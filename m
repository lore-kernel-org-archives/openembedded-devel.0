Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OJujK-00030e-On
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:40:04 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so2440042pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 13:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=KL+qbg60ZnL9c5H9J4wC6X3TXWPgqmpkGq8JqL3i7RI=;
	b=HJyfxBS1sRGjQEOxxJKuxNDDDq0gRvFoHogMPxHyKw0P6euXJ5av9B+ltZPwblFahP
	PgQ8MMhdh+nIMvq12sdARP9RiodJflBz69haFtK0BoYtd17UZ0WT4NIDjx3BASH33tMo
	RHeNDZveOHenONW8toQUD6V2KsciYdLM25YRw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=FqKImmYhgyf6tOPdZZ7CNfdDMsAwxdy/k3goYHk4y3qjxz+mqLBvFQhKIzI69Ub7Mw
	0Yi/dF4HAS/y71dulJAuNJ0G890zH0xK1+5O1N/P4Enchu518WnfJYYz6MHLX8TieIJq
	z6l91X+xz7aiuqLl/xM2z6kd+5WrUD9E0OP4Q=
Received: by 10.143.154.8 with SMTP id g8mr5627850wfo.104.1275510949454;
	Wed, 02 Jun 2010 13:35:49 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 20sm5942447pzk.7.2010.06.02.13.35.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 13:35:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 13:34:54 -0700
Message-Id: <1275510896-30845-15-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 14/16] zlib.inc: Add -fforward-propagate on arm.
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
X-List-Received-Date: Wed, 02 Jun 2010 20:40:05 -0000

* Needed on -O1 compile. Generally we use -Os where
  this option is already enabled. But we enable is anyway
  so it gets picked at -O1 too which we use with DEBUG builds.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/zlib/zlib.inc |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes/zlib/zlib.inc b/recipes/zlib/zlib.inc
index 0f7bea0..5b00ccf 100644
--- a/recipes/zlib/zlib.inc
+++ b/recipes/zlib/zlib.inc
@@ -3,7 +3,13 @@ SECTION = "libs"
 PRIORITY = "required"
 HOMEPAGE = "http://www.gzip.org/zlib/"
 LICENSE = "zlib"
-INC_PR ="r6"
+INC_PR ="r7"
+
+# Below option is added to overcome the GCC bug on ARM 
+# see http://gcc.gnu.org/PR42981 for further details.
+# We could potentially take it off when its fixed in gcc 4.5
+
+CFLAGS_append_arm = " -fforward-propagate "
 
 BBCLASSEXTEND = "native sdk"
 
-- 
1.7.0.4



