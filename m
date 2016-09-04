Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 066EB77245
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Sep 2016 20:15:35 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c133so10457754wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Sep 2016 13:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SPHyY1tGEIc8/2UG8vFjg/Dvb9yk73/Ku3L8AKmj9HM=;
	b=sVvNM0bPFBAUvCXjb/vn7Bz58gk7KO0YpP6KeP/uhlqUoUrmMF8zYkF0dWbdzLN6AF
	iE0SNR9Pm/5JADYOUUcvLTKre+PFhB/nj7Gie+ROKaWbmH+0PjTmYQpPVtjU4nCnAAYl
	PWWd/CPGYCyKH3vG7ALH533F+Lwa5Y2//qwJCQTxnbDF4psGk+npZ+6Jfv298A8u5Jyh
	Aj0u9W1ySLx9EyeaCUCFPiMbPtGGLUU+Wmh4EwBcUML0TXwDqquYAALSqG8o1NfdxXsK
	TXIF8oSFku0TW8QJ9prBIOLFJFLOLDB4NIkEg2qCyJ+dHTeU/SHKq6pwyn3fC9EAePYA
	vfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SPHyY1tGEIc8/2UG8vFjg/Dvb9yk73/Ku3L8AKmj9HM=;
	b=EK9JLlRrrO87qEPk4zLyWugLELvSEXeYCBfUZErdEqPMmMFLEmH/nIADJClZjSg2SZ
	rjBXqK2XXtEe5bFhxZ2f51vYmVmL08x4PKfX+TZYfCqvpXpLrYuyZ+gTZrQ/UVVg9Kvv
	pKEnFkEVQSXF7T8VvbVloYqDfZwIp8MObOuzYXowzM7Qal3H9v80ggn+rS9CLhZJkrJ/
	pNyeLqrubTPZEIPkk0BIV+EsogVxi7VnXkoJpyFsZOaMNVkBtM3tpOCJ7Zwr87d9K0wr
	iBR+cmBPF3grexOw/1WHKECXsjsGhMALtvug7ldzJ9xaabQWkBr8sApWm+TOs7pOiAQx
	sj2A==
X-Gm-Message-State: AE9vXwPzthfygH8EjL2DWz82NLO6Uvknel1UBfgFEvwD6tJqdtEwTcbnE0p9JnYLifNj4A==
X-Received: by 10.194.164.229 with SMTP id yt5mr27818861wjb.39.1473020135372; 
	Sun, 04 Sep 2016 13:15:35 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3967.dip0.t-ipconnect.de.
	[91.10.57.103]) by smtp.googlemail.com with ESMTPSA id
	v137sm10708151wmf.3.2016.09.04.13.15.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Sep 2016 13:15:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Sep 2016 22:15:08 +0200
Message-Id: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/5] pavucontrol: replace intltool by intltool-native in DEPENDS
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
X-List-Received-Date: Sun, 04 Sep 2016 20:15:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb
index 84227b4..bdffb2a 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "PulseAudio Volume Control (pavucontrol) is a simple GTK based vol
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "intltool gtkmm libcanberra pulseaudio"
+DEPENDS = "intltool-native gtkmm libcanberra pulseaudio"
 
 inherit gnome
 
-- 
2.5.5


