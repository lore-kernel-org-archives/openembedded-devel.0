Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id A01606B7F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jun 2014 13:38:06 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id g10so1089834pdj.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jun 2014 06:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=NXLnLwEzPpDz7dD6VUUVKfrjiaisqnCqTPwVbwg06xE=;
	b=JxVVafGWz7aGJnVP1SBAPLGY4JPWgKneiZ3IJOEG+nh2t/j3CBPX1ZtOvIk02TvG7S
	i59/br8CKlb5OMKlJ8HB2dZYahdjxwZWlRZ3KthAu/eW1IWyIZrQ8tkr4K7pcMy2w9AL
	dS425LX8T1E54vvgZ1ScpLivelSqQTvLKcxhcmGwIABF4bBnMaV2yI/WTUymKM+ymA67
	c9ts16kehnNCjxXjCaKs2a9VzNvcFQUiUjMsiwX4WTR1Lhd7AMNx3nO9DaooJVvc9AiU
	M6/HZNQ8YCHfaI2eAKMMsfi0rByOZTW5hW1vY4OVIJ0nT9aOn+QUiIralHMrYWa++fUF
	L2Vw==
X-Gm-Message-State: ALoCoQnBvNDBVqCjCmmnwpR0DV6P5+PJmH3wNHtZLD8Xpy3wvf3oq8RPxqbCUQmwTVKDra7aF+YW
X-Received: by 10.68.194.229 with SMTP id hz5mr75738000pbc.91.1401975486797;
	Thu, 05 Jun 2014 06:38:06 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	or4sm23129985pbb.17.2014.06.05.06.38.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jun 2014 06:38:05 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jun 2014 06:38:01 -0700
Message-Id: <1401975481-22389-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] libop: compile issue files missing in B
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
X-List-Received-Date: Thu, 05 Jun 2014 13:38:08 -0000

needed to copy over a file from S to B.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-oe/recipes-support/libol/libol_0.3.18.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/libol/libol_0.3.18.bb b/meta-oe/recipes-support/libol/libol_0.3.18.bb
index 429945f..7ad7ab5 100644
--- a/meta-oe/recipes-support/libol/libol_0.3.18.bb
+++ b/meta-oe/recipes-support/libol/libol_0.3.18.bb
@@ -8,3 +8,8 @@ SRC_URI[md5sum] = "cbadf4b7ea276dfa85acc38a1cc5ff17"
 SRC_URI[sha256sum] = "9de3bf13297ff882e02a1e6e5f6bf760a544aff92a9d8a1cf4328a32005cefe7"
 
 inherit autotools binconfig
+
+do_compile_prepend() {
+
+    install ${S}/utils/make_class.in ${B}/utils 
+}
-- 
1.9.1


