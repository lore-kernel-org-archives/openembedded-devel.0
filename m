Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PgCM9-0007x0-4B
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 09:28:29 +0100
Received: by pxi17 with SMTP id 17so280062pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 00:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=PT3LDqfAYNoSLw3DpJid38R0b78PqHd2lZooazc9Jgw=;
	b=ADR6zwqyEYME/qDSSqMLk5kGa+3R1Hkp3xxo0ARmhid3QWAFddRyUphUEZbyQBSasD
	pxU+W74+TDoClfYniGKEuYzJQXe0zF9legZGqfuW+TrAUJqBvxEylc9b1mlST3GZOPgL
	mZGDcl7UDDLI1ZDyzgMPS16y92QZIfTiGMEaw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HDCgVRR888bPjMt6LzQUPeydDtTnI1vq2Ho4EthG6B/TZEzaL7/Azgp6yAys4LG4AT
	k9jcxRX0UkFFqOFk8MBvjDep8PeImraZLElViehETMsGHG1Fjr2Jy+OLjMpSf7GpM1k+
	ZrKZkp63sGeRqLb+GmmWRAzBJJGbqbEx/mJ8E=
Received: by 10.142.178.9 with SMTP id a9mr307154wff.263.1295598466803;
	Fri, 21 Jan 2011 00:27:46 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x35sm12318284wfd.13.2011.01.21.00.27.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 21 Jan 2011 00:27:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jan 2011 00:27:36 -0800
Message-Id: <1295598456-12847-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1295598456-12847-1-git-send-email-raj.khem@gmail.com>
References: <1295598456-12847-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] util-linux-ng.inc: Remove udev from DEPENDS
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
X-List-Received-Date: Fri, 21 Jan 2011 08:28:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/util-linux-ng/util-linux-ng.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index 29e534c..579c8dc 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Util-linux-ng is a suite of essential utilities for any Linux system."
 SECTION = "base"
 LICENSE = "GPL"
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} udev  zlib ncurses virtual/libintl"
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} zlib ncurses virtual/libintl"
 DEPENDS_virtclass-native = "zlib-native lzo-native gettext-native"
 
 inherit autotools gettext
-- 
1.7.2.3



