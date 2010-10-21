Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHr-0007gT-0s
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:34:39 +0200
Received: by gwb17 with SMTP id 17so75327gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=8fH6Ln2wcp93+QLIyoluf4/T+zY+8CLuEeCBeFcrrsY=;
	b=wNngH0bQapWUSydy2G0NGShRHe3wn9lqLkR9/Nl7i1tyj7BII8UfADiaBBPJn499TG
	rB4kgjKLrt5eP4mJ+BmADNpbS2W95qvdtS/wlF+6SOM60BFhFTg0svs3Tfj3P6u4liEc
	kx8bbWAdXqQ3STgxsxUe+QNA4pPfcLoxRBEfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=B8e6SLrw9VfeYIAUaEjod4IzmhFlKGMLhttx8tfM6zAyCdemIoD2r7T4x2ciunJToj
	0tNsxOiYmB3QihfOgu+rrWL91bJvZIJsF69SBY/1nQjsXM0QbyaVIFMlKQAPX1cXYtmA
	ubopEl7SixkGeBsr2snYz8CavYtrEtz7EHBQE=
Received: by 10.150.50.18 with SMTP id x18mr3764330ybx.243.1287668031324;
	Thu, 21 Oct 2010 06:33:51 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:50 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:19 -0500
Message-Id: <1287668010-11310-12-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 11/22] iptables: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:35:09 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/iptables/iptables.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/iptables/iptables.inc b/recipes/iptables/iptables.inc
index db2b6f0..5f948f3 100644
--- a/recipes/iptables/iptables.inc
+++ b/recipes/iptables/iptables.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "iptables network filtering tools"
 HOMEPAGE = "http://www.netfilter.org/"
 SECTION = "console/utils"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2;name=iptables-${PV}"
 S = "${WORKDIR}/iptables-${PV}"
-- 
1.7.0.4



