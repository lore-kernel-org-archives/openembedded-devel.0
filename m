Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 912E66FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 20:03:51 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id e124so1064802qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QTk/5439qV36K/CBm/lBN0QAdVg3eY/PbqxnMOwpT1A=;
	b=MI1wXy8wb47n578im2z5TM5u6qL1MzzXipFXjvM6CfNzUvSg9VaVG4m9qR1+BXS0/R
	tqCydEZ6l4+2bDAAmZQKRYTliLIpPPriV9NqLfxP3gu0AI/nyDcyj496XTA6+dYkMPOJ
	SCKlZbuL33AVST/WbQvwbLE5eNJr50z8C9OOsFz/n3+ZRNTh+maHdRhXu2cdT92bM7+x
	k/WK89QGqVewt/K71BLr42l9WnqYFvlhSV5cd5bxDp+TuyYJWxQlgVRtyLBgucsLK8jG
	+khUvll6Rc3g8Y3mcrVhXgzKGKK15eYlpfI2n+uHkIRAvUCUWrdMxxqAmXzXq3gnM7eS
	tUCw==
X-Gm-Message-State: AD7BkJIX2q1ImjTntuDm9vJ5zVowERgpaSImExc5bLUNylKIgX8Sl3F/H9qP50gvKXzPDQ==
X-Received: by 10.55.55.138 with SMTP id e132mr6071712qka.11.1458763431868;
	Wed, 23 Mar 2016 13:03:51 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	b103sm1771859qge.2.2016.03.23.13.03.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 13:03:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2016 16:03:38 -0400
Message-Id: <1458763422-30827-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 1/5] python-six: add python-io to the depends list
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Mar 2016 20:03:51 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-six.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-six.inc b/meta-python/recipes-devtools/python/python-six.inc
index 450e05b..408c60e 100644
--- a/meta-python/recipes-devtools/python/python-six.inc
+++ b/meta-python/recipes-devtools/python/python-six.inc
@@ -12,3 +12,5 @@ do_compile_append() {
 do_install_append() {
     install -m 0644 ${S}/*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
 }
+
+RDEPENDS_${PN} += "python-io"
-- 
1.9.1


