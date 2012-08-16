Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T20vU-0000y0-Du
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Aug 2012 16:19:56 +0200
Received: by bkcik5 with SMTP id ik5so1486124bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2012 07:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=kuqD5AbRHjOAg7QhONAnj5KTEVgll5kRvU/wcvwwQDY=;
	b=zJdmDTpiJ9PfDnybD9l1SbpohubJNyvUbQW0kRSzFFd2QJi/ZO12eqWKvXdJVjhrDU
	wi00jYNZMLMnEAXD2GQq+q/0o6Q5GkLq8+Xp/12wkIbeUxm7pB1buZFHLB/R1KXaKCba
	Uzodi7nMcirrdDTsneC+7v+Pw7FVByaxDhSWCW27i/EtRzYf8OZ7FegVaUyIC4NV1uHZ
	HPf5sEk3UE+MUorCn4hbS65xQVbffJtoGe6CKZfHAMYV45CvmNbv5UL9jdLu+MeN6XhQ
	zHZVP8aCHUAEPx5kMa2GW+3QtXGLwuPOYwZIMqMMhGJ4r5MB7kRsvy9YWltW93FXbXFj
	ZoaA==
Received: by 10.204.130.10 with SMTP id q10mr576450bks.90.1345126079130;
	Thu, 16 Aug 2012 07:07:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id he8sm2388442bkc.3.2012.08.16.07.07.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 07:07:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2012 16:07:46 +0200
Message-Id: <1345126066-1406-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120716182528.GO3729@jama.jama.net>
References: <20120716182528.GO3729@jama.jama.net>
Subject: [meta-oe][meta-systemd][PATCH] systemd.bbclass: add option to disable automatic RRECOMMENDS pkg-systemd_base -> pkg-systemd
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
X-List-Received-Date: Thu, 16 Aug 2012 14:19:56 -0000

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



