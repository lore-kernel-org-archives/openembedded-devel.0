Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E531562252
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 08:25:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAC8PLWA004988
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 00:25:22 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 12 Nov 2014 00:25:21 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Nov 2014 03:25:18 -0500
Message-ID: <cover.1415780121.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1][meta-oe] krb5: fix CVE-2014-5351
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
X-List-Received-Date: Wed, 12 Nov 2014 08:25:31 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The kadm5_randkey_principal_3 function in lib/kadm5/srv/svr_principal.c
in kadmind in MIT Kerberos 5 (aka krb5) before 1.13 sends old keys in a
response to a -randkey -keepold request, which allows remote authentic-
ated users to forge tickets by leveraging administrative access.

This back-ported patch fixes CVE-2014-5351.

The following changes since commit c78eca1ea7452a62f86b740ec59f1cd39e399d73:

  postfix: create or update aliases.db when using systemd (2014-11-10 15:18:55 -0500)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/cve-krb5
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/cve-krb5

Wenzong Fan (1):
  krb5: fix CVE-2014-5351

 ...rn-only-new-keys-in-randkey-CVE-2014-5351.patch |   92 ++++++++++++++++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb   |    1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Return-only-new-keys-in-randkey-CVE-2014-5351.patch

-- 
1.7.9.5


