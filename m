Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8930A77071
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:03 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a140so1212662wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=y4ta7hjU2A/ilTwLGrdA2fdld30xCB09ecIexd6L73g=;
	b=q4EDOdrGVlehF+Crlm1dspPzknyFZaCt0QG+3y5SWNyL52xicAE8slWwadx9bgvIvi
	l5Pm8zLw9KlTwGPbW2e6CmdTvvEomaL04Mb93UP6a412djkVu8EDIOdVl/QYsJjHRA9H
	Kf/ef05z2QXNhuOdMU9qH4SY8dWiOCEtq05Nkk73WET0aSdh3o1i2eY9S1SVEZsxLHFE
	yPZ2Qt6LAGsLjFTP9HakQJo7whEIKnY+ouwnHVX1TN2PZcoUHztAoaNDVmHfdtqjqmC4
	srceN7dlR5hzvo8VT55TKv9xLU9zZKgxVrcn8mcsFNter6QiifgL/w47FbgDs8To4jbu
	c4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=y4ta7hjU2A/ilTwLGrdA2fdld30xCB09ecIexd6L73g=;
	b=gVGXBIDT69lBZGRdaL7MfAx8KCjeF8ZGWtS2h8Q8/MmiIP53Qh50uF9/0rLHzjI3z9
	qZMwnvFSpWWRDE/om7gSDzZJH7XCsOArHewxR/XGr6XGZkgaoCs00SXy1HpzK58OkvEu
	VF0w04Yhgk51lJTqr6NTWY2xwL0qfp73bOo0YaMQiNAQYj04NHB2DRP2qDMUEIk6c3AX
	SePXcr0vm/wBGtYyrv7fHn8CDlWJz5OPU/AuBd75cznadt0fpp6IaJo5CyDcT+VILv5C
	nfFlSihnXgTt0Rn+eTcLAP4/qN6cReKwe9qa7DqsSMnTRblRXq8MvqwhkZXNos1sOGEF
	Mp7g==
X-Gm-Message-State: AD7BkJKgXcwEgBE56o9rkjFOmhrRPqQLEYvJ5Z0wAIF5KssUfDdCcHlx8VQrG4AO9iF0UA==
X-Received: by 10.28.234.137 with SMTP id g9mr8441498wmi.78.1459834743844;
	Mon, 04 Apr 2016 22:39:03 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:17 +0200
Message-Id: <1459834720-17165-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 08/31] qtscript: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtscript_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 32f6ebf..eea6911 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -27,4 +27,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "a5e814fd8809dd6a8a3c3efd4b911b36e3325a2a"
+SRCREV = "a70f6a1b9599931fccd13b15a1700e61137f7e72"
-- 
2.5.5


