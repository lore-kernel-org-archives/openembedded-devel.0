Return-Path: <gerard.b@tekmagic.net>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 29EAD605FF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2016 19:32:46 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id c127so63989006ywb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2016 12:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tekmagic-net.20150623.gappssmtp.com; s=20150623;
	h=reply-to:from:to:cc:references:in-reply-to:subject:date
	:organization:message-id:mime-version:thread-index:content-language;
	bh=MkndG34cMugAG04k6yaIBquP3s+odzkJDXHrUV8v0fo=;
	b=HuyMx2+h2eCElcFLUP3KxzDqWS71UAkx+Zgw9ie4epcobOKufUTHddp7s4Y0VX9FQJ
	kcOQM2h5C2v1Sj1vCeUirCz+57rTr8iKJgo197mps4IGf1meuWFwG+TBik1QtZpkg59Z
	4dCDJ5WwSkMuLjAQiLYXJzpJhGcTiXUTZ4x3IUzGNDOIuxAjXjAn5Q9Bv0Oatq/cfIN4
	hNe7WE1Ok010rszR1PxhDAzC0e/5NhFIaP3lPqfTsSKzLXl35HBRPGFC5/HhRvwRlCE6
	G7B6aGLR/237Kev0jPI/N8lk25ytHzk5OLLWQCXYFVg4GpI6e1Chu3gelN7jEz1+Ew/U
	jztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:reply-to:from:to:cc:references:in-reply-to
	:subject:date:organization:message-id:mime-version:thread-index
	:content-language;
	bh=MkndG34cMugAG04k6yaIBquP3s+odzkJDXHrUV8v0fo=;
	b=EluXsUjKO9DCiZvxS9HTX4g3Ar6kLeRXnsWzewknw2mPfIjUEoaQFvNQmQXxCH4qYW
	fDlN76PvzWGFEHmDbMh7v+Sa7qpWyiWKuP93IKvxZ3BEhxy5wL3oYQRR0USfX87f7yB3
	vAeHGqI9skrf5HNE+nH1tdEc43PiF76r5DMUZJVxsUUprhJI6enXpLVoc6buUue2Z3sT
	3tQl/aZz25PsE0FovfORIQbCoDCsKo+jyLnkMWjpBFKOkojnkptkWb2GSAxQP3uvM7Ny
	XGB+i0KZ3Rfn+l8MKUn3iZUohI65najpkIAolRHyDlDtaEkGbnCmNFNhPf5QqxcGbqZF
	znOw==
X-Gm-Message-State: ALyK8tLstb23P4CHQbIvtnO7LmAlO6X3iEaEr8FVzL2Zr8dcFGKti1T/Rt8Qunalgriwvw==
X-Received: by 10.37.59.81 with SMTP id i78mr283857yba.35.1464031967444;
	Mon, 23 May 2016 12:32:47 -0700 (PDT)
Received: from Win8onMBA (pool-72-78-196-69.phlapa.fios.verizon.net.
	[72.78.196.69]) by smtp.gmail.com with ESMTPSA id
	t189sm20154130ywd.43.2016.05.23.12.32.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 May 2016 12:32:46 -0700 (PDT)
Reply-To: <gerard.b@tekmagic.net>
From: "Gerard Bucas" <gerard.b@tekmagic.net>
To: <openembedded-devel@lists.openembedded.org>
References: <03d601d1b528$7bca9b90$735fd2b0$@tekmagic.net>
	<03e401d1b529$3aaa2210$affe6630$@tekmagic.net>
	<03f101d1b529$74cdb560$5e692020$@tekmagic.net>
In-Reply-To: <03f101d1b529$74cdb560$5e692020$@tekmagic.net>
Date: Mon, 23 May 2016 15:32:45 -0400
Organization: TekMagic
Message-ID: <03f901d1b529$e233fec0$a69bfc40$@tekmagic.net>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQETnGQTInMdIZQuBkIycC+8kkK3LgKNOVTRAX/z6OmhIrF8wA==
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: 'Otavio Salvador' <otavio@ossystems.com.br>,
	=?iso-8859-1?Q?'Eric_B=E9nard'?= <eric@eukrea.com>
