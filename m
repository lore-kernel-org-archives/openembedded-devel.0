Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id E415D6F558
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Apr 2014 08:52:43 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so381634eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Apr 2014 01:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=x6+jw83oleVYVld5Fe6GwvrcsA2BA31oc5r50aBb6fE=;
	b=oEydaTV1hsg8TFJbXT1EJLjos0DoJco/J1aDaoiACBYLsHR4kJTztb1u5NztzBifsM
	Z5VtwvN3BO1Ql+00LZeFAXeN4UNCxP3eBcx557BDbKGemaSW11hvg3HsLO0OjFN09Epd
	y+s3Wwc7swVRaKJ1N7uNzmagjS+mh7jQvz4DG+XPKSpSvz7r8dn3n2dBuf3o0ynVM/45
	lSRVcnZ0lkccTDtJpCbUcsKuwz5JQqgZazt3HC2IuADUIm3sdOUnDPl6XsrA/rWi1LlO
	6Z/XC8nwKFp2fM+ND8VCwPQurWpl1RJ1Ha5eGrWfLB3Cq+YNYVoG2dAsQoOV80YFuntf
	TRPw==
X-Received: by 10.14.214.198 with SMTP id c46mr1245756eep.29.1396860764154;
	Mon, 07 Apr 2014 01:52:44 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199])
	by mx.google.com with ESMTPSA id w1sm40445641eel.16.2014.04.07.01.52.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Apr 2014 01:52:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Apr 2014 10:52:26 +0200
Message-Id: <1396860746-17944-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1396860746-17944-1-git-send-email-schnitzeltony@googlemail.com>
References: <1396860746-17944-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-gnome] abiword: workaround compile races by disabling parallel make
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
X-List-Received-Date: Mon, 07 Apr 2014 08:52:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
index 69d62ef..875cfd6 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
@@ -24,6 +24,11 @@ SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]
 
 inherit autotools pkgconfig
 
+# TBD: fix Makefile
+# | make[3]: *** No rule to make target `../goffice-bits2/libgoffice.la', needed by `libabiword-3.0.la'.  Stop.
+# | make[3]: *** Waiting for unfinished jobs....
+PARALLEL_MAKE = ""
+
 PACKAGECONFIG ??= "collab-backend-xmpp collab-backend-tcp collab-backend-service"
 PACKAGECONFIG[spell] = "--enable-spell,--disable-spell,enchant"
 PACKAGECONFIG[collab-backend-xmpp] = "--enable-collab-backend-xmpp,--disable-collab-backend-xmpp,libgsf libxml2 loudmouth"
-- 
1.8.3.1


