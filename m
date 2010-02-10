Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfIwH-00068Y-HK
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 21:13:36 +0100
Received: by fxm25 with SMTP id 25so402467fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 12:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=ueod/f4JsKKaX0jdwbpIkYfzJjAC+Pki2lvhh0i8qFk=;
	b=L4ICSrJ711Lj2JvnjZGgpqVswFz+QgyLis2z8/HrP8OX3c6ZhjgSHBc1s3GL7G6uxH
	9qUey0j0ApI6EiTcFGrF2+CWEulhLkHl8bAWeiNjtm5q347l7DZecQYbbBKK3V2AjlWq
	CQ4nvn/iQFzxDCmZDEhFyv5CQZQJ2Hl8JgSuw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=VfABzp+ELCKnuJt2i5N9FfMdqcsuoVpNlAMZ79nxl/azBnlkZabfaAzSJ7R9LET3Vq
	5EFqkac/z0LLvHc2ir9u9e+UPF1tsPAIy8iVe2WZ5nrMbK8uobb2mL4HQzEg63/5mlgi
	pHOShfI9qnHcE+U4uRyqJrl+q44/qv26QctJ4=
Received: by 10.223.77.129 with SMTP id g1mr986826fak.11.1265832656656;
	Wed, 10 Feb 2010 12:10:56 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 21sm2607027fkx.55.2010.02.10.12.10.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 12:10:55 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfIvm-0005CK-2Z; Wed, 10 Feb 2010 21:13:02 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2010 21:12:52 +0100
Message-Id: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 0/8] minor trivia; [RFC] add xz
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
X-List-Received-Date: Wed, 10 Feb 2010 20:13:36 -0000

Hi,

hwcloch.sh: resend with just the !getopt_long fixes.
autoconf: add SRC_URI name setting for later 2.65 addition
gmp: add SRC_URI name setting for later 5.0.1 addition (not sent)
base.bbclass: handle xz compressed files
busybox: all *.gz were moved to legacy/ a few days ago. Switch to
         new-style checksums while at it. Didn't touch 1.7.2 which is
         now undownloadable but ancient cruft anyway.
         Remove checksums for download-patches that don't show up in
         recipes/busybox/*bb
autoconf: well, add 2.65; xz will need > 2.63
RFC: xz package (lzma successor). That's the RFC spot. The git versions
     (e.g. xz-native_git, automake-1.11.1, autoconf-2.65) somehow behave
     oddly with NLS on.
     Do sed -i -e "/^EXTRA_OECONF/d" recipes/xz/xz_git.bb
     and also wipe everything below "^# XXX" for the gory details.
     Ideas?

Everything but xz would be nice to have in dev, xz unaltered like in the
patch in this series works for me but needs further love to be clean;

Thanks && cheers,

Bernhard Reutner-Fischer (8):
  hwclock.sh: some more !getopt_long fixes
  autoconf: set SRC_URI name
  gmp: set SRC_URI name
  handle xz compressed files and tarballs
  busybox: use .tar.bz2
  busybox: remove orphaned patch checksums
  autoconf: add 2.65
  xz: add xz package

 classes/base.bbclass                               |    4 +
 conf/checksums.ini                                 |   92 ---------------
 .../autoheader-nonfatal-warnings.patch             |   13 ++
 .../autoconf-2.65/autoreconf-exclude.patch         |  123 ++++++++++++++++++++
 .../autoconf-2.65/autoreconf-foreign.patch         |   11 ++
 .../autoconf-2.65/autoreconf-gnuconfigize.patch    |   30 +++++
 recipes/autoconf/autoconf-2.65/config-site.patch   |   11 ++
 recipes/autoconf/autoconf-2.65/fix_path_xtra.patch |  111 ++++++++++++++++++
 recipes/autoconf/autoconf-2.65/program-GNU.patch   |   13 ++
 recipes/autoconf/autoconf-2.65/program-mkdir.patch |   11 ++
 .../autoconf/autoconf-2.65/program_prefix.patch    |   19 +++
 recipes/autoconf/autoconf-native_2.65.bb           |   12 ++
 recipes/autoconf/autoconf.inc                      |    2 +-
 recipes/autoconf/autoconf_2.65.bb                  |   15 +++
 recipes/busybox/busybox.inc                        |    1 -
 recipes/busybox/busybox_1.11.3.bb                  |    4 +-
 recipes/busybox/busybox_1.13.2.bb                  |    4 +-
 recipes/busybox/busybox_1.14.3.bb                  |    6 +-
 recipes/busybox/busybox_1.15.3.bb                  |    4 +-
 recipes/busybox/busybox_1.2.1.bb                   |    7 +-
 recipes/busybox/busybox_1.2.2.bb                   |    7 +-
 recipes/busybox/busybox_1.3.1.bb                   |    6 +-
 recipes/busybox/busybox_1.7.2.bb                   |    4 +-
 recipes/busybox/busybox_1.9.2.bb                   |    4 +-
 recipes/busybox/files/hwclock.sh                   |   10 +-
 recipes/gettext/gettext-0.17/m4_copy.patch         |   52 ++++++++
 recipes/gettext/gettext_0.17.bb                    |    1 +
 recipes/gmp/gmp.inc                                |    2 +-
 recipes/xz/xz-native.inc                           |    2 +
 recipes/xz/xz-native_4.999.9beta.bb                |    3 +
 recipes/xz/xz-native_git.bb                        |    7 +
 recipes/xz/xz.inc                                  |    8 ++
 recipes/xz/xz_4.999.9beta.bb                       |    8 ++
 recipes/xz/xz_git.bb                               |   22 ++++
 34 files changed, 518 insertions(+), 111 deletions(-)
 create mode 100644 recipes/autoconf/autoconf-2.65/autoheader-nonfatal-warnings.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/autoreconf-exclude.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/autoreconf-foreign.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/autoreconf-gnuconfigize.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/config-site.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/fix_path_xtra.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/program-GNU.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/program-mkdir.patch
 create mode 100644 recipes/autoconf/autoconf-2.65/program_prefix.patch
 create mode 100644 recipes/autoconf/autoconf-native_2.65.bb
 create mode 100644 recipes/autoconf/autoconf_2.65.bb
 create mode 100644 recipes/gettext/gettext-0.17/m4_copy.patch
 create mode 100644 recipes/xz/xz-native.inc
 create mode 100644 recipes/xz/xz-native_4.999.9beta.bb
 create mode 100644 recipes/xz/xz-native_git.bb
 create mode 100644 recipes/xz/xz.inc
 create mode 100644 recipes/xz/xz_4.999.9beta.bb
 create mode 100644 recipes/xz/xz_git.bb



