Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3EAD4785CC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 13:30:10 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u40so10746532wrf.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Nov 2017 05:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1PN44adzgfFu7alntJMqRcRa3XYSlDiKZfeY80EPjXI=;
	b=H0dKCpecGLDfnKIuzZwHiVvQvgx3Y/Xp3r/cesyU0hSkcv5C+Lio3488c89pve5I/X
	7Y2VUumUQYlrLlkdb4SlhKHHo35IATZzWZrLcl0aXigerplqxvD57ck0QAQ2i/jc5tSV
	JJN0Eb9YolgA7iA3IF6lghFuhkFYvm9iNwX5tJX5cKFRuOtUxXaKCD5RUttihglluWfd
	BPg6/z4vNhCWJGDcwVB7vsuBbA51c9tcoIVeQVw9CNi4GhH5Eau8vnYYFI6a5sK8qGmg
	izW85caYswWb/AqM564RpxFWuxu0QQBHtluT0/cnhmTfFyH5ppIYSOOPtbBDREBPniSS
	vNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1PN44adzgfFu7alntJMqRcRa3XYSlDiKZfeY80EPjXI=;
	b=NnoFhiIdiMSLOdoPTuOTaciZwqqPLNHV2VriWTlfWb8kFZG/VJiEHUT2T0/E/Dj4F1
	LyhGaHZcJRGxtWmM7+38U+E7ZR687CkuunHDf1gATsSFcPBY3F5E9Dd+3NFrVDPyzto4
	uUswXOBHBF8MYTghkW8DZBBRVAb0TScRCgOjGfavMwz+0rN/qtdOCC5Ya+gGojnkIKIJ
	S4X0Fm2dzYvvRk8tAmrfmBrM81JSAVUiDQ48hGsqlXlsZ/XiZT9PEcmxGKSULuo6rxIJ
	wBQSIzJ/u9C+zro9DoKoK8OSI0ACA/zFYB7QokN/d9Ko02SQndj/4oDGvL3Wrg8sN9mV
	S3tg==
X-Gm-Message-State: AJaThX75WhshDkV2ui6UnN72E0A7ghvtWcJ+e84S5l56erDAikiLKHRo
	Ebr56+QcOVeKWkjmAdPlaaxwrQ==
X-Google-Smtp-Source: AGs4zMasC/fo+T4GScl07jZ2baL7dj3nwmp1YmisDS07TV7wmz+IIAbWD8D5sXAzWV8QHxS4jf1alQ==
X-Received: by 10.223.128.4 with SMTP id 4mr3196157wrk.9.1510407011653;
	Sat, 11 Nov 2017 05:30:11 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030070ED074A591E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:70:ed07:4a59:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	195sm16189805wmj.3.2017.11.11.05.30.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Nov 2017 05:30:10 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Nov 2017 14:29:46 +0100
Message-Id: <20171111132950.12570-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171111132950.12570-1-schnitzeltony@gmail.com>
References: <20171111132950.12570-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 09/13] xfdesktop: update 4.12.3 -> 4.12.4
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
X-List-Received-Date: Sat, 11 Nov 2017 13:30:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfdesktop/{xfdesktop_4.12.3.bb => xfdesktop_4.12.4.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.12.3.bb => xfdesktop_4.12.4.bb} (77%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb
similarity index 77%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb
index daecf82..d9cbe71 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb
@@ -8,8 +8,8 @@ inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "cb34f4f333d7d122f1688d2f155202c8"
-SRC_URI[sha256sum] = "a8a8d93744d842ca6ac1f9bd2c8789ee178937bca7e170e5239cbdbef30520ac"
+SRC_URI[md5sum] = "7571889368be72df185ce2d470f37198"
+SRC_URI[sha256sum] = "098a35510562907e1431d5adbfa8307484a235c1dec6a43e2d58d2ac4241f1cb"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.9.5


