Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1A7BD77070
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 16:19:17 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id p65so87316364wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2016 08:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i3mct324TTwgnmatXn/xKG48xjz+S34uRvxB3xLDU/Y=;
	b=QcExViH18Kjtbvt+U235kl22BAg2xwPUysb5fWf2j4MWxymzGaOFexKx6R9QULxLpY
	50LkWDbp4VMyKSX08QqFt1BZdl89FW8wl7oVHSvCPcAbSUpddFxJA18a2xzkG+imGGHI
	dGxs7HZz0ztgc5d/iIAo8kvuqikWGRGaQPgFlGK9LWWsSC0Ss22Y4MdCiOOdVR4cvtJ5
	n1lwAzX7CRnoi1qD6Br8LLduUT90gZyO/O+ELw6JNpktS7ef09+EyAFP3dZYBXoiFKuO
	zV840lBmQPO9GNnlAGoYujyb9yBDDAEawfJLHysY76GEH3svlVVi2jMrWcx6/Kzl/pa4
	QgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i3mct324TTwgnmatXn/xKG48xjz+S34uRvxB3xLDU/Y=;
	b=KsFUTimatZsN490hPwukzgED+olPTRhqAI4QDjUBC9/bhDAeRn3uXpoH6CP+BR1sWo
	7pi9Cpnnk5RS4Pc/HmWWlEPWCynoflbscbvo6PadzPUyGLobNm+Yhf0HF5hVY12YQOf9
	KVksakEp079glDsgrPGtjUHueifW46KN2wcESdKa282PkpszBle1tHj0wk0yqEF58JJ2
	HtsC5gOMpTvg/udX6oXA9OoJs9aKDl3KxTNhgMeh6tpm3QlaBd7+2loYxFr6Nm1EMtWv
	8cxSLk0Vo7+dFxCKW3Zp0IlKjYYkExGGjwIvTRJYTE5EIYH1bf1EMwqcrXUtuaqZyO4K
	xzNg==
X-Gm-Message-State: AD7BkJIATcafClzOiwLeo2J6hT9QQf7tGB9ud6una5wvepSCrtvqcpiQ/2Oojs32SmAxGg==
X-Received: by 10.28.96.197 with SMTP id u188mr807762wmb.102.1456935558109;
	Wed, 02 Mar 2016 08:19:18 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w144sm4853035wmd.8.2016.03.02.08.19.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 08:19:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2016 17:21:09 +0100
Message-Id: <1456935672-15538-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <1456935672-15538-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456935672-15538-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/5] vlc: blacklist, not compatible with currently used ffmpeg 3
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
X-List-Received-Date: Wed, 02 Mar 2016 16:19:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 3267dad..32f3ad0 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -104,3 +104,6 @@ FILES_${PN}-dbg += "\
 FILES_${PN}-staticdev += "\
     ${libdir}/vlc/plugins/*/*.a \
 "
+
+# http://errors.yoctoproject.org/Errors/Details/40690/
+PNBLACKLIST[vlc] ?= "Not compatible with currently used ffmpeg 3"
-- 
2.7.2


