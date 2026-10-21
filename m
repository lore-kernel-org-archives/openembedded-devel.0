Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7503.1792574969774569414
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Rv3c3HmF;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so1182888eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574969; x=1793179769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BFzdwDFW7wTV3svdpv55mLXc0xFJAqXCwGrZefnb60=;
        b=Rv3c3HmFgcrjvo7tcqhqTe5kwkssT3nZHo7Ywq7f4TfFAq2yCda1EKS/BiqTzaH1kS
         o6A0UiLQI7YnhiLKaM7kARyd8bu7LdP80BOusMPUXj3SnFFIF3uAC+pNwH1I7WIx6YYL
         7Pd6twkq/gDlEMrQ1IF8Hsjqs4TKslutL5P9vaaY/kjsJbvUd0KZ3OGZogbPxxv6ZqvL
         xZioEgOmhltHq6aOpX40/2et4YQoCTPlOjfoV0ExEzzK3gv9+VDsTFwSpsJQOlLnPq5v
         G/DoMk39T/ejf5a9yuq/8FjtyYMujItPZ7V0yvj865upiUUTzOyZizfxLxlqB3jPFwJ8
         FHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574969; x=1793179769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3BFzdwDFW7wTV3svdpv55mLXc0xFJAqXCwGrZefnb60=;
        b=K4zH6ZdlWKGIxYYiTySclkPnOJU3KYLgN+O0xpiSeJpxGgl595nkQgIEuUuN2kWwe1
         UIgbtHapWCIKPAY56tA6g1b7BcIIhZZ5FUtgX5Ax83HkHkXwrqWfdfFsbeF6harVbRRm
         uxhnUxJpE5kyFnvSB9bnvwQs6rfhTSnecjpdcCXPfRgcahKTxVPkyz1N7Dbp+ElnhUdk
         XwZ9fSBh9/Qrob5iOEMqaiEcsUH2GYVrkPONlIAVAyqUEJo1vnsToQwYoiPOOTWOPkSM
         v42nH6TBKIvW4R2JBV8MSryjVtBGRLlhbT5z2GGyt1jLDP+sKb1bSeADfKCJBHDEj+fK
         Zl/g==
X-Gm-Message-State: AFq9FYI8XjN7trJrTobGPfYqwcDLpRMrLk1Got/EpnOkbfXqDRC93Oek
	pj0uqCNtXgRaTxP6R2WzIzpOEML3yofcLlS+j2dtcYgM0sXTtNmaWfO4c8st0Q==
X-Gm-Gg: AYBFou3ZcWvmsGLvtKL4uT3Sq+6QPWxN5b2bNnZPfA1ONpDJ+4YXqBH5wra3AnUcIse
	W+Wl2uSVik+hkuQS79SrJYvK+lSmvpj0w01FDNYphxa1l+X603o9fi6cgWhkCgNplY+Yavk115i
	7uVGFh4Hk95oVBlGKzlor8Uw6RRyUdFClU3MXvnvj+Tk8JJ4BpUlDmuiwAZ8rfvTJhzbJRTWhgC
	JTaHUR9I/qEyA9phBw6T2DDaY8OM+QJWx5GyAMBiOothE7HnN11RP9KfNRLu8rUSvEwuxknrHcy
	VYu47HWoYe8SA1GuFDuveM4gCHkmLNdRQrhCc/MLUdYZQEOPFYI9IsiYyqbc09a/D3pmOZqzCNP
	bCk9NqhoesEqNa4Vs5lQyDzFBYQd1v90YtMfbAy1y0sg8pIjBZbp9ZCuJe2MU3ZcI0FPwF8Vj1R
	VqUI2yxtfarEhMPw3OCbL598h9T1g7Wq1NWtRuCbPoi1hUQc2xbp4QfMAcgxZY09C43Bl73ONjS
	USkbc09LAmnZl9LYwLkcTF7ZG4WQ+z8pY6Uk+ARWoEOK89HrFUVwyE3HjQGD3yBD4Zsy4/jmvnT
	tW9t3olY1Sfw1Edk18sYkPrWmxxL8ao=
X-Received: by 2002:a05:7022:3d08:b0:17c:a0c5:8c9a with SMTP id a92af1059eb24-190a74764e9mr2534379c88.42.1792574969040;
        Wed, 21 Oct 2026 02:29:29 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 11/44] libmikmod: upgrade 3.3.14 -> 3.3.15
Date: Wed, 21 Oct 2026 22:28:24 +1300
Message-ID: <20261021092857.3585453-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131198
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://sourceforge.net/p/mikmod/mikmod/ci/libmikmod-3.3.15/tree/libmikmod/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mikmod/{libmikmod_3.3.14.bb => libmikmod_3.3.15.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.3.14.bb => libmikmod_3.3.15.bb} (90%)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.14.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb
similarity index 90%
rename from meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.14.bb
rename to meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb
index 2468943349..bfd15cabe1 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.14.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb
@@ -8,7 +8,7 @@ DEPENDS = "alsa-lib texinfo"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "dffd82b8f254c3489c32098da831f33eac7136843d1e7ccb802f1254ad5b4219"
+SRC_URI[sha256sum] = "dc27b338154b8f88dc9e6317196d42c6abc13bf63c4e055257a18d4e38e1afa2"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mikmod/files/libmikmod/"
 UPSTREAM_CHECK_REGEX = "/(?P<pver>\d+(\.\d+)+)/"
 
