Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 21EE1792FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 11:07:59 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id i134-v6so9709228wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 04:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=M/IJrMgsRBQ8unqNMZhTk+jRMh5ERXWlLgJYlsUyNLY=;
	b=cR6ZLOGz/vbfIjVTno3okOofpELdHHIUb3VEpaECtvYtgy53d/n/x84V/Xxs7URHzx
	Nze98vUE0Y04ti6K6MhWG2ICUDi1Ok20wCC3wUAZRH5KLmvf6JfS7+VC6xzwmIrir6pw
	ZK0tyd5R5X0ongJcnmOrxgrSdQ5xTGP4OOatb9wda6TsN6vB7qDc111no2vkdhd5Y5mG
	8+fBVEZbG4l7zhx5ZvXSK9Xay2R1mNuhxjymG2Y8Lg4eGgVeMsrGxbSkL7qAn0A/+2YU
	CQkYsFKOK+ZKNCvSxTTpkjFCciwPC2ddTp6YJWW7yCxd5WhHvQne+13JdG1DohV6jWpc
	5XgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=M/IJrMgsRBQ8unqNMZhTk+jRMh5ERXWlLgJYlsUyNLY=;
	b=YAuywc1nu4JCvhtqFCT5IfYxzWwDvY9sqmqbe0wumyJKFfa7W/4O/FcIE/jgc6bAvH
	b/DGce+DInddmBfzDdZYF9gibCIRYgIDP3aqBG4vbOO0emnPkJaj6m1CshkqGODVIuC4
	snDbM/6bKOOJ+OcL6URUHEmZhfIWKuIq9Nnn/XWQWuP0Ywy7n7YZfX2f2J38KIX6d9s3
	OhdK/yRAhHquOs4GTCGYMH0JU2LPur6N9i/xvem/CI6QEZFmHfOKdRSHgcbm5de2zC7U
	7SeSTWQDiC+2DFfkadRhOK5iMZYERiODwMYDF+arhDJ8/q/DgBSUG9pDgAtDsUJXTiFS
	Wcug==
X-Gm-Message-State: APzg51ApuN346vNevR9V5WA7sgJbpg9Y6jzZVTllIuqh6ajPVU2/PM1Q
	jleygTF+yOiK+9hbrmZlZKYDQwY7
X-Google-Smtp-Source: ANB0VdYj1RyWE5QEqYLnTOzCbcn5phgcgTQr3Mf3x458YnboAp0IhshnpRsAfRTwlBKhNwZlBBisDA==
X-Received: by 2002:a1c:2283:: with SMTP id
	i125-v6mr5409739wmi.28.1535368079766; 
	Mon, 27 Aug 2018 04:07:59 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	a11-v6sm19243016wrr.81.2018.08.27.04.07.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 04:07:58 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 13:07:33 +0200
Message-Id: <20180827110735.6396-4-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180827110735.6396-1-sno@netbsd.org>
References: <20180827110735.6396-1-sno@netbsd.org>
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-python][PATCH 4/6] python{, 3}-pint: add recipes for python2 and python3
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
X-List-Received-Date: Mon, 27 Aug 2018 11:07:59 -0000

Add recipe for physical quantities module for python2 and
python3 infrastructure of Yocto.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../recipes-devtools/python/python-pint.inc       | 15 +++++++++++++++
 .../recipes-devtools/python/python-pint_0.8.1.bb  |  2 ++
 .../recipes-devtools/python/python3-pint_0.8.1.bb |  2 ++
 3 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pint.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pint_0.8.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pint_0.8.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-python/recipes-devtools/python/python-pint.inc
new file mode 100644
index 000000000..53f778393
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pint.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "Interval arithmetic for Python"
+HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
+SECTION = "devel/python"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+
+PYPI_PACKAGE := "Pint"
+
+inherit pypi
+
+SRC_URI[md5sum] = "e1f80f3f8fc4e61f68ad3912db26b3a8"
+SRC_URI[sha256sum] = "afcf31443a478c32bbac4b00337ee9026a13d0e2ac83d30c79151462513bb0d4"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-pint_0.8.1.bb b/meta-python/recipes-devtools/python/python-pint_0.8.1.bb
new file mode 100644
index 000000000..480f08872
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pint_0.8.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pint.inc
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.8.1.bb b/meta-python/recipes-devtools/python/python3-pint_0.8.1.bb
new file mode 100644
index 000000000..f793ac4ac
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pint_0.8.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pint.inc
-- 
2.17.1


