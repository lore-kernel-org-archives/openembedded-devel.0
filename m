Return-Path: <philip.balister@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id EA5DB65D0F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 18:30:38 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id rd3so1023510pab.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 11:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=MCqLe/hl7uGfcAYPWLtAtLMJbKfxH/sYQ4w23u4fJf4=;
	b=V4qSPEej7lbM7ivpT13zdz/LI7gmVhAgEEXbudO+y5Og0+8/Y2S/KQ1NMoGqmInCTm
	qtWIhmeMzoKJQUFMJt13i0GJzR5Go1jUN5jYnroLJDm6B/GQYZaCsMnF42HyKQ46UNcl
	K1G/Ot64SwWDdPiy8vB2NOFYdcBmj0v6lxKzGOhXYLEu7hwxemwLdGxz+V56gJtZ+jBW
	0SXLFYjX2cxMHLeGuNzrNKZQjkEHHidgWOnrIkzrZtFW3PPFQkxLR2ZNAnwZV0znHJ2X
	jiSyR2IVO1H9eLKpjM+AU4wQC5fMA3F/sKleimYDv1hyL9euq11k5f+fj3UELOely9+f
	wD1Q==
X-Received: by 10.68.143.231 with SMTP id sh7mr58211809pbb.7.1398277839193;
	Wed, 23 Apr 2014 11:30:39 -0700 (PDT)
Received: from mattsbaby.amer.corp.natinst.com
	(64-186-172-226.static-ip.telepacific.net. [64.186.172.226])
	by mx.google.com with ESMTPSA id
	au16sm8351451pac.27.2014.04.23.11.30.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Apr 2014 11:30:38 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Apr 2014 11:30:29 -0700
Message-Id: <1398277829-23252-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.9.0
Subject: [meta-networking][PATCHv2] ntp : Add cap to default PACKAGECONFIG options.
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
X-List-Received-Date: Wed, 23 Apr 2014 18:30:42 -0000

If ntp is built without libcap, it refuses to start with the following
message:

Starting ntpd: /usr/sbin/ntpd: The ``user'' option has been disabled -- built
without --enable-clockctl or --enable-linuxcaps
ntpd - NTP daemon program - Ver. 4.2.6p5
USAGE:  ntpd [ -<flag> [<val>] | --<name>[{=| }<val>] ]...

By adding cap to the PACKAGECONFIG the default runs. In the
future, someone could add an option for using clockctl.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-networking/recipes-support/ntp/ntp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 9c3e0d1..9861fd8 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -36,7 +36,7 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ntp \
                        --shell /bin/false --user-group ntp"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "cap"
 PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
                           --with-openssl-incdir=${STAGING_INCDIR} \
                           --with-crypto, \
-- 
1.9.0


