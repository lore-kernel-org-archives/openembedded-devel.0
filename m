Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QCRiS-0007Jm-Ne
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 09:20:48 +0200
Received: by eye27 with SMTP id 27so129301eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=0GNFKNs8l83TMRom1AtKYRTExDDUHqoaF2b/53v9fkA=;
	b=t004r6Do5ySFB0sy5q7zBYutE9hwSwGhQkfOMNEZEP7wwLeFG1BfwExRCRmPNR2vpL
	P5HCHKtyHAPxGqQgF/snr/bsmCmNUJ7ZB8MeyNa+Z2I6OM8Ir9yxul3SN1z87S0CsGMd
	+dUIzV5Sivk3uKGYLizavYJkzQaAxBnFtyxd0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hH2l6Ed8C5We9BZiiVouIx6B3NSsVJVhjBgnyNZfb1veeh2KGvj6Xyip5dCA+/i9MR
	V1nSLHg7ohxSNgbng87q2h2gNNDJiBDYWX8EzmZVxpfySLbQ3oBiPnSVkbR43wJRog9J
	hp28y5amM53aCBt5TPiled7VakAECuy2RK33Y=
Received: by 10.213.27.146 with SMTP id i18mr1059513ebc.15.1303283906553;
	Wed, 20 Apr 2011 00:18:26 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id q53sm449015eeh.11.2011.04.20.00.18.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 00:18:25 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 09:18:23 +0200
Message-Id: <7219c2c86ee030ba8045554734a892fa4428f3f0.1303283391.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1303283391.git.michael.lippautz@gmail.com>
References: <cover.1303283391.git.michael.lippautz@gmail.com>
Subject: [meta-oe 2/6] eventlog: Re-import 0.2.5 from org.oe.dev
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
X-List-Received-Date: Wed, 20 Apr 2011 07:20:48 -0000

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 meta-oe/recipes-support/eventlog/eventlog_0.2.5.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/eventlog/eventlog_0.2.5.bb

diff --git a/meta-oe/recipes-support/eventlog/eventlog_0.2.5.bb b/meta-oe/recipes-support/eventlog/eventlog_0.2.5.bb
new file mode 100644
index 0000000..9dfa402
--- /dev/null
+++ b/meta-oe/recipes-support/eventlog/eventlog_0.2.5.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "Replacement syslog API"
+LICENSE = "BSD"
+PR = "r1"
+
+SRC_URI = "http://www.balabit.com/downloads/files/eventlog/0.2/${P}.tar.gz"
+
+inherit autotools pkgconfig
+
+SRC_URI[md5sum] = "a6bdba91f88540cc69b398fd138d86cd"
+SRC_URI[sha256sum] = "914319726bcd01a4055b1c5e09671085875af6de2b0d8589841916139574ee11"
-- 
1.7.3.4



