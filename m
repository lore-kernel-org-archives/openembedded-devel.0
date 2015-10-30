Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 06E5576F58
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:14:16 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so10456101wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=ZRMEBbAFMDesCuyMZB6/Untosv46Dlk7iDCx1Ix5BMQ=;
	b=u4UMhy7gHDzkOiICDg6l4L9sm66ps1TAAMWPGR61UFSmN1TeQ7KuokCG1BGqBqIZk4
	dgEp+TvB9KbB4zGcbdD/9QLODEfLOo+qVyQFhzAoSh5QJ7DcnqyS+OHpZiFzxc6ajCZe
	5/ORwuDPjrLo2xbzdf6cLXeA21G0LcFTuUCPvxeLwwPqwgdITQ5SNGCN4yNrTcUiAHEI
	yJEpsu2G27JhUxlKo+c2KOVY5g/9JKEaTnR0EqHiqBPWp01gFN81GUnATpxwFYzEH49C
	TN9p8dAbxFA9LtUadu0lcohPZt187Jt2xFGbIR6BzW6PQfAipri0dWQTWE+sKJa6VGgM
	8Ixg==
X-Received: by 10.28.212.70 with SMTP id l67mr3236307wmg.66.1446207256275;
	Fri, 30 Oct 2015 05:14:16 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	184sm2636122wmk.10.2015.10.30.05.14.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:14:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 13:13:32 +0100
Message-Id: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH 00/13] update + usabilty/build enhancements
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Oct 2015 12:14:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

1.    maintenance
2-6.  Update & increase usabilty
7-13. Avoid cloning externel sources during configure/compile (tested with 
      network disconnected)

The following changes since commit c04f105227101977a0f5ed8d41dd6fbe71138eea:

  rrdtool: adding the capability of native-builds to get rrdtool-oo in meta-cpan running (2015-10-26 21:37:38 +0100)

are available in the git repository at:

  git://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to d7cf562d04d4408ffc1b98b71fb970e64648dcf1:

  fontforge: avoid cloning uthash during do_compile (2015-10-30 13:02:34 +0100)

----------------------------------------------------------------
Andreas Müller (13):
      xfce4-vala: unbreak by telling configure vala API version
      xfce-polkit: initial add 0.2
      packagegroup-xfce-extended: xfce-polkit
      gparted: update to 0.24.0
      gparted: add gtk-icon-cache to inherit
      gparted: add polkit support
      gnulib: move meta-networking -> meta-oe
      bootstrap.bbclass: initial add
      netcf: use bootstrap.bbclass
      gnulib: add native extend
      fontforge: use bootstrap.bbclass
      uthash: add native extend
      fontforge: avoid cloning uthash during do_compile

 meta-gnome/recipes-extended/gparted/files/gparted_polkit                                | 10 ++++++++++
 meta-gnome/recipes-extended/gparted/files/org.yoctoproject.pkexec.run-gparted.policy    | 20 ++++++++++++++++++++
 meta-gnome/recipes-extended/gparted/gparted_0.23.0.bb                                   | 18 ------------------
 meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb                                   | 38 ++++++++++++++++++++++++++++++++++++++
 meta-networking/recipes-support/netcf/netcf_git.bb                                      |  8 +-------
 meta-oe/classes/bootstrap.bbclass                                                       | 20 ++++++++++++++++++++
 meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb                                | 13 +++++++------
 {meta-networking/recipes-support/netcf => meta-oe/recipes-support/gnulib}/gnulib_git.bb |  2 ++
 meta-oe/recipes-support/uthash/uthash_1.9.7.bb                                          |  2 ++
 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb                                   | 11 +++++++++++
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb                                    |  4 ++--
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb                      |  2 ++
 12 files changed, 115 insertions(+), 33 deletions(-)
 create mode 100644 meta-gnome/recipes-extended/gparted/files/gparted_polkit
 create mode 100644 meta-gnome/recipes-extended/gparted/files/org.yoctoproject.pkexec.run-gparted.policy
 delete mode 100644 meta-gnome/recipes-extended/gparted/gparted_0.23.0.bb
 create mode 100644 meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
 create mode 100644 meta-oe/classes/bootstrap.bbclass
 rename {meta-networking/recipes-support/netcf => meta-oe/recipes-support/gnulib}/gnulib_git.bb (97%)
 create mode 100644 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb

-- 
2.1.0


