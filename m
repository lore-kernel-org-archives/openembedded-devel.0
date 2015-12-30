Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8820360761
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 19:06:32 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id u188so47867606wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 11:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=l8fNm9gxR6aoNU95bSMm2Yb7W+aMpucBzLuVnDtu9/Q=;
	b=DKACT8x4hOG3vcA0e0P9s9NDPlNVXrvKr6MWRabyLhwEUFjhfrfm9kS4RTG/fNlRNV
	oeleWjDTGyTwAxkyNmV3JpjbhjbSiNNufH3zCZ3XFSypVMQLLKOaGCK5VbX3zX/JnZVk
	5nLolWAVGybpcSrxexo5ygkCZTTTbm3PXbd+ZgpRId9NV5BYZrVRQuYDZIdOJgnmLnD+
	YIrDGOoskaRX7K6qa62F+lTvuTh3EjiqddqkIc+1HVPlbGBbCUenVzD3/+PgO9Q8iy73
	5BvRVoI/MVZNcMjRMrBXLMcvVuGDJ/U6L+r+/K5Z0tS3kFwxolxggglCzjatQSdVi2eN
	LR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=l8fNm9gxR6aoNU95bSMm2Yb7W+aMpucBzLuVnDtu9/Q=;
	b=cpou4H6XRcbOe/WXudbYrktq9rC/JN7v2ExKUl68j9oDe3To+SXR5EeKPbUPda4sgi
	A7mlkNgN4JBtV9tIQ9aeZ/wgfVx+g7T5/25tLTW9lwD+toYdxYbXfl0jBP+viI/IqomZ
	WBoSBbHn3qWI/MXXrIYMi5Wm6FI62Cvf57H4NFjDOZByTdQUg6YRP5mBImzn0M0n9MIg
	zQ8WCZubpKNNfQhNuNKGPxlcc2j3AA2Fgg1HiP6G7jp2X+eaNZC+akmfR5gScLMb/egH
	r3Qk7Qz29iEOIeL2Bk1g5YozVmAF+WUg4J/Kjf9uBqYCckO86MTc70n3erVs5OEqsla9
	V+PQ==
X-Gm-Message-State: ALoCoQm5qYedly2g6iEASRbgfv/QrPKVPxNMJORfd7QrDxaK2f14XQkDyPqMBRucC6H7DPi++FtBBQvPh3UOl4bXWj95/wO65g==
X-Received: by 10.28.52.213 with SMTP id b204mr76293031wma.32.1451502393077;
	Wed, 30 Dec 2015 11:06:33 -0800 (PST)
Received: from ?IPv6:2001:610:612::e546:4844:7194:5e16?
	([2001:610:612:0:e546:4844:7194:5e16])
	by smtp.gmail.com with ESMTPSA id
	jm4sm66458035wjb.7.2015.12.30.11.06.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Dec 2015 11:06:31 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: iPhone Mail (13C75)
In-Reply-To: <CAMKF1sqWtAXeVqRvVNOarUr9VupQpk5zANC6HR-tVXrOoeQ27g@mail.gmail.com>
Date: Wed, 30 Dec 2015 20:06:31 +0100
Message-Id: <91F3034A-0C35-4379-912C-D6B73AB35B41@dominion.thruhere.net>
References: <1451483875-2370-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1sqWtAXeVqRvVNOarUr9VupQpk5zANC6HR-tVXrOoeQ27g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mariadb: -native also needs gold workaround
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
X-List-Received-Date: Wed, 30 Dec 2015 19:06:35 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> Op 30 dec. 2015 om 19:34 heeft Khem Raj <raj.khem@gmail.com> het volgende g=
eschreven:
>=20
>> On Wed, Dec 30, 2015 at 5:57 AM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>> When the host distro uses gold mariadb-native fails to build.
>=20
> what is the failure ?

Not near a computer right now. The same one that you get for the regular rec=
ipe without the TARGET_CFLAGS. It's in the patchwork discussion between Mart=
in and Paul for the version update.

>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-oe/recipes-support/mysql/mariadb.inc | 3 +++
>> 1 file changed, 3 insertions(+)
>>=20
>> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-=
support/mysql/mariadb.inc
>> index a6826c3..6a55476 100644
>> --- a/meta-oe/recipes-support/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
>> @@ -60,6 +60,9 @@ PACKAGECONFIG[setupdb] =3D ", ,,${PN}-setupdb"
>> # https://mariadb.atlassian.net/browse/MDEV-5982
>> TARGET_CFLAGS +=3D "-fuse-ld=3Dbfd"
>>=20
>> +BUILD_CFLAGS +=3D "-fuse-ld=3Dbfd"
>> +BUILD_CXXFLAGS +=3D "-fuse-ld=3Dbfd"
>> +
>> EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
>>                  -DWITH_JEMALLOC=3Dno \
>>                  -DWITHOUT_TOKUDB=3DTRUE \
>> --
>> 2.0.1
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20

