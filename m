Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 169EC7CBDF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 19:01:25 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id w18so18402760wrt.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 11:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qZy+Mv+aQhXdADKhGYYnoP6nDmdxUC+apNgxZVp9SLI=;
	b=LeJdCbOjUdticzOmdS/zLV7mluOTXMobKE/KDtedGZOYBrUm9g9kCXVrK6uGXUxog6
	vux4doxwt1sL+oXqvFuoCSX1OL+f41Iximwu/+blDPPQhDpBToQ1jKmqmb7ZqinAHww2
	syxVMiUVAB+ngvB7ONpJxDFho5Yz0GMOJGoZ0LtPKa6Qd8L5GenI/v0L4xBS83N7+gwa
	NnflWNOZINd3kXsHZ9GE16uoW17uPQEgKDn2zEoriTrVdItXarLGAA0VGo9DNg2wC8d+
	1fNbZa0KiwUU5XG0GcepQUw3xGoiQnkbVXfVMfpdkqyIZx8FRpeQB+OC7aotBkdETMHJ
	dhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qZy+Mv+aQhXdADKhGYYnoP6nDmdxUC+apNgxZVp9SLI=;
	b=HGIx4pvgFcISyW/r+DhVCMXD2z+zoVWkRNG1CFPNJNfBSvK/qm1TzKTC3QfJJ6rTYk
	T3uMKCw338VOGhhhElWtiWH7RohUWd2yFQZRvWjzQhZOWyr3XjIM/cZptTx3NBG2WowN
	rgStDL/hFB9CYhn+kECoCXCYhfpcy2TnX2TKLoXl/gUMjSkCZHW71/RpuRyBmotSnscD
	aKRJSWvMLYGreogbaoBiCLPo4jM4DNlnYCtxvw/0fMIVE1PH9oi/o826l9rzOAHaUuLB
	OG/gPaEdCDxW+ARBiq3qnw3yoFzWTM0N8U3PXgCA/Zjm0208FR7jy3haGH1DjwMJit64
	5XGQ==
X-Gm-Message-State: APjAAAXqmnk8H3PZY43d4lf6Pd4MxtPeKTSz2lDAIcu6rGn5l4Wxkf/e
	J9Kihw2ituLgst6EEh9QYgo84Bd8
X-Google-Smtp-Source: APXvYqz9h58VEPnYohjB5iJdJXCcbLcPBbCP2FUsZu7vo1SJq+78+bPdVnRvf/7rTnavV21qT8AQ5g==
X-Received: by 2002:a5d:6412:: with SMTP id z18mr14149834wru.30.1572894086455; 
	Mon, 04 Nov 2019 11:01:26 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F438C365CAC9282E0012A3C.dip0.t-ipconnect.de.
	[2003:f0:7f43:8c36:5cac:9282:e001:2a3c])
	by smtp.gmail.com with ESMTPSA id
	u21sm21916069wmu.27.2019.11.04.11.01.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 11:01:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Nov 2019 20:01:12 +0100
Message-Id: <20191104190114.5076-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 0/2] mm-common follow-ups
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
X-List-Received-Date: Mon, 04 Nov 2019 19:01:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To avoid another rebasing dance I sent out 'upgrade 0.9.12 -> 1.0.0 / meson
build / add SUMMARY' in a hurry.
Since hurry has never been a good idea I decided to look into mm-common
again and found:

Andreas Müller (2):
  mm-common: do really build with meson
  mm-common: build for allarch

 ...ot-ask-for-python-installation-versi.patch | 41 +++++++++++++++++++
 .../recipes-core/mm-common/mm-common_1.0.0.bb |  9 ++--
 2 files changed, 45 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do-not-ask-for-python-installation-versi.patch

-- 
2.21.0


