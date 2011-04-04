Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippedeswert@gmail.com>) id 1Q6qcb-0006BF-Gf
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 22:43:37 +0200
Received: by eye27 with SMTP id 27so1698916eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 13:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=K3aTxmziqOoZ+h4pJPg4IutFAlolOxWL/6eHK9GZIdg=;
	b=B74IxpeWC5WDFQa2CaHGw60DkycgQUaL1mh1TgargmlNAJaPVzplddmFcWDOQPjBy9
	dBl7ziQTw7ALOLvimLcsTfD8ogoFS6YDAoisH6VSmmPDb+SiEQBmONNpsN3kJs92Mxmr
	VxiqWrklijFHSQAFHyGSziUhmRQ2suGo+tIk0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=gwqud02CW4d/BnsUl9ezsXbso+ouET+svRPSqu0+3dEJS/T1QdhjzQmgob/m2LQX4t
	6B88zouxA83/OH2jvmbgFN0o+AhAYWsUjNJLe67Wq/fy7+JPDYUIXC9+i2Vb12joXeEd
	34K4zDc0ljzRqj9/OhKlMss2+4NjorAESVSeE=
Received: by 10.14.16.100 with SMTP id g76mr3679768eeg.168.1301949692096;
	Mon, 04 Apr 2011 13:41:32 -0700 (PDT)
Received: from localhost.localdomain (80-186-152-89.elisa-mobile.fi
	[80.186.152.89])
	by mx.google.com with ESMTPS id b52sm3542286eei.22.2011.04.04.13.41.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2011 13:41:31 -0700 (PDT)
From: Philippe De Swert <philippedeswert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Apr 2011 23:40:30 +0300
Message-Id: <1301949631-6761-1-git-send-email-philippedeswert@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH v2] 1/2] eio: new recipe and include file for eio
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
X-List-Received-Date: Mon, 04 Apr 2011 20:43:37 -0000

Signed-off-by: Philippe De Swert <philippedeswert@gmail.com>
---
 recipes/efl1/eio.inc    |    8 ++++++++
 recipes/efl1/eio_svn.bb |   13 +++++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 recipes/efl1/eio.inc
 create mode 100644 recipes/efl1/eio_svn.bb

diff --git a/recipes/efl1/eio.inc b/recipes/efl1/eio.inc
new file mode 100644
index 0000000..d7ccdca
--- /dev/null
+++ b/recipes/efl1/eio.inc
@@ -0,0 +1,8 @@
+DESCRIPTION = "Enlightenment Input Output Library"
+LICENSE = "LGPL2.1"
+DEPENDS = "ecore eina"
+
+inherit efl
+
+BBCLASSEXTEND = "native"
+INC_PR = "r0"
diff --git a/recipes/efl1/eio_svn.bb b/recipes/efl1/eio_svn.bb
new file mode 100644
index 0000000..6a12dcf
--- /dev/null
+++ b/recipes/efl1/eio_svn.bb
@@ -0,0 +1,13 @@
+require eio.inc
+
+SRCREV = "${EFL_SRCREV}"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=403f20cf42c847686ac2956f14bfa30f"
+
+SRC_URI = "\
+  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+"
+S = "${WORKDIR}/${SRCNAME}"
-- 
1.7.2.5



