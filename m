Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jan.paesmans@gmail.com>) id 1OWQsI-0005HZ-Rc
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 11:25:05 +0200
Received: by gwj18 with SMTP id 18so3777911gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=CrqHnn/J336RtFAzLcXl0pf2+Xt51SRKNI4u4j8TSqE=;
	b=leUywT0MqrhpxD4M2aWx8HC+MYKSjQJLzk7p23AFAtl5+38nVQsCxveGKCPTof4T98
	A/IIVqIyj/CjoHvR2jHoOj3C6Nknka51YliZhzF8PaZbbbJ5VUoTq4XuTL1PyfsKbAQJ
	DCKHvU/4a9Bow5J3jMpFTkh8AThb03NlZgSDU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=OfvcCZ9yq+EQ1jfPGjEkLDE6WX/bZUqk4uoVoYeSIsXxUK/IEokYbETaxC+yKFSV+1
	qjw5WkIsPJjCA0/jJX8QjzxwLVVH+2uxruIvtSSh4E9GkXitAQ1Jni7CiV0c673OY16X
	uUwz2lX9rxPYZnXRIVAPBet6Y6Q/6x6w1iXOw=
MIME-Version: 1.0
Received: by 10.101.106.10 with SMTP id i10mr7516906anm.99.1278494409957; Wed, 
	07 Jul 2010 02:20:09 -0700 (PDT)
Received: by 10.150.216.16 with HTTP; Wed, 7 Jul 2010 02:20:09 -0700 (PDT)
In-Reply-To: <AANLkTikhVr_O6RX1xlMnZDyj84jXZoclWMZLEyzaR0vE@mail.gmail.com>
References: <AANLkTik1mhR1trtNfJcNrehMg0gs2lNSXyp51PPpaSPu@mail.gmail.com>
	<lyeifgcyxm.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1278439840.30247.3632.camel@rex>
	<AANLkTimI2cM6ehyfx2VQ3FnZiwxkl1SiXJG4Gf4gCGLR@mail.gmail.com>
	<AANLkTin0OEZqHK__gDBP4J2aliFRxr5b3Yjm8HH9CT8v@mail.gmail.com>
	<AANLkTilBEJzflm5tC3EwoWNbyYNoqL1dgbD8JN8P6NiO@mail.gmail.com>
	<AANLkTikhVr_O6RX1xlMnZDyj84jXZoclWMZLEyzaR0vE@mail.gmail.com>
Date: Wed, 7 Jul 2010 11:20:09 +0200
Message-ID: <AANLkTinH2Dx6HPpzyXTiEYYmt0DZgolW_2SJEnKTcBfD@mail.gmail.com>
From: Jan Paesmans <jan.paesmans@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: jan.paesmans@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: native glibc-initial-2.9 unpack error
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
X-List-Received-Date: Wed, 07 Jul 2010 09:25:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Just did a pull from org.openembedded.dev branch and I checked the
content of base.bbclass and the patch was not there.
I'm posting Khem's patch below. Added that to my openembedded and it worked.

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 2da0b7a..b30310d 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -219,14 +219,25 @@ def oe_unpack_file(file, data, url = None):
                       # The "destdir" handling was specifically done
for FILESPATH
                       # items.  So, only do so for file:// entries.
                       if type == "file":
-                               dest = os.path.dirname(path) or "."
+                               if not host:
+                                       dest = os.path.dirname(path) or "."
+                               else:
+                               # this case is for backward
compatiblity with older version
+                               # of bitbake which do not have the fix
+                               #
http://cgit.openembedded.org/cgit.cgi/bitbake/commit/?id=ca257adc587bb0937ea76d8b32b654fdbf4192b8
+                               # this should not be needed once all
releases of bitbake has this fix
+                               # applied/backported
+                                       dest = host +
os.path.dirname(path) or "."
                       else:
                               dest = "."
                       bb.mkdirhier("%s" % os.path.join(os.getcwd(),dest))
                       cmd = 'cp %s %s' % (file,
os.path.join(os.getcwd(), dest))
       if not cmd:
               return True
-       dest = os.path.join(os.getcwd(), path)
+       if not host:
+               dest = os.path.join(os.getcwd(), path)
+       else:
+               dest = os.path.join(os.getcwd(), os.path.join(host, path))
       if os.path.exists(dest):
               if os.path.samefile(file, dest):
                       return True

On Wed, Jul 7, 2010 at 11:03 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/7/7 Jan Paesmans <jan.paesmans@gmail.com>:
>> Khem posted a patch for it earlier:
>> [oe] [PATCH][v2] base.bbclass: re-add backward compatibility with
>> bitbake w.r.t decodeurl fix in bitbake
>>
>> I applied that one and it fixed the issue. Also the issue turned up
>> with libpam-base-files.bb and that patch also fixes that one.
>
> Hm. This patch is also in oe. I am at oe head.
> Also verified that my base.bbclass is patched.
> Then removed my tmp dir and build from scratch
> still have the problem.
>
> Frans
>>
>> Regards,
>>
>> Jan
>>
>> On Wed, Jul 7, 2010 at 10:40 AM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> 2010/7/6 Khem Raj <raj.khem@gmail.com>:
>>>> On Tue, Jul 6, 2010 at 11:10 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
>>>>> On Tue, 2010-07-06 at 19:17 +0200, Enrico Scholz wrote:
>>>>>> Jan Paesmans <jan.paesmans@gmail.com> writes:
>>>>>>
>>>>>> > cp: cannot create regular file `/ld.so.conf': Permission denied
>>>>>>
>>>>>> bb.decodeurl (bitbake 1.10) seems to be buggy:
>>>>>>
>>>>>> | >>> import bb
>>>>>> | >>> bb.decodeurl("file://ld.so.conf")
>>>>>> | ('file', '', 'ld.so.conf', '', '', {})
>>>>>> | >>> bb.decodeurl("file://etc/ld.so.conf")
>>>>>> | ('file', 'etc', '/ld.so.conf', '', '', {})
>>>>>> | >>> bb.decodeurl("file://etc/test/ld.so.conf")
>>>>>> | ('file', 'etc', '/test/ld.so.conf', '', '', {})
>>>>>>
>>>>>
>>>>> There was a fix recently added to bitbake master for this:
>>>>>
>>>>> http://git.openembedded.net/cgit.cgi/bitbake/commit/?id=ca257adc587bb0937ea76d8b32b654fdbf4192b8
>>>>
>>>> right. OE needed a fix too
>>>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=5ac52371b09a25518b60e23e80c8c812cdea6e36
>>>>
>>>> which means that bitbake fix should also go
>>>> into 1.8 an 1.10 to keep building oe .dev with those versions of bitbake.
>>>
>>> I still have the problem:
>>> glibc 2.5 initial
>>> cp: cannot create regular file `/ld.so.conf': Permission denied
>>>
>>> bitbake 1.10 head, oe head.
>>> verified that the patch for oe is there
>>>
>>> Frans
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


