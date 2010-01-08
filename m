Received: from emailgateway.hillcrestlabs.com ([12.173.51.132])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Phil.Black@hillcrestlabs.com>) id 1NTMCM-0004dJ-Ry
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 22:16:50 +0100
X-AuditID: 0a1e000a-b7b8cae000000d7b-e4-4b47a03facc7
From: Phil Black <phil.black@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 08 Jan 2010 16:14:39 -0500
Message-ID: <1262985279.3445.2.camel@pblack-ubuntu>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Phil.Black@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: small fix for u-boot on DM365 DVM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jan 2010 21:16:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The machine conf for the davinci dm365 EVM board was wrong.  This patch
fixes it.

diff --git a/conf/machine/dm365-evm.conf b/conf/machine/dm365-evm.conf
index 1fd5123..5a51616 100644
--- a/conf/machine/dm365-evm.conf
+++ b/conf/machine/dm365-evm.conf
@@ -5,4 +5,4 @@
 require conf/machine/include/davinci.inc
 require conf/machine/include/dm365.inc
=20
-UBOOT_MACHINE =3D "davinci_dm365evm_config"
+UBOOT_MACHINE =3D "davinci_dm365_evm_config"




