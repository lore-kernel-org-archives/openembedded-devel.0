Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vI1-0007o8-J5
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:35:09 +0200
Received: by yxt3 with SMTP id 3so2496161yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=WUp+Z8KzPrU9P5ow3HtEDd0BREIbTZ8FO2AjzxxicbE=;
	b=thb6eptOSD5/ifgzrEnYF9eOfO5g8h1JEzqguukSbkEZcVbwD6/bGbFXBdmiCwGzgk
	OuAFUO/uU3khjyhWKtM2Itstfireu9+YGQ4WMODizZ3vysoYEEnaPepkBws+NyYx0MtF
	cCuTl5kz9Yd3p3pQwyBA73f+Z4YkqgU0qzQqU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=T4nln4cZ97EePxhATJK3YECZdfJKPUb5SbiDYoWrQ0LmrCyIrhuGVtVCO3vymdr2rO
	meMCsmxFjavEdMi+shWILJ0i9jwGar7JZnA4nH1qIVrFNbhF8tEF6tAsG/VRWd8rB8c7
	cEwRjC9nXf/PixrWlWUZUASg1RNVy7aW9aDc0=
Received: by 10.151.92.9 with SMTP id u9mr3643761ybl.319.1287668043479;
	Thu, 21 Oct 2010 06:34:03 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.34.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:34:02 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:28 -0500
Message-Id: <1287668010-11310-21-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 20/22] update-rc.d: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:35:10 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/update-rc.d/update-rc.d_0.7.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/update-rc.d/update-rc.d_0.7.bb b/recipes/update-rc.d/update-rc.d_0.7.bb
index d2d22ab..b36b8ca 100644
--- a/recipes/update-rc.d/update-rc.d_0.7.bb
+++ b/recipes/update-rc.d/update-rc.d_0.7.bb
@@ -1,7 +1,7 @@
 SECTION = "base"
 PRIORITY = "standard"
 DESCRIPTION = "Manage symlinks in /etc/rcN.d"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 S = "${WORKDIR}/update-rc.d"
 INHIBIT_DEFAULT_DEPS = "1"
 PR = "r1"
-- 
1.7.0.4



