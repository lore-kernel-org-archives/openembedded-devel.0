Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Txd5n-0002z9-CT
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 13:37:00 +0100
Received: by mail-wi0-f177.google.com with SMTP id hm2so5838322wib.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 04:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=WcEnZN9qIxq//fSkuMS+62B4Z5R8MRJodKYTxKQNoXU=;
	b=DZ5lHTc5wyLIxeytQdPUXOjogk0ITx95dZVYywZmLJWmUUsDpc9c2gxFCRDs5K7lZB
	XeXfWr2QQN2/SVEomfZhM5rjvpHQ5o0aX1B9fLsR1Ib/mDu4F0Dg45BKijpHRFSnzaVz
	FH5XJbQ6aq0BQ7oq8Pp1yE2ypmI+4u4vxR6OFGmj5hNOuewqe1WBy1kY27lWBX3jzzpt
	kL65PI0e63/wNcE/E/JlNNV+uaK+SYzW9uCDDTH836lQRUUs2TppvuJCqF6Pb9aMoosx
	1wx3UPd9DZx81OeZQkB5j9kJkQZbcHJ41TNuuheKNPqVLbPX7ZGM2y3Ug4oDP0FgSdS5
	ll2Q==
X-Received: by 10.194.143.35 with SMTP id sb3mr31911695wjb.30.1358857259697;
	Tue, 22 Jan 2013 04:20:59 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id dm3sm21294095wib.9.2013.01.22.04.20.58
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:20:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2013 13:20:57 +0100
Message-Id: <1358857259-11444-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <1358857259-11444-1-git-send-email-Martin.Jansa@gmail.com>
References: <1358857259-11444-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-networking][meta-xfce 2/4] gateone: fix QA warnings
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
X-List-Received-Date: Tue, 22 Jan 2013 12:37:33 -0000

* gateone-1.1: gateone: Files/directories were installed but not shipped
  /var/volatile
  /var/volatile/log
  /var/volatile/log/gateone

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/gateone/gateone_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index f0f727a..652876f 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -26,7 +26,7 @@ do_install_append() {
 	install -m 0644 ${WORKDIR}/server.conf ${D}/var/lib/gateone/server.conf
 }
 
-FILES_${PN} = "${localstatedir}/lib ${localstatedir}/log ${base_libdir} ${sysconfdir} ${PYTHON_SITEPACKAGES_DIR}"
+FILES_${PN} = "${localstatedir}/lib ${localstatedir}/log ${localstatedir}/volatile/log ${base_libdir} ${sysconfdir} ${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS_${PN} = "file \
                   mime-support \
                   openssh-ssh \
-- 
1.8.1.1



