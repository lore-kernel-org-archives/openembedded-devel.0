Return-Path: <gizero@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 82A2C6FF80
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2018 07:47:02 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p18-v6so36502639wrm.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2018 00:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=R5c+z+2XMBKdvQNqS49q2y1sXmduVFZdBbL+M3Ay1pg=;
	b=OqKfs61+jOBuG9NIc1wBPlHyP7mTBMfgeK3K8G+udDVzNM7WvVV8CxYIjDcRxiIruF
	fqGGoTQWP7WRW0GZTUepC6Y2eUbO7SB0j/j0WVt38M5yqV46sOU2TQHIm+vf1DwkYkgQ
	SNWh0OBgS70fPwOQK4znKcR7YxxAwO7jC1KA1e+hUnkjOL7z6I5CxG5GDom0aDyumIaG
	p3u/nvrdHXTkwwDRWdNqVc8FmCl/pktgKN6mNaZdReZ2+LKyFMydFfqtJ/cANW/5ZbR8
	PfT/MK+9gHkqlX2GmFN48AilwGV0LIdwg85GRCZDZgM2g6dbBNY7Lyr0x0zH3WtU/ywa
	Dk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=R5c+z+2XMBKdvQNqS49q2y1sXmduVFZdBbL+M3Ay1pg=;
	b=sB4DnuwWRHO1sh3VPms05xAFZR0JfyElumt7SNHSbWhzTXwJf2BQ/+mNxeqRFzpR2+
	7i9mKlVgD/E7IAcVdlyLo7b3/zvsGqtlJ7xLWSemJ3ch0kS/nst3pqdl8X7XbYM25bTL
	B2aAkWBfgPHS2vYkiGGqJVRXw22+vqNcVhpAtLdc+toAWNBQuwXl6WNHlBvYkPxFl/4e
	j6kuHl7gkqu7pMa1aOx49LPQHLlghvWkSWbvwtK0FASZyxFfJEfl8Cm6UCW67ln5/i0q
	BA+7vOKS/Ka+TOXMAzCrTjWebNONhryy9yJOeQBhYVDIGKlc9emlMRqEOn4MS4MRzwjf
	MmPQ==
X-Gm-Message-State: ALQs6tDEzmOiDQKtvHRWIdI6WkDwE/i95IUXJmiPSM6/9cvrh8Mt5HL0
	O2X2ZAaCVOOpM9Z+2nfgGPm7P32T
X-Google-Smtp-Source: AIpwx49DBvM/T8CqZKlCCblrgxsQGaTZ0QnoI+B/1qkc9pZknHVm/C9OD8dJOd6iON1KODML+p0v1w==
X-Received: by 2002:adf:af65:: with SMTP id
	z92-v6mr26889058wrc.250.1524728822467; 
	Thu, 26 Apr 2018 00:47:02 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host193-245-static.58-79-b.business.telecomitalia.it.
	[79.58.245.193]) by smtp.gmail.com with ESMTPSA id
	v5sm11715719wmh.19.2018.04.26.00.47.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Apr 2018 00:47:01 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2018 09:46:53 +0200
Message-Id: <20180426074653.15794-1-gizero@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-python][PATCH] python-flask-restful: add recipe for 0.3.6 version
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
X-List-Received-Date: Thu, 26 Apr 2018 07:47:02 -0000

Flask-RESTful is a simple framework for creating REST APIs with Flask

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 .../python/python-flask-restful.inc              | 16 ++++++++++++++++
 .../python/python-flask-restful_0.3.6.bb         |  2 ++
 .../python/python3-flask-restful_0.3.6.bb        |  2 ++
 3 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-restful.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-restful_0.3.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-restful_0.3.6.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-restful.inc b/meta-python/recipes-devtools/python/python-flask-restful.inc
new file mode 100644
index 000000000..0485f85aa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-restful.inc
@@ -0,0 +1,16 @@
+SUMMARY = "Simple framework for creating REST APIs"
+DESCRIPTION = "\
+Flask-RESTful is an extension for Flask that adds support for quickly building \
+REST APIs"
+HOMEPAGE = "https://github.com/flask-restful/flask-restful"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783"
+
+SRC_URI[md5sum] = "8243ca101185b130d8fa529cbdbdbddd"
+SRC_URI[sha256sum] = "5795519501347e108c436b693ff9a4d7b373a3ac9069627d64e4001c05dd3407"
+
+inherit pypi
+
+PYPI_PACKAGE = "Flask-RESTful"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python-flask-restful_0.3.6.bb b/meta-python/recipes-devtools/python/python-flask-restful_0.3.6.bb
new file mode 100644
index 000000000..1968d1d9d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-restful_0.3.6.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-flask-restful.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.6.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.6.bb
new file mode 100644
index 000000000..6bff59a56
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.6.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-flask-restful.inc
-- 
2.17.0


