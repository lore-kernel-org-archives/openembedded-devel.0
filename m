Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9F7077112
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2016 08:55:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0P8t2oj026895
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2016 00:55:02 -0800
Received: from pek-zgao-d1.corp.ad.wrs.com (128.224.162.191) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 25 Jan 2016 00:55:01 -0800
From: Zhenbo Gao <zhenbo.gao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Jan 2016 16:54:45 +0800
Message-ID: <1453712086-16685-1-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking] postfix: permission of /var/spool/mail seems incorrect
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
X-List-Received-Date: Mon, 25 Jan 2016 08:55:05 -0000
Content-Type: text/plain

Hi all,

I am confused with the permission on /var/spool/mail of the postfix recipe, 
why it is set to 2755?

See the following output:
root@qemu0:~# rpm -qlv postfix | grep /var/spool/mail
drwxr-sr-x 2 postfix nogroup 0 Sep 8 08:46 /var/spool/mail

The premission of /var/spool/mail ("r-s") seems strange as it
belongs to nogroup, i think it is better to modify it to 0755
as to the normal case.

If so, the patch is offered.
If not, Can you give some advice?

Thanks,
Zhenbo

