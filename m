Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2C459605BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a140so1212929wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=W1sTxjY2TLIOvCqyFeyUzNrfYw27IANQSaHueFA+Vvg=;
	b=jm1fwbPS+8dLehtl4J4RN3XjBJtIPr2BuTafejLUucMa1IHmEafV1j6qBefxaCR33q
	bQx3c2zw610GJZaJWRHgFi77R0SApBq05doT5dh71U59bOIRNmel34PZmD4FZtbAz4m7
	m1+0dMpzyXJbHNHHXH/Eg6jvQdZVw0JrxOSY8HQh1htnHezd1N7UrXgZUpBEdIcGjd8z
	yRQOHwcCWsDHNyC8ETY/WEh8avBDw+i8M1RD3RtKhLAc23elS6LjSdV4s9YEkFHUDkNf
	iFwVfJmCc3RyPK2k2mhCsRHufXN/IolZ8vOTtSrnzSHzzcywl8BrVNoebBRzWVLbpQtI
	xjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=W1sTxjY2TLIOvCqyFeyUzNrfYw27IANQSaHueFA+Vvg=;
	b=kxyG1WYxSDpALx75WmSWyPefRE0RAcWFFybA+uq+FDsMEzijsygSebN2brwqcHNxBr
	pyYiS4xBWqyM7Od0vowqIMdCV7HqhhlmpyM8z63Pms9EO1hoXl8IRkGz5DqEkioy6Quk
	m580nvNPCagSkZ7a6v6fphOGYdibQu2LlGL7nnCdj3M/IDZhPYCwtTr/ya/G2zcsvs35
	0GY3sFKVCHPr2Ee3hROe8K94dyNiKUkOVsJgmnVr5EXze2ln+DiYrtl+D9q+JVFhzzfv
	Cuos7vAxLsruU++ctHHdRsam8cEJAZ3CVEAoo2Xpt01gmr3hJH5i7ep92onW/zdVTLja
	pJLw==
X-Gm-Message-State: AD7BkJImCsU8ATCuqXC7kS26ziTKkTyGpP0mwmD3VoNjqw7SulD3vQzsVZa71cwQMw39sg==
X-Received: by 10.194.2.210 with SMTP id 18mr1189405wjw.55.1459834746810;
	Mon, 04 Apr 2016 22:39:06 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:21 +0200
Message-Id: <1459834720-17165-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 12/31] qtsensors: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtsensors_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 4fbd15b..6f2f1a3 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "fbaca62cd0a7309f04bf82101c8e20dbbf423192"
+SRCREV = "7197e7f4b385315cb241043495cbfad58deb911a"
-- 
2.5.5


