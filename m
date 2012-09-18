Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDymF-0001lE-7t
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:51 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=IijU0f3xN2HpsCDeTJ+e443+0YC5bPjGfpSCaQH9B6k=;
	b=p2zWwjHrcdDQJBS47g/bDxU/0LzeWI6nb7elpWagqH/DWbWgadJYZaXc8tk+5O+ftp
	gJ1wtlZomQuDlbCNLzMHKdDRhm5sJn0wuyha9v4J+J9O5Cyse0prCbmw+hWl7CRQ8hWa
	onpHX6Q9+fArIQzeX/8vXHkr+yovzBK/xEwuJI6wQdsFTQHnB3cxKeUITRIM1Mp5UM7X
	6+bB5a9QmmsF0jXBS1R57hTlMnWDYOKOUsAaN6/yr8+FBexncnc7WrYF3YwHYLeJTJED
	QFFN+qGQeNhs0hvVfuetSgOtFhcjycxNl9UNV7cNcQHTVIQDGODJkm8ECCdKNuP9guBg
	4J9g==
Received: by 10.204.154.151 with SMTP id o23mr165456bkw.77.1347977713509;
	Tue, 18 Sep 2012 07:15:13 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.15.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:15:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:21 +0200
Message-Id: <1347977601-28665-41-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 40/40] README: add some layer dependency hints
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
X-List-Received-Date: Tue, 18 Sep 2012 14:32:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/README |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta-xfce/README b/meta-xfce/README
index fa2bab0..88f2332 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -7,6 +7,12 @@ revision: HEAD
 URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
+meta-xfce depends on meta-oe and meta-multimedia in this repository.
+
+To avoid dependencies on meta-multimedia you need to mask recipes by adding
+this to local.conf:
+
+BBMASK = "meta-xfce/recipes-multimedia"
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
 
-- 
1.7.6.5



