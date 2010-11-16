Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <harvey.tim@gmail.com>) id 1PIPrS-0003bF-MI
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 19:02:32 +0100
Received: by pwi8 with SMTP id 8so272588pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 10:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=u7WZo3uCIKpjJnh1PIo930Kt1RsIs6Qe6hOkrgSuWGk=;
	b=R9N+itGL4RZcXoEBBpLmBY6npOkl05Zl/ojEIc1fg6ufmrv41oKebOzlJiQiNnr4Tm
	4TbdWxiO7jSagL5BIqvefY+EEyxZvphdgOl8cAOy/Nmry7EkpnVE0L4h8W9nbP4GmJwt
	p/KlLmszICh3jhmiXEAE04CUaj+JjDxbQq6AI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ewoOULe8/nUp11tebEIsNMbbKTyWAIrap08Ry1qXp0M6cflcHwaFERtMWukEnFjIln
	bI9txd5ldeLBUdSkj+n08/hoib7HFXx0ggLz8oaa3e1Pn/oKu7b1KpFH5kpdVjhaWpzj
	R7VBApRpwCRPqVR0q8F6JgbHixCUX+wBF/4AI=
Received: by 10.142.81.13 with SMTP id e13mr5564497wfb.214.1289930483530;
	Tue, 16 Nov 2010 10:01:23 -0800 (PST)
Received: from localhost.localdomain
	(adsl-76-205-222-173.dsl.snlo01.sbcglobal.net [76.205.222.173])
	by mx.google.com with ESMTPS id w22sm1662999wfd.19.2010.11.16.10.01.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Nov 2010 10:01:22 -0800 (PST)
From: Tim Harvey <harvey.tim@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Nov 2010 10:01:08 -0800
Message-Id: <1289930468-7867-1-git-send-email-harvey.tim@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: harvey.tim@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] iftop: new recipe
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
X-List-Received-Date: Tue, 16 Nov 2010 18:02:32 -0000

Signed-off-by: Tim Harvey <harvey.tim@gmail.com>
---
 recipes/iftop/iftop_0.17.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 recipes/iftop/iftop_0.17.bb

diff --git a/recipes/iftop/iftop_0.17.bb b/recipes/iftop/iftop_0.17.bb
new file mode 100644
index 0000000..2cfa441
--- /dev/null
+++ b/recipes/iftop/iftop_0.17.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Network usage monitor"
+HOMEPAGE = "http://www.ex-parrot.com/pdw/iftop/"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+DEPENDS = "libpcap ncurses"
+
+SRC_URI = "http://www.ex-parrot.com/pdw/iftop/download/iftop-${PV}.tar.gz"
+SRC_URI[md5sum] = "062bc8fb3856580319857326e0b8752d"
+SRC_URI[sha256sum] = "d032547c708307159ff5fd0df23ebd3cfa7799c31536fa0aea1820318a8e0eac"
+
+inherit autotools
-- 
1.7.0.4



