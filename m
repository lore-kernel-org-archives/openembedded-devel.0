Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvXqO-00073f-QT
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 17:54:54 +0200
Received: by iwn2 with SMTP id 2so6230505iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=DSyB1j67D8vEDsSlVvWWSudvkayhNEk8PC8UkPwzLAc=;
	b=Wa/JJASlAvZLgwXS4BFwQRG6yuBcSCRjMLfO+x/fprZ+xmtOovTXeIFzhOMDmzvnME
	7AV6EXvlnTfEhDeXk0+mYQueICNybwsnkripLswSTn2U9YUtERwdtpEOOEo5FX2JntiQ
	oBhVcSn4Mc3VdqHuiylZVHkGbz98kpQHXYC58=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=vZ5sKHLbEpWvSxg00ete/rvMVDpWfYa/hiTnWPfFt7iZ+bumUyJdvuJXfflYz+9GGW
	fK2NjMCHaTJlxd8nr1gBbu2JknOFRG9V478xLk2pBpyI+klgoZyaebsRaqyDRPTyXV51
	twavMNXLetJ+yhCbd8FnXqWDKrYbe8iuhdxVA=
Received: by 10.231.80.213 with SMTP id u21mr18364ibk.173.1284479642175; Tue,
	14 Sep 2010 08:54:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Tue, 14 Sep 2010 08:53:42 -0700 (PDT)
In-Reply-To: <4C8F5E55.9010906@balister.org>
References: <AANLkTi=6fss18KJvTBYf3oV1MXkgJwT7cqTRz4rK+aTx@mail.gmail.com>
	<4C8F5E55.9010906@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Sep 2010 08:53:42 -0700
Message-ID: <AANLkTinA6KZVSpcTJ6AaLaJ_sHD3hRU9zMWfV+ZivM-M@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Tue, 14 Sep 2010 15:54:54 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 14, 2010 at 4:36 AM, Philip Balister <philip@balister.org> wrote:
> On 09/13/2010 02:21 PM, Cliff Brake wrote:
>>
>> last weeks testing cycle was a success.
>>
>> http://wiki.openembedded.net/index.php/Testing#Testing_Log
>>
>> Firefox is failing in some configurations if the same version of
>> firefox is installed on the host system -- it would be nice to get
>> this resolved this week.
>>
>> testing-next branch has been updated and is ready for clean builds.
>
> Next error on F13. Sorry I don't have time to debug these. I'm just trying
> to get in the rhythm. I also need to report this to tinderbox. Not sure why
> it is touching build machine files.
>
> Philip
>
> | /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so:
> undefined reference to `gcry_cipher_setkey@GCRYPT_1.2'
> | /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so:
> undefined reference to `gcry_cipher_setiv@GCRYPT_1.2'
> | collect2: ld returned 1 exit status
> | make[1]: *** [qemu-system-mips] Error 1
> | make: *** [subdir-mips-softmmu] Error 2
> | /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so:
> undefined reference to `gcry_cipher_setkey@GCRYPT_1.2'
> | /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so:
> undefined reference to `gcry_cipher_setiv@GCRYPT_1.2'
> | collect2: ld returned 1 exit status
> | make[1]: *** [qemu-system-mips64el] Error 1
> | make: *** [subdir-mips64el-softmmu] Error 2
> | /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so:
> undefined reference to `gcry_cipher_setkey@GCRYPT_1.2'
> | /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so:
> undefined reference to `gcry_cipher_setiv@GCRYPT_1.2'
> | collect2: ld returned 1 exit status
> | make[1]: *** [qemu-system-mipsel] Error 1
> | make: *** [subdir-mipsel-softmmu] Error 2
> | FATAL: oe_runmake failed
> NOTE: package qemu-native-0.12.5-r0: task do_compile: Failed
>

there is a mismatch of libraries from gnutls package on your host. gnutls
is taken from your host and its not linking with libgcrypt from your host
or you might have two versions of libgcrypt on your host. Adding gnutls to
DEPENDS might solve this provided the libgcrypt was picked from OE sysroot

Make sure there is no double installations on your host and follow the trail
of linker where its picking different libraries from.


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
-Khem


