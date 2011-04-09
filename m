Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q8OrZ-00079W-88
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 05:29:29 +0200
Received: by mail-yw0-f47.google.com with SMTP id 8so1683735ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Apr 2011 20:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=GZz3pQIYNKOrEGrGoBf0bOxv9u56f7SxQsrXe2I/Xlc=;
	b=WarcF1kbyYJ1fj8/K2xzz8fWIHpG85PytqOnOm1zdg81xAfELW06kEhSXfwxisI1dZ
	qAlUhSBp774GhmnIhXZxng7DTv+EkpDFkTAD75CrfliZ/s7kxmH4GdJZqzk2rayfBo5w
	jVKt2wj93PNh3cU4d7+jFqqNq/hIr1/7+NABQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lBBXkVXr4nYEdgWyImZ29yG2UE2arttcwT8VwJI8JnP2rQfemRS7NFUa9LmrnTEHkm
	GV2lPRtiSFUYIMHjijrQvFwXnKRMMzH/bOvY/4Peb4tC8IJfdsunmjzMEQILrFVrhK37
	Fj69BqP6kBo+fHwQlz1KqLiNmeSRUERYB07vg=
Received: by 10.150.141.13 with SMTP id o13mr2774993ybd.381.1302319641470;
	Fri, 08 Apr 2011 20:27:21 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id t16sm1767800ybe.19.2011.04.08.20.27.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Apr 2011 20:27:20 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Apr 2011 08:57:00 +0530
Message-Id: <1302319620-18223-5-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302319620-18223-1-git-send-email-heroor@gmail.com>
References: <1302319620-18223-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCHv3 5/5] ti-syslink-libs: Add Syslink version 02.00.00.68 Beta1
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
X-List-Received-Date: Sat, 09 Apr 2011 03:29:29 -0000

From: Siddharth Heroor <heroor@ti.com>


Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 ...ti-syslink-libs_02.00.00.67+02.00.00.68beta1.bb |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.68beta1.bb

diff --git a/recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.68beta1.bb b/recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.68beta1.bb
new file mode 100644
index 0000000..4a88f28
--- /dev/null
+++ b/recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.68beta1.bb
@@ -0,0 +1,24 @@
+require ti-syslink-libs.inc
+
+PV = "02_00_00_68"
+PVExtra = "_beta1"
+
+S = "${WORKDIR}/syslink_${PV}${PVExtra}"
+SYSLINK_ROOT = "${WORKDIR}/syslink_${PV}${PVExtra}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/${PV}${PVExtra}/exports/syslink_${PV}${PVExtra}.tar.gz;name=syslinktarball"
+SRC_URI[syslinktarball.md5sum] = "468034372124f70f82b60cfb5f11c8e8"
+SRC_URI[syslinktarball.sha256sum] = "ed574dcb3a5477cfbc69a1c9e768d5197291cb057d19fd791e16e1c89af3e8e1"
+
+do_configure() {
+    # Update config.bld
+    sed -i \
+        -e s:^C674_ELF.rootDir.*:C674_ELF.rootDir\ =\ \"${CODEGEN_INSTALL_DIR}\":g \
+        -e s:C64P_COFF,://C64P_COFF:g \
+        -e s:C64P_ELF,://C64P_ELF:g \
+        -e s:C674_COFF,://C674P_COFF:g \
+        -e s:M3_ELF,://M3_ELF:g \
+        -e s:A8_ELF$://A8_ELF:g \
+        ${S}/config.bld
+}
+
-- 
1.7.0.4



