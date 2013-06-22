Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id ED4C3608CC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 13:29:01 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b12so7181802wgh.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=+AWYZ4LL0UlvDZD9hyIlSj6TKddr8KGi66+sdeciqoA=;
	b=FiMZXT1mua2MZUGSWyUdGZ2/5x1FIfAbut+x45jUo+EFiJSJfL0s5e1uTxIJLX+j0G
	ZO0V/9I/PYawn6TbWhTeATkSE9qfZSU0Gysd7mSq56kR5QREOafP7997a34+L/ltjLGh
	cUUhHg86mlbS72cBxGvJIk32CcOHhresygGNKP4CMYCy6Mn5D3Ov5/9FoNA3nv0hX6hX
	sSU3YeM5FygizUj6EsuzBYBfzelscQng4WMQGwHrEQNGZ4JDIhny4V2eM7Xl6PEfdfrN
	PBw8+E3xHisRqh4bMckCIny/2FuYb0K6ARyF1JzSivQgp8YiB7jUFMwqUGGJjxuk+hW0
	JCrw==
X-Received: by 10.194.243.226 with SMTP id xb2mr12377272wjc.67.1371907742185; 
	Sat, 22 Jun 2013 06:29:02 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id nj19sm4038847wic.1.2013.06.22.06.29.00
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 22 Jun 2013 06:29:01 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jun 2013 14:28:33 +0100
Message-Id: <1371907719-8868-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-oe, meta-multimedia, meta-efl][PATCH RFC 0/6] Replace ENTERPRISE_DISTRO with PACKAGECONFIG options
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
X-List-Received-Date: Sat, 22 Jun 2013 13:29:03 -0000

This patch series removes all uses of ENTERPRISE_DISTRO from meta-openembedded
as suggested in recent discussions. It's currently RFC as I haven't yet had
chance to test a few combinations of options but I thought I'd get some opinions
on this early.

What I haven't done is set any default PACKAGECONFIG values. So even if
LICENSE_FLAGS_WHITELIST contains "commercial", these optional features won't be
enabled by default. Is it worth setting PACKAGECONFIG defaults for each of these
recipes based on whether commercial licenses are whitelisted or not?

I've also not checked whether every one of these features does require
commercial licenses to be whitelisted but I think adding these packageconfig
options is a good thing. If any of them don't require commercial licenses to be
whitelisted perhaps they can be added to the default PACKAGECONFIG options in
the relevant recipes.

Paul Barker (6):
  mplayer2: replace ENTERPRISE_DISTRO with PACKAGECONFIG options
  libsdl-mixer: replace ENTERPRISE_DISTRO with PACKAGECONFIG options
  libav: remove unnecessary dependency on liba52
  vlc: replace ENTERPRISE_DISTRO with PACKAGECONFIG options
  mpd: replace ENTERPRISE_DISTRO with PACKAGECONFIG options
  enjoy: replace ENTERPRISE_DISTRO with PACKAGECONFIG options

 meta-efl/recipes-efl/e17/enjoy_svn.bb                          |  7 ++++---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb       |  7 +++++--
 meta-multimedia/recipes-multimedia/vlc/vlc.inc                 | 10 +++++-----
 meta-oe/recipes-multimedia/libav/libav.inc                     |  2 +-
 meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb |  6 ++++--
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb             |  7 +++++--
 6 files changed, 24 insertions(+), 15 deletions(-)

-- 
1.8.3.1


