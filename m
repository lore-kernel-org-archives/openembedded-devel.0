Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIhMO-0000Av-3l
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Oct 2012 16:52:40 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so2280088wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Oct 2012 07:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=VOIwPfRZYW4R5cxJm7+ozScFBh+nLEMZEshU3xkC3GU=;
	b=x8ewzHlbfeVPKC6GuWvPvmpBJcHd9molS4wI4h74tv5o7UxcAi+zEdSkr88NMo8jVP
	27fwqjS1gY3iVSZtCagJ6vqYVozWR3ELB38ugO4423G1xVX9YJQU4yl0ydhYItTZ/cTt
	abevgI/WluZxycY36I4MZJXjcRBCYrjra2f/oheDEXQAT0Uh+cN5GjszLxPIN9hTGhJg
	oU72z7zoZ69m326vUHbKToheZUUXrwiCqmrp/kD/qlYTjhjA5WYJFMEdlDyi9U7ftYzD
	r5VeEsK31rexwz/EFl6/gwMKtY9GG2QtN84dApXYjEmENty/aK6jggKguxuKH1isxzg2
	ulmQ==
Received: by 10.216.194.38 with SMTP id l38mr7844216wen.80.1349102383275;
	Mon, 01 Oct 2012 07:39:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gm7sm6361398wib.10.2012.10.01.07.39.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 07:39:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2012 16:38:50 +0200
Message-Id: <aa65c68a35c3855ed81c2fae46b0cb7941724a8d.1349102278.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349102278.git.Martin.Jansa@gmail.com>
References: <cover.1349102278.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349102278.git.Martin.Jansa@gmail.com>
References: <cover.1349102278.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/6] portaudio: update SRC_URI
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
X-List-Received-Date: Mon, 01 Oct 2012 14:52:40 -0000

* http://www.portaudio.com/usingsvn.html:
  Note that we are in the process of migrating from Trac on portaudio.com to Assembla. (1/24/12)
* old repo seems gone now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
index 312ae60..b35d1d8 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
@@ -6,7 +6,7 @@ SRCREV = "1387"
 PV = "v19+svnr${SRCPV}"
 PR = "r0"
 
-SRC_URI = "svn://www.portaudio.com/repos/portaudio;module=trunk;protocol=http"
+SRC_URI = "svn://subversion.assembla.com/svn/portaudio/portaudio;module=trunk;protocol=http"
 S = "${WORKDIR}/trunk"
 
 inherit autotools
-- 
1.7.12



