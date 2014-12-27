Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id DC7CE72643
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:20 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id eu11so14565559pac.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=TMjd77D+OYn4Boetgh1oupkqGvf1v8w3NedInkUnrV0=;
	b=xx236PeBYG80XcYOcVPUCeBdNnPbatHi1zIu6yYSmE/i20VTnPDe8Q4pJ6MO0G6Jmg
	a5KWcWF5lQdL9ck8U1BVz6m6gS62v42PrNyMBvLF5KkkUf3VK4sK/T0C5qmp619NzbB8
	U33jHF/VlZCXwLhIvIdA0Ychux2Qa5yhILT2f8BRulqyQcW1sJ1cVCRPudnUHkS/SSeW
	fNXqiPLz1Uc+18OTYRpFtddRe6FoDz6Smobe9WUDFvp/w2H5lmXLwYrkmIBBYFeMLhRF
	lYNfYL0j3GMiI4eHvk7I+f0Lg9JK5ILAxNLMamLBzlZLuqC6cky/0VgjnDTqQwHmOtNr
	mmwA==
X-Received: by 10.70.129.106 with SMTP id nv10mr75657388pdb.7.1419700940823;
	Sat, 27 Dec 2014 09:22:20 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:21:51 -0800
Message-Id: <80f3a32d734bab595ee88ef5aed718b4dc0b0c3c.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 04/27] samba: add winbind.service to winbind package
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:21 -0000

From: "Chong.Lu@windriver.com" <Chong.Lu@windriver.com>

This solves the following warning:

lib32-samba-3.6.24: lib32-samba: Files/directories were installed but not shipped
  /lib/systemd/system/winbind.service [installed-vs-shipped]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba-basic.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe/recipes-connectivity/samba/samba-basic.inc
index d0fa8e6..e9f891f 100644
--- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
+++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
@@ -40,6 +40,7 @@ FILES_winbind = "${sbindir}/winbindd \
                  ${bindir}/wbinfo \
                  ${bindir}/ntlm_auth \
                  ${sysconfdir}/init.d/winbind \
+                 ${systemd_unitdir}/system/winbind.service \
 "
 FILES_libwinbind = "${libdir}/idmap/*.so \
                     ${libdir}/pdb \
-- 
1.9.1


