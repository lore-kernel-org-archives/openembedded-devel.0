Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id AD63B61312
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 00:36:12 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id q39so246219pjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 16:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=DMCZOCzg6S3xrvQ/rIeYPfKp/1bVHj2B/GhmRz/4u+4=;
	b=oQ4W82hmFtoHtDhQygJehTf+fTjktD0okDhdItHBw7cL+tlX0zo+oxfXuQ10E2E551
	iqhd55dgkndGUnvRxFrw75DUOpJBnZadXQ2VEDJ7y4a7W6qhpq68cJKottWPiUTxUeDv
	qZNi6wcASS9X91FRzOyWdumb736RxQZbeDHZQbhW0GgOeNr/vezpzHQ3FPmT55Dx9zjz
	ma7IJR8pTkQZpuntWJRqaVNxMrNfR5hjOdy4bIAwm7QBjop0/R/R+34cMi7zM8Na82lx
	jTvPBKCsNzXUqG2VezW909Z1mi/Or6gy1yqMoMd1HLfSWiT7SRXMKWqxmgZLrQRPdAQd
	hv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=DMCZOCzg6S3xrvQ/rIeYPfKp/1bVHj2B/GhmRz/4u+4=;
	b=IJHzCZi0r7X5BTjQEvd/9O/J6tLfg072R1/lCKPZhOhKdMG9K/wcue0lu+0o8XcN6b
	xoLVzhWQbG+HyAGP5ODMP8Dnt20mM1ChM49381k+GH/D4pkPdhBCuE4XnIWPNpw9QYXF
	XCN8Vrek9wygeopGaiE6e6VtsKlh7rZzNXJ9H+f9wN1y9LCeuUrF1kU+F+h4hH0Kb5af
	WDrJ0wA6PxfCxpC5Ys06PCCuvF5KrCvPHgCFZXvB4wNg+kfntleWIb5N9NKrwxkU/nyT
	QPew198JXHGg+xmnW2xn8+CKTKeTD8y+WiYSASLD5xVY2qDB7javAdL8YkA03gnB/UvP
	KqOA==
X-Gm-Message-State: APjAAAVtkByxs4Z2lp5AnVICKPnaDGmexNqQtkZUrbn3D9bHg4in7oRq
	ovWv0D0IeACd+Jo2eloJUVQtS6hhViblUg==
X-Google-Smtp-Source: APXvYqyFiwJFwBR8d3GGF1hzXtMjW3U9oy9arkFn6QpYZNW4/NWB+l1KLCCEKF3/DqNPPeQEcf4WDg==
X-Received: by 2002:a17:90a:1697:: with SMTP id
	o23mr6794764pja.62.1582245373152; 
	Thu, 20 Feb 2020 16:36:13 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id p17sm754574pfn.31.2020.02.20.16.36.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 16:36:12 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id B2E302A0532; Thu, 20 Feb 2020 16:36:10 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Feb 2020 16:35:51 -0800
Message-Id: <20200221003551.9081-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-oe][PATCH] syslog-ng: Remove config nag on boot
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
X-List-Received-Date: Fri, 21 Feb 2020 00:36:12 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

[2020-02-16T22:13:56.331425] WARNING: Configuration file format is too old, syslog-ng is running in compatibility mode. Please update it to use the syslo
g-ng 3.24 format at your time of convenience. To upgrade the configuration, please review the warnings about incompatible changes printed by syslog-ng, a
nd once completed change the @version header at the top of the configuration file

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd  | 2 +-
 meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
index 965abf722..6a8627672 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.systemd
@@ -1,4 +1,4 @@
-@version: 3.19
+@version: 3.24
 #
 # Syslog-ng configuration file, compatible with default Debian syslogd
 # installation. Originally written by anonymous (I can't find his name)
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
index 2b39b8c1f..32b98610d 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf.sysvinit
@@ -1,4 +1,4 @@
-@version: 3.19
+@version: 3.24
 #
 # Syslog-ng configuration file, compatible with default Debian syslogd
 # installation. Originally written by anonymous (I can't find his name)
-- 
2.13.3


