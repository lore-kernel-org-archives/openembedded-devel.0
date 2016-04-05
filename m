Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 36D6C770CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i204so1221999wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uDVMsHiJQko8p3qdIrZ7AF9huHwsTnNro/eqTMPITvo=;
	b=yV2uzs1MJ9XrharsUYjq74pZcWdCepKGTgWeK4dcW8QU6mCcR6GSWQyCsMssJRRTPK
	FsNXDuWud+pn1MXYgCUjrPsHEvathCVu7oKZkAR7ZS68cRNsI3C8+n7g6LJaz+MKeEXp
	1SIgwf/K7JkRXySQ3OHKF64C9FWmp6fMDZ4ofdovYlBsdNeghS6Ea3kePJu55Biz7PkV
	fBWIFcQL5TMf1FAHqX7EcdZsW8LV/MG2C9Movrn4CNhhBi4DQXZ/HeOmyjZPc74msMWm
	wy9O2L7zFyu2wpR/sh5wlXGf2Jc/tm1cWCJInt8u0bpbzYMmyADeWLOt7g7+BwM/vxUf
	ekfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uDVMsHiJQko8p3qdIrZ7AF9huHwsTnNro/eqTMPITvo=;
	b=m/pkUXF1mgxyYfL7bMBlY3xiKXbXTa8kf7iMlt3G0fYmL0ifYVeqA+ia2GD+ZWyPkF
	mWhBv2qxQR3W39uvoF/icsAxi7SPsfwWeUcqyL29EPCTNZnXqi9PeDcLT+f7mEjJ0ZdR
	Oxkb0GAwAOTA+SOFQ5RkvEokuzTy30cjRhSrQs6EmdiruQmvsVyVR/o3EzYEMokY7I9A
	ByV84abaiH1yplCn13oSNqVibwBoCjK7Z1/S6ZZoemW2sQjDBFjF/CIyfGTkML3qZjkA
	zNREZXvPabhYlNSsYiPRmpXldtIhGrdy/jT0L99giAhJj0qO8es2/SZpYr0wCiS22pJ+
	23CQ==
X-Gm-Message-State: AD7BkJIlPMptJbamBhKz9723AYjpPMPLrqML/YIW5fHSpSXr5qIBz7cDimFJIgM0iW+3pQ==
X-Received: by 10.28.234.11 with SMTP id i11mr11097550wmh.76.1459834757412;
	Mon, 04 Apr 2016 22:39:17 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:35 +0200
Message-Id: <1459834720-17165-27-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 26/31] qtwebchannel: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwebchannel_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index eb4475b..7d923d8 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "3fa1c9d2cf5e00e7431d042e7955a6dd75e6e2b1"
+SRCREV = "92d903d92b430222cd3f89eab08d61d947e5abea"
-- 
2.5.5


