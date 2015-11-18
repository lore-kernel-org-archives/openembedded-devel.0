Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 958086AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 07:42:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAI7gO7q008834
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Nov 2015 23:42:24 -0800 (PST)
Received: from pek-zgao-d1.corp.ad.wrs.com (128.224.163.142) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 17 Nov 2015 23:42:23 -0800
From: Zhenbo Gao <zhenbo.gao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Nov 2015 15:41:21 +0800
Message-ID: <1447832482-22639-1-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: gaozb_jlu@163.com
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
X-List-Received-Date: Wed, 18 Nov 2015 07:42:31 -0000
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

