Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB736D2C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 20:05:06 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w7so8333896pgp.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 12:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=PJxOg5/iKSLPGwfOhQOiqSNppHwmyRsSsof1tjZaBKQ=;
	b=OrStLPUhLH2tPTSvdrJ1owWIHj0T8YYzetEj2AZSqJPv73KSV2QMFTzPe52h32juJq
	qHJi6wTvzXye49GXMnoavcjmF6EcYRdNFcMn44DUb59JtGVdrnuhHZkS5+ggbvGUOh9F
	uEC2AGTOe+7YgL4jy/com5ULc+Om5hNA+A/WQkpLse1IIPtMSsizDR7oCjokrKL1y7l2
	7j340ZnHoLxlxdjtoHJqgC2/D1hUoH69QCg9bwNmBXU12HK8MYVxP6bOnLOYvlUeL4Rn
	ZSNw2kp379fSu+gR5SJX3zawUZ3ffvSJ2tlaKLvJDD/AYSEyuIqfuyXAFNQ/jp3XI5rt
	ru9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=PJxOg5/iKSLPGwfOhQOiqSNppHwmyRsSsof1tjZaBKQ=;
	b=EvrGCKpnlxDw8Fs/SkQ42IyAcbU3JTGdPoz1Zs6vQeIcTLIkO10YZOtcMDKTilkmBz
	72EuyjvTDZ3iBm7CTlME0r4i5WX6D101p1rbe6KIvw7Q3aeukD0enxxSF/goQTPsia00
	BdFWwomzevQT40OgZ7IuzZlPy4X4VVPTtLSx+H0edXpUa3p+Ch/l01nuQeR5qD3YLvbY
	brY2cd+g0XHCwSIHvICRuuWD0fppbzIO69dFzil2D11g7u8U9Bd2TtO9cET55J9vL4oS
	Cq2pBWyiIWR0/oRHnE+4NONRKjJzEYC5kSUo4g9Mvm2M/q33rgvgV/jMvjZaAKVgNBA8
	x48A==
X-Gm-Message-State: AGRZ1gI8DXsMKxE53XFHkDUn/jqtciKXlxRiZ2hK14crBLh8gfDti2p3
	fKei9T2HSHebrf5512F8j4Q6+flq
X-Google-Smtp-Source: AJdET5fj5eawJS15HjOVhy9LHGI4tvmovn4cMobugOh+d/WqPDCiXCZClwGKlaSTHoZ/Y2YotaoA5A==
X-Received: by 2002:a62:4886:: with SMTP id q6mr35291338pfi.182.1543349107268; 
	Tue, 27 Nov 2018 12:05:07 -0800 (PST)
Received: from [192.168.0.33] (174-24-96-92.clsp.qwest.net. [174.24.96.92])
	by smtp.gmail.com with ESMTPSA id
	m129-v6sm5579984pfm.78.2018.11.27.12.05.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 12:05:06 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>,
	Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
References: <20181120154041.9420-1-raphael.kubo.da.costa@intel.com>
	<CAMKF1soR+4fXBd1q0bLCndQjROO-zTnvcQSs80TmDP=KKZcMuQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <b443dc91-db87-f835-7a33-98cd9ccf2bea@gmail.com>
Date: Tue, 27 Nov 2018 13:05:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soR+4fXBd1q0bLCndQjROO-zTnvcQSs80TmDP=KKZcMuQ@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][sumo][PATCH] nodejs: Enable system ICU support
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
X-List-Received-Date: Tue, 27 Nov 2018 20:05:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 11/26/18 10:45 AM, Khem Raj wrote:
> Armin
>
> This is ok for rocko
> On Tue, Nov 20, 2018 at 7:40 AM Raphael Kubo da Costa
> <raphael.kubo.da.costa@intel.com> wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> Latest Chromium needs it during build

Is this keeping chromium from building. Is there anyway to have this
done via PACKAGECONFIG?

- armin
>>
>> (cherry picked from commit d7d0cc5227d0dc7d3ff91ded9da841d65c3f3632)
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>=

>> ---
>>  meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb b/meta-oe=
/recipes-devtools/nodejs/nodejs_8.9.4.bb
>> index 8930cd902..132ee0f2b 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
>> @@ -3,7 +3,9 @@ HOMEPAGE =3D "http://nodejs.org"
>>  LICENSE =3D "MIT & BSD & Artistic-2.0"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D270f7477a1705f7cd3e29d3d45=
12915d"
>>
>> -DEPENDS =3D "openssl10 zlib"
>> +DEPENDS =3D "openssl10 zlib icu"
>> +
>> +inherit pkgconfig
>>
>>  COMPATIBLE_MACHINE_armv4 =3D "(!.*armv4).*"
>>  COMPATIBLE_MACHINE_armv5 =3D "(!.*armv5).*"
>> @@ -44,7 +46,7 @@ do_configure () {
>>      export LD=3D"${CXX}"
>>      GYP_DEFINES=3D"${GYP_DEFINES}" export GYP_DEFINES
>>      # $TARGET_ARCH settings don't match --dest-cpu settings
>> -   ./configure --prefix=3D${prefix} --without-intl --without-snapshot=
 --shared-openssl --shared-zlib \
>> +   ./configure --prefix=3D${prefix} --with-intl=3Dsystem-icu --withou=
t-snapshot --shared-openssl --shared-zlib \
>>                 --dest-cpu=3D"${@map_nodejs_arch(d.getVar('TARGET_ARCH=
'), d)}" \
>>                 --dest-os=3Dlinux \
>>                 ${ARCHFLAGS}
>> --
>> 2.19.1
>>



