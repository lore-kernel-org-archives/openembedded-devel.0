Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 982C260807
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 15:14:40 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id u17so44226999pgi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Aug 2019 08:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=aK636kFov+KVdL4xsmtpFxFadRhER9hkNCAvf2HktWA=;
	b=C5Rglsa/tKIAT4mut8HUBiVZ2jEyDXS7sgQkSnDyFXvcdA8rJKz6aWHUKDTyeMx3m4
	Cj6HvP3OzJwEJRtaoAFcHVbjmpo+j3OKqZwvPULbjJRjZXoUJ+b10fBIudnLcBVHUPG5
	RbfKLixLPFmKcdrKG5w0Gcfp9hG6pgsx+mot1Qqkx891gyT2gwGKTW4YuL5heamnG5+m
	gGDztXFp4Uz4dchoxnRQ67B8hT8eXbY9qArXNDCH8pu2g9ObNkyehudRsai7U9RHKJmB
	+AULadRkfHKHMgOi1HtuZSrreexjMMfs6raG4PV6wwwFCrUIHoKJD6Slnyw7d/rPP/aw
	PaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=aK636kFov+KVdL4xsmtpFxFadRhER9hkNCAvf2HktWA=;
	b=eTJA2HWPiIDuX/Mo1mf1zOL/YmCF//pBDsjGYV0o0cyxdv/RPMuDX5v4ExPmJq0EJK
	jYu8xcuNFeJoUftSDCHxx1GRbci1POwwdZ/jgw8N86akX3/uP8NDLoPsX8IDRA5hDzBQ
	AWLdeY4V/+AuVF6GznLyuUJHygy/fx9//EglGTURFHVkyNqp6nIS3GbtmgWP92bFumz2
	JTqadeAbm8dbk6r6hQGlsGS7Ru6eRtZpQblS/GL8FMEgJbwsVBxo3Ynna2GGnuNpwbRi
	Krz/EdMKfts9L+Cc3s4oeqW3HsA32TDIEcp71aGnZ051/+Ah98K6O1uOU1VOQKzk34ED
	/rKg==
X-Gm-Message-State: APjAAAWoLif7XCc5/FtTzat1TlLY7/ETMX45Y6azvp31+ulLXvb4Hy22
	CD82X4znmB14uPLYXfdVoexCkgsRkas=
X-Google-Smtp-Source: APXvYqy6VjDyGLDtXxiWeL/rXwmmdzcsY7Loqa1gx4eRiyoENIO07shyHrt19Z6iyq52El8leKpQ8Q==
X-Received: by 2002:a17:90a:2641:: with SMTP id
	l59mr4339806pje.55.1565277281026; 
	Thu, 08 Aug 2019 08:14:41 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::bbfb? ([2601:646:8500:6bc6::bbfb])
	by smtp.gmail.com with ESMTPSA id
	q198sm98130821pfq.155.2019.08.08.08.14.40
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Aug 2019 08:14:40 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	Andrej Valek <andrej.valek@siemens.com>
References: <20190806064731.17490-1-andrej.valek@siemens.com>
	<76644068-fffd-3398-0898-e00db5a9f026@gmail.com>
	<233c3c9c-9cd6-aead-3ddf-3adfb6d7d554@siemens.com>
	<CA+chaQe1_bMvan17fjGrgXUf-ArJ43bu4iqC9PKq9BU6oRe_1g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <cf2cd666-4c43-d9d1-c2fa-8081f5de0494@gmail.com>
Date: Thu, 8 Aug 2019 08:14:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQe1_bMvan17fjGrgXUf-ArJ43bu4iqC9PKq9BU6oRe_1g@mail.gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nodejs: 10.16.0 -> 10.16.1
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
X-List-Received-Date: Thu, 08 Aug 2019 15:14:40 -0000
X-Groupsio-MsgNum: 78994
Content-Type: multipart/mixed; boundary="------------F3C4EAF1F6719B531E483612"
Content-Language: en-US

--------------F3C4EAF1F6719B531E483612
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 8/8/19 6:26 AM, Martin Jansa wrote:
> My guess: it's the recent insane.bbclass change in oe-core/master-next
>=20

yes it is due to that, and the error looks genuine to me.

> On Thu, Aug 8, 2019 at 8:31 AM Andrej Valek <andrej.valek@siemens.com
> <mailto:andrej.valek@siemens.com>> wrote:
>=20
>     Hi Khem!
>=20
>     I have checked the task, what you mentioned, but there is no errors=
 on
