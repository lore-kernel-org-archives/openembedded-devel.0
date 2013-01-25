Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TyryQ-0007c6-2T
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 23:42:14 +0100
Received: by mail-ee0-f49.google.com with SMTP id d4so430318eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 14:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=vsIy209QuLZp8RG89cliSKJp5zKUDXJHrjDZVN93tV8=;
	b=X9T5nO75CTzPnhBbwMpZTH2HxGEF8CCKshRXrUjPZAXNmcWIRIIIJM29AFtm+DkPSx
	s5Ckvnfbgl9uS9fGZ4gTpVDPOPH5ImQVz7soGYzIsMqn2RyzfSL+TY1WHiaoKWgOz94Q
	KzAKIKMqNYgCG4n7dvdeWA60WicEVU5kUjiRMM6L0MFyykTgeSqFZ70uwOzCTICVE6Xw
	WtFUEq60DFQzo7dS9NQI9LrH5NRbVF43iDG+O4ae42wB20qQw8xYx2VoHgsWBJz6ovC7
	oh+CCnVr34eMAyg4zIzHk1haMoqU15QGe8Jrz7o++OvznDV9LAuCOjXllu3aP8xdm9PE
	ocqA==
X-Received: by 10.14.224.8 with SMTP id w8mr22540353eep.18.1359152799448;
	Fri, 25 Jan 2013 14:26:39 -0800 (PST)
Received: from localhost.localdomain (p5B0A1952.dip.t-dialin.net.
	[91.10.25.82])
	by mx.google.com with ESMTPS id k4sm3566723eep.15.2013.01.25.14.26.38
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 14:26:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 23:26:20 +0100
Message-Id: <1359152782-23743-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-systemd/V2 3/5] daemonize: initial add 1.73+
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
X-List-Received-Date: Fri, 25 Jan 2013 22:42:14 -0000
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
1.7.4.4



