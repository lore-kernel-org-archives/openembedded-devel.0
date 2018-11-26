Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 18998600BC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 16:03:24 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id t13so6354302pgr.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 08:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:from:date:subject:to;
	bh=KHZfHErt7lxeyHohccGU2wabZpiom+ZX5ZH+L05R3xw=;
	b=nJHPTsUBpOKMecw7Bo4YXoTSt/GDn/zvHMzqGY3paW3VhDIGUM87IybLw7hkTLrsHL
	XQCqJ0f+nY2f60SS5RuR3M2J/zXZXskcSzY9wvFul72Tobd796dMtBHIkmaDuMdWwOnt
	8OOo8iv6XWe4OtXWWEG5ACZE1xReuDBCAF/lRJzZhMNKjHO+J3w5qoBpACpIv5tAskPN
	4tWmwqwbayJKkkmk3WJdTsIaGfGZdu7xhjaWuZgdrgheKglG5TFhHAKDZY5pMWUNIfM8
	ZYuXr4UJXUQOpZV5WX3mdvZMtLWBytLxErBtDIf8iQlPuvJilIfOxCxvigJj8sYjc9Rs
	V5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:from:date:subject:to;
	bh=KHZfHErt7lxeyHohccGU2wabZpiom+ZX5ZH+L05R3xw=;
	b=naCljkkWsmv6q30T//2gF6a3FPIHl9K+N6Py9ohnmqmFIiZjxcsJRzIW9mRMuQtZqE
	CN6UGE6qFckFj/87p8am4J5QScuesjQ12PYf3SbAhAYDphL2nQJIteeui8ClbF28Dytr
	Ju3mBaP2UFkZwOzfvc8aqjUxKJo+rV/aocz+X8DSw2fOeDLR9V5EjXfTZPipd9RzFoa8
	0qeUTniPfbbERxtvi2UJoffDZDhqbxkm88Dw0lL2FSizf3eWavuCtMbV2YHkp9WKrIFI
	ey2yhPTqbw05q7rLIxjcVgxfwdbs3aVe2eOcLc/OoL50ywIYF1yQwHF9p+++noXfqR3f
	H1rA==
X-Gm-Message-State: AGRZ1gI7hIVPU5lDzU+ce3WhBLolA4N9TKqVgmZ5ODvqxtY3tdzbgdYg
	j9QCDPWpuoUTTuVTrT5z0hp7jXAB
X-Google-Smtp-Source: AJdET5eIubApUC0TmXKPB/eZ9XwJaG0sw/k9RtHR0r4CmW74NkV0SljQdhcqL5OE3lZDtf8G5+T6Sw==
X-Received: by 2002:a62:5bc7:: with SMTP id
	p190-v6mr28675369pfb.175.1543248205949; 
	Mon, 26 Nov 2018 08:03:25 -0800 (PST)
Received: from akuster-ThinkPad-T460s (174-24-96-92.clsp.qwest.net.
	[174.24.96.92]) by smtp.gmail.com with ESMTPSA id
	b26sm2919322pfe.91.2018.11.26.08.03.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 08:03:25 -0800 (PST)
Message-ID: <5bfc194d.1c69fb81.f2c17.56e4@mx.google.com>
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: "Armin Kuster" <akuster@akuster-ThinkPad-T460s>
Received: by akuster-ThinkPad-T460s (sSMTP sendmail emulation);
	Mon, 26 Nov 2018 09:03:23 -0700
Date: Mon, 26 Nov 2018 09:03:23 -0700
To: <openembedded-devel@lists.openembedded.org>
X-Mailer: mail (GNU Mailutils 2.99.99)
Subject: sumo][Pull request
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
X-List-Received-Date: Mon, 26 Nov 2018 16:03:25 -0000

The following changes since commit 2bb21ef27c4b0c9d52d30b3b2c5a0160fd02b966:

  poppler: Update to 0.64 (2018-09-27 08:49:10 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded sumo-next

for you to fetch changes up to 8760facba1bceb299b3613b8955621ddaa3d4c3f:

  wireshark: 2.4.8 src moved to all-versions (2018-11-26 08:48:11 -0700)

----------------------------------------------------------------
Armin Kuster (4):
      boinc: refresh patches
      postgresql: update to 9.4.20
      sblim-sfc-common: use official SPDX license for EPL
      wireshark: 2.4.8 src moved to all-versions

Gregory Vimont (1):
      tbb: check the version of the cross gcc instead of host gcc

Leon Anavi (1):
      rygel: Update license to LGPLv2.1

Richard Purdie (1):
      xmlstarlet: Disable PARALLEL_MAKE (again)

 .../recipes-connectivity/rygel/rygel_0.34.0.bb     |  2 +-
 .../recipes-support/wireshark/wireshark_2.4.8.bb   |  2 +-
 ...0001-Use-pkg-config-for-libxml2-detection.patch |  8 +--
 .../postgresql/files/not-check-libperl.patch       | 10 ++--
 .../{postgresql_9.4.17.bb => postgresql_9.4.20.bb} |  4 +-
 .../boinc/boinc-client/boinc-AM_CONDITIONAL.patch  | 12 +++--
 .../sblim-sfc-common/sblim-sfc-common_1.0.1.bb     |  2 +-
 meta-oe/recipes-support/tbb/tbb.bb                 |  1 +
 .../tbb/tbb/0002-linux-Fix-gcc-version-check.patch | 57 ++++++++++++++++++++++
 .../recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb |  5 ++
 10 files changed, 84 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_9.4.17.bb => postgresql_9.4.20.bb} (63%)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch

