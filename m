Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QCTGT-0005vB-LJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 11:00:01 +0200
Received: by mail-ew0-f47.google.com with SMTP id 5so146886ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 01:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=DdpGVeM5GGNh7E7sXCmEI/c9qPZAPSEod8bSRxGAAkU=;
	b=mO2dg3K3aAvvbX87OMgy3/iFYDoIbymB7nlK3qh82t3yxSIZ8GrTQ++wlRybV5z0dR
	m7YPBbCSb1O7SbPmim2yOuzIB/Vhgzw36wk/aIN3LJ/vUcmYLwelaZjpcTVJYa0Lr/1a
	c2HVdx6TMVXtyFcjCQHyggceYC4kf1DqnryuA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kahRVA7UAxGDSFzJFC1q/cuJGN8YX3n5z9nOm89vVSPiGozOSuX8gDoNncvdEOHT/g
	wQ0VDUYWDmuUuHU30fV9amhxqx8HxjBkXE3RcOuG63lbK/KAplanJn8xzpIO5KLA5hzz
	Rx+h9pJrvL/ncasQsSW1LBpNWWBC0fXD0k3fI=
Received: by 10.213.28.206 with SMTP id n14mr2903425ebc.25.1303289860466;
	Wed, 20 Apr 2011 01:57:40 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id x54sm497908eeh.19.2011.04.20.01.57.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 01:57:39 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 10:57:36 +0200
Message-Id: <777da713452a72bee76c29944d537538f24e5b91.1303289630.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1303289630.git.michael.lippautz@gmail.com>
References: <cover.1303289630.git.michael.lippautz@gmail.com>
Subject: [oe-meta][PATCHv2] 2/3] eventlog: Clean and update to 0.2.12
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
X-List-Received-Date: Wed, 20 Apr 2011 09:00:01 -0000

* Added LIC_FILES_CHKSUM
* Move to version 0.2.12

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../recipes-support/eventlog/eventlog_0.2.12.bb    |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb

diff --git a/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb b/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
new file mode 100644
index 0000000..1dbac29
--- /dev/null
+++ b/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Replacement syslog API"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b8ba8e77bcda9a53fac0fe39fe957767"
+PR = "r0"
+
+SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/3.2.2/source/${PN}_${PV}.tar.gz"
+
+inherit autotools pkgconfig
+
+SRC_URI[md5sum] = "f9c32814f78ea2629850f0440de5ff34"
+SRC_URI[sha256sum] = "f78c218faa6b6b378f25c640a5d1188b1ecbd57d3a527432263fd44b17bbd1c9"
-- 
1.7.3.4



