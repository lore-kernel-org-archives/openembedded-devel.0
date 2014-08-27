Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id B4F7365E94
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 07:40:03 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id n12so15404109wgh.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 00:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cIV87udaMJjZEkUs/iKEslgvm5Od9xuqRdS22xylznY=;
	b=ZgZe/0eCEXBLEN55rg00qQ4dXfGK+ludln8Y+HryPtOa2kA5IueD30R0IepiAVVAeC
	GmJOrCdaR0aYlyYH02bMbEdlfSon8TbA7Q9gg8gWZiI91xiGEQES0Awgj8vcU4HlOWAU
	khV2jxfgsh3qE5p65rnQpti/4vMR4pSTwJF4Jg2zlX+zNf5pzv2oX96GOGOSFOg8K/8o
	ZwP17Tbx74UqZcxkrc15FwWKf2ZRr0lW6IN0pmX3y/0S+L2KjhwvBiGWCyHs8xPdQ3BK
	7lLlXCA0HT7GXNHwvWvZ5DWhuK96QFjzWx9r6sLVU+KwhxUvClPtWR2ETwiHrzq+RSMA
	WuQA==
X-Gm-Message-State: ALoCoQnvT3WmUSR/+SRjpidoTy7xjxstqa3NOpwXiJycMzH4VqUcJOD/zZSU3xjkn7PafI/EF30k
X-Received: by 10.194.203.8 with SMTP id km8mr34736798wjc.51.1409125204805;
	Wed, 27 Aug 2014 00:40:04 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	xn15sm20822744wib.13.2014.08.27.00.40.03 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Aug 2014 00:40:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Aug 2014 09:40:00 +0200
Message-Id: <1409125200-23081-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-multimedia][PATCH] mkvtoolnix: enable parallel make
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
X-List-Received-Date: Wed, 27 Aug 2014 07:40:09 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
index 8d77024..dd613b3 100644
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
@@ -33,7 +33,7 @@ do_configure_prepend() {
 
 # Yeah, no makefile
 do_compile() {
-    ${S}/drake
+    ${S}/drake ${PARALLEL_MAKE}
 }
 
 do_install() {
-- 
1.9.0


