Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NFBWG-00067b-7q
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 20:02:47 +0100
Received: by iwn32 with SMTP id 32so2266357iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2009 11:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=SJXm3/F7+DVCAQ0qPpYZsBNfEC73dgrCjGHpDIQMSYA=;
	b=G2jRjLjUj7W+U9YJj+biO8D4aj2tP7ULNZy4IFUGCUxUnmRr0uXnDfd0xZtIMt+jsD
	8Sj53+Ea2AaE1iiBr/Pae1+LkFjSJHjBXPDOSREPkpiu0eJF6Yfm2FiV67M6ArLOqnBF
	eNj3O+gXnYU2ecyf4Sa3JEFho1EDs7ifpLR7k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=c2rAH5+CtJUpp61nQ6GBKdl+Pty/sa5LPx7kBX6k8lvGUysA0jvK/jXGCn8IwTQsV5
	SnrsRf4b3q7PaZE+LVHvAVEHvbw+SXfyr4qxvWhm8fuHuvqNlU3K4D5wDqOCYFhbnlfy
	JZQUVpMbdJZ/S3SOaQTLxIL3xb3o9uWaro9rQ=
MIME-Version: 1.0
Received: by 10.231.120.136 with SMTP id d8mr413718ibr.14.1259607669524; Mon, 
	30 Nov 2009 11:01:09 -0800 (PST)
In-Reply-To: <ec1f3d400911230254g51d95762y72147461ea5ea8e5@mail.gmail.com>
References: <ec1f3d400911222214l37838f37i204c88bba6971d5b@mail.gmail.com>
	<hedg4o$hn9$1@ger.gmane.org>
	<ec1f3d400911230254g51d95762y72147461ea5ea8e5@mail.gmail.com>
Date: Mon, 30 Nov 2009 11:01:09 -0800
Message-ID: <19c1b8a90911301101r2798afd1kd1970c9265d89c89@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: cortex-a9 machine build failure at gcc
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
X-List-Received-Date: Mon, 30 Nov 2009 19:02:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> | *cc1: error: bad value (cortex-a9) for -mtune=3D switch
> *| /bin/sh
> /home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-c=
ross-initial-4.3.3-r7.1/gcc-4.3.3/gcc/../move-if-change
> tmp-macro_list macro_list
> ************

above message indicates that the gcc version you chose does not
support cortex-a9

> I have removed gcc specific variables from my local.conf, so they must be
> getting picked up from the distro conf file.
>
> Is cortex-a9 not yet supported by the default Angstrom toolchain or am i
> missing something ?

try using gcc 4.4 if you want gcc to tune for cortext-a9

>
> --RK
>
>
> On Mon, Nov 23, 2009 at 1:42 PM, Koen Kooi <k.kooi@student.utwente.nl>wro=
te:
>
>> On 23-11-09 07:14, RK Raggit wrote:
>>
>>> Hi,
>>>
>>> I am adding support for a cortex-a9 based machine but the build fails a=
t
>>> gcc
>>> with this error -
>>>
>>> ****************
>>> |
>>>
>>> /home/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.2.4-r9.1/g=
cc-4.2.4/gcc/crtstuff.c:1:
>>> error: bad value (cortex-a9) for -mtune=3D switch
>>>
>>
>> Gcc 4.2.4 doesn't support armv7
>>
>>
>>
>> gcc variables in my local.conf read thus -
>>>
>>> PREFERRED_VERSION_gcc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D "4.2.4"
>>> PREFERRED_VERSION_gcc-cross =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D "csl-arm-2008q1"
>>> PREFERRED_VERSION_gcc-cross-initial =C2=A0 =C2=A0 =C2=A0=3D "csl-arm-20=
08q1"
>>> PREFERRED_VERSION_gcc-cross-intermediate =3D "csl-arm-2008q1"
>>>
>>
>> Don't use CSL toolchains, they are waaaay to broken, especially 2008qX:
>> http://hardwarebug.org/2008/11/28/codesourcery-fails-again/
>> Stick with the default toolchain angstrom is using, it is tested on real
>> hardware (CS only tests inside qemu) and is know to work well
>>
>> regards,
>>
>> Koen
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


