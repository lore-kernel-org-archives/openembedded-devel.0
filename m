Received: from mail-yw0-f50.google.com ([209.85.213.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RsHnL-0001mn-Nh
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 18:47:03 +0100
Received: by yhpp61 with SMTP id p61so164532yhp.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 09:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=534rbjHa5M3Qu18ExJUmhCoNQ8U3a5gOAAFAKe8y9Ts=;
	b=m6HDvcVVj8SMKBhPYTBA984wcUdeRV97ZSUYMzoPfg5IcL+QIvxWeZeFoKFnQDjI6N
	LyBHvYXvxI9kVSPKZTeFbGu/bG2n0JXIS9gOAz9yUZw5H0ABUiG6H3BIznrdJL+monmy
	SbY7nuFT4QfjFw5EGzFG4w43Qt5oESZLIw2Hs=
Received: by 10.236.79.135 with SMTP id i7mr36720961yhe.4.1328031548867;
	Tue, 31 Jan 2012 09:39:08 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id 6sm43425979anp.14.2012.01.31.09.39.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 09:39:08 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jan 2012 17:38:55 +0000
Message-Id: <cover.1328031500.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH][meta-oe 0/3] Fixes available on O.S. Systems tree
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
X-List-Received-Date: Tue, 31 Jan 2012 17:47:03 -0000

The following changes since commit a76fff17ea8420686ef81b35f80efac1bef21649:

  ristretto: update to 0.3.4 (2012-01-30 13:03:40 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (3):
  systemd-serialgetty: support machines without serial console
  systemd.bbclass: depends on systemd
  busybox: fix busybox-syslog systemd service file

 meta-oe/classes/systemd.bbclass                    |    2 +-
 .../busybox/busybox/busybox-syslog.service.in      |    2 +-
 .../recipes-core/busybox/busybox_1.19.3.bbappend   |    2 +-
 .../recipes-core/systemd/systemd-serialgetty.bb    |   24 +++++++++++++------
 4 files changed, 19 insertions(+), 11 deletions(-)

-- 
1.7.2.5



