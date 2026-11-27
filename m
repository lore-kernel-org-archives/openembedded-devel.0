Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8195.1795739683844736305
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PISlM+WS;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3866a784546so10293420eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739683; x=1796344483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMhVRGxMlqH6QRO//J1/6ublkXvNDJk+iUCD0R1U5pc=;
        b=PISlM+WSceZufiZ1zlBDX92m//zvXjIS7HcqknBqwTgGrtdExIPQw+ucHfvEiaKMnp
         wWKbpXBrITjqayaYJDDkeKeM1+AMFg2txTOWRjsBAfiffXOdMhtQo0OkvQpWsif8Ha+x
         Ps5BEkOcZxMg3sX4bOX88aHAZgy8mNrIxMGx4hXutDCzgIXsrPCbBIQ2cV566EujQEyd
         mOoMIAOnv8HQLgxi1siDsej7frspM7hey/M1a9CZ0YoKksluFLR3NCeECKUPlTD1T0UF
         9iknFskWZ4SVqIp0Y/ly4CI3a3ZxUXzF+hCugS9L6VL1cumppHiVeu25kUOZz/Qv+aXx
         d8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739683; x=1796344483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yMhVRGxMlqH6QRO//J1/6ublkXvNDJk+iUCD0R1U5pc=;
        b=j+WnLiV13y1rQZmfc1Ho5A8fFLh+iiJGyt/R6mg0s+UfSJV1lGeOfv3w+vhLdtQox3
         ytlm3fKG7T6O1yjCpO2j70CT2T0ibc7hQo7jsEg+0qggaOl2mJOF4qLwlgoiW0NwNISA
         PeVk74VhIw9J+ifzxU9dpoeb0RKogTkTT01KHXX07cgsYHSi5uLfCcKMrvUrOqjq+6r1
         CiPYf7KUtrn6DqMBRiGqEaagRq/ksLjarLNZRvIsU3H1S19MY6u7K+FwBgImHOs0cLDL
         zpBbRrg7PgPw1Bk6bdmsEKtGpJyIE3TyvIms+VR+vOZIyUCoRt2ZpWvt77nwDEAazQjs
         8OBA==
X-Gm-Message-State: APuU4Z9ghJFYWtwQ7cOT6I0JBqVVOydJ4hTt56zpyo+SatpxzG8uv889
	zVG9hHHU1zGxTZqwH9vWl6JOvLTBwxMn7lFrP7fj8Ao6fqoG/rUbJFAS1jUUj1e+
X-Gm-Gg: AZFdTZfqSOGZiyQgHDwdrxQQnebf31pTk5uGU1Qz3yxcV1MAfaNypbz68qVeKYNTtSZ
	xperNJw2q9tfmnqxFNOoi0x8PYLzO1RdzmTFQB8vcDcQI2qL4aGYsPGIhQDboyPccfHAavHCWdk
	QhbhmEqIweWM1XL0qvxRy7DNP7xk052v89TTDGp73hzihiHk0oiPjdJMI0huMAagWqxUDljfrF2
	MNqVATiTmxWR3DvzZ8p1R5rlSvnTzMl5F96RiXrKX/u2NJOXOIxnrcNDWjLJ8Zdl8wXVO19xICn
	lqBH2t5a+Eyoh0Jdb881YwkylCmBO0xcEgNsB7DNDqvN3aGk/fL+4XtobpQpc3ll7NXZ+JsAyVq
	2Z0JT0U+q4+7QXcgDW3ZkEzXPRI4yMUE4LR5jv93B3ycpxhVnrnBcuH+tYZx6McVJfKgX+zX9WL
	VjmnqQxBcjGKqV9YVFMYQYgxwj2ttwjz/tEysGdq34lrko43D/QtfPoGlGvtfYSy1EWVSvZC5QL
	zLpYhx+8CK80Xs36kGGMIUxfhRv5fb/a17+3vP/DIbIb9euTxmC2bqWAQig8U+U4pgpxSIOU5gW
	vX9uq3zHgTh1TqSiTjXCww3TvemuErwDdoAViE7JHFKjs1NMQPrVVFstRbDgWVJCaEL6yJkaVwX
	hHgYU1VQ65mXOt/NFIeqq6UjFOhG2e9vfG7bO2KaUrtTgwMig0gxbWOZ8kSL/BDxX0PuiGLi+4S
	g56UTL1KmTm5Sy25mXt48/ahJ2sMq9PtOsjzTduyFEHmPthvmceUMgiqlX09ppwKcUYgyQcTZAJ
	/n78x3h71OpcEq319sYZekifEcD94Az+UqOEi4n8Vuy6OqN1QMPc7EZues5OjmBatk5EpXi6kD7
	9Bd+
X-Received: by 2002:a05:7301:7e07:b0:35f:2858:aa4b with SMTP id 5a478bee46e88-38570e23830mr22062879eec.30.1795739683075;
        Thu, 26 Nov 2026 16:34:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 12/69] modemmanager: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:28 -0800
Message-ID: <20261127003425.2166632-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133112
Content-Type: text/plain; charset="utf-8"

upstream-version-is-even only sets the tarball regex, so the git tag
check reported the 1.25.95-dev development tag. Match only release
tags with an even minor version.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
index 9227c4b7f4..57bda359e8 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
@@ -13,6 +13,7 @@ DEPENDS = "glib-2.0 libgudev libxslt-native dbus"
 
 SRCREV = "f2b9ab1ad78d322f32134a444b5b54c6e8160e19"
 SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=https;branch=mm-1-24;tag=${PV}"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+\.\d*[02468](\.\d+)+)$"
 
 
 # strict, permissive
