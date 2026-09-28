Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA8FCA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:57:17 +0000 (UTC)
Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63904.1790618233407913079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qvefwhz0;
 spf=pass (domain: gmail.com, ip: 74.125.227.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a48e359e0fso378959a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 10:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618233; x=1791223033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tc+xDS8qRLsuA+sTOiSFmpACfAg2Hhc/h7TSmHtuuHY=;
        b=qvefwhz0syckomNdzJegLCXMxCSn30VpvUNK19yLSFO8gFKIEAsWoNomXZFG5xObco
         2PiMsT4+ZReal+aaK8kyKOBGjW1VsCu2Y/bSrFk8kxt/by4cqUPJ5RE4JN2m50PIbwHz
         TTCRbNq0oEHbMCDnQKdRQIh2Zz7GZEmbKaKtYrJraQf0vHxahLs8ePIXrwr4QhZ4nnMS
         tzrdZUl3DtFF8/TJkzHCazUqF+mZppwHVOQrVs2vXv5i0H4oJ6jAUCjQiUvKTFBi3Ln6
         i8anYlhOhDn4aD8aFa8y9JfkyovQzDo2Ylb4AUxw+9Ck77zntcUH+lbSbVObgjoHWriR
         pMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618233; x=1791223033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tc+xDS8qRLsuA+sTOiSFmpACfAg2Hhc/h7TSmHtuuHY=;
        b=UY78wXsTpvAc5ylojziEnM/SGfZyY95BY19Hm2y0lt2s+V/jWpKH4425nS/oUo/blZ
         /33eTYiwGUYSi1q1V9yBywjT7mRSMuyAEhgGaMCFAQ9ek+15jOw7EPcLX6H9DoabSYlq
         iOzbiRwq0xZc7O5IIJcHdLKwQrUkHH2RD3HLvIyrWwDstVtPxfguPr2i7G1wZ7pl9/fC
         hLk7Hx5XZGLJWnsfRK0QQzBQ7uNDsITrNm9VLlrE9fC1JarKyP7D1mOW/a+SoIyVNf+f
         GWoypYTKca9h+takDrh0fiN1/uGXkjsV7+og+ob5fmOBmvVG2qAMXMmvlU4BQEgDhI+Z
         szDg==
X-Gm-Message-State: AFq9FYLDUj91j3TeI30WPJ5H1xbfz9oUM8kBr2S/wkmXwvfx4bBMadAS
	5/RAQLZfJk/HAU5pQyCmsfh9DmlqA1ouSZkHNsexUSswCbNxJbWW77AA2q3X+A==
X-Gm-Gg: AYBFou3x0cZdreygbA3vbLsjupzoT/YzE/y+Fab8pCHx1IGCIo0nn2OpkVbawXRGSHy
	U3zK+MtuHElBQHLCkfT3e89DdOs/r9HX0wiCijWPpnq7rEzTO4ucHJAlhb2742ASVLNP2ims1KZ
	PGaaOny8f94KigNuA1RCGf9VQB0WQ6TJrBdeKBbu8pD4rIGsP3xBlYYHsTCKv5m+0Wk86KuJesP
	pNrUpzWtp4fxMV9nVsbkGgyDdo45XpEuiBXYLzd6k19uxwkiXXwToPZN6SjVfGvX2SxhFRnkjOA
	APqLoxQ2aWcQ/6etlU06nYmyaTrJHZUKfnzxxuBb6rbBA+tHkbNMhrqkfrr299nWCY7etM4sg4o
	Qi+pOPOJlbkNuZfKoulZk5pxE9XmuULfJHJOyMzpSjiyUZUyWFWwA/GBRE83va/lRfutgJGyCxE
	gSDUMzjvpsicYl2BAG7Okakhpq3CuHnAZOpeVIfuHsYqO3W6+iu8GeTtuNt0IbTcJ+vc1B+AXJ9
	ySqeksWoWi64obYlFzJLsI=
X-Received: by 2002:a17:90b:4a8f:b0:39e:1c03:14c2 with SMTP id 98e67ed59e1d1-3a098570068mr11647617a91.11.1790618232604;
        Mon, 28 Sep 2026 10:57:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm577182a91.13.2026.09.28.10.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:57:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/8] librdkafka: upgrade 2.15.0 -> 2.15.1
Date: Tue, 29 Sep 2026 06:56:53 +1300
Message-ID: <20260928175656.3501512-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
References: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130465

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Upgrade considerations:

- If you're parsing the nodename as received by connect_cb,
stats_cb, ssl_cert_verify_cb or throttle_cb, make sure you're
correctly parsing it following RFC 3986. Metadata API calls
are unaffected: they return the host and port as separate
fields.
- Make sure the brokers' certificates carry the IP in an
iPAddress entry, not a dNSName entry. Previously the
certificate was validated against dNSName (falling back to the
subject CN) whenever the address could not be parsed as an IP
literal: with OpenSSL < 3.0 or BoringSSL for any IP address,
and on all OpenSSL versions for an IPv6 address configured in
brackets in bootstrap.servers ([::1]:9092), which never
verified. A scoped address (fe80::1%eth0) was likewise
dNSName-matched on every version and now has the zone
stripped before matching. IPv6 addresses ending in :: could
not be connected to at all, as the nodename became host:::port
and failed name resolution. In the remaining cases, a bare
IPv4 or IPv6 literal on OpenSSL >= 3.0, the iPAddress entry
was already used, and behaviour is unchanged.

Changelog:
https://github.com/confluentinc/librdkafka/releases/tag/v2.15.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../librdkafka/{librdkafka_2.15.0.bb => librdkafka_2.15.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/librdkafka/{librdkafka_2.15.0.bb => librdkafka_2.15.1.bb} (92%)

diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_2.15.0.bb b/meta-oe/recipes-support/librdkafka/librdkafka_2.15.1.bb
similarity index 92%
rename from meta-oe/recipes-support/librdkafka/librdkafka_2.15.0.bb
rename to meta-oe/recipes-support/librdkafka/librdkafka_2.15.1.bb
index 9a8a84da98..887541efbc 100644
--- a/meta-oe/recipes-support/librdkafka/librdkafka_2.15.0.bb
+++ b/meta-oe/recipes-support/librdkafka/librdkafka_2.15.1.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=40b04809b5d6f648f20f45143cbcb1ad"
 
 SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "9a94e11452cdeb0a844db44ee5dd01ccbe17d3ab"
+SRCREV = "c58bbed850ebe1cc493259d11e4de6ca930d5120"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

