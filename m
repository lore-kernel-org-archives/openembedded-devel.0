Return-Path: <ticotimo@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED8C7F6CF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 05:45:37 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x185so1272775pfc.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 21:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FoX7AdkHCcNSuIimd2h8G2S8aYUuPU+mqeJVDzp8e8c=;
	b=jtRgUMytC+/mMXnaryiEDHrK4wwdNS+WXz9FcVsRk5F9+Mt1yPyILejNZ+w6sjIiKn
	OotapWzlW2Y0OJyHz35i7uB+X5PZiOUVyNPVF4wuRyDO3nbDA9GbIagithX1ci43XoTr
	Y5MxMD+SWsG1VYAT1X0l1iErm+DtgbLVBXw4w1ceCMeuEEH/X+0wIn63Vsf5BOoWiwgf
	10E7Ugj5uPVTAD/+Bq3sIJ56MKwAwphDuCCNe3JcH8kcANT+GmvMaP+1kmKbcH++e6hF
	Fh4YVQRTgAufBjYy4vJ42GgqCPQvycjySPCOm8jmpOdbLJxhDhWbV2X2V27zJzAbIKqK
	rAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FoX7AdkHCcNSuIimd2h8G2S8aYUuPU+mqeJVDzp8e8c=;
	b=YVO+m4tGp/SyRk79BK1vEuAUixKNIOZ8clvJcujj+BV8/WkXwJnUB0owx+gzD/CDna
	20OT/iOTuFZYEGrUWZrzlO0bskedYGylsnRsg8qCqV/TVtNkdkA4zDhOxaE1J8+nR4en
	UkHwqyhyO64us6f82KRd038Axe++bXST89vTxqaXeZR8KZTJrLSfV44a5uakGhOjsJEQ
	txs9B+10jm7p77KSDmLEn5IqfozQfiGRVSPGfoRsiuKz+ML7TuY672MlQ+BQY89E8xP1
	y+e9J/NT/jwpWfK4xNvDOr8k6mpJmephAUN56Ol2e0Xn+RkV0dmQhljBlHhnAdBlvJ/L
	kP5w==
X-Gm-Message-State: APjAAAXIFyHqHBEMcgcZiEYwjmoUaZhu0HHsGuz8BigofnTWVfYV/8Uw
	l7N8lAuUOHwkNa/6D0LCeWOuzex12dg=
X-Google-Smtp-Source: APXvYqzdY6ywILblR2AgQ/saRnFKTGWXBnAcp6kaexenhkwLvlgHDQFF6NOhk5FLXmh8OPBw+zgwWg==
X-Received: by 2002:a63:e0f:: with SMTP id d15mr3488433pgl.255.1575351938840; 
	Mon, 02 Dec 2019 21:45:38 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:a470:42fc:1110:b615])
	by smtp.gmail.com with ESMTPSA id
	u24sm1517256pfh.48.2019.12.02.21.45.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 21:45:38 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Dec 2019 21:45:27 -0800
Message-Id: <20191203054527.3870-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH v2] python-django: upgrade 1.11.14 => 1.11.26
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
X-List-Received-Date: Tue, 03 Dec 2019 05:45:38 -0000
Content-Transfer-Encoding: 8bit

See upstream release notes for details of bugfixes.

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.26/
Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.25/
Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.24/

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.23/
CVE-2019-14232: Denial-of-service possibility in django.utils.text.Truncator
CVE-2019-14233: Denial-of-service possibility in strip_tags()
CVE-2019-14234: SQL injection possibility in key and index lookups for JSONField/HStoreField
CVE-2019-14235: Potential memory exhaustion in django.utils.encoding.uri_to_iri()

Bufixes: https://docs.djangoproject.com/en/3.0/releases/1.11.22/
CVE-2019-12781: Incorrect HTTP detection with reverse-proxy connecting via HTTPS

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.21/
CVE-2019-12308: AdminURLFieldWidget XSS

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.20/

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.19/
CVE-2019-6975: Memory exhaustion in django.utils.numberformat.format()

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.18/
CVE-2019-3498: Content spoofing possibility in the default 404 page

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.17/
Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.16/

Bugfixes: https://docs.djangoproject.com/en/3.0/releases/1.11.15/
CVE-2018-14574: Open redirect possibility in CommonMiddleware

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../{python-django_1.11.14.bb => python-django_1.11.26.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python-django_1.11.14.bb => python-django_1.11.26.bb} (87%)

diff --git a/recipes-devtools/python/python-django_1.11.14.bb b/recipes-devtools/python/python-django_1.11.26.bb
similarity index 87%
rename from recipes-devtools/python/python-django_1.11.14.bb
rename to recipes-devtools/python/python-django_1.11.26.bb
index 3ecfdc57..8f1d6df9 100644
--- a/recipes-devtools/python/python-django_1.11.14.bb
+++ b/recipes-devtools/python/python-django_1.11.26.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "http://www.djangoproject.com/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[md5sum] = "38e82b59a1c27bbf98ccf0564ead7426"
-SRC_URI[sha256sum] = "eb9271f0874f53106a2719c0c35ce67631f6cc27cf81a60c6f8c9817b35a3f6e"
+SRC_URI[md5sum] = "858e5417a10ce565a15d6e4a2ea0ee37"
+SRC_URI[sha256sum] = "861db7f82436ab43e1411832ed8dca81fc5fc0f7c2039c7e07a080a63092fb44"
 
 PYPI_PACKAGE = "Django"
 
-- 
2.24.0


