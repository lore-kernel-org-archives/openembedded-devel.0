Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYL-0003rN-E2
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:28:54 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3592229fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qQPoD4sRi8t0WzBcx27JRNp0cIkJCoslAycKOifIlDg=;
	b=qDuX+Orul3wu7Mt9PFV+qGOa0xD+eWY3FV2p9K8okyie/J+xV9vBVkm4EW15Q+unPH
	ATu5I4DTBdgAyx2lQF5pbclZIz03sV/PAByzJWFI10/PUirFkjPHCX1hCR6dpsZSi48h
	q2VAnEareYkR91tFaWMfYjBP+kK/mqn2iy7CQ=
Received: by 10.223.88.83 with SMTP id z19mr3043248fal.11.1316345020862;
	Sun, 18 Sep 2011 04:23:40 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:40 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:09 +0400
Message-Id: <1316344999-26642-8-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 07/17] libopieobex0: drop setting of FILES for -dbg package
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
X-List-Received-Date: Sun, 18 Sep 2011 11:28:56 -0000

The setting in question makes libopieobex0 ignore global settings
regarding -dbg packages and source inclusion. Fix it to respect -dbg
package settings in oe-core/other layers.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/libopieobex/libopieobex0.inc |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/recipes-opie/libopieobex/libopieobex0.inc b/recipes-opie/libopieobex/libopieobex0.inc
index c1776d3..47a77e4 100644
--- a/recipes-opie/libopieobex/libopieobex0.inc
+++ b/recipes-opie/libopieobex/libopieobex0.inc
@@ -22,7 +22,3 @@ do_install() {
 
 FILES_${PN} = "${palmtopdir}/plugins/obex/ ${palmtopdir}/pics/obex/"
 FILES_${PN}-dev = "${palmtopdir}/plugins/obex/lib*.so"
-FILES_${PN}-dbg = "${palmtopdir}/plugins/obex/.debug"
-
-
-
-- 
1.7.2.5



