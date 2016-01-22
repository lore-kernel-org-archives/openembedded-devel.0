Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A5F9877029
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:31:04 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l65so477764wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9LJChWSIb/QaPWaLNaFVS2L2UoJBpXoWX0MhsocL9uc=;
	b=nvdnHBZxj8cKpsVPF43uBfKSbqyVJpEeeCzTmxpycU/zqSOeJxtLFtOldixvKqJvVC
	Ywkw7TKeEtBrqcDZ+pazGb+QXFEwwMkuGldfHCWx2wjKf4rt3AJ+0+9kCWPfsj6JOiEY
	wKW3KrWF7X5TAxAHagsFG66xJdXJ62/sGeRq43oZKpfyjbo156YzbfhXXC06q6OPw96n
	25PUQGQQ4vGx4Uqfx31RQ3dHbEdnobVUYZO3VI7fOCdussdWrPPBDNLr8dSdJdpQc3z0
	5qhN1eDN59yxQ7JCCst0qRttqznAbkgfeCbTzKA0F2UjOA1G2cDZlHf+nb24CAFXniMe
	vgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=9LJChWSIb/QaPWaLNaFVS2L2UoJBpXoWX0MhsocL9uc=;
	b=W88/Vwhcws5FzCdGSeAeEzIj0vLCSerDZzJR1bkPtMUVvn7SXHzg9XsJSgHbI+klvI
	vTtgAGgxackf6JTk1TuJ2H2QLbuTwkEuRwbuAZ9yOpqc7gmML0BW9y4jVvRRuC3G5xRa
	GUPP/mBEKf0OAVyDdi58XRzrQqcNKFxaw4hHfAU12vg2ImucgOJyNmN/YUntld1YYw0o
	b5aUxcwjzZ9vyJuQCWt+O5Ylh8zb8R6lEUBcuhVOP17xz7WMzE+zNup8xK/G9vrDUTdS
	xB5W4nmG/HYG/Kbo76GHU4fOThGWdWoee/DpI2jwIDXShtiA2MSz0V2BjtthREzToPZU
	JD3Q==
X-Gm-Message-State: AG10YOQ/fYN//EgAaadsuU8PVETsXDUMfkaAAsFVQNRNUIFallj5juG+JGf8j0j2D1m6rA==
X-Received: by 10.194.118.138 with SMTP id km10mr6256877wjb.57.1453505465290; 
	Fri, 22 Jan 2016 15:31:05 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.31.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:31:04 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:23 +0100
Message-Id: <978ea0436565b475b2fd3c82fa16d965fadd98ba.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 21/21] python(3)-flask-pymongo: add recipes
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
X-List-Received-Date: Fri, 22 Jan 2016 23:31:04 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../recipes-devtools/python/python-flask-pymongo.inc        | 13 +++++++++++++
 .../recipes-devtools/python/python-flask-pymongo_0.4.0.bb   |  2 ++
 .../recipes-devtools/python/python3-flask-pymongo_0.4.0.bb  |  2 ++
 3 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-pymongo.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-pymongo_0.4.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo.inc b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
new file mode 100644
index 0000000..939113b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
@@ -0,0 +1,13 @@
+SUMMARY = "PyMongo support for Flask applications"
+DESCRIPTION = "PyMongo support for Flask applications."
+HOMEPAGE = "https://github.com/mitsuhiko/flask/"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;startline=1;endline=24;md5=dff998d5a8469503612ee7757f3a2052"
+
+SRC_URI[md5sum] = "457a210f35ba49d2623dbcf27fbb89e1"
+SRC_URI[sha256sum] = "707ddff92f5b7bdc34d401f1f3857a3d1a9f5dba76e6a1422ccbc3651e2ca521"
+
+PYPI_PACKAGE = "Flask-PyMongo"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo_0.4.0.bb b/meta-python/recipes-devtools/python/python-flask-pymongo_0.4.0.bb
new file mode 100644
index 0000000..8daab00
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-pymongo_0.4.0.bb
@@ -0,0 +1,2 @@
+inherit pypi
+require python-flask-pymongo.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.0.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.0.bb
new file mode 100644
index 0000000..19d33ff
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.0.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-flask-pymongo.inc
-- 
1.9.1