Subject: Re: libsoup build error in master (missing gssapi/gssapi.h ?)
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
X-List-Received-Date: Mon, 23 May 2016 19:32:47 -0000
Content-Language: en-us
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

=20

I have been trying to build yocto with chromium but keep on getting a
libsoup error that I can=92t seem to resolve.

=20

Looks like: fatal error: gssapi/gssapi.h: No such file or directory

=20

=20

So probably has a missing dependency in libsoup recipe?

=20

Any ideas from anyone on how to resolve this?

=20

x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 =
-march=3Dcore2

-mtune=3Dcore2 -msse3 -mfpmath=3Dsse

--sysroot=3D/home/gerard/development/minnowMax/yocto/poky/build/tmp/sysro=
ots/g

enericx86-64 -DHAVE_CONFIG_H -I. -I../../libsoup-2.54.1/libsoup -I..

-DG_LOG_DOMAIN=3D\"libsoup\" -DLIBSOUP_COMPILATION
-DLOCALEDIR=3D\"/usr/share/locale\" -I../../libsoup-2.54.1 -I.. -pthread

-I/home/gerard/development/minnowMax/yocto/poky/build/tmp/sysroots/generi=
cx8

6-64/usr/include/glib-2.0

-I/home/gerard/development/minnowMax/yocto/poky/build/tmp/sysroots/generi=
cx8

6-64/usr/lib/glib-2.0/include =
-DGLIB_VERSION_MIN_REQUIRED=3DGLIB_VERSION_2_38

-I/home/gerard/development/minnowMax/yocto/poky/build/tmp/sysroots/generi=
cx8

6-64/usr/include/libxml2 -fvisibility=3Dhidden -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=3D/home/gerard/development/minnowMax/yocto/poky/build/=
tmp/w

ork/core2-64-poky-linux/libsoup-2.4/2.54.1-r0=3D/usr/src/debug/libsoup-2.=
4/2.5

4.1-r0

-fdebug-prefix-map=3D/home/gerard/development/minnowMax/yocto/poky/build/=
tmp/s

ysroots/x86_64-linux=3D

-fdebug-prefix-map=3D/home/gerard/development/minnowMax/yocto/poky/build/=
tmp/s

ysroots/genericx86-64=3D -Wall -Wstrict-prototypes =
-Werror=3Dmissing-prototypes
-Werror=3Dimplicit-function-declaration -Werror=3Dpointer-arith
-Werror=3Dinit-self -Werror=3Dformat=3D2 -Wno-format-zero-length
-Werror=3Dmissing-include-dirs -Werror=3Daggregate-return
-Werror=3Ddeclaration-after-statement -c
../../libsoup-2.54.1/libsoup/soup-session-feature.c  -fPIC -DPIC -o
.libs/libsoup_2_4_la-soup-session-feature.o

make[3]: Leaving directory

`/home/gerard/development/minnowMax/yocto/poky/build/tmp/work/core2-64-po=
ky-

linux/libsoup-2.4/2.54.1-r0/build/libsoup'

make[2]: *** [all] Error 2

make[2]: Leaving directory

`/home/gerard/development/minnowMax/yocto/poky/build/tmp/work/core2-64-po=
ky-

linux/libsoup-2.4/2.54.1-r0/build/libsoup'

make[1]: *** [all-recursive] Error 1

make[1]: Leaving directory

`/home/gerard/development/minnowMax/yocto/poky/build/tmp/work/core2-64-po=
ky-

linux/libsoup-2.4/2.54.1-r0/build'

make: *** [all] Error 2

WARNING: exit code 1 from a shell command.

ERROR: oe_runmake failed

ERROR: Function failed: do_compile (log file is located at
/home/gerard/development/minnowMax/yocto/poky/build/tmp/work/core2-64-pok=
y-l

inux/libsoup-2.4/2.54.1-r0/temp/log.do_compile.31332)

=20

Thanks!

=20

Gerard

=20


