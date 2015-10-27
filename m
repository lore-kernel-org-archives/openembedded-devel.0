Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 99F127570D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 03:36:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9R3aBSn005455
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 26 Oct 2015 20:36:11 -0700
Received: from pek-zgao-d1.corp.ad.wrs.com (128.224.163.142) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 26 Oct 2015 20:36:10 -0700
From: Zhenbo Gao <zhenbo.gao@windriver.com>
To: <joe_macdonald@mentor.com>, <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Oct 2015 11:35:59 +0800
Message-ID: <1445916960-9539-1-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: gaozb_jlu@163.com
Subject: [meta-networking] postfix: permissions on the /var/spool/mail seems incorrect
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
X-List-Received-Date: Tue, 27 Oct 2015 03:36:18 -0000
Content-Type: text/plain

Hi Joe MacDonald,

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

