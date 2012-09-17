Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDWZH-0005IU-SH
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 10:20:35 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2156766bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 01:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=OM8rAmuLlAsAtWzX/5DnlR9SB8/zBCXIu+F7k/dD9so=;
	b=0Z9ZGggdLxjZvmnP3djIcXEkbKwD0Flx8TcKDeoPycvPfoZSLq2jezpLWaziALjoE7
	7gHuBEv36RzXJajQpB4qTYrOnTmou1FUkmIHTojzzv6MaJ9Q8VVi0EvH9PChpCsTNfuP
	Gu2E1S+jx4Nk43JAasRitafrQ4WHAMOvv1j5bSJR29pz1LjeL9omW1AGtmx6oU7onqO3
	2H1zfhpOFL2pAmnrjNhmJSBLhYI+c9LjGktgNtG8LFtA0ukoZb1hPtMjvVAwVAhehLbM
	0S6rLoZxRzXNo09Y4peaYng47N+Htc7WZW9j0HjObL06qBV3NbYghGv/OFz/90joYyoE
	D0CA==
Received: by 10.204.156.17 with SMTP id u17mr4076750bkw.52.1347869279757;
	Mon, 17 Sep 2012 01:07:59 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1A7D.dip.t-dialin.net.
	[79.223.26.125])
	by mx.google.com with ESMTPS id a17sm1387041bkw.5.2012.09.17.01.07.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 01:07:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Sep 2012 10:15:44 +0200
Message-Id: <1347869747-14271-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1347869747-14271-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347869747-14271-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 4/7] gdm: remove obsolete files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 08:20:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml  |  492 ---------------------
 meta-gnome/recipes-gnome/gdm/gdm/gdm              |   73 ---
 meta-gnome/recipes-gnome/gdm/gdm/gdm-nodocs.patch |   12 -
 meta-gnome/recipes-gnome/gdm/gdm/gdm.conf         |   80 ----
 4 files changed, 0 insertions(+), 657 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml
 delete mode 100755 meta-gnome/recipes-gnome/gdm/gdm/gdm
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/gdm-nodocs.patch
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/gdm.conf

diff --git a/meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml b/meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml
deleted file mode 100644
index f8c2e9c..0000000
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
diff --git a/meta-gnome/recipes-gnome/gdm/gdm/gdm b/meta-gnome/recipes-gnome/gdm/gdm/gdm
deleted file mode 100755
index 0d43a6f..0000000
--- a/meta-gnome/recipes-gnome/gdm/gdm/gdm
+++ /dev/null
@@ -1,73 +0,0 @@
-#! /bin/sh
-### BEGIN INIT INFO
-# Provides:          gdm
-# Should-Start:      console-screen acpid dbus hal network-manager
-# Required-Start:    $local_fs $remote_fs
-# Required-Stop:     $local_fs $remote_fs
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
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
-        CONFIGURED_DAEMON=$(basename "$(cat $DEFAULT_DISPLAY_MANAGER_FILE 2> /dev/null)")
-        if grep -wqs text /proc/cmdline; then
-            echo "Not starting GNOME Display Manager (gdm); found 'text' in kernel commandline."
-        elif [ -e "$DEFAULT_DISPLAY_MANAGER_FILE" ] && \
-           [ "$HEED_DEFAULT_DISPLAY_MANAGER" = "true" ] && \
-           [ "$CONFIGURED_DAEMON" != gdm ] ; then
-                echo "Not starting GNOME Display Manager; it is not the default display manager"
-        else
-                echo "Starting GNOME Display Manager" "gdm"
-                start-stop-daemon --start --quiet --exec $DAEMON 
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
diff --git a/meta-gnome/recipes-gnome/gdm/gdm/gdm-nodocs.patch b/meta-gnome/recipes-gnome/gdm/gdm/gdm-nodocs.patch
deleted file mode 100644
index 395fa62..0000000
--- a/meta-gnome/recipes-gnome/gdm/gdm/gdm-nodocs.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- /tmp/Makefile.am	2006-07-26 11:37:52.000000000 +0200
-+++ gdm-2.14.9/Makefile.am	2006-07-26 11:38:01.734411000 +0200
-@@ -5,8 +5,7 @@
- 	vicious-extensions \
- 	daemon \
- 	gui \
--	utils \
--	docs
-+	utils 
- 
- # add these when help gets added back
- # docs omf-install
diff --git a/meta-gnome/recipes-gnome/gdm/gdm/gdm.conf b/meta-gnome/recipes-gnome/gdm/gdm/gdm.conf
deleted file mode 100644
index 559823b..0000000
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
-- 
1.7.4.4



