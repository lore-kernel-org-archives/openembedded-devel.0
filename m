Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10323.1795752985243014639
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ykRbT0IU;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b546061d58so17750189c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752985; x=1796357785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eZKqF9Ozt6S+DTLWmF5b0Qg9qgB7rG7eFsfe0MUXk4=;
        b=ykRbT0IU5F7zg0A/9HMvqoGBD3lkSuNr2HHrivvKO7t9Y0V4w36O0IiTqicRmdLDl+
         rya3Lmlhl3JpjuH+fsxffe6A9p/wJVOcQVKOGUg4xlAC1d32bxsFzaDIli0i/KxeoSzN
         EI/tXrNqlYkVnTPYTrOxjFhrLwBuqTG7maHsuOwrp1lEpE1BthsKBVwLTm6xLUecnKvW
         z0mkMbExd03RK2yW+JRGhFWxx/MVAwiMbsxR4QNLorXAfhBkgW5gv20yIZUuNoDutkyk
         Eg1BgCVvvXom2TQEDSltNPrgSDsRQX4DQhb3l780Gxe+EpiQ8KiDgLJjUSQniXTF9jLw
         huKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752985; x=1796357785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eZKqF9Ozt6S+DTLWmF5b0Qg9qgB7rG7eFsfe0MUXk4=;
        b=gDBR7As9XSSOD5rFdBTA5O1ruaZT2wu4YPsQb8l87RjJqhTx4J3L1hwllTVYd5dVot
         GPlCe/Dc1OQRTKhNMUAX3w05Ax8PYs5tOrYpkLSsQtTQhAW49K/mag5cbc0cNk5NiBok
         UbbtclnK5xKUIB+YPImUDUe0h7SIV5co0b/nIkEyMdzMeaSE4HDKWvLNDYPud7ug2DeI
         mGu1JlosIn7gt2ZPm29GhQ0IAb5YX2ZG0x8W8Pus68K0EEUDB/q0O+1N4eU4TugQceGt
         q4zmBIZsuzpZydilvj+Hh1/AOAmrBDBxWwZ7lL9oWc2nOXjptZHaBtxuf/k9lPNiwHbb
         qTQg==
X-Gm-Message-State: APuU4Z+A7rX3YTYkNhUcc/Wr6ynkXVt9xiYvNTC4yT+h90hxW5l3bu6a
	dt+g1HK3KyTnZCaKNmK+M+0e1WhHXud6qgNltBGKyKdmFoD7T6kHK+/BIovcbjMU
X-Gm-Gg: AZFdTZdTF8IRg2G8EK7Yr/YueX0ZA8U2u3knmadVOA74T3m4Lkf5cPmWrzklPOQUSpt
	98+vxWDE+RsaoOc5eSvAcRrgfybFVubqYa6eqacNHon2V7quUX9MMkfSmF19wb02wyf1zoH0DRF
	D/zcqvZAAFlDOI+f9JoYJ7shzi+sz8MFLMe0XCEOYDgDFlNIJC6Ut0ml47FgqP3xD+oFDUg6CAp
	XPml1DPrtOs2ZRiH3eBMUtw+aAZ1ZGTNmngcYPV5ADH7g6rE9aHOm7DEtzaZqu6k7qfrvth0YmO
	qSDwGepfmnqWoibfvKePNGZB0vRyJp7KG/DH4aHnuioqS0OyNp2TvdTtJH99V/o1rGhnn68GUc+
	STS+pW4WqhUTevGqgdlRPYkOfsm3sbV7xRI2FS8hl45xbRo51X3sv9mIejp+Av+RDliAlFLdBkU
	KJZVstdobIAJFuvJ1ODYhDk/N6bdELDfbfDaR7mWtf7TX/dCkIZi80ca/7Oa2CVALgi3yfvgTvy
	gjwiSx5yYYOHBIEbvWzFnPI5QnuGyoUl9DhYvKjPboRwT9gQXvM9wY6/cutofRhZgrD1VJ1OWE/
	WdTyaUDL0GYD6xnJE+Zgaor3dHo8NeT2BCH5T+6WBf4JroQWKM8RmK0t9rtb0PT0G1xzESXFXC4
	1L6aya7RJO9ZL3BfHjlidx65TfcOWEJ/m2yjb64l4ah7l85FHil0Qpbo85RbFdJJ7096e8gfJJN
	084Oi7iXWIGl6IMv2CQRMLxbhSM5ZtFzi1UrAq9VQFXaBB9tWkzHRzMT0ZUNTPPVgVSUFcvq0BP
	WixoIFYqPRQZ1ERWfd1MUOW8e0zQoSp1cNIkpZD8U5crQGvWtdBlhkWW5GuoiBRzv+zd5gi0Xh5
	Z+TT
X-Received: by 2002:a05:701a:cc88:10b0:1b2:60ab:1e9d with SMTP id a92af1059eb24-1b55690cf1bmr23716771c88.37.1795752984596;
        Thu, 26 Nov 2026 20:16:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 05/32] python3-pydantic: Fix upstream version check
Date: Thu, 26 Nov 2026 20:15:47 -0800
Message-ID: <20261127041614.1775064-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133224
Content-Type: text/plain; charset="utf-8"

The default tag regex picked up the core-v2.50.5 tags, which belong
to pydantic-core. Match only vX.Y.Z tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pydantic_2.14.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.14.4.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.14.4.bb
index 333dfc4097..7c560f1690 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.14.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.14.4.bb
@@ -13,6 +13,8 @@ inherit python_hatchling ptest-python-pytest
 
 SRCREV = "1642a816171707dd8c58da6fff8061a59348402c"
 SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v${@oe.utils.trim_version('${PV}', 2)}-fixes;tag=v${PV}"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
 CVE_PRODUCT = "pydantic:pydantic"
