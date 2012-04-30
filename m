Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1SOjpd-0003Dh-MB
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:11:33 +0200
Received: by wera1 with SMTP id a1so1793466wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=NwstMu10REeJ6XzYrDnSs4KSwCn9poQefkNzpOUjv8U=;
	b=Mx2nCb+9/9jZdKuMSMB7lCtKmBvGkeQ+w4oYIbfXllVAnLkLw/zte5RQKs8rs1Gpwp
	dOU+s6zKOvSLQDPx6KeRmh1dipZWnJeS18iuAoQqvv/fsUz9D/tTY3yLuF9x9ZJSaPSt
	kzaBcKJzwIhE0oCmw5QHuf37DfDRSM4Tjpn4bB3X94iIIaXR4XJgKgu9qTszhpl0aPjC
	i1fm6SCSyWvlmeH+vZ5eAMJZ3uZB7spsU1CLZb9sYcSEmsNNKTodhmjZ72Ocd3eD7luu
	gEGPuGtvsI+ySYB3oiRYaqXH0+z4ViGeY2IpKcxbJ4AEs2NJh/25wXdsUsoPY8t4Xdds
	umcA==
Received: by 10.180.100.2 with SMTP id eu2mr26117382wib.1.1335765712353;
	Sun, 29 Apr 2012 23:01:52 -0700 (PDT)
Received: from [10.54.74.16] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id ca3sm26208911wib.6.2012.04.29.23.01.47
	(version=SSLv3 cipher=OTHER); Sun, 29 Apr 2012 23:01:48 -0700 (PDT)
Message-ID: <4F9E2A64.6040302@gmail.com>
Date: Mon, 30 Apr 2012 08:00:04 +0200
From: =?UTF-8?B?TWFydGluIEVydHPDpXM=?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120326 Thunderbird/10.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F9A932F.1020400@gmail.com>
	<CAMKF1spP9gnvy7JWQhLxA7VcfhUzWS4Ra1pH3XGA8eEguTporA@mail.gmail.com>
In-Reply-To: <CAMKF1spP9gnvy7JWQhLxA7VcfhUzWS4Ra1pH3XGA8eEguTporA@mail.gmail.com>
Subject: Re: Openembedded and ld-linux-armhf.so.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 06:11:33 -0000
X-Groupsio-MsgNum: 38459
Content-Type: multipart/mixed; boundary="------------070703030807090104020607"

--------------070703030807090104020607
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/29/12 04:40, Khem Raj wrote:
> On Fri, Apr 27, 2012 at 5:38 AM, Martin Ertsås <martiert@gmail.com> wrote:
>> Hi.
>>
>> I'm working on a pandaboard with OMAP4460. Were trying to use the newest
>> PVR drivers, which conforms to the result that arose from
>> https://wiki.linaro.org/OfficeofCTO/HardFloat/LinkerPathCallApr2012
>>
>> We have applied the patch at the bottom of that page gcc, and also a
>> patch for making eglibc make ld-linux-armhf, and load ld-linux-armhf
>> instead of ld-linux. Problem is, this gives us a kernel panic when it
>> tries to run init. Linking ld-linux.so.3 to ld-linux-armhf.so.3 does not
>> work, and we're kind of in the dark as to what is missing.
>>
>> We tried fixing this by renaming the toolchain to be
>> arm-none-linux-gnueabihf instead of arm-none-linux-gnueabi, as we heard
>> this might be a problem with hardfloats, but this needed a lot of extra
>> patches, and some patchwork on other packages like openssl and shadow.
>>
>> My question is, are there any ongoing plans to fix this, and make sure
>> that if we have set hard float we make ld-linux-armhf in openembedded?
>>
>> For the record we are using eglibc2.15 and gcc4.6 from openembedded-core.
> would you show the patches so I can take a look what you did and whats going on
Sure, the patches are attached.
>> Best regards
>> Martin Ertsaas
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--------------070703030807090104020607
Content-Type: text/x-patch;
 name="add-armhf-so.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="add-armhf-so.patch"

--- a/ports/sysdeps/arm/shlib-versions  2011-05-10 09:49:03.000000000 -0600
+++ b/ports/sysdeps/arm/shlib-versions  2012-04-13 22:52:46.790815748 -0600
@@ -1,4 +1,4 @@
 arm.*-.*-linux-gnueabi.*	DEFAULT			GLIBC_2.4

-arm.*-.*-linux-gnueabi.*	ld=ld-linux.so.3
+arm.*-.*-linux-gnueabi.*	ld=ld-linux-armhf.so.3
 arm.*-.*-linux.*	ld=ld-linux.so.2

--------------070703030807090104020607
Content-Type: text/x-patch;
 name="handle-ld-linux-armhf-name.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="handle-ld-linux-armhf-name.patch"

--- a/elf/dl-load.c      2012-04-14 12:11:37.000000000 +0000
+++ b/elf/dl-load.c   2012-04-15 00:39:36.558765502 +0000
@@ -2086,10 +2086,13 @@
	  soname = ((const char *) D_PTR (l, l_info[DT_STRTAB])
		    + l->l_info[DT_SONAME]->d_un.d_val);
	  if (strcmp (name, soname) != 0)
+#ifdef __arm__
+	    if (strcmp(name, "ld-linux.so.3") || strcmp(soname, "ld-linux-armhf.so.3"))
+#endif
	    continue;

	  /* We have a match on a new name -- cache it.  */
-	  add_name_to_object (l, soname);
+	  add_name_to_object (l, name);
	  l->l_soname_added = 1;
	}


--------------070703030807090104020607
Content-Type: text/x-patch;
 name="arm-dynamic-linker.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="arm-dynamic-linker.patch"

# DP: For ARM hard float, set the dynamic linker to
# DP: /lib/ld-linux-armhf.so.3.

diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
index 80bd825..8c9d2e7 100644
--- a/gcc/config/arm/linux-eabi.h
+++ b/gcc/config/arm/linux-eabi.h
@@ -62,7 +62,11 @@
 /* Use ld-linux.so.3 so that it will be possible to run "classic"
    GNU/Linux binaries on an EABI system.  */
 #undef  GLIBC_DYNAMIC_LINKER
-#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.3"
+#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
+#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
+#define GLIBC_DYNAMIC_LINKER \
+   "%{mfloat-abi=hard:" GLIBC_DYNAMIC_LINKER_HARD_FLOAT "} \
+    %{!mfloat-abi=hard:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "}"

 /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
    use the GNU/Linux version, not the generic BPABI version.  */


--------------070703030807090104020607--
