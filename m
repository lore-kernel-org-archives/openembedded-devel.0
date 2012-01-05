Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1Rik27-0002x4-71
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 10:54:51 +0100
Received: by ghrr17 with SMTP id r17so112567ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2012 01:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=o/8hlk8ouCi9x9L/ifRRSkKkxiqCDgFrQBYKer+Aup0=;
	b=gxi719fE+ovlrtt4Lfi+kbJobwjNYVQD7L3iNyqkWwBh89bb3DYMwE+3SEIQuhUqAE
	qZn7ZLwCkQ1KCv6g0VLrVQ74xAyoyoJo/GAPjzAbktHS7VH/QVtnutDEN7uYjHhVczAN
	PMp6MCThY8PROv39N6AaPm28ELTZglm33+t8Q=
Received: by 10.236.124.15 with SMTP id w15mr560631yhh.120.1325756847943;
	Thu, 05 Jan 2012 01:47:27 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id k10sm92601265anb.22.2012.01.05.01.47.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 01:47:27 -0800 (PST)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2012 11:47:09 +0200
Message-Id: <1325756829-6511-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] iw: use a newer commit in the public git
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
X-List-Received-Date: Thu, 05 Jan 2012 09:54:51 -0000

switch to use a newer commit in the public git

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/iw/iw_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/iw/iw_git.bb b/recipes/iw/iw_git.bb
index c98e1bc..f0dc7ff 100644
--- a/recipes/iw/iw_git.bb
+++ b/recipes/iw/iw_git.bb
@@ -4,9 +4,9 @@ SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "BSD"
 
-SRCREV = "0a236ef5f8e4ba7218aac7d0cdacf45673d5b35c"
-PR = "r0"
-PV = "0.9.22"
+SRCREV = "8b2b1c6a77ee17e4128b22845cb8c5901de296c9"
+PR = "r1"
+PV = "3.2"
 PR_append = "+gitr${SRCPV}"
 
 DEPENDS = "libnl pkgconfig"
-- 
1.7.0.4



