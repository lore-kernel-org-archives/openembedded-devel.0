Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 639E86AD69
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:30:00 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so3320188eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=RoHGjDQpp7Yz/cdvzC2uWpdCI1eZzodiBfhqDz4Ikbg=;
	b=Gn2L596eZno/K3SSkHaUwGtEVv+Ii0drHAl8qn1fGWvoNNrzw8FbaV5Z2bua5gp5OU
	CkX0sbB8Rr+NTELMhe+8tOjyxBLmKSQ0l/YhOmAdnfrZX2gfmqtbKiJJ4E7235nC95QD
	Kd4Bd4VQoFWTtfYXimOx3rA3mZTGXx36ff3LDMsBU4d7dMMdssLlHmG3EwQTmQ0Xf//6
	iW2agIjHkDkuoVk7fvETCUT7tlUhSlTa9/5TCZAdB1OI/pEFrWu7LQuU3TkKN43PDgH+
	g8Ni/SamlCLETr60pGkGF0idFH03ULH3ExNGkjSNW9YvErtrtPxRzCy0NTesiGK8kR9N
	xH0A==
X-Received: by 10.14.100.2 with SMTP id y2mr3623867eef.75.1371663001099;
	Wed, 19 Jun 2013 10:30:01 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.29.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:30:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:21 +0200
Message-Id: <1371662967-31734-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 14/20] polkit-group-rule-network: initial add
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
X-List-Received-Date: Wed, 19 Jun 2013 17:30:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

add user-group 'network' allowing memebers to change networkmanager settings

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../files/50-org.freedesktop.NetworkManager.rules  |    8 ++++++++
 .../polkit/polkit-group-rule-network.bb            |   14 ++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/files/50-org.freedesktop.NetworkManager.rules
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb

diff --git a/meta-oe/recipes-extended/polkit/files/50-org.freedesktop.NetworkManager.rules b/meta-oe/recipes-extended/polkit/files/50-org.freedesktop.NetworkManager.rules
new file mode 100644
index 0000000..4b50cf8
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/50-org.freedesktop.NetworkManager.rules
@@ -0,0 +1,8 @@
+/* give group 'network' rights to change settings */
+/* taken from https://wiki.archlinux.org/index.php/NetworkManager#Set_up_PolicyKit_permissions */
+
+polkit.addRule(function(action, subject) {
+  if (action.id.indexOf("org.freedesktop.NetworkManager.") == 0 && subject.isInGroup("network")) {
+    return polkit.Result.YES;
+  }
+});
diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb b/meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb
new file mode 100644
index 0000000..bba1136
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Create usergroup network. All members off this group are allowed to modify networkmanager settings"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+require polkit-group-rule.inc
+
+SRC_URI = "file://50-org.freedesktop.NetworkManager.rules"
+
+do_install() {
+        install -m 0755 ${WORKDIR}/50-org.freedesktop.NetworkManager.rules ${D}${sysconfdir}/polkit-1/rules.d
+}
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system network"
-- 
1.7.4.4


