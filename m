Return-Path: <ticotimo@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB3B9204E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 05:24:28 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 2so956931pfg.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 21:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=33AoTxvo4He8lfuLNRcQkggO8u+XseuIs35s0numuLA=;
	b=JJz3suDI523aR+g/nYMyKjMN/yKWCKLTcfjxSzrsg++AIXjLPx4Gk1iqOUAy4RBvrz
	ZjP2L1Zu/RSkYd8ywKK4oeVagUuXjeywPYi9W/GIm7yq2AgGH+tKoOsRzKCu4PSGpW1P
	Cco6AZ4OIG0r4qnk4P0mjmRkobReO4tEgQwSFe3o9fkW+LJTa5I7YSklcX0RB2zKMlVz
	yIqLRTx3m8qOLb180PE5JqEYxGb0YYzshjtFNxusFztgJjVYGDNwGdIbatUMM7xu6Ai+
	d4tOCuYzLKVlJt/GJ5cOiGO+H1bMcOokvXA4Ree/31ejaGmorUkExeC4+4cRZ51pZHL+
	doig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=33AoTxvo4He8lfuLNRcQkggO8u+XseuIs35s0numuLA=;
	b=T0MDFCHbo8iGnuONTXHWFf/IfS9Md3ZY95k/IoAPpSz52l/p07xvtM9NXCZtmUE4eK
	JdP4HHRtFsEW316A9W6u9TNUDnMzaluPYwuDVZiJ4NrfNSeeOMUJm4JMNdzwGIgUhOf6
	L2518Byg+MB4uJeIny+NsmV8XFCiw3fxVzqhDo4ME+KD6CkZ3CCGEmupjN7rgIEgA7dg
	gZVI8mebH3IV7WA+AT3n5yONr2WYbALKjtKNzKVfvWhru/c6KaUgEYbv55uw6sY9jYba
	NObX0snSznxTIJoDiKpRLQ0+t16MEqOcNqvB+roGnC/WLDQQ61xVSXfVbOVlzumvb2EZ
	XPaQ==
X-Gm-Message-State: APjAAAW33w+hbyNPrvurSs9WjsJ1yhE9LFQjNZdA0L5KX1mUhkY/v45h
	WxTJFEnwr+8Xk+256E3GCbJrfN3lfYk=
X-Google-Smtp-Source: APXvYqxAlwNZlBtDd2MQaZ0uUoHvO9MMlRpQcCeRZlk8bPqfFgVBYGVgEhHQEwWpI1hbhtMV2nqxOw==
X-Received: by 2002:a63:3750:: with SMTP id g16mr2123895pgn.413.1579757068882; 
	Wed, 22 Jan 2020 21:24:28 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:982e:71f9:9a69:ecbf])
	by smtp.gmail.com with ESMTPSA id b1sm774257pjw.4.2020.01.22.21.24.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 21:24:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 21:23:57 -0800
Message-Id: <20200123052357.25350-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-waitress: add missing target RDEPENDS
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
X-List-Received-Date: Thu, 23 Jan 2020 05:24:28 -0000
Content-Transfer-Encoding: 8bit

* Missing run-time dependencies:
    ${PYTHON_PN}-datetime
    ${PYTHON_PN}-io
    ${PYTHON_PN}-logging
    ${PYTHON_PN}-re

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-waitress_1.4.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-devtools/python/python-waitress_1.4.1.bb b/recipes-devtools/python/python-waitress_1.4.1.bb
index 7ab4aaa0..3e144b5c 100644
--- a/recipes-devtools/python/python-waitress_1.4.1.bb
+++ b/recipes-devtools/python/python-waitress_1.4.1.bb
@@ -10,3 +10,10 @@ SRC_URI[md5sum] = "e6b9f0406cb4e6fedcc3add96411786d"
 SRC_URI[sha256sum] = "f4118cbce75985fd60aeb4f0d781aba8dc7ae28c18e50753e913d7a7dee76b62"
 
 inherit setuptools pypi
+
+RDEPENDS_${PN}_append_class-target = "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-re \
+    "
-- 
2.25.0


