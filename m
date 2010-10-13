Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P61uI-0005Ev-Sx
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 16:02:17 +0200
Received: by gwb17 with SMTP id 17so1691380gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 07:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=1g0IcKBS0KloVyTxO17TYWQjd8vgd/oQdECA+VrI7tg=;
	b=Md+BWQDwMAVgfpgRUEBpEZU4GrNVDRw47gxiROFvWYputV+7p9NociAhjPcIWpy0GK
	3h4wL9ThH3XL4883TA3+Ecasdy+gw6GcQRKK+oDvW3a22ylvg2IetASta8SEv0VETrFH
	CFBfpHTr0/SqlU0TRG1ZE38nWhbGIsvXKyjyo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SDhDIfavPwhevK9jg8ylLZQe9zml4DaGTxgeVC2DLNbAmwhT/Is0DozotO3nCGBHuc
	Ga7JvuCXfg5Ssc4qvHXg6wS+TDtvD71uAv2A7JricIFM+FcUJmRq1RLc07UJtJ2vKlzC
	mr2MMgDifZsnSzMGxeNLF6rjjLg7E6Evp6NcA=
Received: by 10.150.158.21 with SMTP id g21mr1196920ybe.149.1286978505478;
	Wed, 13 Oct 2010 07:01:45 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm5073769ybk.4.2010.10.13.07.01.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Oct 2010 07:01:44 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Oct 2010 09:01:31 -0500
Message-Id: <1286978491-13427-5-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1286978491-13427-1-git-send-email-Chase.Maupin@ti.com>
References: <1286978491-13427-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 5/5] matrix-tui: use INC_PR in versioned recipe
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
X-List-Received-Date: Wed, 13 Oct 2010 14:02:17 -0000

* Added an INC_PR to the matrix-tui.inc file to be used
  by the individual version recipes.
* Modified the version recipe to use INC_PR in its PR setting.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/matrix-tui.inc    |    2 ++
 recipes/ti/matrix-tui_1.0.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/ti/matrix-tui.inc b/recipes/ti/matrix-tui.inc
index c8fd70d..6983406 100644
--- a/recipes/ti/matrix-tui.inc
+++ b/recipes/ti/matrix-tui.inc
@@ -5,6 +5,8 @@ SECTION = "multimedia"
 PRIORITY = "optional"
 DEPENDS = "libxml2 zlib ncurses"
 
+INC_PR = "r5"
+
 INSANE_SKIP_${PN} = "True"
 
 SRC_URI = "svn://gforge.ti.com/svn/matrix_tui/;module=trunk;proto=https;user=anonymous;pswd='' \
diff --git a/recipes/ti/matrix-tui_1.0.bb b/recipes/ti/matrix-tui_1.0.bb
index c82dc14..81e622b 100644
--- a/recipes/ti/matrix-tui_1.0.bb
+++ b/recipes/ti/matrix-tui_1.0.bb
@@ -2,4 +2,4 @@ require matrix-tui.inc
 
 SRCREV = "29"
 PV = "1.0"
-PR = "r4"
+PR = "${INC_PR}.0"
-- 
1.7.0.4



