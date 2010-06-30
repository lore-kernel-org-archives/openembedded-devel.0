Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlR1-0001N4-CM
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:45:52 +0200
Received: by gxk1 with SMTP id 1so144090gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=81WDKXoNoUn+vX3bMFIj6k3SpsDesZiRs6oZ+OzC47A=;
	b=E52WrWMM5J4EsRtmzDxPJ5/bqFk6iPkxEanjj0gD8f9xgm740p3TjN9hsN890ylauK
	5KTaLbsKVt7962iOKYqboBoB/9DeVqCEOHIg7txYVB4ZyogNYgKv2gFnXNbwDOCZgDrf
	ienDacmoBTv2xLhkGQ3z6re5XiwA8yYqRRXy0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HY1y4TM147SGz6/OW1trjkd/+PlIEOEHTSLYJsmRhzQGX9yYj4q/XQNHZlVXSj4BPw
	bh+y1bCnUgaWnlT7WIMRkjQq38b2fJw4kEAf5Qt/5QwQyNgIz4/zEhiB55zDyj5qwjo7
	zeIsrlxw96kjfrfx1H4sd6qeRS++x57FImJWU=
Received: by 10.100.244.2 with SMTP id r2mr9422010anh.148.1277858467575;
	Tue, 29 Jun 2010 17:41:07 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id 36sm344282ybr.8.2010.06.29.17.41.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:41:06 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:40:43 -0300
Message-Id: <1277858443-27280-6-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277858443-27280-1-git-send-email-joaohf@gmail.com>
References: <1277858443-27280-1-git-send-email-joaohf@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/5] fix workdir name
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
X-List-Received-Date: Wed, 30 Jun 2010 00:45:52 -0000

---
 recipes/cgreen/cgreen.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/cgreen/cgreen.inc b/recipes/cgreen/cgreen.inc
index 8789375..eb0e445 100644
--- a/recipes/cgreen/cgreen.inc
+++ b/recipes/cgreen/cgreen.inc
@@ -4,7 +4,7 @@ PRIORITY = "optional"
 LICENSE = "GPLv2"
 DEPENDS = "flex-native"
 
-S = "${WORKDIR}/${BPN}-${PV}"
+S = "${WORKDIR}/${PN}-${PV}"
 
 INC_PR = "r0"
 
-- 
1.7.0.2



