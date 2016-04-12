Return-Path: <ian@boundarydevices.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 545236014F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 00:59:42 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id c20so2540993pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 17:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=tOPbYoc3YsXv03B2SPStlVrRIBJe4JCGxKxuOeYYjKU=;
	b=my+44Lie5KvdgAKCvd7EfdTaie/V8Pytl1JF3kHqddu5bWHQ+7kMwHc1AYElgfS7Ng
	2DyUAKjDxV6T84d0GT0Y9d6BeyeUNIZ+zPW9NPn/qsGxgQUTo9IVL92pzbMeany38EqG
	RRjQAHdnhMBfZjXOTHBXJcf9r7jNHvRs3AbLQLjEGQSJ7uMG1vOMyOMDMiJogZ0+9ZBP
	8T9k6i9VK0x1lon8pc2wAv0yJoM0oHkBDzfT8RBtneDziX2RKOzeLlSibyLwV5CUGLJA
	uYGYtO8y5yydNywfGbI+HPz83C2EWAUSCYRPQuQccxOPHvEqufPhbK0NYJRheuzYIdbw
	LwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tOPbYoc3YsXv03B2SPStlVrRIBJe4JCGxKxuOeYYjKU=;
	b=hw/64VA5M8BoPm/U3hAfSb/xFslQ6XKQf/1G5q47qCFMmgREwwwuby8OF2G8lvuOw3
	snshxFXJtOdpcMrEPAawHhe72ra/MYx4cUjBrNM/Hn+HygCrMnimRwNRfHBgkeNfl97r
	wzw5kfhg6TP2gG65utM8hXIRM6vkH7lITVoEKrGoPyQ1LGKzCba2f6HMG+YuHpBvlHow
	Au0Mh3jNwGqBBt+yd06N/gxt3L+tm3qa3jgOBB6yb5V3uCS4pE+l9F5CS/39NNigdEo+
	g7wWXJiAyVPM/1G0x4NGdSsAymLepmJ+1eJCiR/f6hj/mZ/GivKh3yDHWym6nOnDf2+p
	wETw==
X-Gm-Message-State: AOPr4FUCuWR4kOANuC9TvBJoQl3/LOdZQqaqf0p6lHpPvFtVcAtajWqpBGz/w715p5LiRQ==
X-Received: by 10.98.32.218 with SMTP id m87mr663972pfj.48.1460422782651;
	Mon, 11 Apr 2016 17:59:42 -0700 (PDT)
Received: from ian-desktop.attlocal.net
	(104-53-140-179.lightspeed.irvnca.sbcglobal.net. [104.53.140.179])
	by smtp.gmail.com with ESMTPSA id
	o69sm38733859pfi.14.2016.04.11.17.59.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 17:59:42 -0700 (PDT)
From: Ian Coolidge <ian@boundarydevices.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Apr 2016 18:00:00 -0700
Message-Id: <1460422800-14784-1-git-send-email-ian@boundarydevices.com>
X-Mailer: git-send-email 1.9.1
Cc: otavio@ossystems.com.br, eric@eukrea.com
Subject: [meta-browser][PATCH] firefox: Fix QA Issue: non debug package contains .debug directory
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
X-List-Received-Date: Tue, 12 Apr 2016 00:59:43 -0000

Signed-off-by: Ian Coolidge <ian@boundarydevices.com>
---
 recipes-mozilla/firefox/firefox_38.6.1esr.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-mozilla/firefox/firefox_38.6.1esr.bb b/recipes-mozilla/firefox/firefox_38.6.1esr.bb
index 951109d..f2e9726 100644
--- a/recipes-mozilla/firefox/firefox_38.6.1esr.bb
+++ b/recipes-mozilla/firefox/firefox_38.6.1esr.bb
@@ -84,6 +84,7 @@ FILES_${PN} = "${bindir}/${PN} \
                ${bindir}/defaults"
 FILES_${PN}-dev += "${datadir}/idl ${bindir}/${PN}-config ${libdir}/${PN}-devel-*"
 FILES_${PN}-staticdev += "${libdir}/${PN}-devel-*/sdk/lib/*.a"
+FILES_${PN}-dbg += "${libdir}/${PN}/*/*/.debug/* ${libdir}/${PN}/*/.debug/* ${libdir}/${PN}-devel-*/sdk/lib/.debug/*"
 # We don't build XUL as system shared lib, so we can mark all libs as private
 PRIVATE_LIBS = "libmozjs.so \
                 libxpcom.so \
-- 
1.9.1


