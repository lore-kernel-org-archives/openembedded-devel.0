Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S5wPM-0003Qz-1e
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 10:46:44 +0100
Received: by wgbdr12 with SMTP id dr12so1208473wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 01:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=+DG3z6MzB77BD07r8OOPGgssPdOPLq8lFd1nt/tlRKE=;
	b=STV9HC4U0k07UbCj9s7oJjp0/lFoVbWIIFGecY/4Dv+nAEqN4yfd04zvVdfHO3Tmh5
	BCPnYTG014aWCgFnQBc14eTE5vG/ETgAjdgJl5ECoQGUGR2Rn4GKZRsyGtBjMNgIUC4V
	kUO4JlaBxMZWX8PavgzQob7U2xOMhTz8E7BSY7AGhfjmuanRrLF3vlGEOXeu5AyEkwu2
	ITX8tJMgKuo7WpGsO/SQo+BTS4bq6D83TitAOrSftw83r8DMp/wxSni5Kuz1WwV/AyEX
	7yNW0WaWVmvQweI74F7BLRyn4tO7H6NKDIxEjIMl2kfWCbAcm6a0RUGsr+kjm/S7YQL1
	BRog==
Received: by 10.180.101.72 with SMTP id fe8mr3097973wib.4.1331285884961;
	Fri, 09 Mar 2012 01:38:04 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id e6sm618798wix.8.2012.03.09.01.38.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 01:38:04 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Mar 2012 10:37:59 +0100
Message-Id: <1331285879-807-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQkab20vWuUO/Z2/NBrN35Ll7YakT3K8a7+aTfjMatuOzv7mIFExIixjSPYKqYg8gii+q0Gq
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe] systemd: update and disable storing coredumps in the journal
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
X-List-Received-Date: Fri, 09 Mar 2012 09:46:44 -0000

Storing coredumps in the journal was mentioned as one of the reasons the journals grow so large

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 918b314..e99be88 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,11 +14,11 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r21"
+PR = "r22"
 
 inherit useradd pkgconfig autotools vala perlnative
 
-SRCREV = "48496df65c3ad1e3ad055d2b4632da7b73211715"
+SRCREV = "03f38e74984d93aa83c056893d414a5e3eac5763"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            file://0002-systemd-logind-don-t-kill-user-processes-on-exit.patch \
@@ -44,6 +44,7 @@ EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --disable-gtk \
                  --enable-xz \
                  --disable-manpages \
+                 --disable-coredump \
                "
 
 # There's no docbook-xsl-native, so for the xsltproc check to false
-- 
1.7.2.5



