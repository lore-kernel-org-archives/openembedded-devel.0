Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1TQhQL-0007RF-IU
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 18:33:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9NGKLAr023231
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2012 09:20:21 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 23 Oct 2012 09:20:21 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Oct 2012 12:20:17 -0400
Message-ID: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [meta-oe][meta-networking][PATCH V2 0/3] ntp updates
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
X-List-Received-Date: Tue, 23 Oct 2012 16:33:50 -0000
Content-Type: text/plain

are available in the git repository at:

  git@github.com:morganlittle/meta-oe.git ntp

Morgan Little (3):
      ntp: Move from meta-oe to meta-networking
      ntp: Uprev from 4.2.6p3 to 4.2.6p5
      ntp: Clean up recipes

 .../recipes-support/ntp/files/ntp                  |    0
 .../ntp/files/ntp-4.2.4_p6-nano.patch              |    0
 .../recipes-support/ntp/files/ntp.conf             |    0
 .../recipes-support/ntp/files/ntpd                 |    0
 .../recipes-support/ntp/files/ntpdate              |    0
 .../recipes-support/ntp/files/tickadj.c.patch      |    0
 .../recipes-support/ntp/ntp-ssl_4.2.6p5.bb         |   10 +++
 meta-networking/recipes-support/ntp/ntp.inc        |   74 ++++++++++++++++++++
 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |    4 +
 meta-oe/recipes-support/ntp/ntp-ssl_4.2.6p3.bb     |   11 ---
 meta-oe/recipes-support/ntp/ntp.inc                |   35 ---------
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb         |   47 ------------
 12 files changed, 88 insertions(+), 93 deletions(-)
 rename {meta-oe => meta-networking}/recipes-support/ntp/files/ntp (100%)
 rename {meta-oe => meta-networking}/recipes-support/ntp/files/ntp-4.2.4_p6-nano.patch (100%)
 rename {meta-oe => meta-networking}/recipes-support/ntp/files/ntp.conf (100%)
 rename {meta-oe => meta-networking}/recipes-support/ntp/files/ntpd (100%)
 rename {meta-oe => meta-networking}/recipes-support/ntp/files/ntpdate (100%)
 rename {meta-oe => meta-networking}/recipes-support/ntp/files/tickadj.c.patch (100%)
 create mode 100644 meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
 create mode 100644 meta-networking/recipes-support/ntp/ntp.inc
 create mode 100644 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
 delete mode 100644 meta-oe/recipes-support/ntp/ntp-ssl_4.2.6p3.bb
 delete mode 100644 meta-oe/recipes-support/ntp/ntp.inc
 delete mode 100644 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb


