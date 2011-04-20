Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QCTGH-0005vB-7Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 10:59:49 +0200
Received: by ewy5 with SMTP id 5so146886ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 01:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=7Qj13alaJjl3wDlstI4K4W6rwAz5OtyHXSIP6jJLGAc=;
	b=ukJje/e694Y1b7y1VxaoTnr5tMrHW8BQmAzpL51aJTfjTv/MLyQnBrEAE2hbBUh4An
	BsJPhLbcwaJEQTy/1GRmPF7F33GWGUxtzfJVy/xUi+7TkutqF/cpvZf7TmiGs9RgFswJ
	8O0fxmd8h0o/4NYXkWP9UHXgYRPEnzt0Ck/bg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=vdWT/6w2mxoCuCLllBgmJl1jHeLdDHxQgy+o68f7qCxElu/Va0ZbPJS3iXw4LT/ZAb
	D4do6t1I+qaZ4MB/i+7yQ27lgvfhbP7WuGzsj3UOjzwRZbZqgpWEXdYPpKusAnTgd/EY
	x5Mtqb192K/NeU45ZavQtqJx53klDCR1nbfTQ=
Received: by 10.213.0.206 with SMTP id 14mr3052769ebc.4.1303289845957;
	Wed, 20 Apr 2011 01:57:25 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id m55sm496854eei.22.2011.04.20.01.57.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 01:57:25 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 10:57:20 +0200
Message-Id: <cover.1303289630.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [oe-meta][PATCHv2] 0/3] Pull request v2: syslog-ng, eventlog, libnet
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Apr 2011 08:59:49 -0000

Corrected (PR) and squashed version

Pull URL: git://gitorious.org/oe-zoid/meta-openembedded.git
  Branch: master
  Browse: http://gitorious.org/oe-zoid/meta-openembedded/commits/master

Thanks,
    Michael Lippautz <michael.lippautz@gmail.com>
---


Michael Lippautz (3):
  libnet: Clean and upgrade (see below)
  eventlog: Clean and update to 0.2.12
  syslog-ng: Update to 3.2.2

 .../libnet/libnet-1.1.5/fix-endianess-test.patch   |   38 +++
 .../recipes-connectivity/libnet/libnet_1.1.5.bb    |   24 ++
 .../recipes-support/eventlog/eventlog_0.2.12.bb    |   11 +
 meta-oe/recipes-support/syslog-ng/files/initscript |   45 +++
 .../recipes-support/syslog-ng/files/syslog-ng.conf |  338 ++++++++++++++++++++
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   78 +++++
 .../recipes-support/syslog-ng/syslog-ng_3.2.2.bb   |   10 +
 7 files changed, 544 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-test.patch
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
 create mode 100644 meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/initscript
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng.inc
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb

-- 
1.7.3.4



