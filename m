Return-Path: <joe@deserted.net>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id C6C9C73D17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 04:13:00 +0000 (UTC)
Received: by iget9 with SMTP id t9so2391755ige.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2015 21:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=XwCC/pLHacfDBxPBmaHOIqFt8hHeSOZMEdNXFav/p1k=;
	b=ikMZeb5DyXDitaCWmoTuXtkY5KRB0jscDqtOiA3Ltq9TrtU3iLzAAhrma0A5sRWgs4
	nySIOSPUi83z0gybxhHUuA81ftsHqxuLepfk8DdD7fW/7TjTaWn644B8GdhEJfHGxZdb
	2uJax1Ha/9dk32H3K8X099CmqbEBYREX3QbhV90LlUc1sWhbMkVIrL133oEBW9MJ8Cqt
	osM8GsLPSLJIy+82rtCOJBpzLAn14vIXWHpkwOGsRHibSdVzO6Y2krUm42KVk7hGM/8i
	PLD6du2LoMQ8H0nIuGaesWRohJRLjdWHmfQ1rNlQsIa/Aoyz2Fa3BpKSpf2sPIW6SKuI
	aV2g==
X-Gm-Message-State: ALoCoQnYYxtT0fil5MS09Qqk+z3dNpQfHrwdJkQRJ19K7Y0FhydKT2lirlIZnch88XXw/29PcKoX
X-Received: by 10.50.127.232 with SMTP id nj8mr2858227igb.32.1429157581775;
	Wed, 15 Apr 2015 21:13:01 -0700 (PDT)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id w33sm3777380ioi.17.2015.04.15.21.13.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Apr 2015 21:13:00 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2015 00:14:27 -0400
Message-Id: <1429157668-4952-3-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1429157668-4952-1-git-send-email-joe_macdonald@mentor.com>
References: <1429157668-4952-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking, for-fido][PATCH 3/4] vpnc: don't rdepend on kernel-module-tun
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
X-List-Received-Date: Thu, 16 Apr 2015 04:13:01 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Kernel modules may be built-in, so rrecommend it instead.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index 4efc412..151aaf9 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -25,7 +25,8 @@ do_install () {
 }
 
 CONFFILES_${PN} = "${sysconfdir}/vpnc/default.conf"
-RDEPENDS_${PN} = "kernel-module-tun perl-module-io-file"
+RDEPENDS_${PN} = "perl-module-io-file"
+RRECOMMENDS_${PN} = "kernel-module-tun"
 
 SRC_URI = "http://www.unix-ag.uni-kl.de/~massar/vpnc/vpnc-${PV}.tar.gz \
            file://makeman.patch \
-- 
1.9.1


