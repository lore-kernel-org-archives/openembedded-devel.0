Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id CF37D6FFA6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:34 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so105234626pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=0vbBS35DTlK+bxK/xKpElAJiN3vJ25kg5l18Jn8oglI=;
	b=fmoQzzfepD+q9fdsTTKihiwTEID/VGx67vhW/Urifa5WIY9fAEggKcMKL8MZN6c/A9
	YDKptj5/1rETd0DdJR9v+qZRvuTPc7aQTTK39RBbcM1x6hyCnrcbk+7KG4Y5y09h7pYq
	2w5+Cs7jXjjHFb91ds8AjCfgPBdO3NALz63KKcLHdH169pKeWS+B3iKz6g1oMvDaDocg
	pgdZNysb9TXtnyCqLKz9d+EEj3WeOowrwV6CNo3og90p531uHYqUh5f9w8oFyVorlhV9
	vlmQZ+OjGKtgSIMEJVhaPZdCmaXZPvPIPqpVRXqaIyFkPcVUU3kmYtDZB2NFm72BDund
	2d0A==
X-Received: by 10.67.1.103 with SMTP id bf7mr46465693pad.147.1450107275616;
	Mon, 14 Dec 2015 07:34:35 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	sm8sm43630536pac.43.2015.12.14.07.34.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:26 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 35014FCC843; Mon, 14 Dec 2015 07:34:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:34:05 -0800
Message-Id: <f8103cf0233c2f58cdac218b79e8d9219b929d73.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
Subject: [PATCH 12/14] dovecot: add PACKAGECONFIG for lz4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Dec 2015 15:34:37 -0000

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
index 9b5f536..a01ef83 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
@@ -23,6 +23,7 @@ PACKAGECONFIG ??= " \
 
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
 PACKAGECONFIG[ldap] = "--with-ldap=plugin,--without-ldap,openldap,"
+PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 
 # From native build in armv7a-hf/eglibc
 CACHED_CONFIGUREVARS += "i_cv_signed_size_t=no \
-- 
1.9.1


