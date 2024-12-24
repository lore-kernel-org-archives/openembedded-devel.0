Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9BDE77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 12:45:13 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.32650.1735044308796611722
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 04:45:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=slCpUFDk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20241224124505584c5c241406f21843-adekge@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20241224124505584c5c241406f21843
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 24 Dec 2024 13:45:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Ojt8G55eMrfH2eyaS3khDJkMP6wMp64PIVfCTYQyfZw=;
 b=slCpUFDkOKmidlKy0TBsBV258yKVW082WqO5AKDo6zDe988/StdhEtvUK6GTn9ouSZBj6q
 Vx6HCOZxKDXkDK7pXt0Bj/vVUqV8kvPvySq8jpX3rTRjzFwlv+tYCE5+FTTM2+WZyNEqRmxZ
 sT28JglXKHFqwYjGqHT7LoU7wgALGzRXjw+nw5Oj6yvyA13QlgG5S4VvJzU7NE97S3ZrX3tC
 SuSdxCPRxJpIh2/6LdzPXjEU90po9AULzBJkrv7JZip1ndiZJoILYzatZLBq094791gPwk5x
 iwIpMA5900nIW0MPZiYRRqBIKM6aD56SjrLhJ6xMkLj8/ELenXy3uLLw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 0/6] 3rd series for meta-openembedded master
Date: Tue, 24 Dec 2024 13:44:11 +0100
Message-Id: <20241224124417.2547005-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 12:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114541

This time backporting patches and again some CVE_STATUS handling.

Peter Marko (6):
  apache2: ignore CVE-1999-1237
  rtmpdump: mark CVE-2015-8270, CVE-2015-8271 and CVE-2015-8272 as fixed
  rtmpdump: add +git to PV
  libconfuse: patch CVE-2022-40320
  opusfile: patch CVE-2022-47021
  synergy: patch CVE-2020-15117

 .../opusfile/opusfile/CVE-2022-47021.patch    | 44 +++++++++++++++++
 .../opusfile/opusfile_0.12.bb                 |  2 +
 .../rtmpdump/rtmpdump_2.4.bb                  |  5 ++
 .../libconfuse/files/CVE-2022-40320.patch     | 42 ++++++++++++++++
 .../libconfuse/libconfuse_3.3.bb              |  1 +
 .../synergy/synergy/CVE-2020-15117.patch      | 48 +++++++++++++++++++
 .../recipes-support/synergy/synergy_git.bb    |  1 +
 .../recipes-httpd/apache2/apache2_2.4.62.bb   |  1 +
 8 files changed, 144 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch
 create mode 100755 meta-oe/recipes-support/libconfuse/files/CVE-2022-40320.patch
 create mode 100644 meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch

-- 
2.30.2


