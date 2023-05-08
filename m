Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B7FC7EE26
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:23:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.103806.1683541398751364166
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=mwq0mW7o;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541397; i=@fujitsu.com;
	bh=NoY4s7T9pMJWwYhO+KR72cb3se+jew01pBU2r035LVY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=mwq0mW7ozA+xf0kRLEWgjexDjKu3O+0E1JodivhjWHGQOu9ZrfGm6U/+FcExdnzkk
	 o/d+mzQypm/YtO7Hao2VCifNbhGu4C90fwbk1GudGTz3fBbfGSi5wg2TmShgBJOTQR
	 v1s2vI0xvrEgVprEFVJcUi6I5jlIMlfsm1XUHD1DXzNgbXpD9dk3ZWwH0b/HSeOf3V
	 BgSRvTj6VLmNHbGpUQ5qeOn8kRZr2xBNOKMRpsaK1GCpc/Da4r4o/ktqMUQlsRPI2D
	 pNCKhnWJli1ALZl9DPgm/fpnhSRr9EcqXer5RgbKkcdo0fRR0FfBjGe0BEaVqjyaKf
	 sjAQbgG0Z7PXA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8ORpDvlbES
  KQcN6XYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPR37WsBdeEKuZ9cWxg3CzQxcjFISSwkVFi
  7pF7jBDONCaJ/vvbWLoYOTnYBCQkpu89yQ5iiwjoSnz8MJcRxGYWUJGYMfkIE4gtLOAh0bbzI
  jOIzSKgKnG47y+YzSvgJPHwVgNYr4SAgsSUh+/B4pwCzhJfX28Amy8EVNPdO5sdol5Q4uTMJ0
  BxDqD56hLr5wlBrJKXaN46mxlijJrE1XObmCcw8s9C0jELoWMWko4FjMyrGM2KU4vKUot0Dc3
  1kooy0zNKchMzc/QSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2MQLDM6VY+coO
  xv5df/UOMUpyMCmJ8poeDEsR4kvKT6nMSCzOiC8qzUktPsQow8GhJMHrcjoiRUiwKDU9tSItM
  wcYKzBpCQ4eJRFe2SNAad7igsTc4sx0iNQpRkUpcV6+M0AJAZBERmkeXBssPi8xykoJ8zIyMD
  AI8RSkFuVmlqDKv2IU52BUEuZlAJnCk5lXAjf9FdBiJqDF/pfDQRaXJCKkpBqYEg5uLZj4qP6
  btMbbQ4H6ieeslzbE/zsklfm2/JLhl7OVP9iqUj6qZXB8XXLhwurQaYndG0L+9HMF5ZvFr3T+
  dOZtXqe+yO+FChz7Gux/3D+dskx2d4jC8R73v+ztwevm2Jep1Ab4PhMyOBW+1HD9sZznKurXG
  MOPc+6c78vIIfHtY2oW4yw1dunlFlpKO1tr9G2uHSt1XHR678Lf7YFPlx1gfsHw1br+/cT0J+
  Wf1G71aSeZxmguDQ/zmfP5rmLXGTGrJwK93VPtvn649f/U1wSewnVx2s8M9t/fe8X81A4n/TT
  LXmF5dTsmR5uqifKCP88ucmeU4twyq4md3fbcFM3i6nv12oX5qVXLNz1XYinOSDTUYi4qTgQA
  +uxMwEoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1683541396!226644!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25220 invoked from network); 8 May 2023 10:23:16 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:23:16 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 76BC81D4;
	Mon,  8 May 2023 11:23:16 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 9DD141D2;
	Mon,  8 May 2023 11:23:15 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pint: upgrade 0.20.1 -> 0.21
Date: Mon,  8 May 2023 18:23:02 +0800
Message-Id: <1683541384-25689-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541384-25689-1-git-send-email-wangmy@fujitsu.com>
References: <1683541384-25689-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102418

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Add PEP621/631 support.
- Exposed matplotlib unit formatter (PR #1703)
- Fix error when when re-registering a formatter.
- Add new SI prefixes: ronna-, ronto-, quetta-, quecto-.
- Fix unit check with 'atol' using 'np.allclose' & 'np.isclose'.
- Implementation for numpy.positive added for Quantity.
- Changed frequency to angular frequency in the docs.
- Remove deprecated 'alen' numpy function
- Updated URLs for log and offset unit errors.
- Patched TYPE_CHECKING import regression.
- Parse '=C2=B0' along with previous text, rather than adding a space,
  allowing as a unit.
- Improved escaping of special characters for LaTeX format
- Avoid addition of spurious trailing zeros when converting units and non-int-type is
  Decimal (PR #1625).
- Implementation for numpy.delete added for Quantity.
- Fixed Quantity type returned from '__dask_postcompute__'.
- Added Townsend unit
- Fix get_compatible_units() in dynamically added units.
- Fix pint-convert script
- Honor non_int_type when dividing.
- Fix 'trapz', 'dot', and 'cross' to work properly with non-multiplicative units
- Support percent and ppm units. Support the '%' symbol.
- Fix error when parsing subtraction operator followed by white space.
- Removed Td as an alias for denier (within the Textile group)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pint_0.20.1.bb =3D> python3-pint_0.21.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.20.1.bb =3D> python3-pint_0.21.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.20.1.bb b/meta-python/recipes-devtools/python/python3-pint_0.21.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pint_0.20.1.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.21.bb
index 625f50f847..13944ec780 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.21.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE :=3D "Pint"
 
 inherit pypi ptest python_setuptools_build_meta
 
-SRC_URI[sha256sum] =3D "387cf04078dc7dfe4a708033baad54ab61d82ab06c4ee3d4922b1e45d5626067"
+SRC_URI[sha256sum] =3D "3e98bdf01f4dcf840cc0207c0b6f7510d4e0c6288efc1bf470626e875c831172"
 
 DEPENDS +=3D "python3-setuptools-scm-native"
 
-- 
2.34.1


