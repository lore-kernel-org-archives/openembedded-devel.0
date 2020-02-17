Return-Path: <prvs=3095e736d=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id E19A66004E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 08:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1581926481; x=1613462481;
	h=date:from:to:cc:subject:message-id:mime-version:
	content-transfer-encoding;
	bh=G7EOmzDcFeDbzyPAhNoOorrpBkj7JmhpyEGF8piTZ98=;
	b=H57OHMkfOjdeOvx5a9cvFAavHXCwhypWaHEoEbWpcUTiB4nPnrjg+OfB
	ZUOVqEwlFFvBHTjrX8fZ2sNbn4bf39dQrbqXnFgPr4RaI2DNp6vpyEZHp
	iIwdugqiNeaAF5weE7lLYg2N1rnG0THc2q24eEjec5+9WFt1+zo58pvas
	/9GKbrJz6qgyoYb/h0ErLtr9d2mrbhSrzWsmj5xAFbrw8lli3J2r6JEjw
	cNRPT2/l+qussi1POkcRbBG04frhIjTYnMC2CtuwFkXXmG6WfFs8Wxtoe
	cXbQsu7BeVMMB0FT0eybOTG2/rq8xb0NeD55wqMpgpLrhTmHZ/jgCunYM w==;
IronPort-SDR: SC63pQ3PdZP0JkNqcOeKC0FRYvZMOvVziviWhrattRkvZcEa/YqLtozBDc+aRYvZsEpiRkj9Lm
	TSPD5ljI4RbYgXQM7DRzWO2+pwPqVcgK26KpjRWE190e+51h9+Vo/yERL4/XwYDTxmcCCtXDiW
	x7N/XcphRmYyT6BLjRhJBlPcFd+FwFU+Rs7lH9g3eEV0Fb9nsKhTaXLjF+dmSqLBuP1xyAU63h
	Dj6BJzA0HZ6eqCeVJvNz3oixYWUdfBbLnmPW1E3i2xGPHnQx2Mg0ZDh9l+sg024YM9B+F1xvHA
	RVE=
X-IronPort-AV: E=Sophos;i="5.70,451,1574118000"; 
   d="scan'208";a="2522183"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20200217080119.GA9635@pcleri>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
X-Mailman-Approved-At: Fri, 20 Mar 2020 18:44:17 +0000
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@jci.com>,
	Marek Belisko <marek.belisko@open-nandra.com>
Subject: [meta-java] changes pushed to master
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
Date: Mon, 17 Feb 2020 08:01:20 -0000
X-Original-Date: Mon, 17 Feb 2020 09:01:19 +0100
X-List-Received-Date: Mon, 17 Feb 2020 08:01:20 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit


Hi,
this is a note to let you know that I've just pushed the following
changes to the master branch of the meta-java repository at
     git://git.yoctoproject.org/meta-java


Alex Kiernan (1):
      recipes: rename distro_features_check to features_check

André Draszik (1):
      remove True option to getVar calls

Davis, Michael (1):
      java.bbclass: oe_makeclasspath does nothing without -s

Jacob Kroon (2):
      cacao: Use python3 in java wrapper script
      openjdk-8: Don't set TOPDIR bitbake variable

Kraag Gorim (2):
      java-library: inherit python native
      icedtea7-native: inherit python native

Kyle Russell (1):
      icedtea7-native: set default x11 PACKAGECONFIG from DISTRO_FEATURES

Marek Belisko (1):
      jamvm: Disable inlining

Mohamad Noor Alim Hussin (1):
      class/java-native: remove

Richard Leitner (8):
      icedtea7-native: add patch to fix friend declaration of prefix_relocInfo
      icedtea7-native: use openjdk build helper functions
      java.bbclass: remove bashism in comparison
      README: mention dependency on meta-poky for oeqa image testing
      layer.conf: add LAYERDEPENDS for openembedded-layer aka meta-oe
      icedtea7-native: add patch to fix xattr include path
      openjdk-7: add patch to fix xattr include path
      openjdk-8: update to latest ga version 242

Wenlin Kang (1):
      openjdk-8: fix a random crash on JNI_CreateJavaVM


If you have any questions, please let me know.

regards;rl

