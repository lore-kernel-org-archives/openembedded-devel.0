Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id AF2746C230
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:26 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id p15so25694474eds.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Gbc0A+5OGo57qBgdoIFhCw4xefHjhcHz40alVpylRog=;
	b=bC3JrQK7qdAOvsI59u2L8z9nSslncwZTMTB82QlJUeb3wOgH3hvcIR40oArLcpNdWS
	zHqfpwnzJRgMb5wn5FcfLF9uZOqHGtsPTHfdOq96+XUgpFwFN5ClJLYbD3J4qHnu1ikr
	nn07Na+CEFuT/iaeuJBMUng6CkN7Wrg0Ov1TrDb5pkzMNEsyTTpOHIjvbtcN1RcdQCtG
	UC0m+zLI1+7dt66PTQ7SvCJeO7l4HddpN2htSBkDCv71HweUQiKe2NRRqTEj9NpnyBq0
	We+qxFQ4t9enQ22UvH/nH32fOWDj6jHnG8jkazUyT0LzKDdt/5t7ZmeUAorKpi40k/Xu
	Xebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=Gbc0A+5OGo57qBgdoIFhCw4xefHjhcHz40alVpylRog=;
	b=iKs7VMC6vhCyfkw4FsJ8mI2FeMnmqHj0lZQG295Sf7AIiXO/otDo2HrV+5zn1POQwj
	32tmNu8s9onFAk0LGN9he66RlkKU9emaAKAQxSAu6yznZvJryy0a2wLvjwnE5i0N5EEI
	OoYC3QVzuoUlva9OryDcWWdayQxNdmG5YQSp0TLTfyAicCLZQeNVhIHV9o3JmHBnpQ+r
	RAfPFSuklJ8wsG7g8MyBA45roDlLcD8xRWH8IGOVnP9TjKf/FI6Su6SGYG0/Cb5EeF2a
	JK+BifwQ+DA+ZX8MoxxzMZfif4vhYG0WwMEfrNsVH10ztGR7SybgIUcjV09g3NURP6Gh
	W62g==
X-Gm-Message-State: APjAAAU/HcgRTjHnnnHTmxx5yFEljS9IEaY3AK2P/sUgzaemZYz5+kqy
	5Ul6V0Ewq0K+2r5Evr6NbLAXOerePa4=
X-Google-Smtp-Source: APXvYqwuVXyVlab58rZ/8SyspdChF8fpMme1dceLaQotXcyVjPgHUQK3bzPuTlhhl4J9bd8KbjWzzQ==
X-Received: by 2002:a17:906:370c:: with SMTP id
	d12mr12546524ejc.140.1561449147027; 
	Tue, 25 Jun 2019 00:52:27 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:26 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:00 +0200
Message-Id: <20190625075223.13585-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 00/23] Multiple patches for multiconfig
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:26 -0000
Content-Transfer-Encoding: 8bit

Patches to build meta-java with multiconfig and aarch64.

Ricardo Ribalda Delgado (23):
  icedtea7: Add x11 as default pkgconfig
  openjd7: remove support for kerberos
  openjd8: remove support for kerberos
  classpath: Fix build with targets aarch64
  jamvm: Do not build for aarch64 targets
  cacao: Do not build for aarch64 targets
  javasqlite: Create cc tool to make libtool happy
  jdon: Fix location of S
  rxtx: Fix path of javac
  jamvm: Fix binary location for ecj-initial
  cup: Do not use all as PACKAGE_ARCH
  dbus-java: Do not use all as PACKAGE_ARCH
  rhino: Do not use all as PACKAGE_ARCH
  ca-certificates: Cannot be an allarch package
  xalan-j: Do not use all as PACKAGE_ARCH
  xom: Do not use all as PACKAGE_ARCH
  jaxen: Do not build an all PACKAGE_ARCH
  jlex: Do not build as an all PACKAGE_ARCH
  bsf: Do not build as all PACKAGE_ARCH
  poi: Do not build as all PACKAGE_ARCH
  xom: Allow re-running do_compile
  jdom: Do not use all as PACKAGE_ARCH
  dom4j: Do not use all as PACKAGE_ARCH

 .../ca-certificates-java_20180516.bb          |  2 +-
 recipes-core/cacao/cacao_1.6.1.bb             |  2 ++
 .../classpath/classpath-0.99/aarch64.patch    | 19 +++++++++++++++
 recipes-core/classpath/classpath_0.99.bb      |  1 +
 recipes-core/cup/cup_0.10k.bb                 |  1 +
 recipes-core/icedtea/icedtea7-native.inc      |  2 +-
 recipes-core/jakarta-libs/bsf_2.4.0.bb        |  4 +++-
 recipes-core/jakarta-libs/poi_3.0.bb          |  2 ++
 recipes-core/jamvm/jamvm.inc                  |  2 +-
 recipes-core/jamvm/jamvm_git.bb               |  1 +
 .../javasqlite/javasqlite_20150419.bb         |  8 ++++++-
 recipes-core/jlex/jlex_1.2.6.bb               |  2 ++
 recipes-core/openjdk/openjdk-7-common.inc     |  3 ++-
 recipes-core/openjdk/openjdk-8-cross.inc      |  2 +-
 recipes-core/rhino/rhino_1.7r4.bb             |  2 ++
 recipes-core/xalan-j/xalan-j_2.7.1.bb         |  4 +++-
 recipes-core/xml-commons/dom4j_1.6.1.bb       |  1 +
 recipes-core/xml-commons/jaxen_1.1.6.bb       |  2 ++
 recipes-core/xml-commons/jdom_1.1.3.bb        |  4 ++++
 recipes-core/xml-commons/xom_1.2.10.bb        |  9 ++++++--
 recipes-extended/dbus/dbus-java_2.7.bb        |  4 +++-
 recipes-extended/rxtx/files/javapath.patch    | 23 +++++++++++++++++++
 recipes-extended/rxtx/rxtx_2.2.0.bb           |  5 ++--
 23 files changed, 92 insertions(+), 13 deletions(-)
 create mode 100644 recipes-core/classpath/classpath-0.99/aarch64.patch
 create mode 100644 recipes-extended/rxtx/files/javapath.patch

-- 
2.20.1


