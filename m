Return-Path: <paolo.valente@linaro.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id EC3EB6C45D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 15:33:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q18so2446449wrx.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 07:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=kGlEwA2D8sRhi8qaonEcLEsRHxhYl/dnzSsUNAtQcLM=;
	b=fhejRJ8/iZDT+sqtWrYwx/QFTk8RC/fuFP04lCge87z49a7Cgy/SeBLW3u0fWgpsur
	ATrQJrP57b8++nnFcionLAypyaA8ChXTN+XCzRQkC7KNOMho9E2+JhNzDfI+tmElslV+
	P1CaaE4H3U3qkVDrktgHmlEn/5BSix/UgHZOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=kGlEwA2D8sRhi8qaonEcLEsRHxhYl/dnzSsUNAtQcLM=;
	b=RqqiV2hGhKYlzklm1sibRvl2EC2W7ylwrwe/GXxEWqfJIBIxkjMeleVxE+lL7t6Yu/
	i7EprTJFQjbN8GdqAQLsgwetBA/huvcpYGjRxrexNnng2PtEvuTsGUkd1iDxgusFTY3/
	f6PMN1sO8QCTJbmA7UeFCsSirfTA3reC7zcSEQ9CVfowN2DkmF5iPYiEItXKsIimLBLj
	v7Y7Xg/yqb54CQW+tZAa112vJWQ08t4oZWVY3gjJ8F3TmwIgtNg9UVH/V0cGoE/T/y8Z
	0R7I+76TyIQF0e8m7xMqbg43Q/i8xLUno9I8yyCM1jfm5T74NoGx+/w6ibyHCkdEMST4
	tmaQ==
X-Gm-Message-State: AA+aEWYnCLyC6IHF1QvccQvj+gd6SsXSHhKiilYmG6Nop/RdLluzvCGJ
	rKSrF9oWULRqmt6arGzJ3aGgSQ==
X-Google-Smtp-Source: AFSGD/Xh2ccaYc1HgyuOr2Qjlo18g6Qqh/1y+JTkP/4Tw8hhFY9FdySonktjYIUZSsYl7TW2JwGimw==
X-Received: by 2002:adf:b592:: with SMTP id c18mr21343800wre.89.1544715216184; 
	Thu, 13 Dec 2018 07:33:36 -0800 (PST)
Received: from [192.168.0.101] (146-241-196-218.dyn.eolo.it. [146.241.196.218])
	by smtp.gmail.com with ESMTPSA id
	x186sm2390589wmg.41.2018.12.13.07.33.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 07:33:35 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
From: Paolo Valente <paolo.valente@linaro.org>
In-Reply-To: <CAMKF1srK53HOyMG4+773eELKOigsqHwK0-bMkQnZagwR1gYssw@mail.gmail.com>
Date: Thu, 13 Dec 2018 16:33:34 +0100
Message-Id: <6C5A8DD4-110A-43D6-9976-0B429273AB26@linaro.org>
References: <20181213151533.13730-1-paolo.valente@linaro.org>
	<CAMKF1srK53HOyMG4+773eELKOigsqHwK0-bMkQnZagwR1gYssw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.3445.101.1)
Cc: ulf.hansson@linaro.org,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	broonie@linaro.org
Subject: Re: [meta-oe][PATCH] s-suite: push SRCREV to version 3.0
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
X-List-Received-Date: Thu, 13 Dec 2018 15:33:36 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> Il giorno 13 dic 2018, alle ore 16:27, Khem Raj <raj.khem@gmail.com> =
ha scritto:
>=20
> On Thu, Dec 13, 2018 at 7:16 AM Paolo Valente =
<paolo.valente@linaro.org> wrote:
>>=20
>> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
>> ---
>> meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 5 +++--
>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb =
b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>> index 77d172814..166f3000a 100644
>> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>> @@ -2,7 +2,7 @@ SUMMARY =3D "Small collection of benchmarks for =
storage I/O"
>> LICENSE =3D "GPLv2"
>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db529aaa6a0c50f15d29f89609b5c22f3"
>>=20
>> -SRCREV =3D "79698f645bfb28d0d966484ddad3a1efb562246d"
>> +SRCREV =3D "e2727f70ed79b5461689c062a4a66a87f1adb4ce"
>> PV =3D "0.0+git${SRCPV}"
>> SRC_URI =3D =
"git://github.com/Algodev-github/S.git;protocol=3Dhttps;branch=3Dmaster"
>>=20
>> @@ -21,7 +21,8 @@ do_install() {
>>     install -m0755 ${S}/def_config_params.sh ${D}/opt/S-suite
>> }
>>=20
>> -RDEPENDS_${PN} =3D "bash bc coreutils gawk g++ gcc fio libaio =
libaio-dev sysstat"
>> +RDEPENDS_${PN} =3D "bash bc coreutils gawk g++ gcc fio libaio =
libaio-dev sysstat \
>> +                 psmisc git"
>=20
> why these new rdeps

psmisc is for killall, git is for ... git :)

Some weeks ago, I bumped into this missing dependencies that made the
automatic execution of a test fail on a system without either killall
or git.

If these dependencies are certainly useless for oe, then I'll remove =
them.

Thanks,
Paolo

>>=20
>> FILES_${PN} =3D "/opt/S-suite/"
>>=20
>> --
>> 2.16.1
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


