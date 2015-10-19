Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC7777070
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 06:17:10 +0000 (UTC)
Received: by lbbwb3 with SMTP id wb3so72241282lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Oct 2015 23:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h8uA1+wZMlqOShhq7rylm9bb7WpddmMw/rnPKbIBzZI=;
	b=DiS4MdX3TA+vaCSwo50EoMO0FfGanu2/ae7VepYy46RNbuwFho9t0xdoqSmPde5w/Q
	Pfhk1atLxr+ec4nIvIllaK6KTRgfzQ1H9W0Akc1bAY3zY6wNMJ2q8yRlxkvTlayvthXE
	vWUdDypHmQ81PM6lSkFGnfoe3MHIYEqeZhLo3RzopZPfsxFpsxhDpSNCOHx/os88XyYG
	ZOXcTXfDr7fxcMhVbpRSEudexEfzg7ADvEn0LhKesV3k7krknniCmSQrqU9hkzsEa1qQ
	W2qGKO/vr0ZuKw0GjFaUxA3Daga5X1q2vyDLk51Ji8U0ICBRl5qCCKe6Fs/EKPPKHpdt
	XxmA==
X-Gm-Message-State: ALoCoQnbkw6Gp19QsGrPHXRzx6YZs6l1NJfUNp3Qbp+KYiyOQ5CA3Pu6w9BXEUuurQH3NeV6N6eK
X-Received: by 10.112.130.2 with SMTP id oa2mr4252264lbb.14.1445235429499;
	Sun, 18 Oct 2015 23:17:09 -0700 (PDT)
Received: from localhost (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by smtp.gmail.com with ESMTPSA id u6sm4975782lbo.43.2015.10.18.23.17.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Oct 2015 23:17:08 -0700 (PDT)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Oct 2015 08:17:05 +0200
Message-Id: <1445235425-19527-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 2.6.1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-qt5][PATCH v2] qtbase: fix QA warning of host uid leakage
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
X-List-Received-Date: Mon, 19 Oct 2015 06:17:12 -0000

By using cp, the wrong uid ended up in the package. Use install,
as that will automatically handle the uid and gid.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 39d02a9..7641b63 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -231,7 +231,7 @@ do_install_append() {
         cp -a ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_QT_FONTS}
         chown -R root:root ${D}/${OE_QMAKE_PATH_QT_FONTS}
     fi
-    cp -a ${B}/lib/libqt* ${D}${libdir}
+    install -m 0644 ${B}/lib/libqt* ${D}${libdir}
     # Remove example.pro file as it is useless
     rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
 
-- 
2.6.1