>     my side.
>=20
>     DEBUG: Executing python function do_package_qa
>     NOTE: DO PACKAGE QA
>     DEBUG: Executing python function read_subpackage_metadata
>     DEBUG: Python function read_subpackage_metadata finished
>     NOTE: Checking Package: nodejs-doc
>     NOTE: Checking Package: nodejs
>     NOTE: mips-poky-linux-objdump -p .../packages-split/nodejs/usr/bin/=
node
>     NOTE: Checking Package: nodejs-locale
>     NOTE: Checking Package: nodejs-staticdev
>     NOTE: Checking Package: nodejs-src
>     NOTE: Checking Package: nodejs-systemtap
>     NOTE: Checking Package: nodejs-dev
>     NOTE: Checking Package: nodejs-dbg
>     NOTE: mips-poky-linux-objdump -p
>     .../packages-split/nodejs-dbg/usr/bin/.debug/node
>     NOTE: Checking Package: nodejs-npm
>     NOTE: DONE with PACKAGE QA
>     DEBUG: Python function do_package_qa finished
>     DEBUG: Executing python function sstate_task_postfunc
>     NOTE: Using umask 0o002 (not 22) for sstate packaging
>     DEBUG: Executing python function sstate_hardcode_path
>     NOTE: Removing hardcoded paths from sstate package: ...
>     DEBUG: Python function sstate_hardcode_path finished
>     DEBUG: Executing python function sstate_report_unihash
>     DEBUG: Python function sstate_report_unihash finished
>     DEBUG: Executing shell function sstate_create_package
>     DEBUG: Shell function sstate_create_package finished
>     DEBUG: Executing python function sstate_sign_package
>     DEBUG: Python function sstate_sign_package finished
>     DEBUG: Executing python function sstate_hardcode_path_unpack
>     DEBUG: Python function sstate_hardcode_path_unpack finished
>     DEBUG: Executing python function uninative_changeinterp
>     DEBUG: Python function uninative_changeinterp finished
>     DEBUG: Python function sstate_task_postfunc finished
>=20
>=20
>     What is your testing setup?
>     Is it fully reproducible? Could you please run only package_qa task=
?
>=20
>     Regards,
>     Andrej
>=20
>     On 8/8/19 6:32 AM, Khem Raj wrote:
>     > Hi Andrej
>     >
>     > I am seeing
>     >
>     > ERROR: nodejs-10.16.1-r0 do_package_qa: QA Issue:
>     > /usr/lib/node_modules/npm/node_modules/node-gyp/gyp/samples/sampl=
es
>     > contained in package nodejs-npm requires /usr/bin/python, but no
>     > providers found in RDEPENDS_nodejs-npm? [file-rdeps]
>     >
>     > Can you see whats going on ?
>     >
>     > On 8/5/19 11:47 PM, Andrej Valek wrote:
>     >> Update nodejs to active 10.x LTS release 10.16.1.
>     >>
>     >> Signed-off-by: Andrej Valek <andrej.valek@siemens.com
>     <mailto:andrej.valek@siemens.com>>
>     >> ---
>     >>=C2=A0 .../recipes-devtools/nodejs/{nodejs_10.16.0.bb
>     <http://nodejs_10.16.0.bb> =3D> nodejs_10.16.1.bb
>     <http://nodejs_10.16.1.bb>}=C2=A0 | 4 ++--
>     >>=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>     >>=C2=A0 rename meta-oe/recipes-devtools/nodejs/{nodejs_10.16.0.bb
>     <http://nodejs_10.16.0.bb> =3D> nodejs_10.16.1.bb
>     <http://nodejs_10.16.1.bb>} (97%)
>     >>
>     >> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
>     <http://nodejs_10.16.0.bb>
>     b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.1.bb
>     <http://nodejs_10.16.1.bb>
>     >> similarity index 97%
>     >> rename from meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
>     <http://nodejs_10.16.0.bb>
>     >> rename to meta-oe/recipes-devtools/nodejs/nodejs_10.16.1.bb
>     <http://nodejs_10.16.1.bb>
>     >> index aaa1da0aa..8c7795c76 100644
>     >> --- a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.0.bb
>     <http://nodejs_10.16.0.bb>
>     >> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.1.bb
>     <http://nodejs_10.16.1.bb>
>     >> @@ -23,8 +23,8 @@ SRC_URI_append_class-target =3D " \
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Using=
-native-torque.patch \
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>     >>=C2=A0
>     >> -SRC_URI[md5sum] =3D "c9a7ab43f8b50c8a4d5545de307b7540"
>     >> -SRC_URI[sha256sum] =3D
>     "18e37f891d10ea7fbc8f6410c444c2b1d9cc3cbbb1d35aa9c41f761816956608"
>     >> +SRC_URI[md5sum] =3D "009e079ce7e2d695642fb61372459a77"
>     >> +SRC_URI[sha256sum] =3D
>     "6268319c8dddfdaa7886ea3f253ac5c2d133a6c682c00786296227e03f322009"
>     >>=C2=A0
>     >>=C2=A0 S =3D "${WORKDIR}/node-v${PV}"
>     >>=C2=A0
>     >>
>     --=20
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20

--------------F3C4EAF1F6719B531E483612
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------F3C4EAF1F6719B531E483612--
