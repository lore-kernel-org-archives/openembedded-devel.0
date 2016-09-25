Return-Path: <dachaac@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2106B60557
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Sep 2016 17:54:50 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id s64so8365644lfs.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Sep 2016 10:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UH4VWOU1K938fi2QBgJpBYp/n/m36gUtvphyBChCWVw=;
	b=hIK7ob+ikxcPjnou/MV+VanlD3khjavkXu2XqUEvday/ZdrIawuB22wNqD8dZQburT
	0C79CVuTdsCT93qNHIP1S8Km12NdVHKpMq0qEbZPlAExaWoMKmn5yZ6rC4i+ZjQIH15e
	u/7UKkld2Cd7nxynHULihHc3/R72597lSonjOR/am1C/+HklQixaxdloHr8gi+STE/z5
	BFZm0nyHh0lCMM7Vb3F2FYcPinNSYD0gX2NySEf59HZUWWcXWF1Qf04j7x8VMDEldXbq
	xZ/lbt6h5/hti6iQazppwoOwDziOJF/GkOt3eAgC0KfcLXAwHbG92zwhK5GoZVHg61po
	ehEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UH4VWOU1K938fi2QBgJpBYp/n/m36gUtvphyBChCWVw=;
	b=Sgx/GUeybzEDh59LXKEX5NCVDlbI+wYR10X4jahQ1pXggazAIqB5FeW8KCpCLuErVk
	THjU0XQgiqS7ZNCzQaeMIvzppVeBNt0Cia9Vrtr7vDJVX06P5IDzo9ZEypjYUy0hovre
	Bjv02sHN9ZdS4D8UuaYCKSCyaz5mVmMkBnrFI0k7nY0WTPYy+xALHVrrHgdjWMsnWyB0
	K9UpA06xwjquKdS6oi38XMkUj7bXoXfatN8Q8PYFYY66tbFGRyF4jcZ4jt2MxAfAX+d5
	7Xx/XGQRAoiIRwD6Rvrmx9dZzMuYBQPgpBV9atcoY6DIuU6QLy3f3d2VjZjMfH8Fm2ZU
	OjBg==
X-Gm-Message-State: AE9vXwPUnWsuafvfEurgbZNx7oTytiQSbzxh9mJMeeWRxfPp0dXksshdJIRh+OSJP4irFQ==
X-Received: by 10.25.133.8 with SMTP id h8mr5020600lfd.152.1474826091387;
	Sun, 25 Sep 2016 10:54:51 -0700 (PDT)
Received: from localhost.localdomain
	(dtd-fyygkvzdvwsb2-c4t-3.rev.dnainternet.fi.
	[2001:14ba:80fe:4000:a88d:719:3c36:f8b1])
	by smtp.gmail.com with ESMTPSA id
	c186sm3035931lfc.46.2016.09.25.10.54.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Sep 2016 10:54:50 -0700 (PDT)
From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <dachaac@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Sep 2016 20:54:45 +0300
Message-Id: <1474826085-1209-1-git-send-email-dachaac@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-qt5][krogoth][PATCH] Update Qt's git repositories to match new location
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
X-List-Received-Date: Sun, 25 Sep 2016 17:54:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Vesa Jääskeläinen <dachaac@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index b7207e6..9220a75 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -27,5 +27,5 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 
 IMAGE_FEATURES[validitems] += "qtcreator-debug"
 
-QT_GIT ?= "git://github.com/qtproject"
+QT_GIT ?= "git://github.com/qt"
 QT_GIT_PROTOCOL ?= "git"
-- 
2.7.4


