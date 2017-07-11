Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id DEE9477E4A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:45:15 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id z78so5375132lff.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+vVji5zCTEhWbL2T/oDdcRoHge4qx34j65Kg/toYu/A=;
	b=pdy2x90aGOk6gV90Vei9OooNubuCy5agNSAxma0yrPod/n2c3fJrYd36avYFh4lWfm
	iMNEwGwB9PM6cavey3HTx65hBUSmmybQJ23R8xld6sgRGqJkPgSLolVdUHg7Nya9Suy3
	/oFu0l9Y/aSV/rQWmQG5/LawRwrnMSO76GVfeaIs8VP+Zn/YugjnumZLB8Ko0KdBBMim
	mpXu9P8whyqwNZ+d179ln8oPsREjdwRGl6mcobmKHeninyRaCERG16p5nGLKBYL3FwDS
	ziIwge27u9MeuZWNDujEVPsJnVVKyIgS5Qwq5QA/u57zWwFuOxCjSevqoB11Y619ZxL0
	OG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+vVji5zCTEhWbL2T/oDdcRoHge4qx34j65Kg/toYu/A=;
	b=g6UT8LpuUg+YcK26DixphDjweQKKQCt0YHhKK7AuiypQ7JEi82reOC3v2pOAJESRnj
	4ZwX3gw3QG+FgJX1v024Hs1fc26Kv53mxcC9Aq8hEEg5/dMBl9Ypq2muQiVAVz0BZwVE
	ggCywO1r7n9I7qEHE9LdQo004/eZeOXnKwxPd7NiIEb7zDWjrZUdM+boze8aJrll6j1z
	rOfJYtQV24JjvUTgy+7fbBIeOS/4qb53mjArvSOYl07z4JeckgRoa2mugnKcNgJS/32G
	OLL7tkEJHrLD2n0/LGVUJHuaLIXvmYX2Aan8lVGkTUsuAb8uvrNXKFODXlTx01RIw8uf
	cg6g==
X-Gm-Message-State: AIVw110rxZlU/7a3eFUf4f0EZh+RZi5/BYBc3OE0LEjQY23/MBj+AT5I
	/1oUtVUc1yWL7Q17T2A=
X-Received: by 10.80.196.79 with SMTP id w15mr3155257edf.124.1499791516404;
	Tue, 11 Jul 2017 09:45:16 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.112]) by smtp.gmail.com with ESMTPSA id
	p19sm1224952eda.15.2017.07.11.09.45.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Jul 2017 09:45:15 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 18:44:34 +0200
Message-Id: <1499791478-2407-5-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
References: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe/meta-perl] [PATCH 4/8] liblocale-gettext-perl: add recipe
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
X-List-Received-Date: Tue, 11 Jul 2017 16:45:16 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Locale::gettext - message handling functions.

It's being strongly recommended by po4a.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../liblocale/liblocale-gettext-perl_1.07.bb        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb

diff --git a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
new file mode 100644
index 0000000..fdc72a2
--- /dev/null
+++ b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Locale::gettext - message handling functions."
+DESCRIPTION = "The gettext module permits access from perl to the gettext() family of \
+functions for retrieving message strings from databases constructed to \
+internationalize software."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~pvandry/Locale-gettext-${PV}/"
+
+LICENSE = "Artistic-1.0 | GPLv1+"
+LIC_FILES_CHKSUM = "file://README;md5=d028249c2d08dca6ca6c5bb43b56d926"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/P/PV/PVANDRY/Locale-gettext-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "bc652758af65c24500f1d06a77415019"
+SRC_URI[sha256sum] = "909d47954697e7c04218f972915b787bd1244d75e3bd01620bc167d5bbc49c15"
+
+S = "${WORKDIR}/Locale-gettext-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


