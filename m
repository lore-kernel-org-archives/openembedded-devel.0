Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 22F687826E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 02:04:16 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id l87so14399417pfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 19:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C2E4RP6hZYVoKlIUO1d2ailQeu9E509WCoYJsiMDPdU=;
	b=fqN2Wy0aGYzm9o7wRyHtyY5VQmox2XvZ2otlPbY3K7W+oUw4B+0swKsSu7NWmnwxnI
	t+DMyv6a9NCGK9vw9yhGtsSgHYJDsjqbH1gQmvovEbffx3ZcPWAlpHMj50IkBv9ktv+v
	LgMe1NHhrhJ0S7vA6fDw5VuU3up+Etr+NeuPr1+l6fL4Ds/3Sle/jYDP/kd7N2QW8aPM
	jAxDz+MSrzJhgq2MTc4qJDtGI/Id0C9KkrPKdB8VSbnKK+Ok5ROwDChT7K6T7510wflt
	3lTOqKTCutbFAj9rIZbzgGe58gIV8l/kggKAsDzNeYm2kqfSorFFKejERrhxWBLvt7mK
	AVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C2E4RP6hZYVoKlIUO1d2ailQeu9E509WCoYJsiMDPdU=;
	b=anOLcSExZyraSF0wrmh+L0Pve4+uneZF64hA3Ke95BIymMvEUAOUf9Ap8MO3Fo94W/
	gR+jTNNxmWjwutvOA0v9/owziLW1wKyf9ZStLq0NFxfTombgLdiF9bj8AlmxthYhvenv
	MswU8v6rq28gfBgEJRZlzxIK5W0BSknz1EJqpeyO8+fZcejDebADaeHUcPr+D+UQeTN9
	/qaFqrC9uIlAMYMNfr6i6X575vf7RnHmCmnwLO/QzF9dTR3rpmu8SBQyd7DPfkuXcVJw
	+vjUQyot3VcKzEYmQJ2UEPSKZZ+ESBcX9211pjkKpaLO2u0CzGm81vb2iUhTZKgKi9jd
	lbkw==
X-Gm-Message-State: AHYfb5hRLr8schjVd0lqNr14FXP30WVvuOoQj07FMKSJcMw4pJTjG6TZ
	nw6qtsHlutRMy9xB
X-Received: by 10.99.119.201 with SMTP id s192mr614943pgc.227.1504145057864;
	Wed, 30 Aug 2017 19:04:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	c10sm12347641pfk.101.2017.08.30.19.04.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 19:04:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Aug 2017 19:03:59 -0700
Message-Id: <20170831020401.6367-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170831020401.6367-1-raj.khem@gmail.com>
References: <20170831020401.6367-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] corosync: Fix build with musl
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
X-List-Received-Date: Thu, 31 Aug 2017 02:04:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Include-fcntl.h-for-F_-and-O_-defines.patch | 28 ++++++++++++++++++++++
 .../recipes-extended/corosync/corosync_2.4.2.bb    |  4 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/corosync/corosync/0001-Include-fcntl.h-for-F_-and-O_-defines.patch

diff --git a/meta-oe/recipes-extended/corosync/corosync/0001-Include-fcntl.h-for-F_-and-O_-defines.patch b/meta-oe/recipes-extended/corosync/corosync/0001-Include-fcntl.h-for-F_-and-O_-defines.patch
new file mode 100644
index 000000000..fe4b0793f
--- /dev/null
+++ b/meta-oe/recipes-extended/corosync/corosync/0001-Include-fcntl.h-for-F_-and-O_-defines.patch
@@ -0,0 +1,28 @@
+From 85ea47fedbc96ed9180e08b0d371d9966e3a88da Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Aug 2017 17:28:55 -0700
+Subject: [PATCH] Include fcntl.h for F_* and O_* defines
+
+Fixes errors like
+utils.c:95:22: error: use of undeclared identifier 'O_WRONLY'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ qdevices/utils.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/qdevices/utils.c b/qdevices/utils.c
+index 41850b8c..87090853 100644
+--- a/qdevices/utils.c
++++ b/qdevices/utils.c
+@@ -39,6 +39,7 @@
+ 
+ #include <err.h>
+ #include <errno.h>
++#include <fcntl.h>
+ #include <inttypes.h>
+ #include <libgen.h>
+ #include <stdio.h>
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb b/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
index 7d5a87e4c..33e74e2ff 100644
--- a/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
+++ b/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
@@ -7,7 +7,9 @@ SECTION = "base"
 
 inherit autotools pkgconfig systemd useradd
 
-SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz"
+SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz \
+           file://0001-Include-fcntl.h-for-F_-and-O_-defines.patch \
+          "
 SRC_URI[md5sum] = "547fa78704da53aa35912be58d31035f"
 SRC_URI[sha256sum] = "f26e3011309fe4bcce94b1dc20ea8c462f19483a73f3ca62f13b925d011a4ba9"
 
-- 
2.14.1


