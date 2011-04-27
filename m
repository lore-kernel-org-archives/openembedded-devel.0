Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukasmaerdian@googlemail.com>) id 1QF9ho-00063k-UU
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Apr 2011 20:43:21 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so1837353bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2011 11:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=tqNdE1YMkGSnc5rLFsoy/obbGSs4nqCuKtcDfK1bvO4=;
	b=S7le5nD8XSmIzP/6cMVJY5RZPCDVM+7owBmWFpm7HxkIWPlWOr25quu5n9e9SKawu9
	tB1Ac67qgQ3jmi+g8hybtSvSuddB27mMIvRzj9HE9+kvli/9tEo9kEsSilVWKipoh1xU
	6Mk+pbme1ZNC7yHLjyG/koZxO4441e2nJ5vl8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	b=d0hK0ZCo/+HHE+xUkGIpYGbZ1k1pv7fcdEpFI63Y2mTknbGQa6+oPWpzdoFeLg8Kup
	utDqYiC++ACQICAdam5NET2JCNqc08Q2mi82HCgm2+jewPZZ2kK7EkzDxneq1mZCiZOg
	TB5nz+3XeITXswMmx00KXrouDL8VYp5q77mSI=
Received: by 10.204.75.22 with SMTP id w22mr2388277bkj.65.1303929652365;
	Wed, 27 Apr 2011 11:40:52 -0700 (PDT)
Received: from localhost.localdomain
	(ppp-188-174-68-179.dynamic.mnet-online.de [188.174.68.179])
	by mx.google.com with ESMTPS id q24sm585823bks.9.2011.04.27.11.40.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Apr 2011 11:40:49 -0700 (PDT)
From: "=?UTF-8?q?Lukas=20M=C3=A4rdian?=" <lukasmaerdian@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Apr 2011 20:40:33 +0200
Message-Id: <1303929633-1636-2-git-send-email-lukasmaerdian@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1303929633-1636-1-git-send-email-lukasmaerdian@gmail.com>
References: <1303929633-1636-1-git-send-email-lukasmaerdian@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukasmaerdian@gmail.com>
Subject: [PATCH 2/2] e-wm-config-illume2-shr: bump SRCREV and PR
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
X-List-Received-Date: Wed, 27 Apr 2011 18:43:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* this replaces e's default battery gadget with the newly introduced battery-fso gadget (from shr-e-gadgets)
* affects all shr powered devices
* changes will be visible on the device after upgrade, once ~/.e has been removed

Signed-off-by: Lukas Märdian <lukasmaerdian@gmail.com>
---
 recipes/shr/e-wm-config-illume2-shr_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/shr/e-wm-config-illume2-shr_git.bb b/recipes/shr/e-wm-config-illume2-shr_git.bb
index ce22f35..86d029b 100644
--- a/recipes/shr/e-wm-config-illume2-shr_git.bb
+++ b/recipes/shr/e-wm-config-illume2-shr_git.bb
@@ -3,9 +3,9 @@ SECTION = "e/utils"
 DEPENDS = "eet"
 LICENSE = "MIT BSD"
 RDEPENDS_${PN} = "shr-e-gadgets"
-SRCREV = "93f949eda771c792bcd8d341ed77811f099aca6f"
+SRCREV = "6f795f4e1120c2804f3c2f69873ccd36ae47e5ef"
 PV = "1.2+gitr${SRCPV}"
-PR = "r9"
+PR = "r10"
 
 inherit e
 
-- 
1.7.1



