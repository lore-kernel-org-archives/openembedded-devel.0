Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nuo24-0001VM-C7
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 15:27:37 +0100
Received: by fxm20 with SMTP id 20so6400366fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=/nTG1leeGzEfSFNgeyZwr7o5FuK+BR0ZQhzU8SSLUYA=;
	b=F3b4hBYk0q185u+5OtbV7TvRme9s55NpOj31ZVuZX+OxWpGTi+Qnnn1ig8WPssxO8B
	TvhYNhE7mSOdqOPMHm8bYBvX2XaTMhusCODtk9yaXZ0/vFyQ1CumZ0FVgh5bUiX+bqLi
	92YnIUQ6M8dDt/oteSw/Dt+q/TwlVMPlWUKzY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ay0MrAMKzQFhx8k1drL9Mejs1mYDslAyQOlDgLpQT1JfhSlO6fAmogzj4orkIla/D3
	aLNXbKg/2TnQlSQDo38XHrTya+/VyoyVxE8FaIP2rhx6Ews5gT+PC8q0iHSuAv7awovd
	O0BcHVAd2JjZSqvWWSsuCeoiPx862B3zdNn4k=
Received: by 10.223.63.203 with SMTP id c11mr755053fai.94.1269527065924;
	Thu, 25 Mar 2010 07:24:25 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm1063287fxm.15.2010.03.25.07.24.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Mar 2010 07:24:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Mar 2010 15:24:23 +0100
Message-Id: <1269527063-17761-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.2
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] oestats-client: add metadata_scm inherit after base.bbclass split in 89b7e433719f43f1c36c76cb8856d559014e99bc
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
X-List-Received-Date: Thu, 25 Mar 2010 14:27:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/oestats-client.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/classes/oestats-client.bbclass b/classes/oestats-client.bbclass
index e4e6206..5aad12b 100644
--- a/classes/oestats-client.bbclass
+++ b/classes/oestats-client.bbclass
@@ -9,6 +9,8 @@
 # OESTATS_BUILDER = "some_nickname"
 # 
 
+inherit metadata_scm
+
 def oestats_setid(d, val):
 	import bb
 	f = file(bb.data.getVar('TMPDIR', d, True) + '/oestats.id', 'w')
-- 
1.7.0.2



