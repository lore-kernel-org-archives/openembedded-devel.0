Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D43EC74D2B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 07:54:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4P7sul2023590
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 May 2018 00:54:56 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 25 May 2018 00:54:55 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Fri, 25 May 2018 15:54:41 +0800
Message-ID: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 00/12] add UPSTREAM_CHECK_URI for recipes
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
X-List-Received-Date: Fri, 25 May 2018 07:54:58 -0000
Content-Type: text/plain

Some recipes can not get upstream version with bitbake foo -c checkpkg. Add UPSTREAM_CHECK_URI for these.

Yi Zhao (12):
  ntop: add UPSTREAM_CHECK_URI
  geoip-perl: add UPSTREAM_CHECK_URI
  ipvsadm: add UPSTREAM_CHECK_URI
  net-snmp: add UPSTREAM_CHECK_URI
  netkit-telnet: add UPSTREAM_CHECK_URI
  ebtables: add RECIPE_UPSTREAM_VERSION
  dlm: add UPSTREAM_CHECK_URI
  vsftpd: add UPSTREAM_CHECK_URI
  vblade: add UPSTREAM_CHECK_URI
  autofs: add UPSTREAM_CHECK_URI
  vlan: add UPSTREAM_CHECK_URI
  rdist: add UPSTREAM_CHECK_URI

 meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb        | 3 +++
 meta-networking/recipes-connectivity/vlan/vlan_1.9.bb            | 3 +++
 meta-networking/recipes-daemons/autofs/autofs_5.1.2.bb           | 2 ++
 meta-networking/recipes-daemons/vblade/vblade_22.bb              | 2 ++
 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb           | 3 +++
 meta-networking/recipes-extended/dlm/dlm_4.0.2.bb                | 3 +++
 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb     | 9 +++++++++
 .../recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb           | 3 +++
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb     | 3 +++
 meta-networking/recipes-support/geoip/geoip-perl_1.50.bb         | 3 +++
 meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb          | 2 ++
 meta-networking/recipes-support/ntop/ntop_5.0.1.bb               | 2 ++
 12 files changed, 38 insertions(+)

-- 
2.7.4


