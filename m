Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id A30DB7066B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 01:44:08 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id x12so485369qac.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=gMmt3JFjc7RBOmxwX/Ez0d4KmF7UTm1E9Cqob/yqOD8=;
	b=wWqoDR0iwstygbtlq4FkED9LqUk4SnzSq0r6VckVi1BbFNv545MZ/81bk7hxVIZnkF
	bRksKSlEa6SA259tYYn0SWz3OwWmH5vnSpLUcoBETb8S9WZfqP8RGhSDXrAAPpCHZEhH
	yE44bFpG7vL4vRPVI0zK+XDvtTKL7YIHBKAZAvggZtFlvewadgkR1NQ8XvkeapnYZtPb
	PHr7Z7BJopXYfluWMmspO9dVfZVnt32yb3+bvoy8JjKImD56Lkt3STLWhDEqdLb36a1b
	EDsjvyZICAhxtalxstYkGjx8amAYJmV3SwXEfzHqpXdgWaumFZ5vyv0+45p6qNE6Gu87
	dtkQ==
X-Received: by 10.140.22.5 with SMTP id 5mr57424496qgm.72.1423619049440;
	Tue, 10 Feb 2015 17:44:09 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	n13sm17222934qaa.25.2015.02.10.17.44.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Feb 2015 17:44:08 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Feb 2015 23:43:33 -0200
Message-Id: <1423619019-17403-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423619019-17403-1-git-send-email-otavio@ossystems.com.br>
References: <1423619019-17403-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v2 2/8] qtmultimedia: Fix floating dependency gst-plugins-bad
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
X-List-Received-Date: Wed, 11 Feb 2015 01:44:08 -0000

When using GStreamer 0.10 support, QMake detects if GStreamer
Photography interface is available. To avoid a floating dependency we
add the gst-plugins-bad as dependency so it is always present.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qtmultimedia.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index 427f688..e85d202 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -7,7 +7,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d
 PACKAGECONFIG[alsa] = ",,alsa-lib"
 PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
 PACKAGECONFIG[openal] = ",,openal-soft"
-PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base"
+PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base gst-plugins-bad"
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'alsa', '', 'CONFIG+=done_config_alsa', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'pulseaudio', '', 'CONFIG+=done_config_pulseaudio', d)}"
-- 
2.1.4


