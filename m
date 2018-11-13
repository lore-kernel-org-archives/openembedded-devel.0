Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id F2D04605BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 05:08:51 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 2AB8E220285;
	Tue, 13 Nov 2018 18:08:50 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Nov 2018 18:08:33 +1300
Message-Id: <20181113050835.3129-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH 0/2] ntp: Reproducible build
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
X-List-Received-Date: Tue, 13 Nov 2018 05:08:52 -0000

I have marked the "Use fixed path to posix shell" patch as submitted upstream,
but I have only raised an issue on the ntp project, asking for advice on an approach.
This patch does the job for OE, but isn't appropriate in its current form for upstream.

The "Respect SOURCE_DATE_EPOCH" patch has been submitted upstream in this form.

Douglas Royds (2):
  ntp: Reproducible build: Respect SOURCE_DATE_EPOCH
  ntp: Reproducible build: Use fixed path to posix shell

 ...producibility-fixed-path-to-posix-shell.patch | 15 +++++++++++++++
 ...producibility-respect-source-date-epoch.patch | 16 ++++++++++++++++
 .../recipes-support/ntp/ntp_4.2.8p12.bb          |  2 ++
 3 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch
 create mode 100644 meta-networking/recipes-support/ntp/ntp/reproducibility-respect-source-date-epoch.patch

-- 
2.17.1


