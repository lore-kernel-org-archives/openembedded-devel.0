Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3E7AA7BDA9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jan 2019 02:13:55 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id p8so16719246plo.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2019 18:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:from:date:subject:to;
	bh=wojD+yxjE86rgekcFPXT1N6q6I5NIcUgCbO1mPKBKls=;
	b=tKwdonzChoj2IQlKrBV/ymBeTtyTA8q1x9G6bJdd9YI39uUhLNvhcQYud3dm2CgE4S
	Wcul7/HZnUkxr7YAes7ON1LqAD5P1y88LzOiyWPqkHzI7Z+ZYcNAorBAK0v/8O3VX0Og
	+TgNv/u/b4KkWL5IHT3bTsNhd00rHWC/pn63ogpcKMttiRn+QH7kt6AjkMnp4n1CB7+a
	jD0pmZpT5IQaj2unTLv70l0pouSkemM3efD7QEUdnGuvNmNYUJYL65GW5D/x7tUQXdym
	PkILHBZMvPzeL/tl5fsB7nFKHYfK85jV1WVjsTJGSlPPUAHph72sqlTlzkrwz1Vqk6Ca
	3weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:from:date:subject:to;
	bh=wojD+yxjE86rgekcFPXT1N6q6I5NIcUgCbO1mPKBKls=;
	b=me3iN1Wy3FVI8GdMuaA5DRO7y+XZ39nEXejjtlmKFWW3bFZ8LEYWa1/N5ExCdyalor
	0BJEqMUTbyxMg0yveGs1BEx9zT3iNLQ1nJcsHmH2vggDXD7TPC2h3jwiduJLjsPFA+9L
	WROh4vEtyauUBgB1+mhLrIXgwlKOkEFet6FVgUzGHFVXJjL7NsJ5MfApiOIOxQOntyjJ
	7W7o2YFYbkxS0EojjpQPOgpllJvjQ83M9WFLvZMYLcg1xefsCUWEvrCTHzGYVZ62R+Tg
	5EPZ+vb8n5Af4kGJSy9ra9PCJhOZHL9TCm1HbVKOeb3cxp6cDz/hGeSTBF2Vw525NMfx
	O3YA==
X-Gm-Message-State: AJcUukfbpzE7TnJGukomwH93lHKyY1iSeZ+XrXSKfxozo+4h5+gvdv/W
	mxZhL59sdJzQ+IIpunbaNUo=
X-Google-Smtp-Source: ALg8bN4p7RjvLO1QRwCj+62CW6RjY3Rx1CXMlp9herxHPNBIqLeN51e4kEa92GNxns/Pse8ikLrXzw==
X-Received: by 2002:a17:902:e002:: with SMTP id
	ca2mr49946165plb.103.1546568036170; 
	Thu, 03 Jan 2019 18:13:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s ([2601:202:4180:c33:7144:30fa:a7a1:7688])
	by smtp.gmail.com with ESMTPSA id
	62sm67787753pgc.61.2019.01.03.18.13.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Jan 2019 18:13:55 -0800 (PST)
Message-ID: <5c2ec163.1c69fb81.19992.e9c1@mx.google.com>
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: "Armin Kuster" <akuster@akuster-ThinkPad-T460s>
Received: by akuster-ThinkPad-T460s (sSMTP sendmail emulation);
	Thu, 03 Jan 2019 18:13:53 -0800
Date: Thu, 03 Jan 2019 18:13:53 -0800
To: <akuster808@gmail.com>,<openembedded-devel@lists.openembedded.org>
X-Mailer: mail (GNU Mailutils 2.99.99)
Subject: ][THUD][Pull request
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
X-List-Received-Date: Fri, 04 Jan 2019 02:13:55 -0000

The following changes since commit a15d7f6ebcb0ed76c83c28f854d55e3f9d5b3677:

  sblim-sfc-common: use official SPDX license for EPL (2018-11-22 11:34:44 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded thud-next

for you to fetch changes up to 6094ae18c8a35e5cc9998ac39869390d7f3bb1e2:

  geoip: update SRC_URI (2018-12-22 08:14:11 -0800)

----------------------------------------------------------------
Changqing Li (3):
      geoip: add downloadfilename for geoip database files
      geoip: update geolite database checksum
      geoip: update SRC_URI

Vyacheslav Yurkov (2):
      glog: fixed the build for mips and other platforms
      glog: fix installation path

 .../recipes-support/geoip/geoip_1.6.12.bb          | 26 +++++----
 .../0002-Find-Libunwind-during-configure.patch     | 53 ++++++++++--------
 .../glog/glog/0003-installation-path-fix.patch     | 65 ++++++++++++++++++++++
 meta-oe/recipes-support/glog/glog_0.3.5.bb         |  1 +
 4 files changed, 110 insertions(+), 35 deletions(-)
 create mode 100644 meta-oe/recipes-support/glog/glog/0003-installation-path-fix.patch

