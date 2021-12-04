Return-Path: <ubely@ilbers.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5FDC433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 06:33:22 +0000 (UTC)
Received: from shymkent.ilbers.de (shymkent.ilbers.de [85.214.156.166])
 by mx.groups.io with SMTP id smtpd.web11.22138.1638599600803430407
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 22:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: ilbers.de, ip: 85.214.156.166, mailfrom: ubely@ilbers.de)
Received: from baighyz.m.ilbers.de
 (host-80-81-17-52.static.customer.m-online.net [80.81.17.52])
	(authenticated bits=0)
	by shymkent.ilbers.de (8.15.2/8.15.2/Debian-8) with ESMTPSA id 1B46XGbs023668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 4 Dec 2021 07:33:17 +0100
From: Uladzimir Bely <ubely@ilbers.de>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/1] [meta-oe] buildstats: avoiding disk usage warnings in
 Isar
Date: Sat,  4 Dec 2021 07:33:15 +0100
Message-Id: <20211204063316.12502-1-ubely@ilbers.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Dec 2021 06:33:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94207

Recently we've borrowed buildstats functionality to Isar (https://github.com/
ilbers/isar/). Everything works well, but there is a problem with a large 
number of warnings in the console.

The problems comes from run_buildstats() function (bb.build.TaskSucceeded 
handler). Here, rootfs_size is calculated by executing "du -sh" on the 
directory.

In case of Isar, this directory may: 1) be created by root, so some 
directories are not available for the user; 2) have ./proc and ./dev mounted. 
So "du" produces a big amount of "Permissions denied" warnings.

The easiest solution in our case is using "sudo du -shx" instead. This 
solution works, bus it requires forking buildstats.bbclass, so our copy will 
differ from OE's one. That's what we want to avoid.

I'm looking for a proper way to make some changes in openembedded-core 
upstream that will continue using "du -sh" (or "du -shx") in OE/Yocto/etc, but 
will allow to use "sudo du -shx" in Isar.

Current idea is to put "du -sh" functionality to some small separate file (.py 
or .bbclass) so it could be called from buidstats.bbclass via some abstract 
method. Isar could just use its own implementation.

But I'm not sure that it would be a good option for OE-core, because it 
doesn't bring any essential improvements for it.

Probably, someone could hint some other way to deal with the issue that 
doesn't require changes in files borrowed from OE?

The following patch is an example how it could look like.

Uladzimir Bely (1):
  buildstats: disk usage outside bbclass

 meta/classes/buildstats-utils.bbclass | 4 ++++
 meta/classes/buildstats.bbclass       | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 meta/classes/buildstats-utils.bbclass

-- 
2.20.1


