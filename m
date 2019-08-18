Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 90FF27F29A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 22:33:42 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id k2so6713237wrq.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZsgHRTGDvTTik2dRAfnyXwI6tz/bm/0L2Ci/9IJXri0=;
	b=F2zdWfCZ5dEaLs6SwEsYqJeGfdKJ4n1CCcsML2r/QlGoEFBS3tixg95GrJqxFL37dm
	aG6YmKgsJI1kYn5pdRyiOC9HugwhboUKso0cH8vWbRyAss5A1m/OG5pvvXy+HASK010B
	kSk0TL2WAGAJLgsfJsVkNGuNL/xVskJSzUWfVdkgk4PTxyC8daoJEoC+sYqriZJTptqa
	cRNWbJNSPTHH6VM6HcMfp09q0k2MKiYhHETMpdp0P0IjoQZ+WEvZhEMc7aY9j7JOk+Jz
	SLHZPYbYMdAnHi2EExhDR9x3y3ije9ZSApxnwwhuuEOM9kAmvMpkIp3kgi7G0p5akGau
	p1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZsgHRTGDvTTik2dRAfnyXwI6tz/bm/0L2Ci/9IJXri0=;
	b=Zr7ZYS8J15h2hYw1/DSh77yeEj9BGELBB6xFEdOAUGwVkj68QZ7eG52JoM1m5uUfjM
	swe2HcKebdQ3IFWshDKqF/+1j6kqOGGkXW3y7jY1c1Os540GYbYwWwxQo117KuNdM2gz
	OAV6PTa6iO2KW8xqsmMeFH9OAqvNGGp2xyz/2V95/KXmFQwdLGJJTZPeYzFtb3MPOy13
	bZYFOd7yV2yFzdEXLeOcACElN+vUauY9XfdBrtTZMEMW8KwKq7UcXeI5msWYUsrLoiq/
	AaSRgX4qoMnuLlZFkwXgadC6Ye9GbY0desn2K8b7+E8ETY/af0fgnijEiSI8K82QoWTU
	koIA==
X-Gm-Message-State: APjAAAVVkLEksAnU1kA9xOXxjGnOqDRp6OtgFjve6IkYjvEintOzoVzI
	7+nfIv2IGQtSFo0HafP1zoqbCcKQ
X-Google-Smtp-Source: APXvYqyGOR37LwHqpP2Vw7lI0DXZj7BL6xcPUqQIwtlgvRnfCUG97XUsfcjivsYJZ3n/7GV559snpQ==
X-Received: by 2002:a5d:6744:: with SMTP id l4mr15824387wrw.186.1566167622982; 
	Sun, 18 Aug 2019 15:33:42 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2D8718C84C5511B02F056F.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8718:c84c:5511:b02f:56f])
	by smtp.gmail.com with ESMTPSA id
	k124sm30390814wmk.47.2019.08.18.15.33.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 18 Aug 2019 15:33:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Mon, 19 Aug 2019 00:33:13 +0200
Message-Id: <20190818223316.19772-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190818223316.19772-1-schnitzeltony@gmail.com>
References: <20190818223316.19772-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 07/10] xfce4-mpc-plugin: upgrade 0.5.1 -> 0.5.2
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
X-List-Received-Date: Sun, 18 Aug 2019 22:33:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From release notes:
* fix crash when parsing MPD 0.21 outputs response in some cases (bug #15415)
* new translations: hy_AM, ie, fi
* many updated translations

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{xfce4-mpc-plugin_0.5.1.bb => xfce4-mpc-plugin_0.5.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-multimedia/xfce4-mpc-plugin/{xfce4-mpc-plugin_0.5.1.bb => xfce4-mpc-plugin_0.5.2.bb} (64%)

diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.1.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb
similarity index 64%
rename from meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.1.bb
rename to meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb
index 85235490c..ff954acb8 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.1.bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Simple client plugin for Music Player Daemon"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-mpc-plugin"
+HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-mpc-plugin"
 SECTION = "x11/application"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3604d987e6dfdfc672c754d08953b0e0"
@@ -14,5 +14,5 @@ LICENSE_FLAGS = "commercial"
 # for now we recommend our own mpd-server
 RRECOMMENDS_${PN} = "mpd"
 
-SRC_URI[md5sum] = "305dfdacb2b2198e1f1673d61f86e4f5"
-SRC_URI[sha256sum] = "635e678c9729663e9eaadfcf58426f7cea37e6d3fda5e818955fbc8ade00de01"
+SRC_URI[md5sum] = "26a1e8658df2b51967dc2250e23f467d"
+SRC_URI[sha256sum] = "eefe78b7b6b95312b3a52814b7f632dc92970c1b3e9535de616315749bf67760"
-- 
2.21.0


