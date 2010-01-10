Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NTxMN-000396-7F
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 13:57:38 +0100
Received: by pxi13 with SMTP id 13so11617452pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 04:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:cc:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=Pfn2HMixnzWm00MRgD5QEwMgreM+k178H6cFLptfxzE=;
	b=wMUyCtN/s0jjBOtG3zXVD1V1pyqgpIiYHoF3LU58M3ewJJ789UQbbohdMZf726ZjIX
	rdv5j9Rhf0GhS/d3zrQYz030GkCcKIhQRS8p4CK5hL+QlTSlqGeItt5Zn45HoK6B4mNb
	Fl/9rgxBwtDT/cPaFdCHQoGebllq7oReWrTQw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:cc:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=lPxCmsBdJAgGps0Kqm3badC2fXWKdhYHr8fCpF1v0A9lbI6O4fNreB7STRh/1yE1hF
	5eAGANHcHViAlyfcFdrB2MTyznLz5u4Co03u+60RzvA3H/lTwDT/+zmyYId0Np1kmpD8
	gN5gZeOypKJmjt4phKWM14jWYnefwonKEEo8g=
Received: by 10.114.251.10 with SMTP id y10mr2595214wah.149.1263128126306;
	Sun, 10 Jan 2010 04:55:26 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.100.219])
	by mx.google.com with ESMTPS id 21sm20527691pzk.7.2010.01.10.04.55.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 10 Jan 2010 04:55:25 -0800 (PST)
To: "Khem Raj" <raj.khem@gmail.com>
References: <op.u6ax2r1qmn1qzu@guohr-laptop-ubuntu>
	<19c1b8a91001092210k7aa59b12l4417d8654c9b5954@mail.gmail.com>
Date: Sun, 10 Jan 2010 20:55:13 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6bh6baxmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <19c1b8a91001092210k7aa59b12l4417d8654c9b5954@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [Bug 5362] compilation of gcc-cross-intermediate-4.4.2 failed due to lack of fenv.h
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
X-List-Received-Date: Sun, 10 Jan 2010 12:57:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Yes, you are right. I tried to build a powerpc project and verify that.


=E5=9C=A8 Sun, 10 Jan 2010 14:10:35 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> On Sat, Jan 9, 2010 at 9:41 PM, Guo Hongruan <camelguo@gmail.com> wrot=
e:
>> Hi raj,khem:
>>  I think the change you made is not equivalent with before. Please se=
e  =

>> the
>> following patch. When TARGET_ARCH =3D=3D powerpc, the
>> EXTRA_OECONF_append_linux-uclibc should be set "--disable-decimal-flo=
at
>> --without-long-double-128", but in your change, it will be set
>> "--without-long-double-128"
>
> No, thats not correct this patch is unnecessary. Its using _append
> override which I guess is self explanatory.
>
>>
>> Thanks a lot!
>>
>> diff --git a/recipes/gcc/gcc-4.4.2.inc b/recipes/gcc/gcc-4.4.2.inc
>> index 4b11f31..32a27c0 100644
>> --- a/recipes/gcc/gcc-4.4.2.inc
>> +++ b/recipes/gcc/gcc-4.4.2.inc
>> @@ -36,4 +36,4 @@ EXTRA_OECONF_BASE =3D " --enable-libssp \
>>  EXTRA_OECONF_append_linux-uclibc =3D " --disable-decimal-float "
>>  EXTRA_OECONF_append_linux-uclibceabi =3D " --disable-decimal-float "=

>>  EXTRA_OECONF_append_linux-uclibcspe =3D " --disable-decimal-float "
>> -EXTRA_OECONF_append_linux-uclibc =3D " ${@base_contains('TARGET_ARCH=
',
>> 'powerpc', '--without-long-double-128', '',d)}"
>> +EXTRA_OECONF_append_linux-uclibc +=3D " ${@base_contains('TARGET_ARC=
H',
>> 'powerpc', '--without-long-double-128', '',d)}"
>>
>> --
>> Guo Hongruan, Embedded Linux Consultant
>> Skype: camelguo
>> Twitter: camelguo
>> http://www.gulessoft.com
>>


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


