Return-Path: <andrej.rode@ettus.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id B141671A3E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 01:05:41 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id x125so20088965pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 18:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=+FmTAiXaGGoLmUZ2ha92pnOkODs4unuzxoedyWqJbyM=;
	b=x9ywlCTKTo5hrTtNl9nKEXmeYczJtIl3PHlgl26H/d4B0KGjS/RMG1dlx19dJGAW1t
	64C/WsLYIzq67SZXSZfc/UFLFzacwW32Sr1GCbSjHIQk77kYXOCR4WvDsUnnGHo3Y1uy
	kPwXPHYuJwUIwLP7Sy2szxQWB5+YjW8KLl3fC6jMe6a5qydsREbOY3MbUiVY5c7hsbR/
	H0rAiDsvdGixSfsIO7+kM3wftML7Z9PwsKD6+3BuTwi+DS5Pbg3ooJFc0HHoQtTbcqHM
	q67C17MjDEQzOsnkPn6y+aEiX6zGZNJ7xIQlnjrZl+4yarl+bOpUKOlGSNEla3l/PQmY
	8Y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+FmTAiXaGGoLmUZ2ha92pnOkODs4unuzxoedyWqJbyM=;
	b=fgKBwh4xd/tYbqj2LnFQp5nG4ECMKS/1U/+cdyCOzAqAwSNk7X8hSUAtGq1/oob3Is
	f6GCflgfWbKyIOBi5j13AyccI8jDuUt2x+PuoZ/W7hMmo3Qr+VvYMbAiq3z8cc+EjGnJ
	BaXsYJ2XPHb2b49nKSjtNnz/qLAmuDVDDxjxCmFNa93jeUZXEqZZfTSvZ6Gk9BXPWTsy
	UV+xjzdLhgnIU5JbCuOxTO58mghKuS5yPnhD3bYn3GiQ3SheZfagWixxdjmuFi8shwu6
	sE9CnkpUynV27m7rToHMSciRuLATRcXVvFe1VlQWQSOB/27uvYIbih/fMoy5c+1LuDb8
	drxA==
X-Gm-Message-State: AFeK/H0Jyiyq+kD8L0QRZtyBuM64u/WDJuHL4l74mXBDvQunExrrK7fHeIqlVSJXG/4ui8Fp
X-Received: by 10.84.177.36 with SMTP id w33mr39902071plb.105.1491440742490;
	Wed, 05 Apr 2017 18:05:42 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id y65sm27094pfd.82.2017.04.05.18.05.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 18:05:42 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Apr 2017 18:04:51 -0700
Message-Id: <20170406010452.16529-1-andrej.rode@ettus.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-python][PATCH v2 1/2] python-gsocketpool: add new recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 01:05:41 -0000

Adds recipe for python-gsocketpool as a dependency for python-mprpc

Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
---
 .../python-gsocketpool/python-gsocketpool_0.1.5.bb           | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb
new file mode 100644
index 0000000..ae7f264
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A simple connection pool for gevent"
+DESCRIPTION = "creates a pool of connections that can be used with gevent"
+HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
+DEPENDS += "python-gevent"
+RDEPENDS_${PN} += "python-gevent"
+
+SRC_URI[md5sum] = "04f618864b18d6b06f774994f172ef49"
+SRC_URI[sha256sum] = "b6b73deab9bcbc428d4813697eebe5c3b9c40a971f62e13607b881aa749af9d0"
+
+inherit pypi setuptools
-- 
2.10.2


