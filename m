Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id A356077D48
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:44:58 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id z78so5369089lff.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=o6O7nUSQvf6srFNgH8sX5DnrK8XOLIyhEVTTJy/NrH0=;
	b=kHUThLzSGXplnxVkFJxDieGLjt+GhwEPic+26wX2XOkX8YRCeWcEcLGACzV2JzcD+L
	tsicqbQfuj0n6ThP2tdf/uIbEh9Nr5dnzd9UFsOywPGULI+MCCF3Bpl3QeynYT3FYz3B
	VNIeB9M4rdnpocguwAI/gWEF2luFpL/sM3UygP/pBSTcjTHNtdXqDNUbi3ERgp/mojVk
	FmbQzxWMmKg0C++fnNVSAxKjdRb7jQBLlMG0VCLIqtPMUpfcCzjk22NbJjvN7BZSw9u+
	BruZ39LoOCA/wWShCy7h55WJpE4gS38Pz1ZBmKAXUldPAVMXsH16iHs0hHAynUWXD3yg
	zq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o6O7nUSQvf6srFNgH8sX5DnrK8XOLIyhEVTTJy/NrH0=;
	b=mLzUFKj8M72iXVLfMShuOOyez1QyrP5oqUO+42SlOpVCosyWd+tJUp8nN6tfG1swZI
	2NxJlap9oSGug5kZvrmiWQrlv2tnSdLl5gt3sIwsFIM4S342PZln0iKBkG7X2qcwJmO0
	1GAgq/FS6wsqSiQAjes7jZv55YlgLcxQqSC8vk/sgEOwn6KL8QpdMhEXdVCBQn7LvQGn
	OELHQs23JXCrsy6jzBTpaBliFsjaWV4xx4+wSTOGT+XcE5n/5tTVSvfvCpR5AKOg7Tdl
	nFPhbfdZxNTWxMOZ68YMsu8XZelNgPqAbmT4SwoAZxKsl+Gv/kOwXLKEUlln5hyRk8xi
	IPHw==
X-Gm-Message-State: AIVw111rFjo6QZDAZh7RPOEaTS+WAM6bdp4nvGIsSj2mpiq2tBWvT0qS
	syB0B/rE/lqRCDTy
X-Received: by 10.80.241.71 with SMTP id z7mr3298567edl.182.1499791498999;
	Tue, 11 Jul 2017 09:44:58 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.112]) by smtp.gmail.com with ESMTPSA id
	p19sm1224952eda.15.2017.07.11.09.44.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Jul 2017 09:44:58 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 18:44:30 +0200
Message-Id: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe/meta-perl] [PATCH 0/8] po4a: add full functionalities
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
X-List-Received-Date: Tue, 11 Jul 2017 16:44:59 -0000

From: Ming Liu <liu.ming50@gmail.com>

This patch series mainly aim to let po4a and po4a-native work with
full functionalities by adding the following dependencies to its
DEPENDS and RRECOMMENDS_${PN}:
- libtext-wrapi18n-perl
- libterm-readkey-perl
- liblocale-gettext-perl
- libunicode-linebreak-perl

Ming Liu (8):
  libsombok3: add recipe
  libmime-charset-perl: add recipe
  libterm-readkey-perl: add recipe
  liblocale-gettext-perl: add recipe
  libtext-charwidth-perl: add recipe
  libtext-wrapi18n-perl: add recipe
  libunicode-linebreak-perl: add recipe
  po4a: add full functionalities

 ...01-configure.ac-fix-cross-compiling-issue.patch | 31 +++++++++++++++++++
 .../libsombok3/libsombok3_2.4.0.bb                 | 25 +++++++++++++++
 .../liblocale/liblocale-gettext-perl_1.07.bb       | 21 +++++++++++++
 .../libmime/libmime-charset-perl_1.012.2.bb        | 19 ++++++++++++
 .../libterm/libterm-readkey-perl_2.37.bb           | 36 ++++++++++++++++++++++
 .../libtext/libtext-charwidth-perl_0.04.bb         | 27 ++++++++++++++++
 .../libtext/libtext-wrapi18n-perl_0.06.bb          | 32 +++++++++++++++++++
 .../libunicode-linebreak-perl_2017.004.bb          | 26 ++++++++++++++++
 meta-perl/recipes-perl/po4a/po4a_0.49.bb           | 17 ++++++++--
 9 files changed, 232 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/libsombok3/libsombok3/0001-configure.ac-fix-cross-compiling-issue.patch
 create mode 100644 meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
 create mode 100644 meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
 create mode 100644 meta-perl/recipes-perl/libmime/libmime-charset-perl_1.012.2.bb
 create mode 100644 meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
 create mode 100644 meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
 create mode 100644 meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
 create mode 100644 meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2017.004.bb

-- 
2.7.4


