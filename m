Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 88B13766E9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Oct 2015 15:40:03 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so123727179wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Oct 2015 08:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=7prKByY3sxdN8uhzQPiPIg1sbGOIQkmBS6NAcJQrnfk=;
	b=y5aL7GFIVEFHaf5k6yaVuLuqLWyYbSiRSBjWcvTArmeKslQ7UcLXkFIneMejFi00F1
	4S7l9iHIBviMhQtmcNLTxei+nVsu5LbfcqEfvoprPtvfR2j2bXvc4CR84xu8dlWKnME9
	D333YYiDvAUgmnAPm4P3r1cV7M/9cAbogSFLM6qVdjHNiBUU2846qNEMuYivn8VoQTv4
	Ga8so/aFoKm9V+iaGHGjFz118gVTrU6H/5kKTk49r+Yu4esAetWcC8H310vaB79ufRQL
	ys+DIrek4lTm6yxu1mhQrxc13gwzPgqF0gZv+6yTkYHZSPqzCb1NpFUoIaocAAJgNkfX
	HMBA==
X-Received: by 10.194.63.5 with SMTP id c5mr24637858wjs.127.1444578003708;
	Sun, 11 Oct 2015 08:40:03 -0700 (PDT)
Received: from localhost.localdomain
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by smtp.gmail.com with ESMTPSA id
	wc12sm7208775wic.18.2015.10.11.08.40.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Oct 2015 08:40:02 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Oct 2015 16:38:39 +0100
Message-Id: <1444577919-26583-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.4.6
Subject: [meta-oe][PATCH] vim: Upgrade to v7.4.769
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
X-List-Received-Date: Sun, 11 Oct 2015 15:40:05 -0000

v7.4.769 is the latest marked stable in Gentoo so we know this has had some
testing.

License change is simply rewording "further more" -> "furthermore".

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../recipes-support/vim/{vim-tiny_7.4.481.bb => vim-tiny_7.4.769.bb}  | 0
 meta-oe/recipes-support/vim/{vim_7.4.481.bb => vim_7.4.769.bb}        | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vim/{vim-tiny_7.4.481.bb => vim-tiny_7.4.769.bb} (100%)
 rename meta-oe/recipes-support/vim/{vim_7.4.481.bb => vim_7.4.769.bb} (96%)

diff --git a/meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb b/meta-oe/recipes-support/vim/vim-tiny_7.4.769.bb
similarity index 100%
rename from meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb
rename to meta-oe/recipes-support/vim/vim-tiny_7.4.769.bb
diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes-support/vim/vim_7.4.769.bb
similarity index 96%
rename from meta-oe/recipes-support/vim/vim_7.4.481.bb
rename to meta-oe/recipes-support/vim/vim_7.4.769.bb
index 2ece53b..c257d90 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.769.bb
@@ -4,13 +4,13 @@ DEPENDS = "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b779e18be6ed77facc770691c967b8f8"
+LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=c74ec0ada9a68354f9461e81d3596f61"
 
 SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
 "
-SRCREV = "861d80a671747e6535c83356bcffcf80a72f543b"
+SRCREV = "2693ca21cee8a729d74682fd86a4818f2b050228"
 
 S = "${WORKDIR}/git/src"
 
-- 
2.4.6


