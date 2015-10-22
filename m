Return-Path: <joe@deserted.net>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id E70DB77129
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 17:05:45 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so18330346igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 10:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=aXyeyKRmDnvNSImO8EpAvs12qTItpeGf9oIt/WFsfyM=;
	b=cJ9PJqQ5C7TyEvJmsgGjQsmt9FRsO2G4s3KdybHVhVzcwUFLlHTDJNyvVjF0kb/O0Y
	ov0ehVG5fACrEKucUZsqv542DIzzMmsk0CSecr9iJJpPa7LmwSvjJh6unmv4nGvmya9g
	khM1FQaxW4ebbGNkaDnfDoEGO25KswDa4s3yNOeu+z2mS9DwxrzU+mGvnFY5p2kP6Lk0
	xjQLF1yQpyx2ngDMwXxuNckAz4XJEZP04Hk2GWTGWG+RWPT42g8Cg/YizxUWNOftu7Lw
	NW880GtRYbIKR0ctkUt/NsSajDi1MYWQqsPr9dEClUtm8R5gSjWpc6DOefIcIdloOCJ3
	2S1Q==
X-Gm-Message-State: ALoCoQnVOar0XgGDzmb5YzTudDYLxxrNXM4fhDzgoIwcBmTu35RnrsMOOE3nQYm0E7qlg+u9GUbg
X-Received: by 10.50.60.102 with SMTP id g6mr17278973igr.29.1445533545231;
	Thu, 22 Oct 2015 10:05:45 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id bc4sm6362465igb.2.2015.10.22.10.05.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Oct 2015 10:05:44 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2015 13:06:10 -0400
Message-Id: <1445533570-14709-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] xl2tpd: Update git recipe and add release recipe
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
X-List-Received-Date: Thu, 22 Oct 2015 17:05:48 -0000

The previous xl2tpd was significantly out of date, so update the git
recipe and add in a release recipe for anyone looking to use the latest
stable release.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb | 3 +++
 meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
new file mode 100644
index 0000000..eba0cf5
--- /dev/null
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
@@ -0,0 +1,3 @@
+require xl2tpd.inc
+
+SRC_URI = "git://github.com/xelerance/xl2tpd.git;protocol=git;tag=v${PV}"
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
index bd084aa..0cce7ab 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
@@ -1,5 +1,5 @@
 require xl2tpd.inc
 PR = "${INC_PR}.0"
 
-SRCREV = "df7e30eb199fc5710faa83866381aea18b66e60c"
+SRCREV = "a96b345962622ea58490924130675df6db062d11"
 
-- 
1.9.1


