Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAoJW-0006Gb-LO
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 21:08:50 +0100
Received: by wibhj13 with SMTP id hj13so1105774wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=uQbuWEMgmO437ED/ajqsZJnZ9kBLcfZCkFhFIH6yT5g=;
	b=KiuJsvF/XQpHxIxddhPW8yKz4vwJaSNnDpG8gwjGAxMkwhAuMi3SPV8Ffomcai1Krr
	sh8TMc4rsiHlz9/rBK7TEOHCDKrHKhbbTgcf09uFr3i2xW2IS4ANgmwcxckbab+3IECs
	pdPNH4xy5rk9mf+9LwHjIE8bbgI3CmxcoF67LWQSHwjrjZg9V8yGIwtVTDj70YNXkP7Q
	pvA8M4ZYFJj48YVJtGOB/SokMBM0SLIqhtET2juC9rfK0qTcbDyEYmHn5laYBDFUt4Oq
	Mp/qxNJg62Zvz9tTYyOP7TpKP/1xcefKNlf6MF/CzT6IbQugZy/XzDivp+GeGuCizL39
	hW8Q==
Received: by 10.180.94.33 with SMTP id cz1mr376453wib.13.1332446395662;
	Thu, 22 Mar 2012 12:59:55 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id l5sm7657734wia.11.2012.03.22.12.59.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 12:59:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2012 20:59:42 +0100
Message-Id: <1332446382-24958-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 8/8] slim: replace ${base_libdir}/systemd by ${systemd_unitdir} set in oe-core
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
X-List-Received-Date: Thu, 22 Mar 2012 20:08:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/slim/slim_1.3.2.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/slim/slim_1.3.2.bb b/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
index 90f9939..1428806 100644
--- a/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
+++ b/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
@@ -49,8 +49,8 @@ do_install() {
   install -d ${D}${sysconfdir}/pam.d/
   install -m 0644 ${WORKDIR}/slim.pamd ${D}${sysconfdir}/pam.d/slim
 
-  install -d ${D}${base_libdir}/systemd/system/
-  install -m 0644 ${WORKDIR}/*.service ${D}${base_libdir}/systemd/system/
+  install -d ${D}${systemd_unitdir}/system/
+  install -m 0644 ${WORKDIR}/*.service ${D}${systemd_unitdir}/system/
 
   echo 'sessionstart_cmd    /usr/bin/sessreg -a -l $DISPLAY %user' >> ${D}${sysconfdir}/slim.conf
   echo 'sessionstop_cmd     /usr/bin/sessreg -d -l $DISPLAY %user' >> ${D}${sysconfdir}/slim.conf
@@ -58,7 +58,7 @@ do_install() {
 
 
 RDEPENDS_${PN} = "perl xauth freetype sessreg "
-FILES_${PN} += "${base_libdir}/systemd/system/"
+FILES_${PN} += "${systemd_unitdir}/system/"
 
 pkg_postinst_${PN} () {
 if test "x$D" != "x"; then
-- 
1.7.6.5



