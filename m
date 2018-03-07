Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id A970D78694
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:28 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id w22-v6so635468pll.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=mq0rOvphiBH02NmObQyxGKA1jPWpwfzHvGGEslGv2ZI=;
	b=P2WTvpHgiKI9GmYbEwYuHgGTXebaIZwZSX17KVsfYU9lQxW8gX4P9FL8hNE2IMjiMe
	H72Uj6izdXPkjb0va8iqPZkK9JGlE5WRmkAjeHy0dH83IqDYpL18vhSbxJLLsx1jrfBh
	knIpo2fPYQQNi590iM66Nr10dliiVgzoFgOppSU/QIU3KU9gtgfAGB2RxsS55hg5LuZ3
	1jOT5+wVq9TDEZzqa4tTSn2DEkTTk0iTk33QksCvQQcrAVkZliKJJ0qnHpWpZi5T30FD
	yLgc0PTqbfE2dcSIpgD3aG1l8Mps5ZZ1rC8HD6+wqxzDRYRuYclejWn8fj31iKOfftN1
	5C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mq0rOvphiBH02NmObQyxGKA1jPWpwfzHvGGEslGv2ZI=;
	b=BO331UtDMY3ULwju5VS0n8kPNryv2hEuuKqBoAbZ5PuD2ADgi+ahrjww6TaA8iAIhl
	xjftoqVPSSccUp6PU7gAnSa1fADkMJjaJyEU3ov8Nalt6yqDL1u5HbMQFNlC4HvauPDp
	Jv2Eyu5MdggJPQIUkcWpgqUDUmSK2LsW8ubtHCxAJUO8j4YLEytKa9eDPCfiF7paDR1J
	V7WXoC/FethrnUyt+Ag0UOiu2eDGmgqWK0r7eXCQ4N57KqCeQxvjF+yq04nOXIp5ZYtc
	aTgWi67MQE5wfclK6WHnAYcBnfLrcqeVZXhBeU7i83IOXQNRdRsLo45PFK+Ma+RKoDN9
	dKnA==
X-Gm-Message-State: APf1xPBhwBfITT81YjMcEjAFg+Pr6yssqOZ3eAa+KDdaq9zCQw84avrQ
	ulmSJ0f7inHaSawpfVGq97U=
X-Google-Smtp-Source: AG47ELvyPXeuqn0QvE7VV3MrImPyF36rz+AFA/wO/+hS9QZzhj4gzxKnuLSHXcLnL+b+YoZdP74fuA==
X-Received: by 2002:a17:902:5596:: with SMTP id
	g22-v6mr18438005pli.4.1520395409855; 
	Tue, 06 Mar 2018 20:03:29 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:04 -0800
Message-Id: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 01/25] vim: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:28 -0000

fixes:

 vim:do_install: 6a98ed60a33e0915e83ddf4411cb98a4 -> fab6a8f9b3c3978de44b458939712d90
      bitbake-diffsigs --task vim do_install --signature 6a98ed60a33e0915e83ddf4411cb98a4 fab6a8f9b3c3978de44b458939712d90
      NOTE: Starting bitbake server...
      basehash changed from 7302bf635913317779cf6e19324032a4 to 4a66ac61a894cf5b09db9afc053c77e6
      Variable do_install value changed:
      @@ -11,3 +11,7 @@

           # we use --with-features=big as default
           mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
      +	# The mouse being autoenabled is just annoying in xfce4-terminal (mouse
      +	# drag make vim go into visual mode and there is no right click menu),
      +	# delete the block.
      +	sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN}/vimrc

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-xfce/recipes-support/vim/vim_%.bbappend | 7 +------
 meta-xfce/recipes-support/vim/vim_xfce.inc   | 6 ++++++
 2 files changed, 7 insertions(+), 6 deletions(-)
 create mode 100644 meta-xfce/recipes-support/vim/vim_xfce.inc

diff --git a/meta-xfce/recipes-support/vim/vim_%.bbappend b/meta-xfce/recipes-support/vim/vim_%.bbappend
index 25403e6..7b44963 100644
--- a/meta-xfce/recipes-support/vim/vim_%.bbappend
+++ b/meta-xfce/recipes-support/vim/vim_%.bbappend
@@ -1,6 +1 @@
-do_install_append() {
-	# The mouse being autoenabled is just annoying in xfce4-terminal (mouse
-	# drag make vim go into visual mode and there is no right click menu),
-	# delete the block.
-	sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN}/vimrc
-}
+require ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${BPN}_xfce.inc', '', d)}
diff --git a/meta-xfce/recipes-support/vim/vim_xfce.inc b/meta-xfce/recipes-support/vim/vim_xfce.inc
new file mode 100644
index 0000000..25403e6
--- /dev/null
+++ b/meta-xfce/recipes-support/vim/vim_xfce.inc
@@ -0,0 +1,6 @@
+do_install_append() {
+	# The mouse being autoenabled is just annoying in xfce4-terminal (mouse
+	# drag make vim go into visual mode and there is no right click menu),
+	# delete the block.
+	sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN}/vimrc
+}
-- 
2.7.4


