Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfrOM-0004jD-0h
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 13:14:26 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1537087eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 04:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=KHV4iOHewRqtEjBsdV4+tzIcqrEsfaRRp720OYEcoZk=;
	b=cAwMLSvnzpziyg0+rtv9/d2XwIIAhIo90KaEz7LD4VQgESzp5J1ybN3So3UURFtz8L
	Wh8pWE1uHUhbv9VIqthY987O+KLr6lKUqDNr9WY9TarAsElRBl+PCN7hCFnGQMf+VQ5C
	ZOS6oYzSgJ7P4+i16sga04PX34wr6gnbkfrvLHQufQGM7h/pdNdADhWgKlKMoCQybCi9
	jNZFasb7LGuDVSUaKQBnqs9nrNI40s0FuxgUghcvYQ8ewXnPLlYO9AnNPg70OjT+/2qS
	Xd1debIK4xA5GL/+HrBcSXrF+kYAeGMiKZm8Rsor/0SMonXoTMklT6x5Fop1hbOb3rfd
	AC+w==
Received: by 10.14.198.67 with SMTP id u43mr48232401een.7.1354622403773;
	Tue, 04 Dec 2012 04:00:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r1sm2232858eeo.2.2012.12.04.04.00.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 04:00:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 12:59:51 +0100
Message-Id: <cover.1354622319.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH 0/5] [meta-oe][danny] Small fixes from master
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
X-List-Received-Date: Tue, 04 Dec 2012 12:14:26 -0000

The following changes since commit f8ad0760abf8055bac27036853c56f56b40a36c7:

  README: update to danny (2012-11-23 15:22:46 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/for-danny
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/for-danny

Andrei Dinu (1):
  gypsy: added to meta-oe/recipes-navigation

Martin Jansa (1):
  samba: update waf-as-source.patch to apply

Paul Eggleton (3):
  ntp: cleanup recipes and fix SSL support
  ntp: make servers configurable and default to none configured
  meta-systemd: ntp: update for server config improvements

 meta-networking/recipes-support/ntp/files/ntp      | 31 -------
 meta-networking/recipes-support/ntp/files/ntp.conf |  2 +-
 meta-networking/recipes-support/ntp/files/ntpdate  | 11 ++-
 .../recipes-support/ntp/files/ntpdate.default      |  7 ++
 .../recipes-support/ntp/files/openssl-check.patch  | 59 ++++++++++++++
 .../recipes-support/ntp/ntp-ssl_4.2.6p5.bb         | 11 ---
 meta-networking/recipes-support/ntp/ntp.inc        | 94 +++++++++++++++++-----
 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb | 44 +---------
 .../samba/samba-3.6.8/waf-as-source.patch          |  4 -
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |  2 +-
 .../recipes-navigation/gypsy/files/fixups.patch    | 21 +++++
 meta-oe/recipes-navigation/gypsy/gypsy.inc         | 15 ++++
 meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb      | 24 ++++++
 meta-oe/recipes-navigation/gypsy/gypsy_git.bb      | 18 +++++
 .../recipes-support/ntp/ntp/ntpdate.service        |  2 +-
 15 files changed, 234 insertions(+), 111 deletions(-)
 delete mode 100755 meta-networking/recipes-support/ntp/files/ntp
 create mode 100644 meta-networking/recipes-support/ntp/files/ntpdate.default
 create mode 100644 meta-networking/recipes-support/ntp/files/openssl-check.patch
 delete mode 100644 meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
 create mode 100644 meta-oe/recipes-navigation/gypsy/files/fixups.patch
 create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy.inc
 create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
 create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy_git.bb

-- 
1.8.0



