Return-Path: <joe@deserted.net>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9952F65C66
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 04:32:14 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id hl2so4491559igb.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 20:32:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=uQCjol9EgXU7T09G9ejhhOmif4rlhbqu/scm5zkg7PM=;
	b=ATur9N4btJRJ1OHf2wyn0SNdssHet4tCMmKgC5HpaoAD7/JLjL94XzOpe+e6Kv4mND
	rJ59+7o2T0OUGV9uIK34hc3IZy0PFoRLuT3W/AEUiOeIW8bCuE8LXXMw35oPnV5i6vJT
	PN62n5pvDjB8Jp9yRgiNlR8wwl8nj/kQS/34Yqa48RC/CYmp8+MacbaR7joeiXaTElbF
	rJclrmjWuTZKANTgPzK+q2UuWUXELturoco1n1LBjDP8deXo00mURuo/aIkQLIlOZm6Y
	mZ0lYu83A38podotYjzze+9B00fJV1eFWDIaZtOmfmMqMI5vMdpDVnekJ06wrCWeCI8R
	0xww==
X-Gm-Message-State: ALoCoQnlMCNe+gJ16pyFBalPqjoObRwhJ2/1k7I26k4xLMEBCpEBHYP7seWBpnKvlxOmEAyM0I+H
X-Received: by 10.107.129.80 with SMTP id c77mr868190iod.92.1420605135143;
	Tue, 06 Jan 2015 20:32:15 -0800 (PST)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id h3sm503638igh.21.2015.01.06.20.32.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Jan 2015 20:32:14 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jan 2015 23:32:38 -0500
Message-Id: <1420605158-14962-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] opensaf: update SRC_URI and install actions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Jan 2015 04:32:19 -0000

The default configuration for OpenSAF creates /run and /var/lock during
install time.  Tweak the recipe to use ${localstatedir} as other recipes
do, and clean up at the end of do_install.

Swap the hard-coded SRC_URI with ${SOURCEFORGE_MIRROR} while we're at it.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

I was looking at the current OpenSAF patch and this looks like it will address
the issue that Khem raised about /run being volatile (at least a similar same
way to how samba does it).  If this looks sensible to everyone else, I'll
cherry-pick over the OpenSAF recipe from master-next and add this patch on top
of it.

-J.

 meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
index a58de5c..5b42def 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
@@ -13,7 +13,7 @@ HOMEPAGE = "http://www.opensaf.org"
 
 inherit autotools useradd systemd pkgconfig
 
-SRC_URI = "http://jaist.dl.sourceforge.net/project/opensaf/releases/${BPN}-${PV}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://install-samples-from-srcdir.patch"
 
 SRC_URI[md5sum] = "534c0a99438a62c4c8dda56cfa67300c"
@@ -31,10 +31,12 @@ USERADD_PARAM_${PN} =  "-r -g opensaf -d ${datadir}/opensaf/ -s ${sbindir}/nolog
 SYSTEMD_SERVICE_${PN} += "opensafd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-FILES_${PN} += "/run"
+FILES_${PN} += "${localstatedir}/run"
 
 INSANE_SKIP_${PN} = "dev-so"
 
 do_install_append() {
-    rm -rf "${D}${localstatedir}/run"
+    rm -fr "${D}${localstatedir}/lock"
+    rm -fr "${D}${localstatedir}/run"
+    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 }
-- 
1.9.1


