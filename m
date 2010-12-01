Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PNheK-0002bc-Ay
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 09:02:52 +0100
Received: by fxm17 with SMTP id 17so4368210fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 00:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=I7KzG93tmekZkSJracZ9UxF7b//tz16Er7I4TTMQEPw=;
	b=F92x/qLIKXv0zOVgYlSPBMei6CQLwvYVWS/AJUZOAEAS8NVylpnco9/JxMFcN/L0c9
	d46iDH0ftCaTXer6bGDyaDwfemLtPsYsz8jqeWWE3D8LU0WXxvTmV18D3WZdLCbjQv+l
	Ockl/X19rmualVXTJqlYayg0THC360DiPI8IM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=nZMAb21S4w7khsrIqax9iGnyd5WtuOOwxVwMa3KN8tYdgxwqBE4wlnp5PvXU3G6uMP
	vnJulYwdFWYzM9+c6RnwQ1FPfK6HOrLTqBq4F/OVuftxqEvcBUPeczFZnZI6FNQCO7at
	qMUNWi+nwzUjokTjvlHqU/tMSc1IwOQ8A3TwY=
Received: by 10.223.118.211 with SMTP id w19mr227568faq.14.1291190486922;
	Wed, 01 Dec 2010 00:01:26 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e17sm1942964fak.34.2010.12.01.00.01.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 00:01:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Dec 2010 09:01:22 +0100
Message-Id: <1291190482-6925-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] opkg: move OPKG_SRCREV to opkg.inc directly
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Dec 2010 08:02:52 -0000

* now OPKG_SRCREV was used only in this one .inc, so move it there

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/sane-srcrevs.inc |    2 --
 recipes/opkg/opkg.inc                |    2 +-
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index ab8fa89..9531ae4 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -1,5 +1,3 @@
-# this is alphabetical!
 # only SRCREVs included in more recipes should be here, otherwise put sane SRCREV to recipe directly
 
-OPKG_SRCREV ?= "587"
 EFL_SRCREV ?= "54714"
diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
index 0d84626..93d71e0 100644
--- a/recipes/opkg/opkg.inc
+++ b/recipes/opkg/opkg.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Opkg Package Manager"
 DESCRIPTION_libopkg = "Opkg Package Manager Library"
 SECTION = "base"
 LICENSE = "GPLv2"
-SRCREV = ${OPKG_SRCREV}
+SRCREV = "587"
 PV = "0.1.8+svnr${SRCPV}"
 CONFLICTS = "ipkg"
 INC_PR = "r3"
-- 
1.7.3.2



