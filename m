Return-Path: <pieterg@gmx.com>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 06 Oct 2014 10:34:45 UTC
Received: from smtp-3.concepts.nl (smtp-3.concepts.nl [213.197.30.127])
	by mail.openembedded.org (Postfix) with ESMTP id F1644712FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Oct 2014 10:34:45 +0000 (UTC)
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl)
	by smtp-3.concepts.nl with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80.1) (envelope-from <pieterg@gmx.com>)
	id 1Xb5OF-0008us-O0; Mon, 06 Oct 2014 12:19:39 +0200
Received: from laptoppieter.wielewaal (laptoppieter.wielewaal [10.9.0.58])
	by mx1.grimmerink.nl (Postfix) with ESMTP id F18AE6A13C;
	Mon,  6 Oct 2014 12:20:14 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Oct 2014 12:18:46 +0200
Message-Id: <1412590726-577-1-git-send-email-pieterg@gmx.com>
X-Mailer: git-send-email 1.7.9.5
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1Xb5OF-0008us-O0
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
Subject: [meta-oe][PATCH] openvpn: use default iproute2 path
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
X-List-Received-Date: Mon, 06 Oct 2014 10:34:50 -0000

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
index 48e04b7..53801cb 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
@@ -18,7 +18,6 @@ CFLAGS += "-fno-inline"
 # I want openvpn to be able to read password from file (hrw)
 EXTRA_OECONF += "--enable-password-save --enable-iproute2"
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'pam', '', '--disable-plugin-auth-pam', d)}"
-EXTRA_OECONF += "IPROUTE=/bin/ip"
 
 do_install_append() {
     install -d ${D}/${sysconfdir}/init.d
-- 
1.7.9.5


