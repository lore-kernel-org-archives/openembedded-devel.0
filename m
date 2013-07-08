Return-Path: <net147@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5EA6AF42
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 07:46:53 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id z10so3822942pdj.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jul 2013 00:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=3O94f3sIZwCrXRqPk12rY6cbMETTWs3MGfrceVffr5o=;
	b=T4zEQimbqPWzhiPekklYfWFFHaT1vNSNFo1ZJmr1wdyu1WX9dI+qd+T4/pWIV+pFJx
	HlS+MlslIQfcXtJSwSKOEaYd+/VuB9/ue8u4saT4CFOIWM2Az1joULM+vqFXsiHdutYm
	qGYWsiDezKnJ8IEmwZMtUXDjqrxbAQZaMEylpn8Zl4wAPNfBS3pgav/Bs7LCreYeyVFA
	5Fby/j9ikrRCLcjvBrmU2xAgV8yF72KohIgDMpogFxlcM0SMjeod4eNNjnp7Jku3dd2O
	QP9uRXrc1fU65tgcPvkZt2J3mqcZ9jwNHBy3OeLp+7Ytn8cNa6MS+yjVuTHM04KGoCL1
	GBww==
X-Received: by 10.66.121.131 with SMTP id lk3mr22010075pab.43.1373269614451;
	Mon, 08 Jul 2013 00:46:54 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	pv5sm17815121pac.14.2013.07.08.00.46.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 00:46:53 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jul 2013 18:02:29 +1000
Message-Id: <1373270549-7784-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-webserver][PATCH] hiawatha: remove empty /var/run directory
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
X-List-Received-Date: Mon, 08 Jul 2013 07:46:53 -0000

The /var/run directory is already created by base-files.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
index 2c9fe80..94bcbc6 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_9.2.bb
@@ -53,6 +53,8 @@ do_install_append() {
         install -m 644 ${WORKDIR}/hiawatha.service ${D}/${systemd_unitdir}/system
     fi
 
+    rmdir "${D}${localstatedir}/run"
+    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 }
 
 CONFFILES_${PN} = " \
-- 
1.8.3.2


