Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9BBF67F8DB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:23 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q10so5800114wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h/bhYsOhCYzKTeuiNnlWb8BKZg88Jk+kxMHlAlLNmNk=;
	b=FoVp4ySH62T68S6uB9MoxAWgY5Bvcpvn+Ji1rt8smeGs9nj724g2nke6TMbyRj6RE0
	uZBO+N0e+mkvZeSWIXZgQVPivs4n8qwv9fLWAJ1IRWTJokFxoLXJo2dOAasOOzWPz972
	yLXWig8hYHAsdJaguJo05vOk/RVM5G80FYOoV3Uzd+CX/URpkAjWQrY6gVp4150w5U3f
	aeUpWMga2ZSQzrSxwuvxYS3q9TGqtJudj/kpJ4zMHW0zDoy833NcKuFjTqMvnUfRBSk+
	fXT9KMYeJSWHkEZn7Egtj3GfM4YP0zkrmyXb3ZmU5CMXMcIURu9nE5oba+2tVk7UMP2d
	9EAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h/bhYsOhCYzKTeuiNnlWb8BKZg88Jk+kxMHlAlLNmNk=;
	b=iT3L/f9d3eu0Bly23Fnq73h/KTCG27yB+mKao7n+k7loArC0OoXvG9HJUmxAmHtAad
	AobBJS2IstYBWxcjmnYM/++T/c4o3nsC09PGPDcWHpBRdBPuz1z/tHX5PEC0F60MLM7v
	IZ/ohKTqxFDQWVJRHWss2SJ9FKxlWf+Sux3fqSkxN9wv1/QOJIiT28474xX841yhzSeY
	vR4JXw0YrQtqCU/ozjYTouzX7wgeFkmodMW4Zqwq65gFs+GJsE8lz4Od7ldnklic+BMF
	Ob0YvKLs7znYhOQXp990Y6eo4+U3SHq4BZ+uvALuezc/76vuRrmDVBYIqoWHfLPtV9be
	nflA==
X-Gm-Message-State: APjAAAX2DKHlCteOg1NiLXdbBFPzhvcuGtTH4BUIrmKY9eZ/xKn2dD2s
	AjR9BE+B09Buzk/9X5Mz0FCA236H
X-Google-Smtp-Source: APXvYqxoKSBLvxtfufHU+EXhncSp7Nr7Uh6DYGKmqGywtr/zYBO8pclXbrHGRFN/dujiLl85Cdm6zA==
X-Received: by 2002:adf:81e3:: with SMTP id 90mr12432357wra.23.1575590963817; 
	Thu, 05 Dec 2019 16:09:23 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:08:51 +0100
Message-Id: <20191206000912.19841-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 00/21] Gnome cleanups & desktop patches
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Once passed Khem's autobuilder there are the following desktop session
available (yes tested - they work for me)

* gnome-x11
* gnome-wayland
* gnome-classic (gnome2 experience: gnome-shell based)
* gnome-flashback (gnome2 experience: gnome-flashback/metacity based / no
  graphics acceleration required)

currently there the following known issues:

* GDM does not display background image - have no idea if this is a bug
* Acivities does not display application icons for png

Ahh and all this was tested with gdm and alternate / non gnome display-manager
sddm because gdm does not match my needs as desktop environment collector.

Andreas Müller (21):
  pinpoint: remove dead project
  gnome-keyring: upgrade 3.28.2 -> 3.34.0
  libgsf: upgrade 1.14.45 -> 1.14.46
  libgnome-keyring: remove
  gjs: initial add 1.58.1
  gdm: re-add 3.34.1
  gnome-shell: initial add 3.34.1
  gnome-shell-extensions: initial add 3.34.1
  accountsservice: initial add 0.6.55
  rest: initial add 0.8.1
  gnome-online-accounts: initial add 3.34.1
  gvfs: upgrade 1.41.2 -> 1.42.1
  grilo: initial add 0.3.10
  gsound: initial add 1.0.2
  gnome-control-center: re-add 3.34.1
  gnome-session: inital add 3.34.1
  gnome-backgrounds: initial add 3.34.0
  metacity: upgrade 3.32.0 -> 3.34.1
  gnome-panel: (re)add 3.34.1
  gnome-flashback: initial add 3.34.1
  Add: packagegroup-gnome-apps / packagegroup-gnome-desktop

 .../recipes-apps/pinpoint/pinpoint_git.bb     | 24 -------
 .../0001-Ensure-pam-file-installation.patch   | 48 ++++++++++++++
 meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb    | 56 ++++++++++++++++
 .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 ++++++++++
 meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb    | 37 +++++++++++
 .../gnome-backgrounds_3.34.0.bb               | 17 +++++
 ...001-Add-meson-option-to-pass-sysroot.patch | 45 +++++++++++++
 .../gnome-control-center_3.34.1.bb            | 55 ++++++++++++++++
 .../gnome-flashback/gnome-flashback_3.34.1.bb | 34 ++++++++++
 ...-agent-and-ssh-add-by-configure-opti.patch | 42 ++++++++++++
 .../gnome-keyring/gnome-keyring_3.28.2.bb     | 44 -------------
 .../gnome-keyring/gnome-keyring_3.34.0.bb     | 51 +++++++++++++++
 .../gnome-keyring/libgnome-keyring_3.12.0.bb  | 29 ---------
 .../gnome-online-accounts_3.34.1.bb           | 32 ++++++++++
 ...nd-ZONEINFO-it-tries-to-run-compiled.patch | 37 +++++++++++
 .../gnome-panel/gnome-panel_3.34.1.bb         | 28 ++++++++
 .../gnome-session/gnome-session_3.34.1.bb     | 39 +++++++++++
 .../gnome-shell-extensions_3.34.1.bb          | 27 ++++++++
 .../gnome-shell/gnome-shell_3.34.1.bb         | 64 +++++++++++++++++++
 .../recipes-gnome/grilo/grilo_0.3.10.bb       | 29 +++++++++
 .../recipes-gnome/gsound/gsound_1.0.2.bb      | 13 ++++
 .../gvfs/{gvfs_1.41.2.bb => gvfs_1.42.1.bb}   | 11 ++--
 ...p-a-copy-paste-of-introspection.m4-m.patch |  0
 .../{libgsf_1.14.45.bb => libgsf_1.14.46.bb}  | 12 ++--
 .../recipes-gnome/metacity/metacity_3.32.0.bb | 41 ------------
 .../recipes-gnome/metacity/metacity_3.34.1.bb | 38 +++++++++++
 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb   | 28 ++++++++
 .../accountsservice/accountsservice_0.6.55.bb | 29 +++++++++
 .../packagegroups/packagegroup-gnome-apps.bb  | 20 ++++++
 .../packagegroup-gnome-desktop.bb             | 26 ++++++++
 30 files changed, 838 insertions(+), 151 deletions(-)
 delete mode 100644 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
 create mode 100644 meta-gnome/recipes-gnome/gdm/gdm/0001-Ensure-pam-file-installation.patch
 create mode 100644 meta-gnome/recipes-gnome/gdm/gdm_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_3.34.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-sysroot.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.28.2.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb
 create mode 100644 meta-gnome/recipes-gnome/gsound/gsound_1.0.2.bb
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.41.2.bb => gvfs_1.42.1.bb} (87%)
 rename meta-gnome/recipes-gnome/libgsf/{files => libgsf}/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch (100%)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.45.bb => libgsf_1.14.46.bb} (59%)
 delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity_3.34.1.bb
 create mode 100644 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
 create mode 100644 meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
 create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
 create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb

-- 
2.21.0


