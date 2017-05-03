Return-Path: <Yadi.Hu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD5E71A88
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 May 2017 03:26:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v433QAu8012358
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 May 2017 20:26:10 -0700 (PDT)
Received: from pek-yhu2-d1.wrs.com (128.224.162.195) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Tue, 2 May 2017 20:26:08 -0700
From: Yadi Hu <yadi.hu@windriver.com>
To: <yadi.hu@windriver.com>, <openembedded-devel@lists.openembedded.org>,
	<martin.jansa@gmail.com>
Date: Wed, 3 May 2017 11:25:58 +0800
Message-ID: <1493781959-31023-1-git-send-email-yadi.hu@windriver.com>
X-Mailer: git-send-email 2.7.4
drbd-utils: fix dependency for perl under small-fs
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Cc: marius.tiplea@windriver.com
Subject: drbd-utils: fix dependency for perl under small-fs
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
X-List-Received-Date: Wed, 03 May 2017 03:26:09 -0000
Content-Type: text/plain

when run drbd-overview under samll fs, the perl script fails to run
due to lack of perl's lib. warning shows as below:

drbd-overview
random: nonblocking pool is initialized
Can't locate Getopt/Long.pm in @INC (you may need to install the Getopt::Long module) (@INC contains: /etc/perl /usr/lib64/perl/site_perl/5.22.0/ /usr/lib64/perl/site_perl/5.22.0 /usr/lib64/perl/vendor_perl/5.22.0/ /usr/lib64/perl/vendor_perl/5.22.0 /usr/lib64/perl/5.22.0/ /usr/lib64/perl/5.22.0 /usr/local/lib/site_perl /usr/lib64/perl/5.22.0 .) at /usr/sbin/drbd-overview line 393.
BEGIN failed--compilation aborted at /usr/sbin/drbd-overview line 393. 

the patch explicaitly specified dependency for perl;s lib needed.


