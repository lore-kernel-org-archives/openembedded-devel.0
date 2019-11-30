Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 548407F7BB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:10:48 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id k25so193493pgt.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NGcdrlzWEQcB8nVQtvOPVMcZ+XeBSl+mvXEnGoZwH1I=;
	b=L1C44ClXuMfGZ5Rl3ZwS9jy/O1RNvMBVpxQc5E0WOp17TA5ZGusKblTr/UZKnyOqr4
	N5Hu5Reekd4ipXvWEX5zBzMYU9Z/7S3IazMit411BHN0wVEzjaTmWSkAaFBCqaDWy3qV
	NM1DgZrrr2wD2NtncsI/MGmee5+R0wXT7QTyPfMZvza8rciTJEEKdJpGUr1Hlx2P/1OS
	04X19YdaVip1oExjOLjTFRs3Ku88Pfxjgh92MGqiar+nGZIuwfP95aon+Bmrif59Ba+B
	1Jt2NcXkQQb7mHy9xdFtMO/P54bcylx8StXHCty1jhg8XZHrqt/WOthvwSbN5tObZmLS
	8WRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NGcdrlzWEQcB8nVQtvOPVMcZ+XeBSl+mvXEnGoZwH1I=;
	b=mqw/a+5Ukbmfekwbv4sRb6PIKsJMwunQxmxV4Fsw4O6dvyfQvkRohtvscJrzJ3eLdA
	5Gp2aPVTEmZIYegVa/XmubDi7DTraAcKpl6jDvBsqI+hiAjgR/Hvt7QLjwOuk1QrMjkY
	Gr4fewerdvtdVIKmBhynGEJPMNLhyDBoQHpFwH64D3WM6RE7QObThaQPm6chWa4T9iP5
	XkB+wzAOWeXTxaxT1lb1NDvD8OT748OquVBtIj5/PRCSPGrejMKyQ/6tSUTSDTneNRod
	HSUo2v+M665nUkVToaD5Ed0xqsf/GRD7hxQEATejcH1drOvMoFC8FTMKJRbaie7NIzfK
	N0RQ==
X-Gm-Message-State: APjAAAUeiuCN25LDzyis+rbnZb3Kzh8d4Pbhn81dWCioRZy88oXECnkG
	FgAc7bD4wqz1mUztWQQZ0Lq1R3dy
X-Google-Smtp-Source: APXvYqzTaogTgRcgWD6tv0LRGekAbeDG1VhWs3eE2yCRlIcP5SrUF5+keG9aljsRE/esFiEdvgJBOQ==
X-Received: by 2002:a63:e648:: with SMTP id p8mr22885065pgj.259.1575137449024; 
	Sat, 30 Nov 2019 10:10:49 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.10.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:10:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:30 -0800
Message-Id: <cover.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/15] Zeus patch review
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
X-List-Received-Date: Sat, 30 Nov 2019 18:10:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please have comments back by Tuesday

The following changes since commit aad5b3d070cd8c58828b0975cf861d8ebc90f460:

  README: updated Maintainers list for Zeus (2019-10-30 14:16:04 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/zeus-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/zeus-nut

Andreas Oberritter (1):
  samba: fix installation for minimal build

Hongxu Jia (1):
  python-more-itertools.inc: fix python2 package not incorrectly
    generated

Khem Raj (1):
  rsyslog: Dont force enable atomic builtins on mips

Michael Scott (1):
  modemmanager: Upgrade 1.10.6 -> 1.10.8

Slater, Joseph (1):
  php: fix CVE-2019-11043

Stefan Wiehler (1):
  nvme-cli: defer host ID generation to post installation

Trevor Gamblin (3):
  rsyslog: fix CVE-2019-17041
  rsyslog: upgrade from v8.1908.0 to v8.1910.0
  quagga: fix PIDFile path for service files

Yi Zhao (2):
  samba: upgrade 4.10.8 -> 4.10.10
  freeradius: fix CVE-2019-10143

Zheng Ruoqin (2):
  mariadb: upgrade 10.3.16 -> 10.3.18
  wireshark: upgrade 3.0.3 -> 3.0.6

niko.mauno@vaisala.com (2):
  gitpkgv.bbclass: Use --git-dir option
  gitpkgv.bbclass: Support also lightweight tags

 ...-to-radiusd-user-group-when-rotating-logs.patch | 104 +++++++++++++++++++++
 .../freeradius/freeradius_3.0.19.bb                |   1 +
 .../samba/{samba_4.10.8.bb => samba_4.10.10.bb}    |  20 ++--
 .../recipes-protocols/quagga/files/bgpd.service    |   4 +-
 .../recipes-protocols/quagga/files/ospf6d.service  |   4 +-
 .../recipes-protocols/quagga/files/ospfd.service   |   4 +-
 .../recipes-protocols/quagga/files/ripd.service    |   4 +-
 .../recipes-protocols/quagga/files/ripngd.service  |   4 +-
 .../recipes-protocols/quagga/files/zebra.service   |   4 +-
 .../{wireshark_3.0.3.bb => wireshark_3.0.6.bb}     |   4 +-
 meta-oe/classes/gitpkgv.bbclass                    |  15 ++-
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb       |   5 +-
 ...demmanager_1.10.6.bb => modemmanager_1.10.8.bb} |   4 +-
 ...native_10.3.16.bb => mariadb-native_10.3.18.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc              |   4 +-
 .../{mariadb_10.3.16.bb => mariadb_10.3.18.bb}     |   0
 .../recipes-devtools/php/php/CVE-2019-11043.patch  |  38 ++++++++
 meta-oe/recipes-devtools/php/php_7.3.9.bb          |   1 +
 .../rsyslog/rsyslog/0001-Out-of-bounds-issue.patch |  31 ------
 .../{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb}   |   6 +-
 .../python/python-more-itertools.inc               |   2 -
 21 files changed, 186 insertions(+), 73 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.8.bb => samba_4.10.10.bb} (95%)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.0.3.bb => wireshark_3.0.6.bb} (95%)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.10.6.bb => modemmanager_1.10.8.bb} (92%)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.16.bb => mariadb-native_10.3.18.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.16.bb => mariadb_10.3.18.bb} (100%)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2019-11043.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb} (97%)

-- 
2.7.4


