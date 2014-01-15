Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 118D56E6FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 10:47:45 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so1600361wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:47:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Z0lFtblbEllj9Xe+awxSnkkK1ijOAwBtlJVRuHfxeyk=;
	b=bxIwkSgAl83Jsb/5j6gXpF/2slOU/jTADqE4Y17G8AF+rOfCdu7ue+BUgY7Hxn6pWV
	F1Zh26dNthETRAwkC66o5/Le1VSqfUYtJP2NKbLXpplX4fwBB36Mg+rrJffNTVv/7ET6
	1PYr9Qp8ZIMEy4t90XhoHhrL3nlYEuZIl0WXmKzWFZG4GvHF+b59yUV4kz4QUdYBdn2C
	dbsWsgUKtUHWzpgKN5oznWRkK9LAGzugq/q1RGY8+HddqlikxgjXcz7+MO3UWi05U7uW
	unOYdCrknvwgSzfq6ElMVDqxl1gHexPG5UWk79RuvitVUc67Xv6lMhLENOuvT+lfI4Yh
	a2jA==
X-Gm-Message-State: ALoCoQkF5IC1Kr+DFSo2g8Idnvrb2mZZoVN+hwfRBgBhijIVTpNInPCQ82oHTgUIdXrneIOBtymM
X-Received: by 10.180.206.201 with SMTP id lq9mr1558904wic.8.1389782866671;
	Wed, 15 Jan 2014 02:47:46 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id j3sm6016854wiy.3.2014.01.15.02.47.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 02:47:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 10:47:33 +0000
Message-Id: <1389782854-14355-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389782854-14355-1-git-send-email-ross.burton@intel.com>
References: <1389782854-14355-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][meta-oe 4/5] python-mako: remove, migrated to oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jan 2014 10:47:46 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-devtools/python/python-mako_0.7.2.bb   |   22 --------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-mako_0.7.2.bb

diff --git a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
deleted file mode 100644
index 1d2bdd7..0000000
--- a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Templating library for Python"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=da8dd26ed9751ee0cfdf9df1a16bbb54"
-
-PR = "r2"
-
-SRC_URI = "http://www.makotemplates.org/downloads/Mako-${PV}.tar.gz"
-SRC_URI[md5sum] = "e3c0a677aa4216da9e89ef8fa76cbafb"
-SRC_URI[sha256sum] = "fe8698e845035586bd711a6748e4e40a208a58de276b9138026164700494b68f"
-
-S = "${WORKDIR}/Mako-${PV}"
-
-inherit setuptools
-
-RDEPENDS_${PN} = "python-threading \
-                  python-netclient \
-                  python-html \
-"
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10.4


