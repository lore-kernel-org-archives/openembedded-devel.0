Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0CDB66AD45
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:29:58 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c41so3391515eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=/ZE+lrIE7JUyGUOZDZtZVSHMSkGDCT4enDUdgjjTAhc=;
	b=h2StiJaaJRSTp0Uf4dCC3D+2KKN5tu+NVPJuzVMsePecxC8GnqVRsSLxorqDjjm1si
	5SzME64ctxMfM+1owhxFud2zXCl8V385gu5q1mnnnNUnRyOFSoPJfQozo0SgRSRIYcUL
	PTQRKZ/2xzpXIWB71phdSRrZGj2amo32Chg6UGUBQLwAqkwJy5kluKEZzI2dnxr9mxjQ
	flBTyIFBC52h3NV0/zG92LKCAFKzKNkVdNorkBEvL9vYBwGsmpgWMb/p95Rw+zUDPKaI
	IMtQLc0oLdy1cUM04m0XfR9GjnpQQjcg7A9v+v/fd/Nbogxk9AbbZ2vtFU1wHT5rk7I7
	Po4w==
X-Received: by 10.14.209.5 with SMTP id r5mr3596853eeo.112.1371662999750;
	Wed, 19 Jun 2013 10:29:59 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.29.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:29:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:20 +0200
Message-Id: <1371662967-31734-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 13/20] polkit-group-rule.inc: add a common template for polkit-rules/user-groups
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
X-List-Received-Date: Wed, 19 Jun 2013 17:29:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-extended/polkit/polkit-group-rule.inc  |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-group-rule.inc

diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
new file mode 100644
index 0000000..8d1a89a
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
@@ -0,0 +1,9 @@
+# polkit must prepare polkid group
+DEPENDS += "polkit"
+
+inherit allarch useradd
+
+do_install_prepend() {
+    install -m 700 -d ${D}${sysconfdir}/polkit-1/rules.d
+    chown polkitd:polkitd ${D}${sysconfdir}/polkit-1/rules.d
+}
-- 
1.7.4.4


