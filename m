Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id D98F96FF56
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 01:28:34 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id l185so1937658qkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 18:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=R3yiC3k5UXDel22CZC5FVFGsP6ngmAcqA6LXMu+wues=;
	b=jAwCSlheVfvKVnx2KfubsvkGRwm9S9C9dOiKE8pb1c64m4nUaw2b/z21LAbqPKBy6m
	901b+xwjt6yhAhLLnOXoIwVQwopDYA4X8BOG9z4t6dRS22Ek95Judwe1GlWLp94ezI0d
	ZkFPSkEzRPyTZyx2Fi2S8YrPIUZulUVSXEc89Y5oQiW7QvXGGlw2Fmw10h59m4s1QUuK
	rE9jXfs+5H/3YxwGUhC7eE05s8YqQSMUHfJqBbQgHnY+UtPsDgORkuZghdc7MikVeWZ4
	Upulwa1reL7hA6xbIsy26bPXuSWrV0h0yiiUPOJ7eReyIIo5C+SWGUpLY7i+OAWyY/zs
	bnPQ==
X-Gm-Message-State: ALyK8tL+c/whQ9/EqVZwq33cv9UnFdZw0nMzP/JFLVfj5ElQIHGUy3xTqjyycrvFQ1gyBQ==
X-Received: by 10.55.133.130 with SMTP id h124mr7867173qkd.82.1465435715032;
	Wed, 08 Jun 2016 18:28:35 -0700 (PDT)
Received: from lnx-dereks-laptop.minotaur.lab
	(c-73-172-178-168.hsd1.md.comcast.net. [73.172.178.168])
	by smtp.gmail.com with ESMTPSA id n81sm948338qkn.20.2016.06.08.18.28.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Jun 2016 18:28:34 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 21:28:25 -0400
Message-Id: <1465435705-3794-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] geis: add CFLAG to ignore misleading indentations
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
X-List-Received-Date: Thu, 09 Jun 2016 01:28:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
index bc88143..9b087a8 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -24,6 +24,8 @@ SRC_URI[md5sum] = "2ff9d76a3ea5794516bb02c9d1924faf"
 SRC_URI[sha256sum] = "8a60f5683852094038904e690d23cc5a90a980fc52da67f0f28890baa25c70eb"
 
 EXTRA_OECONF = "--disable-integration-tests"
+TARGET_CFLAGS += "-Wno-error=misleading-indentation"
+
 
 FILES_${PN}-bin = "${bindir}"
 RDEPENDS_${PN}-bin = " \
-- 
1.9.1


