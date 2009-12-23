Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNKgo-0004R8-Hl
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 07:27:21 +0100
Received: by yxe5 with SMTP id 5so2758644yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 22:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=IsvH4OyivkrL8UTt7n1wgpQBJ0ZPUArh25/CEY+xx7A=;
	b=kysy+HaofPtQH1Iy1YD8QEHrr3ypdCE/yCmXS0oSWqlndafEizUkhPQUyRQatIatIS
	sgF10YZhVJpn4WI7N+fhGfpgKJSM0AWAgtkHvG9j2rgAXB9m4GwXGFrdi7kW0o3gcC6D
	DzL8nW+HNU7bF39TJlMRR3kJ5AiUNNG7OtcnM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=xtN1CwOIEAUSxqreeNMWPB1iok57zzBvBPN+KmRC8Zfj4LKW000q4MqUQx15TeDRqm
	BubQzJhLZokGHW1WnOu0cBU6NCczt5Poc4SHz+lMh30azgIWWjPvdtZJRBF3phNpwcl7
	oHVMoOotuGHpIuQsDZZp9emez1C7sSNNmAeU4=
Received: by 10.101.138.1 with SMTP id q1mr7211945ann.148.1261549525377;
	Tue, 22 Dec 2009 22:25:25 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.196])
	by mx.google.com with ESMTPS id 22sm6106086iwn.8.2009.12.22.22.25.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Dec 2009 22:25:24 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5dklxm5mn1qzu@guohr-laptop-ubuntu>
	<19c1b8a90912222220j543c443ei1d24890b83c4b7f9@mail.gmail.com>
Date: Wed, 23 Dec 2009 14:25:09 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5dn37xvmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <19c1b8a90912222220j543c443ei1d24890b83c4b7f9@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Compiling glibc-2.6.1 failed
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
X-List-Received-Date: Wed, 23 Dec 2009 06:27:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

That's what I think. I tried to apply the patch and configure/compile  =

glibc. the configuring process works OK but the compilation failed. I  =

think the patch is not the only one cause of the error.

=E5=9C=A8 Wed, 23 Dec 2009 14:20:21 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> On Tue, Dec 22, 2009 at 9:09 PM, Guo Hongruan <camelguo@gmail.com> wro=
te:
>> Hi guys,
>>    When compiling glibc,  I meet the following error information. You=
  =

>> can
>> reproduce it as the following:
>> DISTRO =3D "minimal"
>> MACHINE =3D "qemux86"
>> bitbake helloworld-image
>>
>>   By the way, when using eglibc, it works OK.  Anyone can give me som=
e
>> hints?
>>
>> Thanks a lot.
>>
>> | checking whether
>> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe=
-linux/4.4.2/../../../../i686-oe-linux/bin/ld
>> is GNU ld... yes
>> | checking for
>> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe=
-linux/4.4.2/../../../../i686-oe-linux/bin/as...
>> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe=
-linux/4.4.2/../../../../i686-oe-linux/bin/as
>> | checking version of
>> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe=
-linux/4.4.2/../../../../i686-oe-linux/bin/as...
>> 2.20, bad
>> | checking for
>> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe=
-linux/4.4.2/../../../../i686-oe-linux/bin/ld...
>> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe=
-linux/4.4.2/../../../../i686-oe-linux/bin/ld
>> | checking version of
>> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe=
-linux/4.4.2/../../../../i686-oe-linux/bin/ld...
>> 2.20, bad
>
> here lies the problem. I think the sed expression is not
> able to comprehend that 2.20 version of ld is newer
>
> you need to backport glibc-2.9/glibc-2.9-enable-binutils-2.2.patch
>
> to 2.6.1
>
> Thx
>
> -Khem
>
>
>
>> | checking for pwd...
>> /media/work-disk/workdir/oe-mini-glibc-bug/staging/i686-linux/usr/bin=
/pwd
>> | checking for i686-oe-linux-gcc... (cached) ccache i686-oe-linux-gcc=

>> -march=3Dpentiumpro
>> | checking version of ccache i686-oe-linux-gcc -march=3Dpentiumpro...=
  =

>> 4.4.2,
>> ok
>> | checking for gnumake... make
>> | checking version of make... 3.81, ok
>> | checking for gnumsgfmt... no
>> | checking for gmsgfmt... no
>> | checking for msgfmt... msgfmt
>> | checking version of msgfmt... 0.17, ok
>> | checking for makeinfo... makeinfo
>> | checking version of makeinfo... 4.11, ok
>> | checking for sed... sed
>> | checking version of sed... 4.1.5, ok
>> | checking for autoconf... autoconf
>> | checking whether autoconf works... yes
>> | configure: error:
>> | *** These critical programs are missing or too old: as ld
>> | *** Check the INSTALL file for required versions.
>> | FATAL: oe_runconf failed
>>
>>
>>
>> --
>> Guo Hongruan, Embedded Linux Consultant
>> Mobile: +86-0-13484056007
>> Skype: camelguo
>> Twitter: camelguo
>> http://www.gulessoft.com
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
>>
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


