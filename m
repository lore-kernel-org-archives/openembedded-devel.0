Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NRyk7-0005qE-4m
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 03:01:58 +0100
Received: by ywh8 with SMTP id 8so15672949ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 17:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=eNd2KKkVutKTJOYNUw2TumAPxKA8BDIy/k0+W+YJvXk=;
	b=ruO2ykObxz/D2cGCeLNGfv9QxEB1aQuvB5q0ppLrjiiKVbmoGMT29nRn1F6+T54vnl
	I8IgSlDgnE/+qEvS0RfEEXACcr+FioYz7sqn4DQtKVJRWy8kBw7bYep4ipX70pnplZ6e
	gk8WghYhpFeIfG72PULSf6eo7LrhCFKkUaRyU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=VRr/cyiABM8x8nsjXoCw8vTUau8uVc8WP014SIpd2kd8sIIOcsyw2mJILVNwazFemu
	jXkPeLXylldpYRh9R2jD4KR/kc2GFxU4jUS0EzSSr+/WAuAoYIZ0dcWFxraICf3lyCgL
	GD9N1lcp7elxKUaZA/pFhUxDLDMznPx2yinKI=
Received: by 10.101.187.18 with SMTP id o18mr27577610anp.8.1262656791557;
	Mon, 04 Jan 2010 17:59:51 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 34sm7555234yxf.29.2010.01.04.17.59.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 04 Jan 2010 17:59:49 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1262417638-26595-1-git-send-email-camelguo@gmail.com>
	<20100104231453.GA10191@gmail.com>
Date: Tue, 05 Jan 2010 09:59:41 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u51ehr2pmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <20100104231453.GA10191@gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Add --disable-decimal-float option to gcc-cross-intermediate/gcc-cross_4.4.2.bb
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
X-List-Received-Date: Tue, 05 Jan 2010 02:01:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Tue, 05 Jan 2010 07:14:53 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> On (02/01/10 15:33), Guo Hongruan wrote:
>> 1. Add --disable-decimal-float option to  =

>> gcc-cross-intermediate_4.4.2.bb when LIBC =3D=3D uclibc and TARGET_AR=
CH =3D=3D  =

>> i[3|4|5|6]86, without it, the compilation will failed due to lack of =
 =

>> fenv.h.
>> ---
>>  recipes/gcc/gcc-cross-intermediate_4.4.2.bb |    7 +++++++
>>  recipes/gcc/gcc-cross_4.4.2.bb              |    7 ++++++-
>>  2 files changed, 13 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/gcc/gcc-cross-intermediate_4.4.2.bb  =

>> b/recipes/gcc/gcc-cross-intermediate_4.4.2.bb
>> index 3ca59aa..4bb1004 100644
>> --- a/recipes/gcc/gcc-cross-intermediate_4.4.2.bb
>> +++ b/recipes/gcc/gcc-cross-intermediate_4.4.2.bb
>> @@ -1,9 +1,16 @@
>>  require gcc-cross_${PV}.bb
>>  require gcc-cross-intermediate.inc
>>
>> +PR =3D "${INC_PR}.2"
>> +
>>  DEPENDS +=3D "gmp-native mpfr-native"
>>
>>  EXTRA_OECONF +=3D " --disable-libmudflap \
>>  		  --disable-libgomp \
>>  		  --disable-libssp \
>>  		"
>> +
>> +EXTRA_OECONF_append_linux-uclibc +=3D " ${@base_contains('TARGET_ARC=
H',  =

>> 'i386', '--disable-decimal-float', '',d)}"
>> +EXTRA_OECONF_append_linux-uclibc +=3D " ${@base_contains('TARGET_ARC=
H',  =

>> 'i486', '--disable-decimal-float', '',d)}"
>> +EXTRA_OECONF_append_linux-uclibc +=3D " ${@base_contains('TARGET_ARC=
H',  =

>> 'i586', '--disable-decimal-float', '',d)}"
>> +EXTRA_OECONF_append_linux-uclibc +=3D " ${@base_contains('TARGET_ARC=
H',  =

>> 'i686', '--disable-decimal-float', '',d)}"
>
> It should be disabled for all uclibc based arch/distro combo's
> and the change should go to gcc-<version>.inc files as in my original
> patch.

Yes, I agree with you.

My proposal is to keep the effect of my patch as small as possible. For =
I  =

have not validated other platforms, so I can not disable it this way. I =
 =

will try it as soon as possible, if it did has the same problem on other=
  =

platform, I will fix the patch.

By the way, on arm, mips platform, there is no such problem. I have not =
 =

figured our why it does not occur on the platforms.

>
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


