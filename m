Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3NAL-0000WA-4W
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 10:16:53 +0200
Received: by weyr6 with SMTP id r6so3979076wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 01:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kuqD5AbRHjOAg7QhONAnj5KTEVgll5kRvU/wcvwwQDY=;
	b=KGOCuaO/YX3feAIEz+eEv5xSl2tZMPBIqcVvTfqflzXkvkPoDcw4nAJ/TdvFtDd+lf
	EBYwm5vcIpaGHEoVo144pjvD/IpFISgJU62S2sI39MDpX+SntmAig30BeOkNCNrawNvj
	W0rNkVJnwxQjZjxbwRXIHDUjruzTlFZkZCICN/lKNmIC6VVJahUmQiW540ZwCVEzggqL
	wc5AENgNRxPLZ1P5ts0Qvt9pu3s5iWhIh3D95WAlwvscdyY8sihUTfP+EUF/2+XIaQNw
	Y3bKvmkVAg+kEqGHueYyNaaPG5FSWxYp1hlvdxv2JG7KMJKZdw95NvAKWciYXG0tgkcW
	/UCQ==
Received: by 10.180.109.129 with SMTP id hs1mr26917393wib.0.1345449891254;
	Mon, 20 Aug 2012 01:04:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm39835528wiz.9.2012.08.20.01.04.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 01:04:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 10:04:40 +0200
Message-Id: <e008cc8688504687b1e3a62a149a78d3da1375e7.1345449825.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <695786ad0fac01f3dff2232a187e95ab7ef864b0.1345449825.git.Martin.Jansa@gmail.com>
References: <cover.1344599409.git.Martin.Jansa@gmail.com>
	<695786ad0fac01f3dff2232a187e95ab7ef864b0.1345449825.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345449825.git.Martin.Jansa@gmail.com>
References: <cover.1345449825.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/6] systemd.bbclass: add option to disable automatic RRECOMMENDS pkg-systemd_base -> pkg-systemd
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
X-List-Received-Date: Mon, 20 Aug 2012 08:16:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/classes/systemd.bbclass |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index 4036f91..96d7f8f 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
@@ -2,6 +2,8 @@ DEPENDS_append = " systemd-systemctl-native"
 
 SYSTEMD_AUTO_ENABLE ??= "enable"
 
+SYSTEMD_AUTO_RRECOMMENDS ??= "enable"
+
 systemd_postinst() {
 OPTS=""
 
@@ -208,12 +210,14 @@ python populate_packages_prepend () {
         if len(rdepends_arr) == 0 and pkg_systemd != '${PN}' and not pkg_systemd_base in rdepends:
             rdepends = '%s %s' % (rdepends, pkg_systemd_base)
         d.setVar('RDEPENDS_' + pkg_systemd, rdepends)
-        # RRECOMMENDS_${pkg_systemd_base} += pkg_systemd systemd
-        rrecommends = d.getVar('RRECOMMENDS_' + pkg_systemd_base, 1) or ""
-        # not rrecommending myself AND avoid double entries
-        if pkg_systemd != pkg_systemd_base and not pkg_systemd in rrecommends.split():
-            rrecommends = '%s %s' % (rrecommends, pkg_systemd)
-        d.setVar('RRECOMMENDS_' + pkg_systemd_base, rrecommends)
+        auto_rrecommends = d.getVar('SYSTEMD_AUTO_RRECOMMENDS', 1) or 'enable'
+        if auto_rrecommends == 'enable':
+            # RRECOMMENDS_${pkg_systemd_base} += pkg_systemd systemd
+            rrecommends = d.getVar('RRECOMMENDS_' + pkg_systemd_base, 1) or ""
+            # not rrecommending myself AND avoid double entries
+            if pkg_systemd != pkg_systemd_base and not pkg_systemd in rrecommends.split():
+                rrecommends = '%s %s' % (rrecommends, pkg_systemd)
+            d.setVar('RRECOMMENDS_' + pkg_systemd_base, rrecommends)
 
     # run all modifications once when creating package
     if os.path.exists('${D}'):
-- 
1.7.8.6



