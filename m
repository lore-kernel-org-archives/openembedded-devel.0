Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 578006B7E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 12:57:30 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so5842327eak.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 04:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iYPH54mOAKaW3VuOYsUzl9AH/iKjVeIKXK0qkiRMSWY=;
	b=MYaeVNJpacuhlbjIjPKB9fIYFaWrYszvDj/bqzP54H4jByNSM/0JjUND/sEKGteIA+
	FKt2iSxUsXfZbpZOu+iqaWt9VMvjaVD0Bt+NxJiFNZ2hpj53jMCHCZqLIYdObRSS3ZxU
	HECqKJfujoin5Cw+M6ao3DqxeGkvp9Jd3oTTI979DP8I8v7noNlm2JvsZS82KYwgAO8t
	lCEYeJSLAECJZciNxK3OVgIdqkTB3yz36N3V+gB0Ja+s16Nt5fqi9CCKinsqCGOvdbgT
	g5eUelnlnJpo/aQ4LrDK9AM6HfCTREpECvvJbLrhfjiJp89+cZYp2M/RRRNML3Zs6bqb
	aD6w==
X-Received: by 10.14.69.200 with SMTP id n48mr11067530eed.54.1388581051021;
	Wed, 01 Jan 2014 04:57:31 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m1sm126902472eeg.0.2014.01.01.04.57.30
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 04:57:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jan 2014 13:57:23 +0100
Message-Id: <1388581046-8713-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 5/8] libssh: Fix branch param and set PV in recipe
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
X-List-Received-Date: Wed, 01 Jan 2014 12:57:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libssh/{libssh_0.5.5.bb => libssh_git.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.5.5.bb => libssh_git.bb} (89%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.5.5.bb b/meta-oe/recipes-support/libssh/libssh_git.bb
similarity index 89%
rename from meta-oe/recipes-support/libssh/libssh_0.5.5.bb
rename to meta-oe/recipes-support/libssh/libssh_git.bb
index fa25119..73b9ec1 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.5.5.bb
+++ b/meta-oe/recipes-support/libssh/libssh_git.bb
@@ -7,7 +7,8 @@ DEPENDS = "zlib openssl libgcrypt"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=388a4fb1dea8ceae0be78ba9b01fc139"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git"
+PV = "0.5.5+gitr${SRCPV}"
+SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=v0-5"
 SRCREV = "43914a5f07702fe292a968322d5ff2627e0431db"
 S = "${WORKDIR}/git"
 
-- 
1.8.4.3


