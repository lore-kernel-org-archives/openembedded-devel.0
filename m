Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Aws.Ismail@windriver.com>) id 1UK9c2-0002iT-3R
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Mar 2013 16:47:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2PFU7MT012776
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2013 08:30:07 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.212) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 25 Mar 2013 08:30:06 -0700
From: Aws Ismail <aws.ismail@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Mar 2013 11:30:05 -0400
Message-ID: <1364225407-13263-1-git-send-email-aws.ismail@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: joe.macdonald@windriver.com
Subject: [meta-networking][PATCH 0/2][V3] Quagga: deal with snmp support, and some cleanup.
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
X-List-Received-Date: Mon, 25 Mar 2013 15:47:23 -0000
X-List-Received-Date: Mon, 25 Mar 2013 15:47:23 -0000
Content-Type: text/plain


*** V3 ***
Cleanup whitespaces and hardtabs
This is made a separate new commit
*** V3 ***

Overall, this commit introduces a set of changes to do the following:

1. Update the configure option for quagga to replace the old --enable-tcp-md5
2. Add snmp support based on DISTRO_FEATURES availability.
3. Install sample runtime configuration files for quagga and its daemons.
4. Make sure the post install script is executed at the right stage.

Aws Ismail (2):
  Quagga has no snmp support, unrecognized options --enable-tcp-md5
  Quagga: clean up whitespaces/hardtabs in recipe

 .../recipes-protocols/quagga/quagga.inc            |   71 ++++++++++++--------
 1 files changed, 43 insertions(+), 28 deletions(-)



