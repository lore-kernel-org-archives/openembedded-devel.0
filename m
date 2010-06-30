Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlQv-0001MQ-9x
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:45:46 +0200
Received: by mail-gw0-f47.google.com with SMTP id 18so143897gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=zbySiRStTS9/bc3sG1QeFL+AXQcJUu5Nmb9YcpnjRwI=;
	b=FzDkT38auCnS1/Um9NXs+G43e3HGac9rFTSfSjdi9Sa+3vomoAcx7w3ZjjE4Du/n8N
	RDqubdD9dS3sqrV9AUAj/quOgUxe5OjQ5eILIjYu4ChDafD3T/Hm/vBolHHE6of66DIB
	/5CQf2c4FfB8ZDurX8VanyBu5Cb67dgLzZNKE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jaF77R6QSFWbU1qyZsyDLz25/aWLNrD0+nOL2q92wcuFMlD1SiV1WWI4i73lKb4tCD
	hmsv5cLpEXB5PxQtJFHx8BbQTwHpJPaKtNEimtdkydVPJQY5QR1jbo6tEKi21AZW4hHq
	iEWsghMglumyC+ltwmayG8KyBZINO2MiEczbg=
Received: by 10.100.243.8 with SMTP id q8mr9767888anh.146.1277858464179;
	Tue, 29 Jun 2010 17:41:04 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id 36sm344282ybr.8.2010.06.29.17.41.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:41:03 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:40:41 -0300
Message-Id: <1277858443-27280-4-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277858443-27280-1-git-send-email-joaohf@gmail.com>
References: <1277858443-27280-1-git-send-email-joaohf@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/5] add flex to recipe
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
X-List-Received-Date: Wed, 30 Jun 2010 00:45:46 -0000

---
 recipes/cgreen/cgreen.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/cgreen/cgreen.inc b/recipes/cgreen/cgreen.inc
index eb3307e..8789375 100644
--- a/recipes/cgreen/cgreen.inc
+++ b/recipes/cgreen/cgreen.inc
@@ -2,6 +2,7 @@ DESCRIPTION = "Cgreen is a unit test framework for C language"
 SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
+DEPENDS = "flex-native"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-- 
1.7.0.2



