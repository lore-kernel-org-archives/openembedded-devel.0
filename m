Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 84D7176AC2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 04:56:11 +0000 (UTC)
Received: by iods203 with SMTP id s203so136284084iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Aug 2015 21:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=V7YFy6eM5ZkV7lrdnxywg/HFnBQ3loADblxIqdIg6fk=;
	b=Pe3wmOpin4IfzU2a1tgXGAd/w3qAkmHb8oJm8PhbqYLuSx70RwyjthFeQ0z4hIDz/2
	vPAhKdPt3RGDQZNVxD/onTD7vBxOmI+m0TJG5NTTC6WKCiWQ+MtlvVMLFM/1VwZUcyO8
	hObCxuDTdmUGYzQsMjUm+9ULUkExt9PaKiaVsRXvpY9SV+lRDNKEpJaBtLGjiV4/K2ms
	wKsrKDD+orDA8DnjmJntdKuKIBzxmABOoynBarVjnm4SnI2/3tAFzIStK+hSacmuP0kA
	1bbENwmmJ83AvhGUjGaVUO829m+/UmO55U19VFnjAoOgX6RWWhH1GRyG1FqRSKo1dZE1
	JD3g==
X-Received: by 10.107.25.80 with SMTP id 77mr22154616ioz.62.1440392171902;
	Sun, 23 Aug 2015 21:56:11 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id pl8sm8172356igb.8.2015.08.23.21.56.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Aug 2015 21:56:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Aug 2015 21:56:05 -0700
Message-Id: <1440392165-3659-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCH] README: Correct syntax for git send-email
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
X-List-Received-Date: Mon, 24 Aug 2015 04:56:12 -0000

Add some more help on sending more than 1 patch (if needed)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 README | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/README b/README
index 06335bb..e9ba2b9 100644
--- a/README
+++ b/README
@@ -16,7 +16,10 @@ for detail.
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-qt5]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-qt5][PATCH'
+
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-qt5][PATCH'
+
+Change option '-1' to '-n' for n number of patches in series
 
 You are encouraged to fork the mirror on github[1] to share your
 patches. This is preferred for patch sets consisting of more than one
-- 
2.1.4


