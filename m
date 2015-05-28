Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 79C787573B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 20:22:35 +0000 (UTC)
Received: by lbbuc2 with SMTP id uc2so36000811lbb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6qYeQIhIUse0JPO7KuWwRBBz1A7JNt8b+8uNPYyfexs=;
	b=nMRV2uo45JmIiMHN8uNt/BlBh/b/semH30b3Q784HagKf0VS5zZHT9e41F+hy+ppaF
	9cI0iuHuRzu6vhUg9FKwt6fw0Vvg66SFejHc7MLNrYF33REfVYkXoXm3SM1kmJQWdoCz
	lfnm9luiXVQ/RFFSpoaD0jOP57OW2RPMCtwDXUeC1RatRZYrVJuCVtfPakC4YfVVjINa
	uPG942K/va+KGctGJd7z+EFH2nXrWWAU2GV5yK+OVDhqOsvBbx3a2nXXf4582TNxy0Ai
	GSz617WUI9xYUmm5bi6wiFjvFJbeY0S4VaMh7lN0fn2P6sMs+crLIk3RR3Ju5uo0QgHl
	ukjw==
X-Received: by 10.152.37.201 with SMTP id a9mr4448199lak.120.1432844556773;
	Thu, 28 May 2015 13:22:36 -0700 (PDT)
Received: from angmar.lumag.rup.mentorg.com
	(ppp89-110-9-6.pppoe.avangarddsl.ru. [89.110.9.6])
	by mx.google.com with ESMTPSA id q1sm817389lah.27.2015.05.28.13.22.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 May 2015 13:22:35 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 May 2015 23:22:22 +0300
Message-Id: <1432844543-4452-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1432844543-4452-1-git-send-email-dbaryshkov@gmail.com>
References: <1432844543-4452-1-git-send-email-dbaryshkov@gmail.com>
Subject: [meta-opie][PATCH 3/4] opie-keytabs: fix warning about nonexistant ${S} directory
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
X-List-Received-Date: Thu, 28 May 2015 20:22:37 -0000

Point ${S} to ${WORKDIR}/etc to fix the warning.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/opie-keytabs/opie-keytabs.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-opie/opie-keytabs/opie-keytabs.inc b/recipes-opie/opie-keytabs/opie-keytabs.inc
index 05962a2..ae86c98 100644
--- a/recipes-opie/opie-keytabs/opie-keytabs.inc
+++ b/recipes-opie/opie-keytabs/opie-keytabs.inc
@@ -4,6 +4,8 @@ LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
+S = "${WORKDIR}/etc"
+
 inherit palmtop-defs
 
 do_install() {
-- 
2.1.4


