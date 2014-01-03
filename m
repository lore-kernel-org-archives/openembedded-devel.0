Return-Path: <andrei@gherzan.ro>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id A60B16BBB8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2014 20:59:32 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c13so6937099eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jan 2014 12:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8RbyhH7nWQLcWvv9FRYV9eLjN7Q1AHuXDIl8cAyXYKQ=;
	b=jRd8U+5Dn2+dTLXJLpLyho6uiZpOn8PVXqNUY4W9N+ufqesN6mZNjVyF/jj6mCJRjW
	2/MXyrEQ/toRJe4Oqngc9RoAAxg7qJhN4AXGdDraCH1xBz6H5q5xMsljrdzRm4fhSUFO
	ibrJpEKUfeypsnowtxySd2Hh77U62kus7ia4STGKWDtrud6HYK4uSTv3Lb1h9efUVhqm
	cwlXyAQ9VhDESTwGseMMk++unbnI4sp9MW3234T9cn2BSCMjprH29fc0YdoqgnCXfpLX
	i84eLyzJWhq5GrI790eAnxmnb+d7anXqaoo+jVXZQt4bws/+DfbQiVfkh9OTEYjMaEwK
	jO9g==
X-Gm-Message-State: ALoCoQknViUMj8PhprWx3qsre2AVgN3Ud1GgBPTaWM1iQ/cyZudwilD7K0oeXVhVtr37VhxLCGWn
X-Received: by 10.14.87.2 with SMTP id x2mr4142579eee.79.1388782773473;
	Fri, 03 Jan 2014 12:59:33 -0800 (PST)
Received: from localhost.localdomain (5-13-221-193.residential.rdsnet.ro.
	[5.13.221.193]) by mx.google.com with ESMTPSA id
	p45sm148062011eeg.1.2014.01.03.12.59.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jan 2014 12:59:33 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Jan 2014 22:59:25 +0200
Message-Id: <1388782765-16266-3-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1388782765-16266-1-git-send-email-andrei@gherzan.ro>
References: <1388782765-16266-1-git-send-email-andrei@gherzan.ro>
Subject: [meta-oe][PATCH 3/3] libass: Remove unrecognised --enable-png options
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
X-List-Received-Date: Fri, 03 Jan 2014 20:59:33 -0000

Change-Id: Ib748bfbd3437e3cfdeaba7283b99aa55ad479a6a
Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta-oe/recipes-multimedia/libass/libass.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/recipes-multimedia/libass/libass.inc
index a0dc564..64405ff 100644
--- a/meta-oe/recipes-multimedia/libass/libass.inc
+++ b/meta-oe/recipes-multimedia/libass/libass.inc
@@ -19,7 +19,6 @@ PACKAGECONFIG[harfbuzz] = "--enable-harfbuzz,--disable-harfbuzz,harfbuzz"
 EXTRA_OECONF = " \
     --enable-enca \
     --enable-fontconfig \
-    --enable-png \
 "
 
 PACKAGES =+ "${PN}-tests"
-- 
1.8.1.4


