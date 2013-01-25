Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tyi35-00035G-0W
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 13:06:24 +0100
Received: by mail-ee0-f46.google.com with SMTP id e49so147716eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 03:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=GUL4P0WfBNU0JOXqZ+CTwsU19kKtkKvQwfxCE9GOjx8=;
	b=a9GOUUgh+Mh1+k+Jvx8oi/0wnxvIbJzBFv8V9jmCZ6J5f1n6paZJ3y/rJM+aZrKGoe
	TIFQdKWxu2f67Alzsg1i2A3IH/sNMIKNPWctbOa6qoq01gYtvvJ/6w2vuauxktBDsXOt
	Rr3p4QQ0GliTA7nlekB3t0OeFD20GOqZ1tLoYJkwpPEQi2VNnfeU3GdWOo+HYiIV62Ht
	NMZh45fKfo80+ODOLz29gKgNhEV5sGCiakUGVqh8wUk0ldAu6bJPImm0h5+RAvek1mPA
	LTaY5JB8D2Ox87b0YAfpvaGttPxLSq7zApNvUUGuHcdOdBL54pZ2pc7u/67zeKxzr8YM
	pZww==
X-Received: by 10.14.214.67 with SMTP id b43mr17174303eep.33.1359114649145;
	Fri, 25 Jan 2013 03:50:49 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id f6sm1244955eeo.7.2013.01.25.03.50.47
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 03:50:48 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 12:48:54 +0100
Message-Id: <1359114536-3823-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1359114536-3823-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359114536-3823-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-systemd 3/5] daemonize: initial add 1.73+
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 12:06:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/daemonize/daemonize_git.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/daemonize/daemonize_git.bb

diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe/recipes-support/daemonize/daemonize_git.bb
new file mode 100644
index 0000000..2e747cd
--- /dev/null
+++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "A tool to run a command as a daemon"
+HOMEPAGE = "http://software.clapper.org/daemonize/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=3cf9084faa88bc8554a9139d8d7dd35f"
+PV = "1.7.3+git${SRCPV}"
+
+inherit autotools
+
+SRCREV = "93788682a4749d8b577ce6549d6d3dd6df166ba4"
+SRC_URI = "git://github.com/bmc/daemonize.git;protocol=git"
+
+S = "${WORKDIR}/git"
-- 
1.7.6.5



