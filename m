Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id A668277103
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:50:08 +0000 (UTC)
Received: by wmec201 with SMTP id c201so21821981wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=syzjUO6+9RtAWN0p7Okhjm4r214LVqR3jraQS+RQWkw=;
	b=XbpUdx1v7xl3FdGk9L2AAxoh8dVwUSIcUCDvdamuq1MKgO/zCFyR3o4VdOEqjnfpkd
	uahe/q9UPIVTYokj2GJaQ0WeFtvbrOVys1p2aa4ZVB5qezqTLcoQ2XNQ/f8ulBVczLbm
	jf5fL7fzlcLjCGHiXz6IgJr50s6AMSVVn2+E2ThQVXAzLwuQqxqV/dEhjjQ0Ny6orA80
	TzHVJnWkcLzWSbJCIBOhRZDmkG6qdAmcowUBeGIxM+HwPsMPfA4XXl3hza5zr2rWo4kj
	xAQO6QYH20NzF5jx4E8lJsRRo0vHUr6ZMT3RWnOhAahvHiP6kEcu1BwxftwHCOts/BeE
	Q6mA==
X-Received: by 10.194.91.164 with SMTP id cf4mr6275278wjb.139.1447192208818;
	Tue, 10 Nov 2015 13:50:08 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	ej10sm4763171wjd.32.2015.11.10.13.50.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:50:08 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 22:49:17 +0100
Message-Id: <1447192164-9399-11-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 10/17] networkmanager: run dispatcher
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
X-List-Received-Date: Tue, 10 Nov 2015 21:50:08 -0000

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index 3277fdc..4df8793 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -126,7 +126,7 @@ FILES_${PN}-nmtui-doc = " \
     ${mandir}/man1/nmtui* \
 "
 
-SYSTEMD_SERVICE_${PN} = "NetworkManager.service"
+SYSTEMD_SERVICE_${PN} = "NetworkManager.service NetworkManager-dispatcher.service"
 
 do_install_append() {
     rm -rf ${D}/run ${D}${localstatedir}/run
-- 
2.4.3


