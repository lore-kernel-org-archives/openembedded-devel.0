Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 50A6D771D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 21:47:08 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o80so18048210wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2016 14:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UN6pjb85tZpbpBKp0uAAz8ScdaLNIFqUUNL77nPmnds=;
	b=R+q9F9DdDkICjjnfrxHmJvzHM9ouNAUApnxflhU1XaLZl65AcxClco+d7QuvKAPRLV
	RG6fedissNEFe4mFnrIQA8YnQNEdvKzsFY4Q8YPKOkt017JHN63Xn9U6zvGD+UsHFtcc
	1SaeSphE28vyOe5vt/RuIGjZR4kYIAOosg/gd5NrBFmwZ29gxfVDoXGx8vpauURwAktY
	DAXAoiJcw0xWskPlB2G8XEw/2CMYbg8kI4tS7NVA/FXvZv15qwExqKe5mFJJZXQ0kZtc
	6FOEMjrpaVamRQQJ+1fSvKmFRqQAFyIEkma1wtf63XxFUQqp0wvZ7IiDuWLMYt7JMmMG
	YiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UN6pjb85tZpbpBKp0uAAz8ScdaLNIFqUUNL77nPmnds=;
	b=BjCt/Zz5m0vFFc+84SyXzArzWYmyoNjKMRompy4fUUGS6EyE/sPZ3ZtIlE3TmKD9C4
	+2J7NXRDbMPLWM2kMoSzggQIyUroyBdWRV+fH8nefmfLYuURUcEO8VrzReQC9nA0QYTH
	gXuHwIFpWaZodX9fl67mlxKTNf1LeGt+Ru0N+rdpTVVuERiZ0JG5H/gKUet4kCszRa/J
	j+N8KubHj91MTwAkJOzEBsE2lMT4pbmVkkdXwhCLFyfi4XJHy+PDMTMMcJyn7oDw5Cqr
	/Aey0gwyPwoRNMcL8L5izmaKigKWs/GFPfs0VlTqGFpTBREx0alwJyrkz6T02ypKEoQJ
	AzbA==
X-Gm-Message-State: AEkoouuZOB2f/F6sdD4u8qRHFjRjEqB8Jr8MCkGpR/PJoSB/EO07KJ5wvEG/K1lZDDnlCQ==
X-Received: by 10.28.182.136 with SMTP id g130mr17201730wmf.21.1470692828958; 
	Mon, 08 Aug 2016 14:47:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	o4sm34765520wjd.15.2016.08.08.14.47.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Aug 2016 14:47:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Aug 2016 23:47:08 +0200
Message-Id: <20160808214708.10620-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [meta-qt5][PATCH] qtbase: fix drm dependency for eglfs PACKAGECONFIG
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
X-List-Received-Date: Mon, 08 Aug 2016 21:47:09 -0000

* there isn't virtual/drm, just drm

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index fcaa322..f69c33c 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -86,7 +86,7 @@ PACKAGECONFIG[jpeg] = "-system-libjpeg,-no-libjpeg,jpeg"
 PACKAGECONFIG[libpng] = "-system-libpng,-no-libpng,libpng"
 PACKAGECONFIG[zlib] = "-system-zlib,-qt-zlib,zlib"
 PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
-PACKAGECONFIG[eglfs] = "-eglfs,-no-eglfs,virtual/drm"
+PACKAGECONFIG[eglfs] = "-eglfs,-no-eglfs,drm"
 PACKAGECONFIG[gl] = "-opengl desktop,,virtual/libgl"
 PACKAGECONFIG[gles2] = "-opengl es2,,virtual/libgles2 virtual/egl"
 PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
-- 
2.9.2


