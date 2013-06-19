Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 081846AD77
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:30:01 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c41so3402106eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=r5ucWPrtF22DdGECBN4DwHfAqI7ZaXMGTVqzLa40AmQ=;
	b=mMx4C+yU5mpdOVg0lnZuoOAbFSwCTHBx2a/7B0FNpN59fF34sF/Gg2QJ877IkYeYff
	7Ajg12/bawj5jDFaPXvCrkg6h6uYFmrPoMSZI8qMsNHZvN5DUyULZ8EIYpywoR9XaotO
	cGqrJG5Nn58mbL+dGG7/RQFlQE071MLQcQ5t+zkeYhDI8/r3MvlzMUylB4dVgJ1nRL4e
	Q+pUyGNAR4oqJ44h2YrPhbllR7ke7tomtneYQsgmQsF1nrJkhTtiRfhNEgdaA9nNWazY
	/Yctet5CCCWRFrz1rJv8TH7q0codYnouYb2YKLbJesCTD2wt+PGsCR7yhLJcDJQBIf2Y
	Dwxg==
X-Received: by 10.15.42.129 with SMTP id u1mr3570374eev.116.1371663002744;
	Wed, 19 Jun 2013 10:30:02 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.30.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:30:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:22 +0200
Message-Id: <1371662967-31734-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 15/20] polkit-group-rule-datetime: initial add
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
X-List-Received-Date: Wed, 19 Jun 2013 17:30:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

add user-group 'datetime' allowing members to change date/time/timezone settings

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../files/50-org.freedesktop.timedate1.rules       |    8 ++++++++
 .../polkit/polkit-group-rule-datetime.bb           |   14 ++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/files/50-org.freedesktop.timedate1.rules
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb

diff --git a/meta-oe/recipes-extended/polkit/files/50-org.freedesktop.timedate1.rules b/meta-oe/recipes-extended/polkit/files/50-org.freedesktop.timedate1.rules
new file mode 100644
index 0000000..95b0e0f
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/50-org.freedesktop.timedate1.rules
@@ -0,0 +1,8 @@
+/* give group 'datetime' rights to change settings */
+/* based upon http://lists.freedesktop.org/archives/systemd-devel/2013-March/009576.html */
+
+polkit.addRule(function(action, subject) {
+  if (action.id.indexOf("org.freedesktop.timedate1.") == 0 && subject.isInGroup("datetime")) {
+    return polkit.Result.YES;
+  }
+});
diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb b/meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb
new file mode 100644
index 0000000..373e4f0
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Create usergroup datetime. All members off this group are allowed set date/time/timezone via system dbus"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+require polkit-group-rule.inc
+
+SRC_URI = "file://50-org.freedesktop.timedate1.rules"
+
+do_install() {
+        install -m 0755 ${WORKDIR}/50-org.freedesktop.timedate1.rules ${D}${sysconfdir}/polkit-1/rules.d
+}
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system datetime"
-- 
1.7.4.4


