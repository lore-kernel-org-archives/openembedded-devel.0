Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id D2A9460684
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 18:32:32 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id p47so1808255qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 11:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=gmypjEE1Fx30ddZRpJKYRqlqNrWgpkvG77YjnlfyiSc=;
	b=nRAAnrTvDPBLml5f7C/jASuTD/1L41V74kXI373F6AXdr0VVaceID9cPPNpv4hB64M
	XcXD+Ovu4VSFoGE7htWPpcTjqK1uLbfrGs6uT2DZTnHe8rbLJKdqQlyefbDN0dbxwFog
	V0pflJYpkv1S6NoXAR872HA7s116p8AQB7HFJFvViucqNLQ1TqoMz0WnyCcHNiVdSgaf
	RNtBmfTNJEK2/UgK4qMChLyJzdQrajAd76iR5eAhOZorYlZs7KRLELTIZZJc5g03aA7Y
	g5wzNSCdunZDaaxgZ2dgMHuKI60Zx1Cpw4JSN8tVaYe1t7I3YG/yvhJ8A7qdtuqgnMus
	h9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=gmypjEE1Fx30ddZRpJKYRqlqNrWgpkvG77YjnlfyiSc=;
	b=cEb8r3yQ+K4pL+1iWSNAuq5nuni3l9IetAwhKTNxSRNL7rjqlL0On9HyDU5cK82PJb
	mybSVr8M8eXbwVZ0ZwpXqlrJHtu4DoYALGJDgxoho1j5CKBOlwB9lFgxYzumCclPmR7T
	Y30TwTAld0trV1j9u3QdpFAdBEvtSEx6V79tH1rijb8/ywunEB43jYtN4adHMjbaGa1E
	mGAGNZND/jZCni8vyreZAAD9lKlNJTGM0NO2Pty+SQunsTRjtyAY6R57E6qQJuL4rCgi
	U5zHw2Awb5+ig2ZqpxD5XEepeG64bbgG/8gMTdPxcptIa5Sd/l8UcHixg6k8bT2KwC7J
	gJLg==
X-Gm-Message-State: AE9vXwOqmWuAL6ixWlx0TcS674FZ6jLmC1CI9vc1In1ErjyPBZZSNSfiaGfg1Un6fGEGKg==
X-Received: by 10.237.59.174 with SMTP id r43mr43217227qte.77.1474482753407;
	Wed, 21 Sep 2016 11:32:33 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([179.105.252.78])
	by smtp.gmail.com with ESMTPSA id
	73sm19544887qtc.16.2016.09.21.11.32.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Sep 2016 11:32:32 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2016 15:31:38 -0300
Message-Id: <1474482698-22007-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [meta-qt5][krogoth][PATCH] qtwebengine: Add gperf-native to DEPENDS
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
X-List-Received-Date: Wed, 21 Sep 2016 18:32:33 -0000

Fix error:

FAILED: cd ../build/tmp/work/cortexa9hf-neon-mx6qdl-linux-gnueabi/qtwebengine/
5.6.99+5.7.0-beta+gitAUTOINC+dbf7dd2742_29c16917b3-r0/git/src/3rdparty/chromium/
third_party/WebKit/Source/platform; gperf "--key-positions=*" -D -s 2
ColorData.gperf "--output-file=../build/tmp/work/cortexa9hf-neon-mx6qdl-linux-
gnueabi/qtwebengine/5.6.99+5.7.0-beta+gitAUTOINC+dbf7dd2742_29c16917b3-r0/git/
src/core/Release/gen/blink/platform/ColorData.cpp"
 /bin/sh: gperf: command not found
 ninja: build stopped: subcommand failedP

Change-Id: Ic28d0ac72fcbce8054638a3168b5d6a34bc129b5
Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 recipes-qt/qt5/qtwebengine_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 28b9fe6..979f606 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -16,6 +16,7 @@ DEPENDS += " \
     qtlocation \
     libdrm fontconfig pixman openssl pango cairo icu pciutils \
     libcap \
+    gperf-native \
 "
 
 # when qtbase is built with xcb enabled (default with x11 in DISTRO_FEATURES),
-- 
2.1.4


