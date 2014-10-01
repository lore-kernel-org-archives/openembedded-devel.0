Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2130765F77
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:29 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id ho1so1096963wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=OHKOgERjfTNkEsyfzi3H9CZgpzDMPIWNKyB9lya8FKU=;
	b=UMyQBag1jdJnt7AHxwJkqlUHUI4ftNf7fKXV9jTTpkOD1oBGdSWCkgvxKli7O7LWQD
	4/deCFPGDUOb2pioJeCRmI6G5wp2jPglcqshsxzTRrraUR84zyEBl5W9MtDbmBXA51Fx
	qZixX4n6guVaBkZnBcmd8TZMPWHwEyvCj3OOaXkauhoQaTKqxxo8qBFoJxuWdhA0lenh
	tI1JvG1xghHA7at3tn2PqIxXy+iPwDwnhuZEdbhdfv0WF8pMZ5xOo+CTdKjh4zqwFWqU
	lzZz/39e02MZ5InDzcdXbnwScYqvunG0THargxGjInRYfJ5u8Xg9uiu+WEJRXrIujY9t
	3HRw==
X-Received: by 10.180.75.49 with SMTP id z17mr11960153wiv.3.1412151570507;
	Wed, 01 Oct 2014 01:19:30 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:07 +0200
Message-Id: <1412151555-19865-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 07/15] ristretto: don't blacklist - tumbler is up again
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
X-List-Received-Date: Wed, 01 Oct 2014 08:19:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb
index 566d600..8e485f9 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb
@@ -7,7 +7,6 @@ DEPENDS = "exo libexif gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo"
 
 inherit xfce-app
 
-PNBLACKLIST[ristretto] = "BROKEN: rrecommends broken tumbler"
 RRECOMMENDS_${PN} += "tumbler"
 
 SRC_URI[md5sum] = "6b8c9a5d7ed319e4c84a9fefaa18792c"
-- 
1.8.3.1


