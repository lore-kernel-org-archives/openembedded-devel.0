Return-Path: <philip.balister@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 63B006A43E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 11:31:06 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id n1so938913qcw.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 04:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=0CtQGtHDVW572eoZcb7l+v3vYaJw+AgU18KB4Wh7ba8=;
	b=CDYEedj2UnxFpiScUjBrDPKzUsntonGiadaMl4RDZsevPDbSXAjFssSKCZGL6i+nzn
	8VOCXWxIyTqTPi8UwSH//bhpnZoyubunyBmCC5AyELlATm6g+QUR3AMAEfvOuZ4Xnzrl
	0VnSsL1k3Cy0098To8xAoWyNQqw1WNPDyxdUvFcvTrBCGWZpqXEI/uS1f8+m56UyA+8G
	OAx4ERBDQdI5yXhcoA2qVgZmuYT+h3beSQFhOPb9XESukjxj7r/89jlWAUDxcwOZfLk9
	o71AZ/bD8wHHffammTW31lYM2HbGK9EtliqKmlfYidWARca0TWMNzBcKzQce9TtWm2lF
	PlHA==
X-Received: by 10.224.41.8 with SMTP id m8mr6568558qae.26.1369222267204;
	Wed, 22 May 2013 04:31:07 -0700 (PDT)
Received: from localhost.localdomain
	(pool-96-240-170-171.ronkva.east.verizon.net. [96.240.170.171])
	by mx.google.com with ESMTPSA id l13sm7418737qaj.9.2013.05.22.04.31.06
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 22 May 2013 04:31:06 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2013 07:31:01 -0400
Message-Id: <1369222261-29852-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1369222261-29852-1-git-send-email-philip@balister.org>
References: <1369222261-29852-1-git-send-email-philip@balister.org>
Subject: [meta-oe][PATCH 2/2] uhd : Update to version 3.5.3.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 May 2013 11:31:07 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-connectivity/uhd/uhd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/uhd/uhd_git.bb b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
index 5a549ca..06d5eff 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd_git.bb
+++ b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
@@ -1,10 +1,10 @@
 require uhd.inc
 
-PV = "3.5.2"
+PV = "3.5.3"
 PR = "${INC_PR}.0"
 
 SRC_URI = "git://ettus.sourcerepo.com/ettus/uhd.git;branch=maint;protocol=git \
 "
 S = "${WORKDIR}/git/host"
 
-SRCREV = "0cce80c1ef2bcdb5094d579a6853261cebd2ec03"
+SRCREV = "f4c58120dc1e3674ee0228213f0f0011a0f80dcf"
-- 
1.7.11.7


