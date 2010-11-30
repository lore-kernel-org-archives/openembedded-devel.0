Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <harvey.tim@gmail.com>) id 1PNTgI-0000wq-CO
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 18:07:55 +0100
Received: by pvd12 with SMTP id 12so950325pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 09:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=iowz97AhL1DoK7FCXO7cNYqgjY89GKH9OCPc7mGuqns=;
	b=vuZU+obE1ohnCE7oSlYEPMYwh5pMCGC1oM054eWL1r0rOdu5UkK4EzW2v9/5QUrMFQ
	c7oU1cgklsxl8SRdb5qXd12hRWnsWeZ8GYtBUG9sXZ8/j7s8WmYXP5Qx5g9WK15nUp2s
	pQ5kIVuLpqPq0xcDt/MId8ourY7V/8m8eiVTc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=G57Nhxncqs+XoqPzav/8wxdf+UtDE62rMKeey+M4MJgKCx05p5H0+dTCHYq1eAVwVZ
	R5GXZGFA85gd6vfrvjpciteq5XwwTBV+RKWPiPJPdB2AfQKWvBAqeWdOlJQj0VS1Uxa+
	gm1yFQZ3PCJvzgBBBqB68eXSQzYVta/lEHgwU=
Received: by 10.142.43.5 with SMTP id q5mr7412230wfq.401.1291136792766;
	Tue, 30 Nov 2010 09:06:32 -0800 (PST)
Received: from localhost.localdomain ([76.205.222.173])
	by mx.google.com with ESMTPS id b11sm9205768wff.21.2010.11.30.09.06.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 30 Nov 2010 09:06:31 -0800 (PST)
From: Tim Harvey <harvey.tim@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Nov 2010 09:05:38 -0800
Message-Id: <1291136738-32061-1-git-send-email-harvey.tim@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: harvey.tim@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] avrdude: does not reliably build with parallel make
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
X-List-Received-Date: Tue, 30 Nov 2010 17:07:55 -0000

disable parallel make for avrdude recipes
Signed-off-by: Tim Harvey <harvey.tim@gmail.com>
---
 recipes/avrdude/avrdude.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/avrdude/avrdude.inc b/recipes/avrdude/avrdude.inc
index 679c4ba..3a387c3 100644
--- a/recipes/avrdude/avrdude.inc
+++ b/recipes/avrdude/avrdude.inc
@@ -9,3 +9,4 @@ SRC_URI = "http://savannah.nongnu.org/download/avrdude/avrdude-${PV}.tar.gz"
 
 inherit autotools
 
+PARALLEL_MAKE = ""
-- 
1.7.0.4



