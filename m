Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFA3727C7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 19:21:43 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id l89so7374611qgf.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=F1nWFApa92MsmknBehAyhQDelt48gGoRgygv9Y7bDrg=;
	b=o2z5eFVN0YPziLtDpAWqFzSFQPi/xbsK2tY0H4YxCe6RI+0L65HVXfHp5Urf2T3f6n
	83P9535NM/tLivETniytP4a+ehKmt0yKxjViix86Z1VIhNw5lMJOqq4AkRRIQgaDnzyx
	VeVorLH1nwvEQd8XgWO1sYC90G5B1SmgnMpZg09lnB1Jyk/wE/VCPU5vZAaRW4zOFYud
	RCLaALG34CqzCBm3yv1FoYGrkJDBdz8DHK6NklgHApKZqpIP04VGAgAKfCxZ6EZsoKby
	kgzM0Z/7t6xEnA5B/JnBp/HLreLLrJr6pi0ormPhfahD0idX9R+ZLJtbLBxi4+MvophZ
	6VDw==
X-Received: by 10.229.35.74 with SMTP id o10mr51834018qcd.26.1419621704026;
	Fri, 26 Dec 2014 11:21:44 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	k11sm26659998qgf.18.2014.12.26.11.21.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 11:21:43 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:21:36 -0200
Message-Id: <1419621700-1102-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
References: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 08/12] procmail: Fix license format QA error
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
X-List-Received-Date: Fri, 26 Dec 2014 19:21:43 -0000

Fix the following QA error:

,----
| WARNING: Recipe procmail, LICENSE (GPL-2.0 Artistic-1.0) has invalid
|     format, LICENSES must have operator "([&|() ])" between them.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/procmail/procmail_3.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index dacda28..6ab1e9b 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${PN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "1678ea99b973eb77eda4ecf6acae53f1"
 SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"
 
-LICENSE = "GPL-2.0 Artistic-1.0"
+LICENSE = "GPL-2.0 & Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a71e50e197a992c862379e576e669757 \
     file://Artistic;md5=505e00d03c3428cde21b17b2a386590e"
 
-- 
2.1.3


