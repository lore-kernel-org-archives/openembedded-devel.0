Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id F20C87F96B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:35:56 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r1so7977272wrs.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z7yb4o2REVy7WT80PMCN212s4To/2K3lZREJGJYkk0U=;
	b=UqflYfxy3ceVlFbo70jUJmdS8SKNDdEyDHcamg8IK6TnLsOb61Ma31ujzsUQatX49f
	2cZo1LJXfKybrL0dpD1axQlZH5xzhAG8H3anMUCXge+VvOKeULMENRZ4rZzilq2sAOx3
	lG4UfsC184AB+kxE6PNKWjuqjOqtMQRXmxpbrQUUt5UIbXnNDaBsRUAoAmlPzi6tKDCl
	iLtPjVty0kEsP8+PvGTrotnGOZpDG9eKqVeECYuk9N9UuTvSyc5ERq5/iQRvN/Aw5CXY
	YDhgX+uuqiV89jkRyHMP763mYWUzUDq5hA9CUKabZZifbUOzuAbNJZOt0Ld84PNxGvU4
	SQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z7yb4o2REVy7WT80PMCN212s4To/2K3lZREJGJYkk0U=;
	b=GYnow5KIKjxze+C9akZ3QBYbM8OoGnIsvI25GYyjv/f+3PE3CKrTyqshURggv5AeBf
	Jl2OZ9h17Yn39cD4z9R7VIOCH4HxQgI9xDVfVy3yY986Xt/coCSw6OlbfrU61tDhfsoO
	J/fvm4GUcZE6nZQBhiten+10xmROfYzNVu8+nBYlsXyN9yBu0iKzKP75iKImbuPG3di0
	a9G15BcpoYc1RNvBbXjQrGmT/U2HxfjulA8JBeCRaDp5nYWmPwPjvbjlG0rYQNWhRkSJ
	ELTpJzYiE4l+O1WlkPK31apCaAf/EOLzX7QbsJywlRvabp9lje0TIBzKGkbC2lRRonYS
	En7A==
X-Gm-Message-State: APjAAAXRWiHVsfyjRj+6fhbh4snbZdzAK0oRM/DyDKbcNd3asTU6/IB7
	0TohRcFPOt9uuKNemnbWpQGUKm3m
X-Google-Smtp-Source: APXvYqwPp1fPfkpvV4xPquAwdSRMuCoALZyFwwgVn70+Z24Ean/4jPuyI0F+RtmGRiHAFtBvv4uHmQ==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr12111745wrq.192.1572219357319; 
	Sun, 27 Oct 2019 16:35:57 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.35.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:35:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:26 +0100
Message-Id: <20191027233545.4146-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 00/19] next gnome batch
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
X-List-Received-Date: Sun, 27 Oct 2019 23:35:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* known autobuilder issues from previous series fixed
* upgrades 
* new recipes

