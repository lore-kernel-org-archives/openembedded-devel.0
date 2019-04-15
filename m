Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id E9BDD7D71C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 19:31:05 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id y7so23413435wrn.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 12:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hj2pzuT0dMB5Gi4e6z/NNLvxRt7bZllk/lK9rXUbp1c=;
	b=k0SnTd+DXPRGKpFue4yQx4vJvKajajNa2dyFVL2TtoQSKspr/Z/Si22Nf7NxgauCNv
	CcJ5V3VVikRq58LEnHvb4/VMv3GDzOaG65CEX6nlBMoQJ3vFuYsWqE706rNdyVCPmtSy
	vgqQ5DCrC9fq/BWlF8ie+prs28RRXbx0H3Bv9VQuJdhwSfJxlzyncYAcjhFSxPTVWHFj
	NU0XR1ao5ti6pa3jilPGzfVLYahK0g/oWyhiKdP1i9zrdzmdU/iH1wBqYlh1l8BPrLTA
	lrMwnlnG2gMQkKAFmSJenEwD2j1tNNQXA5dxOfAup+swe4M/kR18oU3g6j8xXb3xwjLa
	noyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hj2pzuT0dMB5Gi4e6z/NNLvxRt7bZllk/lK9rXUbp1c=;
	b=JbalKMMFZn2c0chdbn/4dFOhU4izuEpLD1gU57u+VVDQGgaZRwNf+4ETmKmbn7aLpg
	TqIsUuOWPR642rGGcoc3qlchBt/Bnfmc2RkMujSxwlTteCLQPtzT/25yHXK5aeP6R6SI
	NCe6hn40t341j1ANOlaUXsawabobO3mk8EhHbp5TWM1Ck8NCYbOIDppSOVYEmoe6vxiM
	wqTt2Was/mAm0r6HdxtgQ9Im9nDTeoPr5f3UabaFEDNhcHl6jpy+bBKLCQ56xvVaJP4g
	42MM6F1e0A5oFuRRQdWwZNiqBUEDMMLXNeCJB+lzq9e3SwIrBQqs7vcPHLqAeew7n28+
	ayEw==
X-Gm-Message-State: APjAAAUNQhqbPeKhaTQlby6BIPZ61fUrFqe/29h2T1pC/9xyYpKyEZP+
	98EJBkn/RiHpFVF+Wk1RlmQA4w0O
X-Google-Smtp-Source: APXvYqwSWDgG29iPfGeghuT/GZ8bY0uWIXFNOU0Y6Jb+NaerMjs735xGeG6Xc5f+TjE51K532kVe6g==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr41155539wrp.72.1555356666323; 
	Mon, 15 Apr 2019 12:31:06 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F3387417A2C29093A387C31.dip0.t-ipconnect.de.
	[2003:f0:7f33:8741:7a2c:2909:3a38:7c31])
	by smtp.gmail.com with ESMTPSA id
	d3sm39125720wmf.46.2019.04.15.12.31.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Apr 2019 12:31:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Apr 2019 21:30:57 +0200
Message-Id: <20190415193057.12546-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gvfs: remove systemd user unit executable permission adjustment
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
X-List-Received-Date: Mon, 15 Apr 2019 19:31:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Executable permissions were set accidently by a typo in recipe and has nothing
to do with meson build. Typo in recipe was fixed so adjustment can go.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
index 35367ae11..7caee2771 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
@@ -73,12 +73,4 @@ do_install_append() {
     for exe in `find ${D}/${libexecdir}`; do
        chmod +x $exe
     done
-
-    # Something sets user services executable - looks a bit as if meson
-    # transition has room for enhancements...
-    # Systemd warns with messages as:
-    # Apr 07 01:00:33 raspberrypi3 systemd[348]: Configuration file /usr/lib/systemd/user/gvfs-mtp-volume-monitor.service is marked executable. Please remove executable permissio>
-    for service in `find ${D}/${systemd_user_unitdir}`; do
-       chmod -x $service
-    done
 }
-- 
2.20.1


