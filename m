Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 514B571AE2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 22:41:05 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u144so24293044wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2016 14:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=M4U2R694mPPKMlyfF54WTTqm4P4eQIq1dJyG73hHMmo=;
	b=0l3o7Ta33xJ4aZDmAMCPPhMG6wRs56R3bMH7Vh6KQH7A/QKJmur9rVjsLdCk8lEEKf
	JGz3Tnd0PDI8IuCj22R6H4Jnpp09F4PEsB6ckGp1/aALWB/HyvxvZ6Wq0eLBzzbVCnWe
	5thyeEHbqMCOsEWHHJer8GZitVaJ9I5adq5VtA1pjzZbw98Hfx4UN4yqt19qc2Ix1+cX
	A3XdhG4DbTph25CNS2ZXdDj0OO7bEK4BBKWtFZ02u5c3aepqN2vp46D0ZGnCVAeCFskd
	PxsQuGpoa8YxVQTMgxiR1Y9V8QM2CRYjmwFcbfwi/nw5EDFIBOY0MT15xHRpvaoxV6al
	hQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=M4U2R694mPPKMlyfF54WTTqm4P4eQIq1dJyG73hHMmo=;
	b=D91yg3lAsL0DdInO5ApoHZnEOBs8aivCdRofA5v/wJeZA27LvaSv9eIGeVIKL1TkgO
	ceWERzL1LE+wpJ4NXJYgAAKr8ZZ9TNWbSO8YDzs/1Hags4Y2Wq1JDpi3+XqIPb43tdOn
	JiXRHfnAWOtF7BzBgsFnFrtCM6+GMe289dOSb4ZDMMnDlq/Up/EQqcKMYf89BO20myjT
	oFf3x5C8PrXCnY5pvZAxqa9XHLqEGh30Gcp2gIUJKvHt2URtlmCLmHsshth/IoM6S/d2
	apabvqku09bqI/iOlm4be9WElIwdLwfqGyHS3vzYRLZLMUE3P1wDaujY6/0QxOR4ALZL
	LUKA==
X-Gm-Message-State: AKaTC03KmzldMZmSvgouep6CFDjITzVoi/3DyFVGafxOhYwR+PAIeee8tS2Jnc8JnjdmPw==
X-Received: by 10.28.16.70 with SMTP id 67mr616819wmq.53.1481064066696;
	Tue, 06 Dec 2016 14:41:06 -0800 (PST)
Received: from localhost.localdomain (p579CEAA5.dip0.t-ipconnect.de.
	[87.156.234.165]) by smtp.googlemail.com with ESMTPSA id
	j6sm28060674wjk.25.2016.12.06.14.41.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 14:41:06 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2016 23:40:42 +0100
Message-Id: <1481064044-26249-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1481064044-26249-1-git-send-email-schnitzeltony@googlemail.com>
References: <1481064044-26249-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] xfce4-notifyd: update 0.3.4
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
X-List-Received-Date: Tue, 06 Dec 2016 22:41:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-notifyd/{xfce4-notifyd_0.3.3.bb => xfce4-notifyd_0.3.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.3.3.bb => xfce4-notifyd_0.3.4.bb} (78%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.3.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb
similarity index 78%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.3.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb
index a50cea5..6310a17 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb
@@ -6,8 +6,8 @@ DEPENDS = "libxfce4util libxfce4ui xfconf gtk+ dbus dbus-glib libnotify"
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "f918bd3f9f9ad85eace408aecf541198"
-SRC_URI[sha256sum] = "986c4cfeb64c21c6bfb2fe65839490ad0f501fdfc8ed10cc71815da5da110f73"
+SRC_URI[md5sum] = "793490b488c3c4a3f97d644431f048d8"
+SRC_URI[sha256sum] = "038535de79b7056058e8d6dceb457959949831853c2594a686ec68b037ae31bf"
 
 do_compile_prepend() {
     mkdir -p xfce4-notifyd
-- 
2.5.5


