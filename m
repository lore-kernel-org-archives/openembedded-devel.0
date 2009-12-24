Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNgH0-0002AN-U7
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 06:30:10 +0100
Received: by gxk7 with SMTP id 7so16762641gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2009 21:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=fxR/aQzcnYf9hEwkwmaHCQ99c90lnrlybeAuqoPj/dc=;
	b=X3WT2beMzGbbhAV8/pZOcWjUjfHKk9L0QFYECEua23Kxvw/2HaJyTyyl/cShctxvkk
	oNn3nGGfyanJ9Co4xWfBhzg7xxfVVHy0xoREHs27opbUEr3eLlTpLq4sCS5m80n1M+sN
	rDsdgWwHWwjGjo8LkqK7iZ5rnsNb7pYrQkF1o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=W2coyG026NMJhmgG7M3RHbgvHnmSlZhcset3jlGMEnFgquWp6HVNfGD8zPBEDoWg9I
	HOKSc6X/EqlGKuJj3OVYUEZaEuJNpkoKTZ/hoAFLtwi7dXkQI5TFaTyr4EXAR3/h1k8W
	R801acAD7YRamSDPAp4Q8yGGYGz00R3qEnohY=
Received: by 10.100.234.26 with SMTP id g26mr9170680anh.38.1261632492767;
	Wed, 23 Dec 2009 21:28:12 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.101])
	by mx.google.com with ESMTPS id 21sm6890796iwn.6.2009.12.23.21.28.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Dec 2009 21:28:12 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5dklxm5mn1qzu@guohr-laptop-ubuntu>
	<19c1b8a90912222220j543c443ei1d24890b83c4b7f9@mail.gmail.com>
	<op.u5dn37xvmn1qzu@guohr-laptop-ubuntu>
	<19c1b8a90912231429y68b32709x735ae17b0ed97493@mail.gmail.com>
Date: Thu, 24 Dec 2009 13:28:03 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5ff41opmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <19c1b8a90912231429y68b32709x735ae17b0ed97493@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.217.215
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
X-List-Received-Date: Thu, 24 Dec 2009 05:30:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

I will tried to reproduce it and put the result into  =

http://tinderbox.openembedded.net/

=E5=9C=A8 Thu, 24 Dec 2009 06:29:00 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> On Tue, Dec 22, 2009 at 10:25 PM, Guo Hongruan <camelguo@gmail.com>  =

> wrote:
>> That's what I think. I tried to apply the patch and configure/compile=
  =

>> glibc.
>> the configuring process works OK but the compilation failed. I think =
the
>> patch is not the only one cause of the error.
>
> Could be and we would not know more unless you give more details about=

> the next errors.
>
>>
>> =E5=9C=A8 Wed, 23 Dec 2009 14:20:21 +0800=EF=BC=8CKhem Raj <raj.khem@=
gmail.com> =E5=86=99=E9=81=93:
>>
>>> On Tue, Dec 22, 2009 at 9:09 PM, Guo Hongruan <camelguo@gmail.com>  =

>>> wrote:
>>>>
>>>> Hi guys,
>>>>   When compiling glibc,  I meet the following error information. Yo=
u  =

>>>> can
>>>> reproduce it as the following:
>>>> DISTRO =3D "minimal"
>>>> MACHINE =3D "qemux86"
>>>> bitbake helloworld-image
>>>>
>>>>  By the way, when using eglibc, it works OK.  Anyone can give me so=
me
>>>> hints?
>>>>
>>>> Thanks a lot.
>>>>
>>>> | checking whether
>>>>
>>>> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-=
oe-linux/4.4.2/../../../../i686-oe-linux/bin/ld
>>>> is GNU ld... yes
>>>> | checking for
>>>>
>>>> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-=
oe-linux/4.4.2/../../../../i686-oe-linux/bin/as...
>>>>
>>>> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-=
oe-linux/4.4.2/../../../../i686-oe-linux/bin/as
>>>> | checking version of
>>>>
>>>> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-=
oe-linux/4.4.2/../../../../i686-oe-linux/bin/as...
>>>> 2.20, bad
>>>> | checking for
>>>>
>>>> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-=
oe-linux/4.4.2/../../../../i686-oe-linux/bin/ld...
>>>>
>>>> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-=
oe-linux/4.4.2/../../../../i686-oe-linux/bin/ld
>>>> | checking version of
>>>>
>>>> /media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-=
oe-linux/4.4.2/../../../../i686-oe-linux/bin/ld...
>>>> 2.20, bad
>>>
>>> here lies the problem. I think the sed expression is not
>>> able to comprehend that 2.20 version of ld is newer
>>>
>>> you need to backport glibc-2.9/glibc-2.9-enable-binutils-2.2.patch
>>>
>>> to 2.6.1
>>>
>>> Thx
>>>
>>> -Khem
>>>
>>>
>>>
>>>> | checking for pwd...
>>>> /media/work-disk/workdir/oe-mini-glibc-bug/staging/i686-linux/usr/b=
in/pwd
>>>> | checking for i686-oe-linux-gcc... (cached) ccache i686-oe-linux-g=
cc
>>>> -march=3Dpentiumpro
>>>> | checking version of ccache i686-oe-linux-gcc -march=3Dpentiumpro.=
..
>>>> 4.4.2,
>>>> ok
>>>> | checking for gnumake... make
>>>> | checking version of make... 3.81, ok
>>>> | checking for gnumsgfmt... no
>>>> | checking for gmsgfmt... no
>>>> | checking for msgfmt... msgfmt
>>>> | checking version of msgfmt... 0.17, ok
>>>> | checking for makeinfo... makeinfo
>>>> | checking version of makeinfo... 4.11, ok
>>>> | checking for sed... sed
>>>> | checking version of sed... 4.1.5, ok
>>>> | checking for autoconf... autoconf
>>>> | checking whether autoconf works... yes
>>>> | configure: error:
>>>> | *** These critical programs are missing or too old: as ld
>>>> | *** Check the INSTALL file for required versions.
>>>> | FATAL: oe_runconf failed
>>>>
>>>>
>>>>
>>>> --
>>>> Guo Hongruan, Embedded Linux Consultant
>>>> Mobile: +86-0-13484056007
>>>> Skype: camelguo
>>>> Twitter: camelguo
>>>> http://www.gulessoft.com
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
>>>>
>>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el
>>
>>
>> --
>> Guo Hongruan, Embedded Linux Consultant
>> Mobile: +86-0-13484056007
>> Skype: camelguo
>> Twitter: camelguo
>> http://www.gulessoft.com
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


