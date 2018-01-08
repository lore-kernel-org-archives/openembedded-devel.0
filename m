Return-Path: <texier.pj2@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 34F2478937
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 21:04:07 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g130so17540976wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jan 2018 13:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=s5KttxJGIlTToLqB55IZrbIVHUayI2uh+nI7yMjsqoc=;
	b=DATA2GwkOq630MUmUQMSUmyeGi0o6RpF77RRiT5JFXj5b63Nonrdcb+wB435hoLzdv
	7ioPtXa7ay6M3InwdNySXBOJ/ZdfLjeiOf6VU6CtcpzHcZz3MB1/raySSLs+jz/ughe1
	O6vHwhNpgAQScUGbmP93U8WgopRzWpicfwFhYS5KmrKWjqi0xCphseBJVD/hL85p7eVc
	5BV5Ddhb+30R66+/RfPO11UDcnZ/C1Qlsgv9WmQqPpQ+ebtsUO5Cgpe6BgwksO4cqSab
	hRRZy97VmaO64G5ZgAGuVZ7O+CmYXYzaI+Dyp65iHfrYOGkU9jEbKlawngVMR70c4YaZ
	29uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=s5KttxJGIlTToLqB55IZrbIVHUayI2uh+nI7yMjsqoc=;
	b=LWgLRzIU58tjDOk+BzNn9BwsPoW9TMzk+Cenk972y8DbGXuBF+a0cpI/Z+f0+/VZdR
	h429CUs7JNbgnPc+skkgP8BnmBahPPkpu558wOX/YefGtJ7r4jydcLjXTkoXWTl6Fw8u
	mc+6o6J6Zj3LNOf6DzEw6tmrQ9vNqImK7KiYa2TkIqxmJpnXTc2VTPYY5igZ/N6Ai+N6
	M2IWZBMBNJhh8Kauf8SJY87gXkuBJQ4s7WsvlKmeSJUdxe6vMLqibwAR0Qs1nCmJZ1PL
	BNloYcRd2+nGtthTybm+7odnk5Onl6C6SS+1Y4xgAb5HNSyivU4yurEDpFhZY+iFhCRd
	FH0g==
X-Gm-Message-State: AKGB3mKdVV3tXlvXwod5CGWeBqv5hug+lQUyLb/wkGHTmhR6qqzzg66f
	uSGFXQupdSlolr52N/vqE4pP1A==
X-Google-Smtp-Source: ACJfBouEfe7OlFKE84qZElM09ZvV9nnLkR3B5/QH+mImB5GK/DVlL3DSQpuodrUAr48Kirbj1O9LWA==
X-Received: by 10.28.118.24 with SMTP id r24mr10251383wmc.53.1515445448835;
	Mon, 08 Jan 2018 13:04:08 -0800 (PST)
Received: from menoah.home ([2a01:cb19:190:c500:30a5:17f0:4e77:378d])
	by smtp.googlemail.com with ESMTPSA id
	a126sm10942340wma.11.2018.01.08.13.04.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jan 2018 13:04:08 -0800 (PST)
From: Pierre-Jean TEXIER <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jan 2018 22:04:06 +0100
Message-Id: <1515445446-17883-1-git-send-email-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-qt5][PATCH] qtmqtt: add recipe
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
X-List-Received-Date: Mon, 08 Jan 2018 21:04:08 -0000

Qt MQTT module was added in Qt 5.10. (http://doc.qt.io/QtMQTT/index.html)

Signed-off-by: Pierre-Jean TEXIER <texier.pj2@gmail.com>
---
 recipes-qt/qt5/qtmqtt_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-qt/qt5/qtmqtt_git.bb

diff --git a/recipes-qt/qt5/qtmqtt_git.bb b/recipes-qt/qt5/qtmqtt_git.bb
new file mode 100644
index 0000000..efcb35d
--- /dev/null
+++ b/recipes-qt/qt5/qtmqtt_git.bb
@@ -0,0 +1,12 @@
+require qt5.inc
+require qt5-git.inc
+
+LICENSE = "(GPL-3.0 & The-Qt-Company-GPL-Exception-1.0) | The-Qt-Company-Commercial"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
+"
+
+DEPENDS += "qtbase"
+
+SRCREV = "45d87f0d9260ef0c42434daa329e77aecf3f5d46"
-- 
2.7.4


