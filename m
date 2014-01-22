Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id DCE576C921
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 16:17:21 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id z5so484456lbh.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 08:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=p28vDzFTx9n/23L5A51cFisFOpDNU9kpz+bvnQNG3No=;
	b=dcgcy+n0chszKheYEpCrs5KX2lZpIZ1XJD9DW/gNyqEmJIC6KCkJzeF43F0ZiKZFDm
	23IYvSA1skDSJEf7D2j+diW6U4c4l9TX8Bo0UJ3HcN/sbbOv/Z+bNIPBUTpWiFN8Zbrv
	ItE/XO3jUwcbOtS+1kzqn4XYaLKfbgLar3dm5xjqkuGrq6BYUTs7vRVBixGnFiK0G2Hs
	itK+pXcQod9mucw6ReHjylERUOXWoHfCd8XuVsqhWExaG1OeebYeWRFkbEJ74sP0FzmU
	lhCavIEp+QoEaQa1oIgHazUVMbAqfsserRDzF6aX9T1SLFZE43/naYinAKPfSOivoOJF
	8vVw==
X-Received: by 10.152.19.133 with SMTP id f5mr1646437lae.52.1390407441969;
	Wed, 22 Jan 2014 08:17:21 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id ox6sm8070683lbb.6.2014.01.22.08.17.20
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 08:17:21 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 6EA5F1C61BD; Wed, 22 Jan 2014 17:17:13 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2014 17:17:12 +0100
Message-Id: <1390407432-22077-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Cc: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@enea.com>
Subject: [meta-browser][PATCH] nspr: Remove BBCLASSEXTED override since its already set to native in oe-core.
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
X-List-Received-Date: Wed, 22 Jan 2014 16:17:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 recipes-support/nspr/nspr_4.10.2.bbappend | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/recipes-support/nspr/nspr_4.10.2.bbappend b/recipes-support/nspr/nspr_4.10.2.bbappend
index 3296e91..947164f 100644
--- a/recipes-support/nspr/nspr_4.10.2.bbappend
+++ b/recipes-support/nspr/nspr_4.10.2.bbappend
@@ -1,6 +1,3 @@
-# nspr-native is needed by nss
-BBCLASSEXTEND = "native"
-
 # don't build tests : this ICE on armv7
 do_configure_append() {
 	sed -i "s:CSRCS =:CSRCS = \nDONTBUILD =:g" ${S}/pr/tests/Makefile
-- 
1.8.3.2


