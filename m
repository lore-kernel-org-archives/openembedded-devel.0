Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id CBA6C6011C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Dec 2017 06:48:37 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id p69so12513746wrb.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Gx+kRbYW3V93K3YpdMjBzWq+3dGK09Xi+FCzqpyqdNc=;
	b=WxCCB2A86xd1h10Js6nlxIM+jxR2oxiudzPPsgmiFmmFlXqmsDQ61x2I8svrkFzYIL
	WSZSBBx4JJaBuA4+rf20zqN90Cg53k7kCsYBCb+pX1XHJHg1WX2beYuH+it82EJ5uuFO
	mT8Jnh1HXOZM3XObSSggYL22wb+zBARQcllRV2Pe+/MfntH3hoOVRsKLBJIZD9+WsB4n
	KtYeL5kpYMIrdTi+j0fR4qztc2ttIxXs9PKKPF9zqqiwbwdrSNMhb3yF2O0uNKlbMjqc
	iNT9PQLRFU4VGdrgReatRh7AH/XTuhKUkRKXagJYZyLf77M3Gsdj7u7moicAIVXWQADa
	hLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Gx+kRbYW3V93K3YpdMjBzWq+3dGK09Xi+FCzqpyqdNc=;
	b=FxlYJC2Z0AzLL471WrC5JoyYBDZSRhkeL35s0D0cijofUHnoMzSe02g0BJ/dbU/zP/
	YDZvI5h43otVliEgY1j3w5bKr+0+IJhC6NP4jrVwWa/ENS17/zQ7+wnyjHO3Agqcb1m8
	J8EN0R+Ku/GNBe0Dhyup0dOKq8xGnQTNZVza/+qOHTQXmiBi9pHLsOYVCLvdub3RfgOi
	QFt+Hc85oYtZf45XuEQvXswA2GFzu0w/VNiUpt9UmcMYpe3rgMuWrJ+MBrOL12cBMAmW
	x3tG7WqdHpoDyJCO3aDzGCpN5nsxW4xO53tz3xFVpQHm0FBTz+TMyOS4ZunztD+9E1gk
	ozsA==
X-Gm-Message-State: AKGB3mL4bMaE2XU3Hx2FNEzAhUpnze5axTr76r7nZOXgghRwythDpFx1
	Gyeler/gMDt+ZeUgMoC/dNWP3ABfZ6SnBYEb8Wipzg==
X-Google-Smtp-Source: ACJfBotvYFt9i72VVqKRWcSHWCSZ/dwje5cGZJTQOnzaJj8bfZH3TQNreNzynOzIyZoFE5jZ9e5ZBtNA8tS7Yv27zLE=
X-Received: by 10.223.161.158 with SMTP id u30mr587567wru.200.1513752518600;
	Tue, 19 Dec 2017 22:48:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Tue, 19 Dec 2017 22:48:38 -0800 (PST)
In-Reply-To: <CA+chaQc4TeOyEnpWhYJi6m_6FNk47JYb3Z6eZ3oz=oFK23TW6w@mail.gmail.com>
References: <20171216104544.23324-1-dariusz.pelowski@gmail.com>
	<CA+chaQc4TeOyEnpWhYJi6m_6FNk47JYb3Z6eZ3oz=oFK23TW6w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Dec 2017 07:48:38 +0100
Message-ID: <CA+chaQfr5S5XvS3+fotQnycDfEz2oUDp65yJC16R1ksnKJ+o+Q@mail.gmail.com>
To: Dariusz Pelowski <dariusz.pelowski@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] meta-networking: virtual/db dependency corrected to db
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Dec 2017 06:48:38 -0000
Content-Type: text/plain; charset="UTF-8"

https://patchwork.openembedded.org/patch/145728/
https://patchwork.openembedded.org/patch/145729/

On Sat, Dec 16, 2017 at 2:51 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> There are already pending changes for this.
>
> On Sat, Dec 16, 2017 at 11:45 AM, Dariusz Pelowski <
> dariusz.pelowski@gmail.com> wrote:
>
>> db doesn't provides virtual/db anymore
>>
>> Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
>> ---
>>  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 2 +-
>>  meta-networking/recipes-daemons/postfix/postfix.inc             | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.
>> 26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
>> index eaa453d91..64d1a76d6 100644
>> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
>> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
>> @@ -1,7 +1,7 @@
>>  SUMMARY = "Generic client/server library for SASL authentication"
>>  SECTION = "libs"
>>  HOMEPAGE = "http://asg.web.cmu.edu/sasl/"
>> -DEPENDS = "openssl virtual/db"
>> +DEPENDS = "openssl db"
>>  LICENSE = "BSD"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
>>
>> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc
>> b/meta-networking/recipes-daemons/postfix/postfix.inc
>> index a588bd347..75cf13795 100644
>> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
>> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
>> @@ -6,11 +6,11 @@ has a definite Sendmail-ish flavor, but the inside is
>> completely different."
>>
>>  HOMEPAGE= "http://www.postfix.org"
>>  SECTION = "mail"
>> -DEPENDS = "virtual/db icu libpcre openssl postfix-native \
>> +DEPENDS = "db icu libpcre openssl postfix-native \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)}
>> \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '',
>> d)} \
>>  "
>> -DEPENDS_class-native = "virtual/db-native icu-native openssl-native
>> libpcre-native"
>> +DEPENDS_class-native = "db-native icu-native openssl-native
>> libpcre-native"
>>
>>  LICENSE = "IPL-1.0"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=64375f37431336ea1b1b3005fe3fa354"
>> --
>> 2.15.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

