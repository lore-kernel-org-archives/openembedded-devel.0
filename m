Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jan.paesmans@gmail.com>) id 1OvUlo-0000A4-Vf
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 14:38:25 +0200
Received: by qwa26 with SMTP id 26so3778096qwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ub6rPsQ4+gmI7lzQX5n63apUiI3ezSZMzRmaWwlNMp8=;
	b=bUkXkA+do7aqvOwd94EuZbEP7bH22+7zqilHoOU/xLn/wAOJQWQw0o1oECpUsqph8V
	kckbCkM0g9KxuYNdmbV9ONYAc/huK5n6l6fQ3yd4Nt9ppNs4dEHWq5yL/qPlcejpUyOs
	jPCf6iyVaGW4QOoGiBASfjcuc1prHc2k/SXOw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=lW03EbKihTSIjZCUsoMsgPn8rsuDwSNcbEb/fgC7NSeLmfUEo16RMVq1fQSpaYGMOB
	YtIAV6Sxyn5d1GsWhZWUJR3GU/m4GYpRVktW/3jI9DZWkaVyOaXdWtCApUGuK7d4pEYJ
	94xd8msf80HDT36xHMgcOTXm5L0Y7OYXfr4cw=
MIME-Version: 1.0
Received: by 10.229.229.18 with SMTP id jg18mr4302825qcb.156.1284467828079;
	Tue, 14 Sep 2010 05:37:08 -0700 (PDT)
Received: by 10.229.50.75 with HTTP; Tue, 14 Sep 2010 05:37:08 -0700 (PDT)
In-Reply-To: <4C8F6A6F.4090403@balister.org>
References: <AANLkTi=6fss18KJvTBYf3oV1MXkgJwT7cqTRz4rK+aTx@mail.gmail.com>
	<4C8F5E55.9010906@balister.org> <4C8F6A6F.4090403@balister.org>
Date: Tue, 14 Sep 2010 14:37:08 +0200
Message-ID: <AANLkTikNARJgBSC4m1u0tgjXfHh4VEga2=X9OZPBB1Et@mail.gmail.com>
From: Jan Paesmans <jan.paesmans@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jan.paesmans@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-09-13
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
X-List-Received-Date: Tue, 14 Sep 2010 12:38:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

I had a quick look at the output and it seems that qemu is linking
against the gnutls installed on the host. Maybe the version that qemu
needs is not compatible with the one installed on your host or it is
configured differently.

Also noticed that qemu has no dependency on gnutls, only on zlib.
Probably doing something like this could help:

Index: openembedded/recipes/qemu/qemu_0.12.4.bb
===================================================================
--- openembedded/recipes/qemu/qemu_0.12.4.bb    (revision 37950)
+++ openembedded/recipes/qemu/qemu_0.12.4.bb    (working copy)
@@ -1,7 +1,7 @@
 LICENSE = "GPL"
-DEPENDS = "zlib"
+DEPENDS = "zlib gnutls"

-PR = "r1"
+PR = "r2"

 SRC_URI = "\
     http://download.savannah.gnu.org/releases/qemu/qemu-${PV}.tar.gz;name=qemu-${PV}
\


On Tue, Sep 14, 2010 at 2:28 PM, Philip Balister <philip@balister.org> wrote:
> On 09/14/2010 07:36 AM, Philip Balister wrote:
>>
>> On 09/13/2010 02:21 PM, Cliff Brake wrote:
>>>
>>> last weeks testing cycle was a success.
>>>
>>> http://wiki.openembedded.net/index.php/Testing#Testing_Log
>>>
>>> Firefox is failing in some configurations if the same version of
>>> firefox is installed on the host system -- it would be nice to get
>>> this resolved this week.
>>>
>>> testing-next branch has been updated and is ready for clean builds.
>>
>> Next error on F13. Sorry I don't have time to debug these. I'm just
>> trying to get in the rhythm. I also need to report this to tinderbox.
>> Not sure why it is touching build machine files.
>
> Here is the full log:
>
> http://tinderbox.openembedded.net/public/logs/task/7786641.txt
>
> Hopefully a QEMU guru can look it over.
>
> Philip
>
>>
>> Philip
>>
>> | /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so:
>> undefined reference to `gcry_cipher_setkey@GCRYPT_1.2'
>> | /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so:
>> undefined reference to `gcry_cipher_setiv@GCRYPT_1.2'
>> | collect2: ld returned 1 exit status
>> | make[1]: *** [qemu-system-mips] Error 1
>> | make: *** [subdir-mips-softmmu] Error 2
>> | /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so:
>> undefined reference to `gcry_cipher_setkey@GCRYPT_1.2'
>> | /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so:
>> undefined reference to `gcry_cipher_setiv@GCRYPT_1.2'
>> | collect2: ld returned 1 exit status
>> | make[1]: *** [qemu-system-mips64el] Error 1
>> | make: *** [subdir-mips64el-softmmu] Error 2
>> | /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so:
>> undefined reference to `gcry_cipher_setkey@GCRYPT_1.2'
>> | /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so:
>> undefined reference to `gcry_cipher_setiv@GCRYPT_1.2'
>> | collect2: ld returned 1 exit status
>> | make[1]: *** [qemu-system-mipsel] Error 1
>> | make: *** [subdir-mipsel-softmmu] Error 2
>> | FATAL: oe_runmake failed
>> NOTE: package qemu-native-0.12.5-r0: task do_compile: Failed
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


