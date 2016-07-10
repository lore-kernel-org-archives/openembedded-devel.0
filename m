Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 303DE601F6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 12:48:06 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id r68so13831573qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 05:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7Rbf4weD72xV/N53Ue4/cQQoIk8kpFjWnZB8hmR9j4I=;
	b=KBijwXWsWP7bRDLLvgJCrrKNeJgzz0jY4MPuhApBcHhYAPuTNoSmbgRaSrvJZO/tx5
	NCXC0oYkaJlfMNFi6pbrDig+YtX9ehuNBI2QWEfTsHiqsdTzfkK5eOojJxqOVBjNvQ7z
	ej7lTWLaG33IAh3XuL8ViZohoiEKDrhmKFm4v9SpNDUSs/UintUWWdhKTIFd+qibBdyb
	dWXR3Y513EpziUQiblLd5uEstchcbxznXgkL6aIRlI62CBzjcNDHi0V6npLFL7ONOfsk
	6sLFPzevUunOu3eiC1gy1KrNMfHNm9yY6mWxP/upHV/PCtD7HtuoiDuS6smNMp15JEkw
	pDqQ==
X-Gm-Message-State: ALyK8tJKQ3iA3RuPY1IKJqKp9p9qK4ZAO0KBmMgR3/kFbzsAnxivPZTtFriD/28k8b1Bfw==
X-Received: by 10.55.114.69 with SMTP id n66mr18792273qkc.2.1468154887554;
	Sun, 10 Jul 2016 05:48:07 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id q13sm2219705qkq.6.2016.07.10.05.48.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jul 2016 05:48:06 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jul 2016 08:48:00 -0400
Message-Id: <1468154881-16715-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH 1/2] python-vcversioner: update to version 2.16.0.0
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
X-List-Received-Date: Sun, 10 Jul 2016 12:48:07 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ython-vcversioner_2.14.0.0.bb => python-vcversioner_2.16.0.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-vcversioner_2.14.0.0.bb => python-vcversioner_2.16.0.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb b/meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
rename to meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
index 0df18f5..9308c12 100644
--- a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-vcversioner_2.16.0.0.bb
@@ -2,10 +2,10 @@ SUMMARY = "Python vcversioner, automagically update the project's version"
 HOMEPAGE = "https://github.com/habnabit/vcversioner"
 
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=260625d695c5e0c9dd2c2ef898833c7d"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=827a7a91a8d20d3c666b665cd96db8e3"
 
-SRC_URI[md5sum] = "7848a365ced9941053bc25d9a9f8f4b4"
-SRC_URI[sha256sum] = "acd43686e92e6c8bbeb4f2eef54408567a7adea9692fa72d591eec5357c03b86"
+SRC_URI[md5sum] = "aab6ef5e0cf8614a1b1140ed5b7f107d"
+SRC_URI[sha256sum] = "dae60c17a479781f44a4010701833f1829140b1eeccd258762a74974aa06e19b"
 
 inherit pypi setuptools
 
-- 
1.9.1


