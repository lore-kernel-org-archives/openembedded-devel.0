Return-Path: <misn@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 478FE65F99
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 13:07:26 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 13 May 2014 15:07:21 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4351)	id 301202800C6;
	Tue, 13 May 2014 15:07:21 +0200 (CEST)
From: Mihaela Sendrea <mihaela.sendrea@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 May 2014 15:07:17 +0200
Message-ID: <1399986439-6925-1-git-send-email-mihaela.sendrea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: mihaela.sendrea@enea.com does not
	designate permitted sender hosts)
Subject: [meta-networking][PATCH v4 0/2] netperf: enable SCTP support
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
X-List-Received-Date: Tue, 13 May 2014 13:07:29 -0000
Content-Type: text/plain

Hi Martin and Paul,

Thank you for the help, I have cleaned the recipes now, but unfortunatelly I
could not reproduce the build error you reported on lksctp-tools. I hope this
version is ok now...

Best regards,


Mihaela Sendrea (2):
  lksctp-tools: add recipe (version 1.0.16)
  netperf: enable SCTP support

 .../lksctp-tools/lksctp-tools_1.0.16.bb            | 57 ++++++++++++++++++++++
 .../recipes-support/netperf/netperf_2.6.0.bb       |  5 ++
 2 files changed, 62 insertions(+)
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb

-- 
1.8.5.3