Andreas Müller (19):
  itstool: rework native shebang and add class to make native itstool
    work
  yelp-tools: use itstools.bbclass
  yelp-xsl: use itstool.bbclass
  yelp: use itstool.bbclass
  gnome-help.bbclass: Handle gnome-help files with new distro feature
    'helpfiles'
  zenity: rework recipe
  colord: initial add 1.4.4
  colord-gtk: initial add 0.2.0
  dconf: extend to native build for upcoming gdm
  dconf-editor: upgrade 3.32.0 -> 3.34.0
  gtksourceview4: upgrade 4.2.0 -> 4.4.0
  gnome-menus3: upgrade 3.10.1 -> 3.32.0
  gnome-desktop3: upgrade 3.34.0 -> 3.34.1
  gnome-bluetooth: upgrade 3.32.1 -> 3.34.0
  glade3: upgrade 3.8.5 -> 3.8.6
  gspell: upgrade 1.8.1 -> 1.8.2
  gnome-system-monitor: upgrade 3.32.0 -> 3.32.1
  network-manager-applet: upgrade 1.8.22 -> 1.8.23 / build with meson /
    cleanup
  ibus: initial add 1.5.21

 meta-gnome/classes/gnome-help.bbclass         |  69 ++++++++
 .../network-manager-applet_1.8.22.bb          |  44 -----
 .../network-manager-applet_1.8.24.bb          |  29 +++
 ...ditor_3.32.0.bb => dconf-editor_3.34.2.bb} |   4 +-
 .../recipes-gnome/dconf/dconf_0.34.0.bb       |   4 +
 ...th_3.32.1.bb => gnome-bluetooth_3.34.0.bb} |   4 +-
 ...op3_3.34.0.bb => gnome-desktop3_3.34.1.bb} |   8 +-
 .../gnome-menus/gnome-menus3_3.10.1.bb        |  21 ---
 .../gnome-menus/gnome-menus3_3.32.0.bb        |  18 ++
 ...t-build-help-we-do-not-have-yelp-yet.patch |  30 ----
 ...32.0.bb => gnome-system-monitor_3.32.1.bb} |   8 +-
 .../{gspell_1.8.1.bb => gspell_1.8.2.bb}      |   6 +-
 ...view4_4.2.0.bb => gtksourceview4_4.4.0.bb} |  13 +-
 .../recipes-gnome/yelp/yelp-tools_3.32.2.bb   |   3 +-
 .../recipes-gnome/yelp/yelp-xsl_3.34.0.bb     |   9 +-
 meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb  |   3 +-
 .../0001-build-don-t-generate-manual.patch    |  50 ------
 .../recipes-gnome/zenity/zenity_3.32.0.bb     |  12 +-
 .../colord-gtk/colord-gtk_0.2.0.bb            |  21 +++
 .../recipes-support/ibus/ibus-native.bb       |  31 ++++
 meta-gnome/recipes-support/ibus/ibus.bb       |  33 ++++
 meta-gnome/recipes-support/ibus/ibus.inc      |  33 ++++
 ...start-dbus-we-do-not-have-dbus-lauch.patch |  39 ++++
 meta-oe/classes/itstool.bbclass               |   5 +
 .../recipes-support/colord/colord-native.bb   |  64 +++++++
 ...n-cd_icc_create_from_edid-to-avoid-u.patch | 166 ++++++++++++++++++
 .../colord/colord-native/Makefile             |  48 +++++
 meta-oe/recipes-support/colord/colord.bb      |  45 +++++
 meta-oe/recipes-support/colord/colord.inc     |  13 ++
 ...Run-native-cd_idt8-cd_create_profile.patch |  59 +++++++
 ...-build-time-hardcoded-python-binary-.patch |  35 ++++
 ...d-time-hardcoded-python-binary-path.patch} |   0
 .../recipes-support/itstool/itstool_2.0.6.bb  |   6 +-
 .../recipes-devtools/glade/glade3_3.8.5.bb    |  23 ---
 .../recipes-devtools/glade/glade3_3.8.6.bb    |  18 ++
 35 files changed, 770 insertions(+), 204 deletions(-)
 create mode 100644 meta-gnome/classes/gnome-help.bbclass
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb
 create mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.24.bb
 rename meta-gnome/recipes-gnome/dconf/{dconf-editor_3.32.0.bb => dconf-editor_3.34.2.bb} (67%)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_3.32.1.bb => gnome-bluetooth_3.34.0.bb} (78%)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.34.0.bb => gnome-desktop3_3.34.1.bb} (72%)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monitor_3.32.0.bb => gnome-system-monitor_3.32.1.bb} (64%)
 rename meta-gnome/recipes-gnome/gspell/{gspell_1.8.1.bb => gspell_1.8.2.bb} (51%)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview4_4.2.0.bb => gtksourceview4_4.4.0.bb} (65%)
 delete mode 100644 meta-gnome/recipes-gnome/zenity/zenity/0001-build-don-t-generate-manual.patch
 create mode 100644 meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus-native.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus.inc
 create mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
 create mode 100644 meta-oe/classes/itstool.bbclass
 create mode 100644 meta-oe/recipes-support/colord/colord-native.bb
 create mode 100644 meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
 create mode 100644 meta-oe/recipes-support/colord/colord-native/Makefile
 create mode 100644 meta-oe/recipes-support/colord/colord.bb
 create mode 100644 meta-oe/recipes-support/colord/colord.inc
 create mode 100644 meta-oe/recipes-support/colord/colord/0001-Run-native-cd_idt8-cd_create_profile.patch
 create mode 100644 meta-oe/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
 rename meta-oe/recipes-support/itstool/itstool/{0001-Don-t-use-build-time-hardcoded-python-binary-path.patch => 0002-Don-t-use-build-time-hardcoded-python-binary-path.patch} (100%)
 delete mode 100644 meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
 create mode 100644 meta-xfce/recipes-devtools/glade/glade3_3.8.6.bb

-- 
2.21.0


