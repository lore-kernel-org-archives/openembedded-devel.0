Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2557965D0D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 05:33:49 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id fa1so1552719pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 22:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=T8eD3IOKjcjObDoFWkfe+T93/v1iJYtJJv8Q5Xxqa2Y=;
	b=0WwlRymoCRupZUc3JOEp1OGrELC5yeKv/sGYzwrtOshuc7rWw+2Qkn7G3JxzaTg2w9
	VEUjdayJxNfi8prf20Yi4cvx46cFP7BmUAEDMQAi9eIXmycvWIfphx9m7a5V2wfrJqm5
	eaH7voh+MrvU+T5F/OfLJOeh2+g9z0wz9VBVkMPZFoNH63tJaB8ngjf6bVkkJYXeniBM
	LQmA7Zy0tZbZGOMponTA98HSrvWo1iR+wr96l7q4o7haTR+IqUkiNp1eJx3XArZKt21y
	TGjtvS/WRMDKq1xdFEJ3Z6FkJAs9decL0l8AylKUVwVlQD1nj14/3NRefPrNQv6D+4ri
	btlg==
X-Received: by 10.68.103.165 with SMTP id fx5mr31491644pbb.118.1398317630321; 
	Wed, 23 Apr 2014 22:33:50 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id lr3sm15001297pab.4.2014.04.23.22.33.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Apr 2014 22:33:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Apr 2014 22:36:03 -0700
Message-Id: <1398317764-25741-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [meta-oe][PATCH 1/2] fftw: Build native version as well
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
X-List-Received-Date: Thu, 24 Apr 2014 05:33:52 -0000

imagemagick-native needs it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/fftw/fftw_3.3.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
index 5824d41..990f01e 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
@@ -2,3 +2,5 @@ require fftw.inc
 
 SRC_URI[md5sum] = "2edab8c06b24feeb3b82bbb3ebf3e7b3"
 SRC_URI[sha256sum] = "8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2979a72dbe5af0982"
+
+BBCLASSEXTEND = "native"
-- 
1.9.2


