Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1QA4pn-0008JK-CE
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Apr 2011 20:30:35 +0200
Received: by gxk3 with SMTP id 3so381832gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 11:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=FZn0rIj1AHYkT7Ren6sRm0DMxcmo9s5e00LjoWyWf3M=;
	b=ACV10gGdH9l0zwiU0pJY8+3ptlU6nHZxiHAcYZy3aPr6fNyGh0LhqYG2hIzP2ZUujl
	pa+Bw+S/B5+NUaNZp21BxAcy+8CA26+za8jtk/8uVmNQQG88tj/+smyfHKBaDZS2oW7t
	MS45QUh91GcaWHzy/KoTTIZQS3ysrfUEH5mDM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EG7QC+fPzMB3xN4vJmBMDERPNoZmq3iZGJR3O/P5nEEzU87yy/7PvsJy/DWfU5HbaR
	ZZNe71IHqGQgcAFWa3X3EjfnJ44vi6lPlceRXRRvTP0I6XY9ePpBZgGpxTvTn+GBpxUP
	GpPKySa7c6y7lEAvBZRafKWPY+xn/A+Obd3CE=
Received: by 10.236.70.197 with SMTP id p45mr975053yhd.478.1302719296421;
	Wed, 13 Apr 2011 11:28:16 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id x79sm368208yhn.83.2011.04.13.11.28.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2011 11:28:15 -0700 (PDT)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2011 21:12:30 +0300
Message-Id: <1302718350-6429-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <y>
References: <y>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCHv2] ti-wifi-utils: update to a newer git commit
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
X-List-Received-Date: Wed, 13 Apr 2011 18:30:36 -0000

* Change to a newer calibrator version supporting new wl12xx chips.
* Add a PR number

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/ti/ti-wifi-utils_git.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/ti/ti-wifi-utils_git.bb b/recipes/ti/ti-wifi-utils_git.bb
index 92edb7f..1ee5f2d 100644
--- a/recipes/ti/ti-wifi-utils_git.bb
+++ b/recipes/ti/ti-wifi-utils_git.bb
@@ -3,10 +3,11 @@ LICENSE = "TI-BSD"
 
 DEPENDS = "libnl"
 
+PR ="r1"
 PV ="0.0"
 PR_append = "+gitr${SRCPV}"
 
-SRCREV = "6de17deb67a1313b5cc8"
+SRCREV = "7f63af54eb66e5b2515f92c59fcc19a8065ce481"
 SRC_URI = "git://github.com/gxk/ti-utils.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.0.4



