Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail.openembedded.org (Postfix) with ESMTP id 87FC87EC95
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:18:29 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id m10so7934657edv.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aB0ZAUonkXqRO4062phpxKktj3xEMk7KEUa1PAo37o4=;
	b=GUzwd0OIQk/4GV7gRBtG8rwBdDhV9IqTbsQMeM76u5ua/HPdNOuwMNwPXiAIWRbtag
	7uJQWs3YJ8v1tEpqRlyS2tBRllgwwUBB9TpfEql1EtEI5ceyxGNlC5Qas6+VdJQxEh4e
	CC/MC1b3TR4/n/oiv6qm0PB6GLiwdzmYDjPyM48Mi/rKp5RLEYsghBvaWM2Bp+AW77r8
	+gQTWzS48d5rY8/N4eqlHQQz8nn8Rq5UMqmWfKd1e7ODI/+0FLLPi/iEad1Lg5/tCElh
	JMG80MYaGkWoW/SEfqgM8jJabfqJiKiXdThuGsc8hLx0z+Wf0NNV7wvZH5e2f6Eyd9Nb
	PlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=aB0ZAUonkXqRO4062phpxKktj3xEMk7KEUa1PAo37o4=;
	b=EeTUsl/Av4eFjFw+wHz5GEExzCDQ48Lmz7hhdWE7EhUWNzFEToBJrOEG9J95TsINRG
	JIyXJQgO+EPG+qO65QWkprYHBBWGPIuQH/Om75g+718Dj8vkJA4sPjmmhb9D1WXMCHnr
	Uzi1NYMU5fOULIXiKTuIsg5IZJhnvR6ednBrD/JKerlF1duA/D0lSim5F/1bUHtpd6HH
	hqPlgtvAyhMz1uwAcewODmTdkvR9+NxSL9AKcqSu+WOFljZ0eFK+3yD6hKFrmp5muLK4
	nvH51YSEnhXahSNuEyRED8kiyGnYluU1uDjBlbo5vs6Hkx+/MoNr5qoCG0zYIQY8ndJd
	MfVA==
X-Gm-Message-State: APjAAAXkID8qeIvAFPe70/P4HfJ8HcRfTtKobzkElZzM9ovbW3pDy2FE
	KUMeMB/95fhe6H8i4EJQHm3cHmaF39A=
X-Google-Smtp-Source: APXvYqysmbxaS/VfulA0u7nu4zwXar8PSmJ/OR/siFe9SJsC2N5bdWCCY5+pL7zK3FImNI2UD2SyUA==
X-Received: by 2002:a50:9730:: with SMTP id c45mr3965656edb.196.1562325509855; 
	Fri, 05 Jul 2019 04:18:29 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.18.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:18:28 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:01 +0200
Message-Id: <20190705111824.22255-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 00/23] Multiple patches for multiconfig
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
X-List-Received-Date: Fri, 05 Jul 2019 11:18:29 -0000
Content-Transfer-Encoding: 8bit

Patches to build meta-java with multiconfig and aarch64.

v2 and v3 have been reviewed at
https://github.com/ribalda/meta-java/tree/v2
https://github.com/ribalda/meta-java/tree/v3

Richard, thanks for your patience :)


Ricardo Ribalda Delgado (23):
  icedtea7: Add missing DEPENDS
  openjdk7: Make kerberos optional through PACKAGECONFIG
  openjdk8: Make kerberos optional through PACKAGECONFIG
  classpath: Fix build with targets aarch64
  jamvm: Do not build for aarch64 targets
  cacao: Do not build for aarch64 targets
  javasqlite: Create cc tool to make libtool happy
  jdon: Fix location of S
  rxtx: Fix path of javac
  jamvm: Fix binary name for javac
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
 recipes-core/cacao/cacao_2d6f6c14daf9.bb      |  2 ++
 .../classpath/classpath-0.99/aarch64.patch    | 19 +++++++++++++++
 recipes-core/classpath/classpath_0.99.bb      |  1 +
 recipes-core/cup/cup_0.10k.bb                 |  1 +
 recipes-core/icedtea/icedtea7-native.inc      |  3 ++-
 recipes-core/jakarta-libs/bsf_2.4.0.bb        |  4 +++-
 recipes-core/jakarta-libs/poi_3.0.bb          |  2 ++
 recipes-core/jamvm/jamvm.inc                  |  5 +++-
 recipes-core/jamvm/jamvm_git.bb               |  1 +
 .../javasqlite/javasqlite_20150419.bb         |  8 ++++++-
 recipes-core/jlex/jlex_1.2.6.bb               |  2 ++
 recipes-core/openjdk/openjdk-7-common.inc     |  4 +++-
 recipes-core/openjdk/openjdk-8-cross.inc      |  4 +++-
 recipes-core/rhino/rhino_1.7r4.bb             |  2 ++
 recipes-core/xalan-j/xalan-j_2.7.1.bb         |  4 +++-
 recipes-core/xml-commons/dom4j_1.6.1.bb       |  1 +
 recipes-core/xml-commons/jaxen_1.1.6.bb       |  2 ++
 recipes-core/xml-commons/jdom_1.1.3.bb        |  4 ++++
 recipes-core/xml-commons/xom_1.2.10.bb        | 14 +++++++++--
 recipes-extended/dbus/dbus-java_2.7.bb        |  5 +++-
 recipes-extended/rxtx/files/javapath.patch    | 23 +++++++++++++++++++
 recipes-extended/rxtx/rxtx_2.2.0.bb           |  5 ++--
 23 files changed, 105 insertions(+), 13 deletions(-)
 create mode 100644 recipes-core/classpath/classpath-0.99/aarch64.patch
 create mode 100644 recipes-extended/rxtx/files/javapath.patch

-- 
2.20.1


