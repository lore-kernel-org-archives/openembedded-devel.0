Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 69E5A786EE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:34:56 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id g38so14779437wrd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ia8vctAHUkbN7TsbkMCydHBHU4655CshZneoTRbzZ90=;
	b=F4Df3X/cyVhg6/wG3RrZybKFR21vx/bPfJ6voc1dDWc6VSPB/HdbfZLwY6vJKiFgaG
	vtSPRqx+1oTdAiCZtgyVGL1uGpgkUky9yY1vqO8RP+3DqNocaeBJCdpus/8qzNz/Audo
	xgSvDeTp3oL/M2TjjTef+lAYN23rJMNvgUeWKfbmKIuxZt1ZcU+ZQz1YsYhiLyM24fzC
	GE8saC9wxsMxmkhNcp3OQhsgYHpJCxEV+AmMLx5xPyGYezbp5hgiptBYOLABFJFWqFqJ
	jEpCQRfgP0nberFtPmdBoA1audWOdRP9F8h9EG7wmFrk4M+aEjUOeFF7+fGJ4QESQNad
	NJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ia8vctAHUkbN7TsbkMCydHBHU4655CshZneoTRbzZ90=;
	b=i+G+1lsrRX9NGnoPXIJ9fVDglTtKCrxxolAkmWC/AO7mmhUdcf1rkx7Ew0+JBJqjKQ
	qG3dE8TWCBfBVGMEvHen/do20/sLC8lvRFtohjILVQgUMeOCipkBya96tkq+dL3vWbbl
	3Fk5npPIID2mHwCV6s4MueH5+e6r7lGedVGL5IgSZ+DSMGI94G6nSkpzKVZYD9GL0wGp
	+AhzD8Dka6nE9g17FT6G1jv8HGQGGzGqseeZfcu3VF4HI1V1MbN43odummIarabzyT3J
	0mhyMzThu08jy7XZpslEHPLr8F1ANi9hg1h1DxrgyZRVGcX0imZuXN89GcjkI/td4gYL
	acWg==
X-Gm-Message-State: AKwxyteuVtOuKq0sD9Bc6th81rvGMxaEPJDa1t5P/1JpxIlivC2y4soU
	P3ic+WclDRhHYwLiJvM13i9h/A==
X-Google-Smtp-Source: ACJfBoujeRfJv5rEQtHnEoUUXRDqc+ei6Jfl5YG6fBcYGEwgRQqIXQ4myGES5g1L0ULSy8gHVkHG1g==
X-Received: by 10.223.165.30 with SMTP id i30mr1976127wrb.84.1516178096543;
	Wed, 17 Jan 2018 00:34:56 -0800 (PST)
Received: from localhost.localdomain
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	c54sm4230832wrg.68.2018.01.17.00.34.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 00:34:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:34:13 +0100
Message-Id: <20180117083421.30233-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180117083421.30233-1-schnitzeltony@gmail.com>
References: <20180117083421.30233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/14] remove gdm leftovers
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
X-List-Received-Date: Wed, 17 Jan 2018 08:34:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml   | 492 ---------------------
 meta-gnome/recipes-gnome/gdm/gdm/Default           |  96 ----
 .../recipes-gnome/gdm/gdm/cross-xdetection.diff    |  96 ----
 meta-gnome/recipes-gnome/gdm/gdm/gdm               |  89 ----
 meta-gnome/recipes-gnome/gdm/gdm/gdm-pam           |  11 -
 meta-gnome/recipes-gnome/gdm/gdm/gdm.conf          |  80 ----
 meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in    |  10 -
 7 files changed, 874 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml
 delete mode 100755 meta-gnome/recipes-gnome/gdm/gdm/Default
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/cross-xdetection.diff
 delete mode 100755 meta-gnome/recipes-gnome/gdm/gdm/gdm
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/gdm-pam
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/gdm.conf
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in

