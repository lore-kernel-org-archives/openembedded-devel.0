Return-Path: <andrei@gherzan.ro>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7DF60CF2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 16:42:04 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id ii20so2793031qab.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 08:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ndlYR6Yyt3mPudDXmgauNsX8wzx3dPgMdv+nC10pJbA=;
	b=ZnIeIvbRTq8BaAL5Fxwk3qNhN/UPO6LDAl+qQp0QU/WmJ2JmmB1F4xdIHepuhlWETw
	bw0YkZEh6oAWuWkEZgrzX1nPHqcWW5qQ7YRhIKQAMccSIFCOJE/b3pnNRINXb0PM+VKZ
	Nl3H41z9pw5H6w0XMFhETwfnwQOTMn3hpCyngN4SjCQkap/ZFv70ozUhMiEOh+6KuzFo
	3biOQZuziJiuvNrcEJVXMNpbKsTLVi8xHH3P+NxEwrmWsILtFwFy9j4psC9pSWBCy187
	MVtXDs4OlSiG52Ayz8/q5XZaTV3nd4yJo23s85s9Pb111w3UZSUxYAmS5Bv9OLOpvywl
	MMHw==
X-Gm-Message-State: ALoCoQkr2THIYBTGCLe0T7urcz6W3ZYMbiTfc9eh9TvwRYocGRciOXjpT9Qtg7fogKIMcnQfxbd6
X-Received: by 10.229.194.1 with SMTP id dw1mr44272070qcb.20.1387298525504;
	Tue, 17 Dec 2013 08:42:05 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPSA id a5sm58120708qae.2.2013.12.17.08.42.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Dec 2013 08:42:04 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Dec 2013 18:41:49 +0200
Message-Id: <1387298509-20865-2-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1387298509-20865-1-git-send-email-andrei@gherzan.ro>
References: <1387298509-20865-1-git-send-email-andrei@gherzan.ro>
Cc: Alexandru Niculita <alexnick87@gmail.com>
Subject: [meta-oe][PATCH 2/2] libsdl-image: Add support for libsdl-image-native
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
X-List-Received-Date: Tue, 17 Dec 2013 16:42:05 -0000

From: Alexandru Niculita <alexnick87@gmail.com>

Change-Id: If4a11d3e0d7aa800081ac3361cf2662bb979dd7c
Signed-off-by: Alexandru Niculita <alexnick87@gmail.com>
Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
index 459bf12..19dd4a4 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
@@ -29,3 +29,5 @@ do_configure_prepend() {
     rm -f acinclude/ltsugar.m4
     rm -f acinclude/ltversion.m4
 }
+
+BBCLASSEXTEND = "native"
-- 
1.8.1.4


