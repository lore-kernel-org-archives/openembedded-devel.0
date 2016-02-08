Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 Feb 2016 11:13:20 UTC
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id A8CC56E268
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2016 11:13:20 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 685666865; Mon, 08 Feb 2016 05:58:19 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aSjWI-000GrK-IU; Mon, 08 Feb 2016 10:58:14 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aSjWI-00026y-H0; Mon, 08 Feb 2016 10:58:14 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2016 10:57:49 +0000
Message-Id: <1454929083-2966-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 00/14] Prepare for EXTRA_OEMAKE = "" in oe-core bitbake.conf
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
X-List-Received-Date: Mon, 08 Feb 2016 11:13:22 -0000

This series fixes various recipes that rely on the current default
value of EXTRA_OEMAKE = "-e MAKEFLAGS=" to explicitly set that value
in the hope that bitbake.conf can set EXTRA_OEMAKE = "" in the future.

The affected recipes are:

 meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
 meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
 meta-networking/recipes-daemons/squid/squid_3.5.7.bb
 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
 meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
 meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.7.2.bb
 meta-networking/recipes-support/pimd/pimd_2.1.8.bb
 meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
 meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
 meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
 meta-oe/recipes-extended/efivar/efivar_0.21.bb
 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
 meta-oe/recipes-extended/sysdig/sysdig_git.bb
 meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
 meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
 meta-oe/recipes-support/ckermit/ckermit_302.bb
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
 meta-oe/recipes-support/mg/mg_20110905.bb
 meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
 meta-oe/recipes-support/uim/uim_1.8.6.bb

Mike.

