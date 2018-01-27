Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 011F078864
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:50 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 11so166499plc.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QF6ngJtAzW52MQpR9muHcjFjgYnLjbsskAdq8/C2Lvg=;
	b=iICpFjc0Oz6zUfouB5gm3lwEhEJqrwVIHszqSKE2ljAOrjrcD5Ns6C7wK4aXAMCdTe
	HPushPVUzs8CN8HqfVy8lEhlvQukGcgEbwIva+olW5Ig8ZTPWbReToZIx3ww8QM5GuYb
	7o07KIn5V8tRxBvhYKgQmMdEGJ1gVnVLxcDQqHu1rHiCW9VA8RP9rcCVG2OF56H8Cwao
	9KPqi9IFDap6njTKWnPQvz2YehNXqGRcDLripY8hZbkbJAPTAPqUMDV6vkAJXbolp3ap
	8yZTCyIUvqbRP16OdQ7OWwY6m8sRE++F3knERk/oWkboePPkKkHDo2MrwR2KUISAf/yj
	Siww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QF6ngJtAzW52MQpR9muHcjFjgYnLjbsskAdq8/C2Lvg=;
	b=DTZVjdTXBqSskuGoayWROtx7tXg/V7gYx6/NfdP93862oiy+LcWCE3DnD0BsxNAomT
	T+xkQu3RtxGBOhbV71/NmSm44SsV1IhwrvdXEu+6+ibWe5coyyBOXWocykLxyuziPRao
	ckqBCYD5NoyPDWGGqt16qq00Z5KNBLuDcgBz3daRcou7dr20+/tPvoi4dnqA6U8P7RJD
	OQ0qat0OPxfN/SrJlS0cI1Qg/iEDqzeMmuaq9e+RtjOV1TB5Idp5IV91EZDCghXVg2rM
	jLFIbgHqQf6AuXya/P+VPPM6fnJCbLytX4iGseT8QkqQ0egR4T/VTzWJOQntsU4STliy
	mRXA==
X-Gm-Message-State: AKwxytfxwqsxG53eSndBimqgkqMeojEIFeFgt+Nh2DmG1AYHvwRdSGsG
	SFtCxIREyUtKK51EeYBZEQulpg==
X-Google-Smtp-Source: AH8x227yLTW7pPw3phni1Z8ivEOoYS9yHF2JczFOjxSB4gbYGzdn12J3ZJT3F7HJ1e+qn9caw2ocag==
X-Received: by 2002:a17:902:59c2:: with SMTP id
	d2-v6mr16362243plj.306.1517023491692; 
	Fri, 26 Jan 2018 19:24:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:11 -0800
Message-Id: <47a394b7d4987dfafb6b32fe515ea57d8409b079.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 11/36] xfce4-screenshooter: create src dir before build
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:50 -0000

From: Catalin Enache <catalin.enache@windriver.com>

In some case the output directory for xfce4-screenshooter.appdata.xml file
doesn't exist.

Create directory before build.

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 754754b53bbf4c72d7855e9209f1ccecce5cd8dd)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb
index 06dea64..e449dce 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb
@@ -12,6 +12,7 @@ SRC_URI[sha256sum] = "e62b31d9cf06a7414a26400c2ebe7a2ae7c2b22aa60f997f25145ea9eb
 
 do_compile_prepend() {
     mkdir -p lib
+    mkdir -p src
 }
 
 FILES_${PN} += " \
-- 
2.7.4


