Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 621D878A31
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:26 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y186so1314984pfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qaaG5G8KTqYqpLmK1Mj7jvcO/yvvxLG4revXLTU9zxc=;
	b=P4ACmtq5a/b/RCvYdb6jnpo9emV45ytKXDOzsLqwh/WJS6QWLe3GCOr1PYRdwFavXR
	Loixx8hc4lKTnnlT4IEdRnboxjNnd+rZn2JsxLfORc6TO2XVh4+BYEZtzSDIpvcK897i
	5zreZ8xwJW53CFaC+ITD+iUTmCxahCK0GdLfpHOT+V80arkIE2E8QLiqDZ+Q3tCcEAhX
	2F20wXIAOYXc6o+stTXoMX64ziSPHj7PS63W5z8b4QYp1RxVp7K0YVk1OU3wRFXKEMXP
	GUZcVK2L6D4FclL3EePeusgUrnwzT0LnXgjXOjJFcR7igkHvTJfIaEQ4YU/zOdW9Ci8u
	a7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qaaG5G8KTqYqpLmK1Mj7jvcO/yvvxLG4revXLTU9zxc=;
	b=aN+4GYyvN01gNhvjYimiuywzsa2T12jhTQts6qgpfEj2dGYxCBC888C4yzFnuT4omx
	3+nUGnVNJ5CUAalRAMzpTi2pVfFmRchfy8F1dl9+xAogJ2S54VOsL4EBmelqWywzuurn
	fhPD1HP09kJSuLi0jkHNUlMoDaU9KWPnkoc+QIFxq0GvxKqProS07TnY5peAC7bPkcaa
	+UuVSSecnSM8adysYdefqZutRxMv9UxgLFUyI+jsj5kTozW57Hd/9Cd9VlOn2OebmDrM
	4qwXPuDi21k5HVsx01d+7XHzwANxqOTUfl9jZ4S70D0SEy2nhJd19cM++C/+6VHlYs2m
	oVVw==
X-Gm-Message-State: APf1xPDUHp19WrCidMTciqA7brZvJjs8zBGODw3XbJjTaBw3UZBXHgIX
	1RcALHn2aPBEhRaJcXv+KSI=
X-Google-Smtp-Source: AG47ELvgQnhEWv97ZUGRmOB/A+7gyUzXp5jzzCcGfH1flvAtXr8/3BsXOFoHwAQ5KqBHmcvhmtoQqA==
X-Received: by 10.99.64.198 with SMTP id n189mr18781221pga.191.1520449287065; 
	Wed, 07 Mar 2018 11:01:27 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:00:58 -0800
Message-Id: <1520449275-29492-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 06/23] onboard: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:26 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-support/onboard/onboard_1.4.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
index 10765ee..4e49bec 100644
--- a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
+++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
@@ -10,7 +10,9 @@ SRC_URI = "https://launchpad.net/onboard/1.4/${PV}/+download/${BPN}-${PV}.tar.gz
 SRC_URI[md5sum] = "1a2fbe82e934f5b37841d17ff51e80e8"
 SRC_URI[sha256sum] = "01cae1ac5b1ef1ab985bd2d2d79ded6fc99ee04b1535cc1bb191e43a231a3865"
 
-inherit setuptools3 pkgconfig gtk-icon-cache gsettings
+inherit distro_features_check setuptools3 pkgconfig gtk-icon-cache gsettings
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.7.4


