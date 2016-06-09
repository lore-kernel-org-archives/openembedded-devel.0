Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8CDA46E6B1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 01:27:43 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id p34so1905991qgp.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 18:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OTNDJoM4xZdF32EsqGyuaRHaukiFd2wFXRcnuKADuE4=;
	b=mwJoeBLzO815B716rRkg3n7kb6MHInPEXqZBmlflyFEHLeAlYdEpQS9C0xrGqWJJN9
	po8ve2mTAjV4G1itdScCfpduQHcYqSWNbd8OeCAp6B4s50ZfjVy3xejnBBTbmhk9zUnv
	zcXiBkLQdxjg043/Ld9j5kCT/SeKjozwPZe5UtTEonOApnRk/ivnYvtpXLJDW1s6/6lI
	4+oIayh1XLi6pYREkB5c6lmpAyhCy6u2UdLlM9q/+lvnFaWZVcvFq/d+eQuG4LAMYUJ/
	JtM5c/GV7j0sO2c+yrwk8lvBz0G0xyQxNHTbwTaBi5JTEiXk7onZ6ov0Flk3p9PlXMok
	dn0Q==
X-Gm-Message-State: ALyK8tIFQgDR1hY1TZIghnReqLPGAxEkekLrBgJD4VFxt471419hzGrYU3cANTbPKOIQZw==
X-Received: by 10.140.91.202 with SMTP id z68mr2722367qgd.56.1465435663636;
	Wed, 08 Jun 2016 18:27:43 -0700 (PDT)
Received: from lnx-dereks-laptop.minotaur.lab
	(c-73-172-178-168.hsd1.md.comcast.net. [73.172.178.168])
	by smtp.gmail.com with ESMTPSA id
	q12sm1069607qkc.27.2016.06.08.18.27.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Jun 2016 18:27:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 21:27:26 -0400
Message-Id: <1465435646-3745-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-multimedia][PATCH] tvheadend: add CFLAG to ignore misleading indentations
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
X-List-Received-Date: Thu, 09 Jun 2016 01:27:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 65d43c6..9fed042 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -14,6 +14,8 @@ PV = "3.3"
 
 S = "${WORKDIR}/git"
 
+TARGET_CFLAGS += "-Wno-error=misleading-indentation"
+
 do_configure() {
     ./configure --prefix=${prefix} \
                 --libdir=${libdir} \
-- 
1.9.1


