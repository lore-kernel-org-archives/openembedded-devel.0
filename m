Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxk-0001qj-Sk
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:18 +0200
Received: by mail-pv0-f175.google.com with SMTP id 6so1648285pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=RA/OzFu3KU+qcc2UPTZlQ+CBT15E08J+IWXInMkeOC0=;
	b=vzRZS03RInbbYjVnG7SF4M+NRKCPqF0nzJiZvWy/Dt/B2du40bZdBGVm0swc6VMSYv
	tP+NbIiNKnkZHeSJxi8f93MrT85K1S+inJYd4oWuMH8OmaDYswLaJFNzAycV6Koz+wOM
	buWKr0arlZKIuvOTK9AUfe5eYfzO2Rc8Nd0nM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ThoCNWvj1dsOnEW1IxgRlM4qMrlb6b6/YQJSo7vJF0e7VNLECzT0+xb/TOyDJN7BRe
	wOAbmSVoD3VZ9pVW1pfOVE8D+zM1odcrgA1rTqE4h+YF7XxqcaVqmyeOO4vE1yOqovVy
	XBUJw7ZOHcDi/tyhVrcwts+IqUrJXkYqSupYM=
Received: by 10.142.49.6 with SMTP id w6mr2775229wfw.98.1283027088174;
	Sat, 28 Aug 2010 13:24:48 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:14 -0700
Message-Id: <1283027073-12308-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 04/23] esc-node-demo_git.bb: Do not RDEPEND on a recipe yet which is under review
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:19 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/esc/esc-node-demo_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/esc/esc-node-demo_git.bb b/recipes/esc/esc-node-demo_git.bb
index 814771b..f29b7ba 100644
--- a/recipes/esc/esc-node-demo_git.bb
+++ b/recipes/esc/esc-node-demo_git.bb
@@ -23,7 +23,7 @@ do_install() {
         install -m 0755 ${S}/${i} ${D}${datadir}/esc-training
     done
 }
-
-RDEPENDS_${PN} = "nodejs"
+# disable for now until nodejs recipe is committed
+#RDEPENDS_${PN} = "nodejs"
 FILES_${PN} += "${datadir}/esc-training"
 
-- 
1.7.1



