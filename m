Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Aws.Ismail@windriver.com>) id 1UIktj-0005lF-NR
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 20:11:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2LIsfnW024228
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 11:54:41 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.212) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 21 Mar 2013 11:54:42 -0700
From: Aws Ismail <aws.ismail@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Mar 2013 14:54:40 -0400
Message-ID: <1363892081-14280-1-git-send-email-aws.ismail@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: joe.macdonald@windriver.com
Subject: [meta-networking][PATCH 0/1] Quagga has no snmp support, unrecognized options --enable-tcp-md5
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
X-List-Received-Date: Thu, 21 Mar 2013 19:11:49 -0000
X-List-Received-Date: Thu, 21 Mar 2013 19:11:49 -0000
Content-Type: text/plain

This commit introduces a set of changes to do the following:

1. Update the configure option for quagga to replace the old --enable-tcp-md5
2. Add snmp support based on DISTRO_FEATURES availability.
3. Install sample runtime configuration files for quagga and its daemons.
4. Make sure the post install script is executed at the right stage.

Aws Ismail (1):
  Quagga has no snmp support, unrecognized options --enable-tcp-md5

 .../recipes-protocols/quagga/quagga.inc            |   23 ++++++++++++++++---
 1 files changed, 19 insertions(+), 4 deletions(-)



