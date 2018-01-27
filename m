Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7B86978874
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:25:00 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id p5so167658plo.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2WHnDY4nLrNFKOSOonXSPjnWWnt2Z1eN5iv2lhl/nIQ=;
	b=ijUaWhE5DJtRwCMCQaPIhuIJHrKUHxAnEem2chCagkLrzDUyxwyznh2/CH7gkRhYMp
	cC6KL71MDyOKc0FNsekSwMlMweVIHRcGAxXb1vYBHHyXKbi5HtZSa6flRJB8mGa2TUn3
	tml9d7orTOZe3TNgeIeyhhMXFuHW5DMHlQPHDoL1iLfldTZ6JKAbHdxGwoyPN/KPJAlL
	TuGkSvhAEBKpnFSQXkLnFShmdQ9MK4fjsyyK2Dfil9V2ku8lRzSKQtP1SYm060o1kHDc
	8E9rMMeQUv9v9uuCoiMhlt1QeH3btJgvfSKLdfxxVOMdc9MUOCHdxlDImQFpqRsi8/Qw
	fCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2WHnDY4nLrNFKOSOonXSPjnWWnt2Z1eN5iv2lhl/nIQ=;
	b=Uwimq/Id6v+mjewdukRYDY3A+rYsinL06ZmLL0rfVD/3C2lPm1/sc6yvxISKSIgS2e
	jbZtW/FanrhymzMKGO27nmaG+iPrH5LNXqFK/rD64hC7RnBrKweO8wpWtO3/oph4u+Go
	P3CmV+ablcIBHNLrOb1kbEuxJEs5GSRoTMXOubHRmBa1tpTXB23gHDimxfswGjtOxwHB
	mc3VUPq9KnkTbPr2jz/eEtaTf/itxB/cuCCf1sW2k9ecrHID+CXFbV76iVWgPT8KQz44
	KHnJ6cjmvfp4HbPWMvFmcj5FYb8+iBeRmnRk1L5u5iS84MECJ4JLeEEP9DJWAmOAaewT
	R3Xw==
X-Gm-Message-State: AKwxytc01CDPENo77/QELVX86hVRe0czdF/MJG0GIjCds5OHZNv0TamJ
	ISOAusP03wAnPB++6OU/dMnD0g==
X-Google-Smtp-Source: AH8x226/UQBkX3167zFEHiKnreZCEQX1o6EQt6NYAtGOnWgoKNqqf1n+RSrh5PybTsGbM/fDqdDy4A==
X-Received: by 2002:a17:902:bf0a:: with SMTP id
	bi10-v6mr9696005plb.181.1517023502194; 
	Fri, 26 Jan 2018 19:25:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.25.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:23 -0800
Message-Id: <2452c72b74154befa837c5ed1f1664ed665c4849.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 23/36] fltk-native: remove fltk-config from image
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
X-List-Received-Date: Sat, 27 Jan 2018 03:25:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Make sure fltk-config will not be used accidentaly.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 66601de45ff88a2a267d50f27553956611c8a174)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk-native.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/fltk/fltk-native.bb b/meta-oe/recipes-support/fltk/fltk-native.bb
index 353987e..2636287 100644
--- a/meta-oe/recipes-support/fltk/fltk-native.bb
+++ b/meta-oe/recipes-support/fltk/fltk-native.bb
@@ -14,3 +14,8 @@ EXTRA_OECMAKE += " \
     -DOPTION_USE_XFIXES=OFF \
     -DOPTION_USE_XCURSOR=OFF \
 "
+
+do_install_append() {
+    # make sure native fltk-config is not used accidentaly
+    rm -f ${D}${bindir}/fltk-config
+}
-- 
2.7.4


