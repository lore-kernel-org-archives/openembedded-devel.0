Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 22F516BDEE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:31 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so340641eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=YF92PSCb2gffFNKPEsZe+56Pmd5lMFQh7tMuVvjbXrs=;
	b=z9mEt6SwseOCpWGdGfYS2GtTZ/Q6VpPtb/TLJWnsOu5dlADm2IV+UAs3Ltw7650YdU
	T2U74L207Lw3JN5Xip68zRMlBTntb6ZmdgNImU5d7hY0rOmnnYuf51fdDtRVEQ5J/qeD
	OqbP1QQEjO4eep5axxZIi/39ELWW/6menrSKjNweTzQyGpZbcRyj8skn2hyrAYgynmIM
	H9EpGRIXxBZ5zsdESzfRh+iyaNPFqjI1LO6awJww5ZaiPSpGL3XKwxQ5oPLCuSEzloGf
	qAzrhLk8ZE/c7mHSFCgcVW/hCT1fnmdlRDqY/RzllCsQrAb1Leju2gOOqq9SfGw+C77u
	2NBg==
X-Received: by 10.14.177.199 with SMTP id d47mr5351834eem.14.1377791492535;
	Thu, 29 Aug 2013 08:51:32 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j7sm47186059eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:25 +0200
Message-Id: <4f829fb9a253db0e06402196db4a656c8b078c2b.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 32/66] upower: Add PACKAGECONFIG for idevice
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/upower/upower_0.9.14.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/upower/upower_0.9.14.bb b/meta-oe/recipes-support/upower/upower_0.9.14.bb
index 902a983..0aa9ec9 100644
--- a/meta-oe/recipes-support/upower/upower_0.9.14.bb
+++ b/meta-oe/recipes-support/upower/upower_0.9.14.bb
@@ -12,6 +12,9 @@ SRC_URI[sha256sum] = "81eb44c0453b264a737d32f763a31d5b1776f050a47d5be85fc5e9caf8
 
 inherit autotools pkgconfig gettext
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[idevice] = "--with-idevice,--without-idevice,libimobiledevice libplist"
+
 EXTRA_OECONF = " --with-backend=linux"
 
 do_configure_prepend() {
-- 
1.8.3.2


