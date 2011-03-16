Received: from na3sys009aog106.obsmtp.com ([74.125.149.77])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PzuPf-0004Gy-Vn
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 18:21:36 +0100
Received: from source ([209.85.210.170]) (using TLSv1) by
	na3sys009aob106.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTYDxOE6dUNNTBpccvlxGKf9PtMYhcnHR@postini.com;
	Wed, 16 Mar 2011 10:19:55 PDT
Received: by mail-iy0-f170.google.com with SMTP id 12so2312858iyb.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 10:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=F52IMYZAiAdhmC8psy2WV0RpLGdVW6RqTmb1mxURiFA=;
	b=GC/CKRuGDt4knYnN5KRUbcY8LJcAH96Bp99u3bRydrmmIi4kVE/F0co03bPvxEQcK4
	QoaDBesu9Ee+lR5ANyneDnAIeOcJR8fxqKWX9fmMQF9fQt3s6Nm6N/ZU5JoIIBXJGi1q
	nH891iIV8gHVd9gLt9d3aN+tnp2ixXP+LhvTA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:subject:date:message-id:x-mailer;
	b=c2onDFiDDmi/JVNPF61+5OrxaN75BZxO7tn8SBV15HWCPYjOwIcAoDwkmUKFEz1REi
	RoJ2VO1S2cap6/7pVytSpvpNd3vfcfAmkTtRLM77NgO142kAHfPf9V22S3H9QYq8FN+1
	OmO2g1htNd9T/xgEWyv75YOChWuRWm5AWsfSA=
Received: by 10.42.134.136 with SMTP id l8mr292087ict.307.1300294243557;
	Wed, 16 Mar 2011 09:50:43 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id q34sm39593ibu.40.2011.03.16.09.50.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 09:50:42 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 12:50:33 -0400
Message-Id: <cover.1300293663.git.bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
Subject: [2010.03-maintenance] [PATCH 0/7] 2010.03-maintenance: libc-headers, gdbserver and ubifs
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
X-List-Received-Date: Wed, 16 Mar 2011 17:21:36 -0000

This series is cherry-picks of commits made to org.openembbed.dev; libc-headers
and gdbserver fixes for external toolchain and ubifs image filenames.

The changes are also available at git://github.com/BenGardiner/oe-dev.git branch
upstream/oe/releases/2011.03-maintenance/features/BenGardiner/backport-ubifs-links

I've only tested build of hello-worldimage with externa-toolchain and
Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   =
"upstream/oe/releases/2011.03-maintenance/features/BenGardiner/backport-ubifs-links"
METADATA_REVISION = "64d4245"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "da850-omapl138-evm"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2011.03"
TARGET_FPU        = "soft"

Ben Gardiner (4):
  image.bbclass: add link to .rootfs.<type> or .<type>.img
  bitbake.conf: use .ubifs.img extension in IMAGE_CMD_ubi
  external-toolchain: allow override of linux-libc-headers provider
  external-toolchain-csl: allow linux-libc-headers

Denys Dmytriyenko (2):
  external-toolchain-csl: handle packaging of gdbserver based on
    PREFERRED_PROVIDER
  toolchain-external.conf: set the default provider for gdbserver

Tom Rini (1):
  external-toolchain-csl: Drop do_stage, add gdbserver

 classes/image.bbclass                      |    6 +++-
 conf/bitbake.conf                          |    2 +-
 conf/distro/include/toolchain-external.inc |    3 +-
 recipes/meta/external-toolchain-csl.bb     |   45 ++++++++++++++++------------
 4 files changed, 34 insertions(+), 22 deletions(-)



