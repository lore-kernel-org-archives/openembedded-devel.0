Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SA2qR-0008E3-NX
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 18:27:39 +0100
Received: by wibhj13 with SMTP id hj13so358759wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 10:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=FtICcgsV94g2DrJgtID0jPOaVU13LJmcYz9NfPV+WJo=;
	b=TfTxPl6ZEKf7LkKDbEAuseBRgl9LAY1dqhmMOl2fiGa5lR+Y/evlz4SSZYLjtXbP4t
	Fe+GoLCX2gpHOE0Wp2EyiFCmPh3HCG52HXMDg+vFFQhwxiS1U0rJVdphDi3QhAOssoBF
	3fKBCek5sfUxQ9dj8ZrqMnBPOz3FzLJfw+VWVOig7t3w7GjDt4a42pefxlKPrkYBnzoI
	4cLx0dNnDDctb97i3jLd/77CqyL1h7heLEXcyrzdWyUqjVwVzcdado2vHCnkrOdX8ydx
	7U6uINec1XSxPywd1CIvPVpgMdWsxIu2KZOnPkgbfg8kyFMU4g4gMkWGJeGh2o4a/wbm
	COgA==
Received: by 10.216.131.24 with SMTP id l24mr349957wei.76.1332263927013;
	Tue, 20 Mar 2012 10:18:47 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id 9sm8877435wid.2.2012.03.20.10.18.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 10:18:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2012 18:18:36 +0100
Message-Id: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQk7J+/f1jXHCeJYwHGmkek3yPN72X8qYWmoePTZfcrhTpLXU33NUX0R9qneOy/KBpYNmfjk
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 1/4] kmod: update to v7
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
X-List-Received-Date: Tue, 20 Mar 2012 17:27:39 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-kernel/kmod/kmod_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/kmod/kmod_git.bb b/meta-oe/recipes-kernel/kmod/kmod_git.bb
index c382ffc..aae9e7f 100644
--- a/meta-oe/recipes-kernel/kmod/kmod_git.bb
+++ b/meta-oe/recipes-kernel/kmod/kmod_git.bb
@@ -3,12 +3,12 @@ DESCRIPTION = "kmod - handle kernel modules"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools gitpkgv
 
 PKGV = "${GITPKGVTAG}"
-SRCREV = "80e54cb675d08f4f81b093a1919465ea86110a3b"
+SRCREV = "8885ced062131214448fae056ef453f094303805"
 SRC_URI = "git://git.profusion.mobi/kmod.git \
            file://0001-man-disable-man-page-generation-because-we-don-t-hav.patch \
 "
-- 
1.7.2.5



