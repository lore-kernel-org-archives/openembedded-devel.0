Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9055C5DF7E
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:01:49 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2322.1787029307292807377
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hzj0AoTN;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so5463146a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029307; x=1787634107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvBMa3tdXlKnEiIa0ac+gyNRTM5xMfT1g+hGVcnC98E=;
        b=hzj0AoTND1auwERGsiL8cFTPgTNVziAiAs3DEEep/y0W12wRepdR8UgSWueCwA3jMt
         mZqbTMYwvj1zrhlXI0Ul6GCIDyifmc4yn9WzEGB000HY4pwlOLbcwNoLTnla5GckrsgS
         bmRkg3A6wEKY2PCduTV1pBNVBEVujSZAntnG3JXEo1xyboCXQ2aOa9txMitOM0zNHuiT
         bqmF4udOzP2DkPdPgaLCRhVnJEUuwotN9X/nPiUp5I/jwxo2IH58EQLO8BQU4pQ0Ll43
         XNIWURnr8Py1c1gp6SfHzALBUR6m/P7/EdM05cgEyHPLp2gesoT98t0tLnvzC1SmlIPE
         6M2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029307; x=1787634107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vvBMa3tdXlKnEiIa0ac+gyNRTM5xMfT1g+hGVcnC98E=;
        b=j0ID1mw6dl1guFFFptcQQSO0cl7gZFJoM4qpzUD4Z7ZpkHZu02sp8NGwUBscc0jIMJ
         D5BXrGVZNHcjJo20fSWWAQ75OXhs8/nz6YMUy56onb1joXEtHfFyYyGC8wnHeegacOva
         2tQHlsrG0XUzDL1/NZ+4Zd+5+PcjySoJrYF8EKWyRbQTsjadpUKi/YYEgNReD7QD4ZvR
         4SNZGiu+ynfW9ug+/haLZ0lHtQUfmq51jWsXJE09pIzXd8HXc6/nZpnrL1RJ0rQnvamr
         wvDoXYx32iAjc/UtXCETRkZS0xDndlh1Wzsi+QEULOjLg6xb2HK3/ozD+SJABUU7vhJO
         MJGg==
X-Gm-Message-State: AOJu0Yw3wNlKWQv2MfuWxRAdBibpLG+Hv88IwFKMQfYCaKS/yJFMuDz6
	WAWN22OrThr0PoiHZG37VKGHkpGAWVQuhxi744zNewfB+SbztS1zuj078LUdljT0
X-Gm-Gg: AR+sD11Sn4UxNwv5mqyuASWoPxLYeZoSRvnpCeJuSu0QtPItPgOwbH9w4F/2hEFkboo
	78snQyNd37jy3lY7WxCSnk+DTrAjtCpjTfZA2XO9Ov2WuoAgkuR63RVrs7MlUqbAqeQii3uj6q9
	lBsTYJQczghSJFJe52CZQ3P60gmx+5GduJfSvfmPDc5cX3OtuLD7dtNYRgfDHzKXhYwNVDMudPT
	REayN2ZvKyzitscUBdbPF1yd/+sO15CeKu0E2D4oA5yFLMUksFs3zyJaQrHbSgxRqkBOz7oTkpn
	L0bNPitGe8oClGpIEpurDqZlxMLtv557Fq0CW+zrP5WEYT5DyNr9Wp+vBSH6dFzdznmkzqf87GC
	VF2LSjCwMWF2tgs3lUdXS535inK939Fnmte2GViBG8UrvupSrpAT+ctk/mjlb3+0ZO6kjCGG8p6
	ENB9Txqzs1LY87072AiPa7FNYqw7QfYUsXPOs3rnwB0hnb7WnYHExU0w79ScEGFTmmFGdcLvCDj
	g==
X-Received: by 2002:a17:90b:278f:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3955a7c464bmr7188751a91.13.1787029306666;
        Mon, 17 Aug 2026 22:01:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:01:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 4/27] gnome-session: upgrade 49.2 -> 49.3
Date: Tue, 18 Aug 2026 17:00:59 +1200
Message-ID: <20260818050123.2901739-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129203

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also add UPSTREAM_CHECK variables to check for new releases.
Fixes:
$ devtool latest-version gnome-session
...
INFO: Current version: 49.2
INFO: Latest version:

Release Notes:
https://gitlab.gnome.org/GNOME/gnome-session/-/blob/49.3/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{gnome-session_49.2.bb => gnome-session_49.3.bb}         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-session/{gnome-session_49.2.bb => gnome-session_49.3.bb} (77%)

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.3.bb
similarity index 77%
rename from meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb
rename to meta-gnome/recipes-gnome/gnome-session/gnome-session_49.3.bb
index 119e2ff951..8ef1944ae3 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.3.bb
@@ -14,7 +14,10 @@ inherit gnomebase gettext gsettings upstream-version-is-even mime mime-xdg manpa
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI[archive.sha256sum] = "fcdb4f45d6a60d84e9ecae1e3740bab6e55bab0cb49e0fb38280e9b38f3a8485"
+SRC_URI[archive.sha256sum] = "b424a90cfe51de4941b791a5102aeaadb2c62c185522a21f71cb485270053fe1"
+
+UPSTREAM_CHECK_URI = "https://gitlab.gnome.org/GNOME/gnome-session/-/tags"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 

