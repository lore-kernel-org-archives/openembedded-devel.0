Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id AB3126FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 08:14:12 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id b14so74845742wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 00:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ddcOu6RjEM/0wXnaJixm3M0Zf6fGdb8l4DczCHcJI24=;
	b=p3oPhBFk3BsF+NTgf5f1HJP454f25c6Ze1r8TkX6VzIMK6lKVGkboGWYLhr3rQlqDy
	LiuNXVOsnpUqu+A9c6PKAINqrDlUPX43hZvna5vQ0U24IZtg9CGjnZHa9Vxx2C/R2+A2
	o+QoLRDkYB63PN2Lm8dW6EsTSFqcuxaV8vDBWHSTIWEOn+LCA5aY5vzcxg9NjRPkHZFA
	IBK1ZSuaVvt9mi+TUuu0WAsISgaGPCsUYJxF3L8phTws8EcKp6wwgDd6yodsQLEpxUGD
	51bj08SdRkNKHAkBItuPb7kMcDd2HXQ86pEDddWbfrHnQo+a08Qxagw+sIe7vK1KTMJ1
	w5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=ddcOu6RjEM/0wXnaJixm3M0Zf6fGdb8l4DczCHcJI24=;
	b=BpvYl/nNe/8+pB/pNppBsjTI+x7zV2reI8PG0nKbgOfKljy7BehnpL2+naU/EbfUW0
	4Sz2R9Fxureha2PDVzsnpqsMvTjnnUVFzIJ2QR88PG1JfyXRWdfpm/89QcxAKGUFxhG6
	yjRSMoWoobFx3qWogpcBZqNCQ4XopPfCmLcoZvixVzE9WAeC2JXvxdtatmeBCuLiB5EP
	xTvN+cd7AbrEX119lXMD7aGyS3X+aLn7Fd2U9Ahm60q7j3+o0+2lkx2Y3DZmOh/JbFPi
	c2sNUZxK8CKobUNGg3e+fp/SPIlIrcKE8jRIAMxV1ZTFo/7CRH1T0iVOgY2D6I65gIZQ
	rZ9A==
X-Gm-Message-State: ALoCoQm33YW+Q3kcMvFtHswdC1oeGAlYaz2bKu9d5a1wIRXvWkOsuxyC1PHFUXJlmifttABrxhlg61zPwYFcXrawL3ZaIFUovw==
X-Received: by 10.28.225.8 with SMTP id y8mr37103483wmg.98.1451549652622;
	Thu, 31 Dec 2015 00:14:12 -0800 (PST)
Received: from ?IPv6:2001:610:612::b8dc:33a6:8b4d:253f?
	([2001:610:612:0:b8dc:33a6:8b4d:253f])
	by smtp.gmail.com with ESMTPSA id
	193sm21923719wmg.16.2015.12.31.00.14.11
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Dec 2015 00:14:11 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAMKF1sqWtAXeVqRvVNOarUr9VupQpk5zANC6HR-tVXrOoeQ27g@mail.gmail.com>
Date: Thu, 31 Dec 2015 09:14:10 +0100
Message-Id: <FF00A155-5A85-4DE2-9A2B-0CE288BACF1B@dominion.thruhere.net>
References: <1451483875-2370-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1sqWtAXeVqRvVNOarUr9VupQpk5zANC6HR-tVXrOoeQ27g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.3112)
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
X-List-Received-Date: Thu, 31 Dec 2015 08:14:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 30 dec. 2015, om 19:34 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:
>=20
> On Wed, Dec 30, 2015 at 5:57 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> When the host distro uses gold mariadb-native fails to build.
>>=20
>=20
> what is the failure ?

The same one as in =
http://lists.openembedded.org/pipermail/openembedded-devel/2014-August/097=
495.html

>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-oe/recipes-support/mysql/mariadb.inc | 3 +++
>> 1 file changed, 3 insertions(+)
>>=20
>> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc =
b/meta-oe/recipes-support/mysql/mariadb.inc
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


