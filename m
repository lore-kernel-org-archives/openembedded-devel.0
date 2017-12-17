Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id AD21460269
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 18:21:55 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id y21so12151394wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 10:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U+eE1MHZ6+DzRUPd4bmKqncEvEJnZrdGH4ah4/Mgluw=;
	b=Ra1aiYF33AQIjd2WFGnvZva5cWsYgJ3fnVBZe5OlqV6KXdVsj1MAn+LVyFV45WYXsm
	JY7gQMwwrRYE/+j+3hZF6L3gMT8WwT0x9Wt8FwI8/7SvZlHNm1exI45yeR4T5dHKQj1U
	0AzoNu5w2VsM5Nfb+elEm63LKp540QEVU5QTEmG+8BRKZOK1K/aUkfWDzNJTUdW7T53V
	8by53TOgMItRw5pjS84GNbWXRxGjvW3G/9a8OCLLgmeuxTxJpEOytI5aC/QpgeMLLY3u
	UkowYXKa8Bv2SBBw1CHFdfUJ0T0BA/aX/yA38+KQkDF12tJbFN4KFlYSpU/n2nhrwG5w
	AFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U+eE1MHZ6+DzRUPd4bmKqncEvEJnZrdGH4ah4/Mgluw=;
	b=D814o42MeYHxQhTSVxzJnXLXX2wPTtaFx5K5lZj16EwMNc090eEK5Fe0JS6vQpiKo9
	093J/DVY1PPQq+Ii6tWdkEH6wOnNPFx/s1HJlaYh7CXkOwduvrfNsntVVXpsJze1D1KW
	u/6EnAA/XkbakDL09PbmNL/BzktJXMsCo0ln4aI8a7WjIRPRK1V7fMp4V+GeZt9Hum49
	nTApfesDke1YopbGSlLim0ffYvPi+tNA+IfcwR9vVUxoAL5b/WZJKEs9xXgcIg16Lnj3
	O3HSxF2UQ66DBT9VunkP/HA5jM+iZsYJ+CA2x9aL+YcJ6DM2Nxj73ME7yLqCeXAdc0GM
	9ZZw==
X-Gm-Message-State: AKGB3mIyIKvx3jJQP6fqtqUcWbHUnxjvofJmOy9ZxL/mj/p3vkmiFy76
	L0hOGiZFUZoeVD0F4z6jqaZ05w==
X-Google-Smtp-Source: ACJfBovKP649UUMjdsK8Dn88lhbZSA7ZbJRdKuVpJVX9o7CTfGN9ajbTKB42HiURI9UQiL/h4XusRg==
X-Received: by 10.223.150.61 with SMTP id b58mr3820750wra.185.1513534915939;
	Sun, 17 Dec 2017 10:21:55 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC3E4151E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc3:e415:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 139sm7762637wmp.7.2017.12.17.10.21.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Dec 2017 10:21:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Dec 2017 19:21:36 +0100
Message-Id: <20171217182144.21123-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
MIME-Version: 1.0
Subject: [PATCH][V2 0/8] few fixes
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
X-List-Received-Date: Sun, 17 Dec 2017 18:21:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1 -> V2: fltk correct packing of shared libs / cleanup

Andreas Müller (8):
  gvfs: update 1.32.1 -> 1.34.1
  plymouth: do not install systemd units manually
  plymouth: packageconfig gtk needs gtk+3 as depends
  plymouth: fix path to systemd-tty-ask-password-agent
  fltk-native: remove fltk-config from image
  fltk: remove fltk-native from DEPENDS
  fltk: do not suffix shared library names with '_SHARED'
  Add FLTK to licenses to avoid warning when building fltk / fltk-native

 .../gvfs/{gvfs_1.32.1.bb => gvfs_1.34.1.bb}        |   7 +-
 meta-oe/licenses/FLTK                              | 530 +++++++++++++++++++++
 ...ath-to-systemd-tty-ask-password-agent-con.patch |  34 ++
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb    |  12 +-
 meta-oe/recipes-support/fltk/fltk-native.bb        |   5 +
 meta-oe/recipes-support/fltk/fltk.bb               |   5 +-
 ...d-Force-shared-libs-with-unsuffixed-names.patch |  41 ++
 7 files changed, 622 insertions(+), 12 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.32.1.bb => gvfs_1.34.1.bb} (88%)
 create mode 100644 meta-oe/licenses/FLTK
 create mode 100644 meta-oe/recipes-core/plymouth/files/0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk/0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch

-- 
2.9.5


