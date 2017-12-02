Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4167F786D9
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:13:09 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id k15so5359561pgr.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tAEUiEjX8+nNodiiawBAlAtWIVvEuWWmAw6cAZfj/ec=;
	b=gdZ/vY7UYAtwQIA4GbJ8LRGrc+te60eWWR0Z19q4CbxHT3hBclYaCjGH9WT8oWCdwO
	E+sVOxhGxHzu1mE63ZHOQi2EuigdDZHO25U2kvcdvp7T7bwUKXuashEJqTMFZWekiyZq
	vL7Wm5tKlUevB+SGUqCYjuL//TknXgpwl0oQG0NjDDAV/R4XcdoBVlyefa1CLURlN7/s
	CCg27nHF6TZVLuBiR1hxXLII4g62sp4YZsSYqlx3mxfKIZhqx2wmg9cPLna8vA/XdJkd
	ISS0+LKQcbLCYf+8SL1vznbLrqWaZQVx+DgZVMJ3goeRa0sRxJMIUGDdOxHc7PKGSm5Q
	9i1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tAEUiEjX8+nNodiiawBAlAtWIVvEuWWmAw6cAZfj/ec=;
	b=DNwI9BajQiUzzHgJeKFSJoDMgPWRamjhmHlLO5dvb23rITXxArEEHKefZHD/YAgpn0
	XFyJpuftHSP932Rd7mcCoQWIlE9g4luXkh6rTNfSm4e6L7P/B6PLg9ec0y2NSmIuerS9
	yvO+iSjyynwn92wsOJoI0QK7wjxlNVhYOK5781h65Ryh0n1kz1wMEvJ/34XEV2Hs/jAT
	prV4DSgH0iPzu571Gtd+IcqTqx42E6qmvI29Tqz3HjoJAo+v+nm8GjfT8wvQbr1LV8Yk
	NuDPt/QhP1aEN14JIs6nJgKiaY/nl2ZuSmqwOB0q5x9iNmCJY9wIDKL+20iYkQhjxt9t
	lFzA==
X-Gm-Message-State: AJaThX5AkajhAuiCpT2G/iE/pjI/g0EzKHWMES/DAnYh52qldQ8jsj0B
	Ko4jFCAng+pQebX/58wCj9txrg==
X-Google-Smtp-Source: AGs4zMbdDmGIYDc6EvUU2hpNw6AykyTfxIMB2J6qQCJejPN5sYlfr9IocBMYyo6HPIBz+OCH8DER4w==
X-Received: by 10.99.127.14 with SMTP id a14mr8309674pgd.315.1512191590534;
	Fri, 01 Dec 2017 21:13:10 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm14681137pfg.98.2017.12.01.21.13.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:13:09 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:12:46 -0800
Message-Id: <1512191576-2302-4-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 03/13] python[3]-fask-migrate: new recipes
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
X-List-Received-Date: Sat, 02 Dec 2017 05:13:09 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../recipes-devtools/python/python-flask-migrate.inc       | 14 ++++++++++++++
 .../recipes-devtools/python/python-flask-migrate_2.1.1.bb  |  2 ++
 .../recipes-devtools/python/python3-flask-migrate_2.1.1.bb |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-migrate.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-migrate.inc b/meta-python/recipes-devtools/python/python-flask-migrate.inc
new file mode 100644
index 0000000..7af4fe1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-migrate.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alembic"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
+
+SRC_URI[md5sum] = "def4106c80897b7fad2afb3bc05360e4"
+SRC_URI[sha256sum] = "b709ca8642559c3c5a81a33ab10839fa052177accd5ba821047a99db635255ed"
+
+PYPI_PACKAGE = "Flask-Migrate"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-flask-sqlalchemy \
+    ${PYTHON_PN}-alembic \
+    ${PYTHON_PN}-flask \
+    "
diff --git a/meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb b/meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb
new file mode 100644
index 0000000..af79997
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-flask-migrate
diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb
new file mode 100644
index 0000000..94abbf3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-migrate
-- 
2.7.4


