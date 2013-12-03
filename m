Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id A70576DDF4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2013 21:44:21 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id c41so9165602yho.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Dec 2013 13:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=KknjLhZzv2ifZfRxkJzI1LewI0v1DMn3Oe7Nr2YDFdg=;
	b=PDKSvVfqc+oFu84TD8UVMhguFr3fV/A07bHhdzafb6z6ZFKi9+8lv3c8YBGLnIR07c
	9X4OmeVidoD1w3gc0RGYK2s1QNBhgima0VeS1Jlw81mpbFP2d8I/yrOtc3Vs0RaY0mT6
	mvj8D51r2aHCPqBAbO2ZrSZv0w32mlxpVOYnVXkG+//ucpqpoDjcNtt22XJy+VdVuwE1
	c5+oI2Yb3G+5a37OR2DIR0WLJvyrdIUD2wloIytGE0lJst9gtUP33aJg1/aNJ18Up1p1
	xIEVnnDmuBP2HDw+U71XgpTCVzjqaI9zN2MXyAH+v4l2hTD6bXtA3eL/dbc+Wc/KtHE1
	JyFQ==
X-Received: by 10.236.170.71 with SMTP id o47mr52955yhl.159.1386107061258;
	Tue, 03 Dec 2013 13:44:21 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	e10sm136294571yhj.1.2013.12.03.13.44.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Dec 2013 13:44:20 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 1034E175EF891; Tue,  3 Dec 2013 19:44:16 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue,  3 Dec 2013 19:44:03 -0200
Message-Id: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe 1/5] meta-oe: Drop pointercal-xinput from SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Tue, 03 Dec 2013 21:44:22 -0000

The pointercal-xinput has been moved to OE-Core so we should handle it
here.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/conf/layer.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index b50d1a4..2aa50ff 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -26,7 +26,6 @@ BBFILE_PRIORITY_openembedded-layer = "6"
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-  pointercal-xinput \
   mplayer-common \
   fbset-modes \
   gpsd-machine-conf \
-- 
1.8.4.3


