Received: from [195.135.220.15] (helo=mx2.suse.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mhrusecky@suse.cz>) id 1M92Zn-0002jd-Er
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 21:44:43 +0200
Received: from relay1.suse.de (relay-ext.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id E147B4844E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2009 21:36:35 +0200 (CEST)
Date: Tue, 26 May 2009 21:36:32 +0200
From: Michal Hrusecky <mhrusecky@suse.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090526193632.GA23428@misibook.miska.isageek.net>
MIME-Version: 1.0
X-Operating-System: WindowsKiller Linux
User-Agent: Mutt - the best e-mail client in the world
Subject: [PATCH] xmms-embedded: fixed build
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
X-List-Received-Date: Tue, 26 May 2009 19:44:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There was some .debug directories packaged in non-debug package. QA
error fixed by adding them to debug package.

Signed-off-by: Michal Hrusecky <Michal@Hrusecky.net>
---
 recipes/xmms-embedded/xmms-embedded_20040327.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/xmms-embedded/xmms-embedded_20040327.bb b/recipes/xmms-embedded/xmms-embedded_20040327.bb
index 48c5439..e2371e3 100644
--- a/recipes/xmms-embedded/xmms-embedded_20040327.bb
+++ b/recipes/xmms-embedded/xmms-embedded_20040327.bb
@@ -63,4 +63,4 @@ do_install() {
     done
 }
 
-FILES_${PN}-dbg += "${palmtopdir}/lib/xmms/Input/.debug"
+FILES_${PN}-dbg += "${palmtopdir}/lib/xmms/Input/.debug ${palmtopdir}/lib/xmms/Output/.debug ${palmtopdir}/lib/xmms/General/.debug"
-- 
1.6.3.1


