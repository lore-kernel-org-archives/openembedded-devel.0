Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id EDE8471AD7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 22:11:09 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p190so14027065wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Xt21pxXyJMwRsiHB8fja21cqKEEWgo3irvoBLRvCGuQ=;
	b=nF4xDnVZ8U4o+P3tmFOiUIbEQe3doGybEmkXd2+pxUsla50TYGdj/xbIJZvVGe58H2
	M9kPYugMx4Mj0oLVbt7qJONy7zZaaoTw5Ray9YLAj8OBtn+GIJ+bjSPL3MyGpawdfckj
	O7NoWL08VeTYVxuNgzpoB/l2tObSJq7GFJgwrt30mSnG14UpVmNw5Snz32VD0AUCLrQB
	+8wKoVfBAlUnleWF+EwTxwdFELebbbxFnASpycqDBkFs4NUb59knisGivtx+PD4mV43r
	851kXNj/YQimoUtknIw34WHDbGME8d+R3la1ofrxpTNR7UXL7a9AZSR9Hynq54kBieFS
	JNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Xt21pxXyJMwRsiHB8fja21cqKEEWgo3irvoBLRvCGuQ=;
	b=ernvyXAe/0U0K8GkgXKM0ne8cc4NMVF7BCgPzxirq5WVcRrIDtXOyFRhX/jHicptCI
	0VdKuG7YmP0Vi8ZXdm5juZbDjMl9u3//NCODb3KDbPRS5UV/EaQ+ZpmJVl3SHODO5WYM
	HScgV8jnrhTiJDXNmgAR/vYqbS4gcA6GNwExHGpoGS4r/4+aDL9rwxEYNZyFEEju7/fE
	nKaOY9CwIAi3hRTkmK1VG9jcIGqjucCcCUWVUevYHPptnYZ13eliNc/XB44uRIIR6zvI
	ZnSMPhL/2QrHXckEPdBoPy8K8qR7Ol08dD90nN9BtTW2qlGCHLyArWUWS6BRcoyRkfvp
	Xi8w==
X-Gm-Message-State: ABUngvdCVCUsAFc1OgYel8mHfvcEPZ+6vyyM8GWhiKbgsh8tDKxdbMPnAKDadghEQMiZfA==
X-Received: by 10.194.248.162 with SMTP id yn2mr23844497wjc.203.1477951870963; 
	Mon, 31 Oct 2016 15:11:10 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3FE5.dip0.t-ipconnect.de.
	[91.10.63.229]) by smtp.googlemail.com with ESMTPSA id
	129sm26918697wmq.9.2016.10.31.15.11.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 15:11:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2016 23:10:43 +0100
Message-Id: <1477951849-32149-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 07/13] ristretto: update to 0.8.1
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
X-List-Received-Date: Mon, 31 Oct 2016 22:11:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-apps/ristretto/{ristretto_0.8.0.bb => ristretto_0.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.8.0.bb => ristretto_0.8.1.bb} (73%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.0.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb
similarity index 73%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.8.0.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb
index 66399cf..7abf186 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.0.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb
@@ -9,7 +9,7 @@ inherit xfce-app
 
 RRECOMMENDS_${PN} += "tumbler"
 
-SRC_URI[md5sum] = "94c778850325a4e5a12e3433c8a05432"
-SRC_URI[sha256sum] = "71625324cecda7199acbc95a3ea5132d0dcbf808771e7a209ea2b9503ae4f328"
+SRC_URI[md5sum] = "5332876b627b3237eebb76db66e2fb11"
+SRC_URI[sha256sum] = "0b4c90c585166c958d479075b98da6e28ca500bda6f4d3443f20e0a2172030ee"
 
 FILES_${PN} += "${datadir}/appdata"
-- 
2.5.5


