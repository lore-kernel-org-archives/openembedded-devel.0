Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 19754730BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 12:15:58 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v77so152128wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 04:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rTw+4rdgcGFj9onL5WZmFG1nlSJm8qBOBmOGYoYvuIo=;
	b=R1vFkV3RXiRPOVztnngAW/20BI/UvSTMAA0qkApiKqdAShHMBopNMVwXfS9wuj60ed
	hDSR+NQTKM15uiqXs998zaoOqyWz2+/+4c5UHtPMocB8Ze8Zfcinl0dtk0NEJh2qDhDO
	D5oGo8ceTSpwF5d2rI+FRIqAWmq+Jh2+dUxh/R5uvqICG5pOOwL3841GlqE0SkceQ/ua
	bfTlceC4Dzkoc5fO+Yxu5wLrRxFv1onsLDW1XrdTeCqnispHO56FBCUUpwiQo665FoqF
	iSIC0XhW3t22xGWsbVhd7EIsno8juNWCIvV2ZASeZ7v3uYjWCD8y4Hp/svkqdc/nB6oq
	iOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rTw+4rdgcGFj9onL5WZmFG1nlSJm8qBOBmOGYoYvuIo=;
	b=aAeWa8PHnIkJ5OSa3JVsZDyAwOC+COiiiKbGTqNmIfoPueHmUdGeOCLjSFgpqGqmTW
	FKYhbTaKj8q3i7EbtWnqy0e9czRsURyty2Q8kjaRF+J9T9eTptEtnysVSprnld3owhZi
	XvdzQAWzAdZgLWmMJCKIPyeuPikSnW9U3KCKNgkBMiMVblzLdHK0Tfivbj/gYNn/RKLf
	UPQyo8FnFkkqqLtDQIMNBOYjz9mQkAR2WNPrAnntYOalrjxQpz/UfJqeBAMGieqtYHun
	n2Ve0szxeKeayRdOkUyUHc2CEZlOGZM3xbfFkqktohJ1i2+hESK48kVbb4Qh4kBQ+Kwq
	+rIQ==
X-Gm-Message-State: AMke39n/0kXCHlfSq8vrUriM9xfGEpkDZ2SpFjr6F1mtUxY6VgnsnLVFwkL/UI0RRD7GMg==
X-Received: by 10.28.144.66 with SMTP id s63mr2223662wmd.134.1487765759599;
	Wed, 22 Feb 2017 04:15:59 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id y1sm1862876wme.15.2017.02.22.04.15.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 04:15:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 13:15:57 +0100
Message-Id: <20170222121557.16805-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH] pidgin: add missing dependencies and unblacklist
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
X-List-Received-Date: Wed, 22 Feb 2017 12:15:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb b/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb
index aacb30a9b..462e21c92 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "multi-protocol instant messaging client"
 SECTION = "x11/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "python virtual/libintl intltool-native libxml2 gconf"
+DEPENDS = "python virtual/libintl intltool-native libxml2 gconf glib-2.0-native"
 
 inherit autotools gettext pkgconfig gconf perlnative
 
@@ -118,5 +118,3 @@ python populate_packages_prepend () {
         description='Finch plugin %s',
         prepend=True, extra_depends='')
 }
-
-PNBLACKLIST[pidgin] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130634/"
-- 
2.11.1