diff --git a/meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml b/meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml
deleted file mode 100644
index f8c2e9cc2..000000000
--- a/meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml
+++ /dev/null
@@ -1,492 +0,0 @@
-<?xml version="1.0"?>
-<gconf>
-        <dir name="desktop">
-                <dir name="gnome">
-                        <dir name="url-handlers">
-                                <dir name="ymsgr">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="xmpp">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="webcal">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="uvox">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="trash">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="sip">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="rtsp">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="rtp">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="pnm">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="note">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="net">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="msnim">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="mmsh">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="mms">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="man">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="mailto">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="lastfm">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="itpc">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="itms">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="irc">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="info">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="icyx">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="icy">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="icq">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="https">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="http">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="h323">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="ghelp">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="gg">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="ftp">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="file">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="feed">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="cdda">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="callto">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="aim">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                                <dir name="about">
-                                        <entry name="command" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                        </dir>
-                        <dir name="lockdown">
-                                <entry name="disable_url_handlers" mtime="1227173197" type="bool" value="true">
-                                </entry>
-                                <entry name="disable_save_to_disk" mtime="1227173197" type="bool" value="true">
-                                </entry>
-                                <entry name="disable_print_setup" mtime="1227173197" type="bool" value="true">
-                                </entry>
-                                <entry name="disable_printing" mtime="1227173197" type="bool" value="true">
-                                </entry>
-                                <entry name="disable_lock_screen" mtime="1227173197" type="bool" value="true">
-                                </entry>
-                                <entry name="disable_command_line" mtime="1227173197" type="bool" value="true">
-                                </entry>
-                        </dir>
-                        <dir name="applications">
-                                <dir name="terminal">
-                                        <entry name="exec" mtime="1227173197" type="string">
-                                                <stringvalue>/bin/true</stringvalue>
-                                        </entry>
-                                </dir>
-                        </dir>
-                        <dir name="accessibility">
-                                <dir name="keyboard">
-                                        <entry name="enable" mtime="1227173197" type="bool" value="true">
-                                        </entry>
-                                </dir>
-                        </dir>
-                </dir>
-        </dir>
-        <dir name="apps">
-                <dir name="gnome_settings_daemon">
-                        <dir name="keybindings">
-                                <entry name="www" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="stop" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="sleep" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="search" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="screensaver" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="previous" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="power" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="play" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="pause" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="next" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="media" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="home" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="help" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="email" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="calculator" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                                <entry name="eject" mtime="1227173197" type="string">
-                                        <stringvalue></stringvalue>
-                                </entry>
-                        </dir>
-                </dir>
-                <dir name="metacity">
-                        <dir name="keybinding_commands">
-                                <entry name="command_window_screenshot" mtime="1227173197" type="string">
-                                        <stringvalue>/bin/true</stringvalue>
-                                </entry>
-                                <entry name="command_screenshot" mtime="1227173197" type="string">
-                                        <stringvalue>gdm-screenshot</stringvalue>
-                                </entry>
-                        </dir>
-                        <dir name="global_keybindings">
-                                <entry name="switch_to_workspace_up" mtime="1227173197" type="string">
-                                        <stringvalue>disabled</stringvalue>
-                                </entry>
-                                <entry name="switch_to_workspace_right" mtime="1227173197" type="string">
-                                        <stringvalue>disabled</stringvalue>
-                                </entry>
-                                <entry name="switch_to_workspace_left" mtime="1227173197" type="string">
-                                        <stringvalue>disabled</stringvalue>
-                                </entry>
-                                <entry name="switch_to_workspace_down" mtime="1227173197" type="string">
-                                        <stringvalue>disabled</stringvalue>
-                                </entry>
-                                <entry name="switch_group" mtime="1227173197" type="string">
-                                        <stringvalue>disabled</stringvalue>
-                                </entry>
-                                <entry name="show_desktop" mtime="1227173197" type="string">
-                                        <stringvalue>disabled</stringvalue>
-                                </entry>
-                                <entry name="run_command_window_screenshot" mtime="1227173197" type="string">
-                                        <stringvalue>disabled</stringvalue>
-                                </entry>
-                                <entry name="run_command_screenshot" mtime="1227173197" type="string">
-                                        <stringvalue>Print</stringvalue>
-                                </entry>
-                                <entry name="panel_run_dialog" mtime="1227173197" type="string">
-                                        <stringvalue>disabled</stringvalue>
-                                </entry>
-                                <entry name="panel_main_menu" mtime="1227173197" type="string">
-                                        <stringvalue>disabled</stringvalue>
-                                </entry>
-                        </dir>
-                        <dir name="general">
-                                <entry name="num_workspaces" mtime="1227173197" type="int" value="1">
-                                </entry>
-                        </dir>
-                </dir>
-                <dir name="compiz">
-                        <dir name="general">
-                                <dir name="allscreens">
-                                        <dir name="options">
-                                                <entry name="run_command11_key" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command11_button" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command10_key" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command10_button" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command8_key" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command8_button" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command7_key" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command7_button" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command6_key" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command6_button" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command5_key" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command5_button" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command4_key" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command4_button" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command3_key" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command3_button" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command2_key" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command2_button" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command1_key" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command1_button" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command0_key" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_command0_button" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_key" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="run_button" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="main_menu_key" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="main_menu_button" mtime="1227173197" type="string">
-                                                        <stringvalue>Disabled</stringvalue>
-                                                </entry>
-                                                <entry name="command_window_screenshot" mtime="1227173197" type="string">
-                                                        <stringvalue></stringvalue>
-                                                </entry>
-                                                <entry name="command11" mtime="1227173197" type="string">
-                                                        <stringvalue></stringvalue>
-                                                </entry>
-                                                <entry name="command10" mtime="1227173197" type="string">
-                                                        <stringvalue></stringvalue>
-                                                </entry>
-                                                <entry name="command9" mtime="1227173197" type="string">
-                                                        <stringvalue></stringvalue>
-                                                </entry>
-                                                <entry name="command8" mtime="1227173197" type="string">
-                                                        <stringvalue></stringvalue>
-                                                </entry>
-                                                <entry name="command7" mtime="1227173197" type="string">
-                                                        <stringvalue></stringvalue>
-                                                </entry>
-                                                <entry name="command6" mtime="1227173197" type="string">
-                                                        <stringvalue></stringvalue>
-                                                </entry>
-                                                <entry name="command5" mtime="1227173197" type="string">
-                                                        <stringvalue></stringvalue>
-                                                </entry>
-                                                <entry name="command4" mtime="1227173197" type="string">
-                                                        <stringvalue></stringvalue>
-                                                </entry>
-                                                <entry name="command3" mtime="1227173197" type="string">
-                                                        <stringvalue></stringvalue>
-                                                </entry>
-                                                <entry name="command2" mtime="1227173197" type="string">
-                                                        <stringvalue></stringvalue>
-                                                </entry>
-                                                <entry name="command1" mtime="1227173197" type="string">
-                                                        <stringvalue></stringvalue>
-                                                </entry>
-                                                <entry name="command0" mtime="1227173197" type="string">
-                                                        <stringvalue></stringvalue>
-                                                </entry>
-                                                <entry name="command_terminal" mtime="1227173197" type="string">
-                                                        <stringvalue></stringvalue>
-                                                </entry>
-                                                <entry name="command_screenshot" mtime="1227173197" type="string">
-                                                        <stringvalue>gdm-screenshot</stringvalue>
-                                                </entry>
-                                                <entry name="active_plugins" mtime="1227173197" type="list" ltype="string">
-                                                        <li type="string">
-                                                                <stringvalue>cube</stringvalue>
-                                                        </li>
-                                                        <li type="string">
-                                                                <stringvalue>decoration</stringvalue>
-                                                        </li>
-                                                        <li type="string">
-                                                                <stringvalue>gconf</stringvalue>
-                                                        </li>
-                                                        <li type="string">
-                                                                <stringvalue>glib</stringvalue>
-                                                        </li>
-                                                        <li type="string">
-                                                                <stringvalue>move</stringvalue>
-                                                        </li>
-                                                        <li type="string">
-                                                                <stringvalue>place</stringvalue>
-                                                        </li>
-                                                        <li type="string">
-                                                                <stringvalue>resize</stringvalue>
-                                                        </li>
-                                                        <li type="string">
-                                                                <stringvalue>screenshot</stringvalue>
-                                                        </li>
-                                                        <li type="string">
-                                                                <stringvalue>wobbly</stringvalue>
-                                                        </li>
-                                                </entry>
-                                        </dir>
-                                </dir>
-                        </dir>
-                </dir>
-                <dir name="gnome-power-manager">
-                        <dir name="ui">
-                                <entry name="show_context_menu" mtime="1227173197" type="bool" value="false">
-                                </entry>
-                        </dir>
-                </dir>
-                <dir name="gnome-screensaver">
-                        <entry name="power_management_delay" mtime="1227173197" type="int" value="30">
-                        </entry>
-                </dir>
-                <dir name="nautilus">
-                        <dir name="preferences">
-                                <entry name="show_desktop" mtime="1227173197" type="bool" value="false">
-                                </entry>
-                        </dir>
-                </dir>
-        </dir>
-</gconf>
diff --git a/meta-gnome/recipes-gnome/gdm/gdm/Default b/meta-gnome/recipes-gnome/gdm/gdm/Default
deleted file mode 100755
index a7a7fcf7f..000000000
--- a/meta-gnome/recipes-gnome/gdm/gdm/Default
+++ /dev/null
@@ -1,96 +0,0 @@
-#!/bin/sh
-# Stolen from the debian kdm setup, aren't I sneaky
-# Plus a lot of fun stuff added
-#  -George
-
-PATH="/usr/bin:$PATH"
-OLD_IFS=$IFS
-
-gdmwhich () {
-  COMMAND="$1"
-  OUTPUT=
-  IFS=:
-  for dir in $PATH
-  do
-    if test -x "$dir/$COMMAND" ; then
-      if test "x$OUTPUT" = "x" ; then
-        OUTPUT="$dir/$COMMAND"
-      fi
-    fi
-  done
-  IFS=$OLD_IFS
-  echo "$OUTPUT"
-}
-
-sysresources=/etc/X11/Xresources
-
-# merge in defaults
-if [ -f "$sysresources" ]; then
-    xrdb -merge "$sysresources"
-fi
-
-sysmodmap=/etc/X11/Xmodmap
-
-XMODMAP=`gdmwhich xmodmap`
-if [ "x$XMODMAP" != "x" ] ; then
-  if [ "x$GDM_PARENT_DISPLAY" = "x" ]; then
-    if [ -f $sysmodmap ]; then
-      $XMODMAP $sysmodmap
-    fi
-  else
-    ( DISPLAY=$GDM_PARENT_DISPLAY XAUTHORITY=$GDM_PARENT_XAUTHORITY $XMODMAP -pke ) | $XMODMAP -
-  fi
-
-  #
-  # Switch Sun's Alt and Meta mod mappings
-  #
-
-  UNAME=`gdmwhich uname`
-  PROCESSOR=`$UNAME -p`
-  if [ "x$PROCESSOR" = "xsparc" ]; then
-    if $XMODMAP | /usr/bin/grep mod4 | /usr/bin/grep Alt > /dev/null 2>/dev/null
-    then
-      $XMODMAP -e "clear Mod1" \
-               -e "clear Mod4" \
-               -e "add Mod1 = Alt_L" \
-               -e "add Mod1 = Alt_R" \
-               -e "add Mod4 = Meta_L" \
-               -e "add Mod4 = Meta_R"
-    fi
-  fi
-fi
-
-SETXKBMAP=`gdmwhich setxkbmap`
-if [ "x$SETXKBMAP" != "x" ] ; then
-  # FIXME: is this all right?  Is this completely on crack?
-  # What this does is move the xkb configuration from the GDM_PARENT_DISPLAY
-  # FIXME: This should be done in code.  Or there must be an easier way ...
-  if [ -n "$GDM_PARENT_DISPLAY" ]; then
-    XKBSETUP=`( DISPLAY=$GDM_PARENT_DISPLAY XAUTHORITY=$GDM_PARENT_XAUTHORITY $SETXKBMAP -v )`
-    if [ -n "$XKBSETUP" ]; then
-      XKBKEYMAP=`echo "$XKBSETUP" | grep '^keymap' | awk '{ print $2 }'`
-      XKBTYPES=`echo "$XKBSETUP" | grep '^types' | awk '{ print $2 }'`
-      XKBCOMPAT=`echo "$XKBSETUP" | grep '^compat' | awk '{ print $2 }'`
-      XKBSYMBOLS=`echo "$XKBSETUP" | grep '^symbols' | awk '{ print $2 }'`
-      XKBGEOMETRY=`echo "$XKBSETUP" | grep '^geometry' | awk '{ print $2 }'`
-      if [ -n "$XKBKEYMAP" ]; then
-        $SETXKBMAP -keymap "$XKBKEYMAP"
-      elif [ -n "$XKBTYPES" -a -n "$XKBCOMPAT" -a -n "$XKBSYMBOLS" -a -n "$XKBGEOMETRY" ]; then
-        $SETXKBMAP -types "$XKBTYPES" -compat "$XKBCOMPAT" -symbols "$XKBSYMBOLS" -geometry "$XKBGEOMETRY"
-      elif [ -n "$XKBTYPES" -a -n "$XKBCOMPAT" -a -n "$XKBSYMBOLS" ]; then
-        $SETXKBMAP -types "$XKBTYPES" -compat "$XKBCOMPAT" -symbols "$XKBSYMBOLS"
-      elif [ -n "$XKBSYMBOLS" ]; then
-        $SETXKBMAP -symbols "$XKBSYMBOLS"
-      fi
-    fi
-  fi
-fi
-
-# FIXME: the housekeeping below really should be moved to the postinst of packages that require it
-# brute force approach for now
-update-desktop-database
-glib-compile-schemas /usr/share/glib-2.0/schemas/
-
-#x11vnc  -q -bg -display :0 -forever -avahi -xkb
-
-exit 0
diff --git a/meta-gnome/recipes-gnome/gdm/gdm/cross-xdetection.diff b/meta-gnome/recipes-gnome/gdm/gdm/cross-xdetection.diff
deleted file mode 100644
index bee35116e..000000000
--- a/meta-gnome/recipes-gnome/gdm/gdm/cross-xdetection.diff
+++ /dev/null
@@ -1,96 +0,0 @@
-From 60084e7e973634971c9643f2459e5d3e248ee3f1 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Thu, 9 Jun 2011 18:12:45 +0200
-Subject: [PATCH] build-sys: hardcode x paths to fix crosscompiling
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- configure.ac |   72 ++++-----------------------------------------------------
- 1 files changed, 5 insertions(+), 67 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index eeaf3dc..841efe0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1101,73 +1101,11 @@ dnl ---------------------------------------------------------------------------
- dnl - Check for X Server location
- dnl ---------------------------------------------------------------------------
- 
--# First check with "! -h" for /usr/X11R6 and /usr/X11 since they often
--# symlink to each other, and configure should use the more stable
--# location (the real directory) if possible.
--#
--# On Solaris, the /usr/bin/Xserver script is used to decide whether to
--# use Xsun or Xorg, so this is used on Solaris.
--#
--# When testing for /usr/X11R6, first check with "! -h" for /usr/X11R6
--# and /usr/X11 since they often symlink to each other, and configure
--# should use the more stable location (the real directory) if possible.
--#
--if test -x /usr/X11/bin/Xserver; then
--   X_PATH="/usr/X11/bin"
--   X_SERVER_PATH="/usr/X11/bin"
--   X_SERVER="/usr/X11/bin/Xserver"
--   X_CONFIG_OPTIONS="-audit 0"
--elif test ! -h /usr/X11R6 -a -x /usr/X11R6/bin/X; then
--   X_PATH="/usr/X11R6/bin"
--   X_SERVER_PATH="/usr/X11R6/bin"
--   X_SERVER="/usr/X11R6/bin/X"
--   X_CONFIG_OPTIONS="-audit 0"
--elif test ! -h /usr/X11 -a -x /usr/X11/bin/X; then
--   X_PATH="/usr/X11/bin"
--   X_SERVER_PATH="/usr/X11/bin"
--   X_SERVER="/usr/X11/bin/X"
--   X_CONFIG_OPTIONS="-audit 0"
--elif test -x /usr/X11R6/bin/X; then
--   X_PATH="/usr/X11R6/bin"
--   X_SERVER_PATH="/usr/X11R6/bin"
--   X_SERVER="/usr/X11R6/bin/X"
--   X_CONFIG_OPTIONS="-audit 0"
--elif test -x /usr/bin/Xorg; then
--   X_PATH="/usr/bin"
--   X_SERVER_PATH="/usr/bin"
--   X_SERVER="/usr/bin/Xorg"
--   X_CONFIG_OPTIONS="-audit 0"
--elif test -x /usr/X11/bin/X; then
--   X_PATH="/usr/X11/bin"
--   X_SERVER_PATH="/usr/X11/bin"
--   X_SERVER="/usr/X11/bin/X"
--   X_CONFIG_OPTIONS="-audit 0"
--elif test -x /usr/openwin/bin/Xsun; then
--   # Do not add /usr/openwin/bin here because on Solaris you need
--   # /usr/openwin/bin in your PATH even if you are using the Xorg
--   # Xserver.  We add this to the path below.
--   X_PATH="/usr/openwin/bin"
--   X_SERVER_PATH="/usr/openwin/bin"
--   X_SERVER="/usr/openwin/bin/Xsun"
--   X_CONFIG_OPTIONS="-audit 0 -nobanner"
--elif test -x /opt/X11R6/bin/X; then
--   X_PATH="/opt/X11R6/bin"
--   X_SERVER_PATH="/opt/X11R6/bin"
--   X_SERVER="/opt/X11R6/bin/X"
--   X_CONFIG_OPTIONS="-audit 0"
--elif test -x /usr/bin/X; then
--   X_PATH="/usr/bin"
--   X_SERVER_PATH="/usr/bin"
--   X_SERVER="/usr/bin/X"
--   X_CONFIG_OPTIONS="-audit 0"
--else
--   # what to do, what to do, this is wrong, but this just sets the
--   # defaults, perhaps this user is cross compiling or some such
--   X_PATH="/usr/bin/X11:/usr/X11R6/bin:/opt/X11R6/bin"
--   X_SERVER_PATH="/usr/bin"
--   X_SERVER="/usr/bin/X"
--   X_CONFIG_OPTIONS="-audit 0"
--fi
-+# We hardcode the X paths since we know where it will be in the OE univers
-+X_PATH="/usr/bin"
-+X_SERVER_PATH="/usr/bin"
-+X_SERVER="/usr/bin/X"
-+X_CONFIG_OPTIONS="-audit 0"
- 
- dnl ---------------------------------------------------------------------------
- dnl - Check for Xnest / Xephyr support
--- 
-1.6.6.1
-
diff --git a/meta-gnome/recipes-gnome/gdm/gdm/gdm b/meta-gnome/recipes-gnome/gdm/gdm/gdm
deleted file mode 100755
index bb5b41864..000000000
--- a/meta-gnome/recipes-gnome/gdm/gdm/gdm
+++ /dev/null
@@ -1,89 +0,0 @@
-#! /bin/sh
-### BEGIN INIT INFO
-# Provides:          gdm
-# Should-Start:      console-screen acpid dbus hal network-manager
-# Required-Start:    $local_fs $remote_fs
-# Required-Stop:     $local_fs $remote_fs
-# Default-Start:     5
-# Default-Stop:      0 1 2 3 6
-# Short-Description: GNOME Display Manager
-# Description:       Debian init script for the GNOME Display Manager
-### END INIT INFO
-#
-# Author:       Ryan Murray <rmurray@debian.org>
-#
-set -e
-
-PATH=/sbin:/bin:/usr/sbin:/usr/bin
-DAEMON=/usr/sbin/gdm
-
-test -x $DAEMON || exit 0
-
-if [ -r /etc/default/locale ]; then
-  . /etc/default/locale
-  export LANG LANGUAGE
-fi
-
-# To start gdm even if it is not the default display manager, change
-# HEED_DEFAULT_DISPLAY_MANAGER to "false."
-HEED_DEFAULT_DISPLAY_MANAGER=true
-DEFAULT_DISPLAY_MANAGER_FILE=/etc/X11/default-display-manager
-
-case "$1" in
-  start)
-	# make needed directories in volatile
-
-	if [ -e /var/log/gdm ] ; then 
-		rm -rf /var/log/gdm
-	fi
-
-	mkdir -m 01770 /var/log/gdm
-	chown gdm:gdm /var/log/gdm
-
-	if [ -e /tmp/.ICE-unix ] ; then 
-		rm -rf /tmp/.ICE-unix
-	fi
-
-	mkdir -m 01777 /tmp/.ICE-unix
-	chown root:root /tmp/.ICE-unix
-
-        CONFIGURED_DAEMON=$(basename "$(cat $DEFAULT_DISPLAY_MANAGER_FILE 2> /dev/null)")
-        if grep -wqs text /proc/cmdline; then
-            echo "Not starting GNOME Display Manager (gdm); found 'text' in kernel commandline."
-        elif [ -e "$DEFAULT_DISPLAY_MANAGER_FILE" ] && \
-           [ "$HEED_DEFAULT_DISPLAY_MANAGER" = "true" ] && \
-           [ "$CONFIGURED_DAEMON" != gdm ] ; then
-                echo "Not starting GNOME Display Manager; it is not the default display manager"
-        else
-                echo "Starting GNOME Display Manager" "gdm"
-                start-stop-daemon --start -b --exec $DAEMON 
-        fi
-  ;;
-  stop)
-        echo "Stopping GNOME Display Manager" "gdm"
-        set +e
-        start-stop-daemon --stop --quiet --pidfile /var/run/gdm.pid \
-                --name gdm --retry 5
-        set -e
-  ;;
-  reload)
-        echo "Scheduling reload of GNOME Display Manager configuration" "gdm"
-        set +e
-        start-stop-daemon --stop --signal USR1 --quiet --pidfile \
-                /var/run/gdm.pid --name gdm
-        set -e
-  ;;
-  status)
-        status_of_proc -p "$PIDFILE" "$DAEMON" gdm && exit 0 || exit $?
-  ;;
-  restart|force-reload)
-        $0 stop
-        $0 start
-  ;;
-  *)
-        echo "Usage: /etc/init.d/gdm {start|stop|restart|reload|force-reload|status}"
-        exit 1
-  ;;
-esac
-
-exit 0
diff --git a/meta-gnome/recipes-gnome/gdm/gdm/gdm-pam b/meta-gnome/recipes-gnome/gdm/gdm/gdm-pam
deleted file mode 100644
index f9fafed9d..000000000
--- a/meta-gnome/recipes-gnome/gdm/gdm/gdm-pam
+++ /dev/null
@@ -1,11 +0,0 @@
-#
-# default; standard UN*X access
-#
-auth     required       pam_unix.so
-account  required       pam_unix.so
-password required       pam_unix.so
-session  required       pam_unix.so
-
-auth     optional       pam_gnome_keyring.so
-session  optional       pam_gnome_keyring.so  auto_start
-
diff --git a/meta-gnome/recipes-gnome/gdm/gdm/gdm.conf b/meta-gnome/recipes-gnome/gdm/gdm/gdm.conf
deleted file mode 100644
index 559823b86..000000000
--- a/meta-gnome/recipes-gnome/gdm/gdm/gdm.conf
+++ /dev/null
@@ -1,80 +0,0 @@
-# GDM Custom Configuration file.
-#
-# This file is the appropriate place for specifying your customizations to the
-# GDM configuration.   If you run gdmsetup, it will automatically edit this
-# file for you and will cause the daemon and any running GDM GUI programs to
-# automatically update with the new configuration.  Not all configuration
-# options are supported by gdmsetup, so to modify some values it may be
-# necessary to modify this file directly by hand.
-#
-# This file overrides the default configuration settings.  These settings 
-# are stored in the GDM System Defaults configuration file, which is found
-# at the following location.
-#
-# /usr/share/gdm/defaults.conf.  
-#
-# This file contains comments about the meaning of each configuration option,
-# so is also a useful reference.  Also refer to the documentation links at
-# the end of this comment for further information.  In short, to hand-edit
-# this file, simply add or modify the key=value combination in the
-# appropriate section in the template below this comment section.
-#
-# For example, if you want to specify a different value for the Enable key
-# in the "[debug]" section of your GDM System Defaults configuration file,
-# then add "Enable=true" in the "[debug]" section of this file.  If the
-# key already exists in this file, then simply modify it.
-#
-# Older versions of GDM used the "gdm.conf" file for configuration.  If your
-# system has an old gdm.conf file on the system, it will be used instead of
-# this file - so changes made to this file will not take effect.  Consider
-# migrating your configuration to this file and removing the gdm.conf file.
-#
-# If you hand edit a GDM configuration file, you can run the following
-# command and the GDM daemon will immediately reflect the change.  Any
-# running GDM GUI programs will also be notified to update with the new
-# configuration.
-#
-# gdmflexiserver --command="UPDATE_CONFIG <configuration key>"
-#
-# e.g, the "Enable" key in the "[debug]" section would be "debug/Enable".
-#
-# You can also run gdm-restart or gdm-safe-restart to cause GDM to restart and
-# re-read the new configuration settings.  You can also restart GDM by sending
-# a HUP or USR1 signal to the daemon.  HUP behaves like gdm-restart and causes
-# any user session started by GDM to exit immediately while USR1 behaves like
-# gdm-safe-restart and will wait until all users log out before restarting GDM.
-#
-# For full reference documentation see the gnome help browser under
-# GNOME|System category.  You can also find the docs in HTML form on
-# http://www.gnome.org/projects/gdm/
-#
-# NOTE: Lines that begin with "#" are considered comments.
-#
-# Have fun!
-
-[daemon]
-
-[security]
-
-[xdmcp]
-
-[gui]
-
-[greeter]
-
-[chooser]
-
-[debug]
-
-# Note that to disable servers defined in the GDM System Defaults
-# configuration file (such as 0=Standard, you must put a line in this file
-# that says 0=inactive, as described in the Configuration section of the GDM
-# documentation.
-#
-[servers]
-
-# Also note, that if you redefine a [server-foo] section, then GDM will
-# use the definition in this file, not the GDM System Defaults configuration
-# file.  It is currently not possible to disable a [server-foo] section
-# defined in the GDM System Defaults configuration file.
-#
diff --git a/meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in b/meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in
deleted file mode 100644
index 3e1556ae0..000000000
--- a/meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Gnome Display Manager
-After=systemd-user-sessions.service
-
-[Service]
-ExecStart=%sbindir%/gdm -nodaemon
-StandardOutput=syslog
-
-[Install]
-Alias=display-manager.service
-- 
2.14.3


