Return-Path: <philip.balister@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8856F60DD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 13:09:56 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id rp16so770344pbb.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 06:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=DzHHhaPtrP/pjc8bgqBApHNDOnPv/QYzmS8SRIQPPJQ=;
	b=wCb8GqgwkypNRYfhluAbEjHmOdzS+1phF1O9SrFVHi2KkE6nCnnmUClOAE/XwB0Tx9
	ijjYe05u2+ZauMBC4F4B7YNeKqlojoHGicy9afmQwDCgxu/STx9FsFWykkKqhVgnvFmd
	6BRGX3gghVKp3ooUSknNJY6PvpEj8F+OWuA/tygQtVwHiJG8u3dlj6ZjmVItDkrJl8Qb
	Yz+qCkDfuYQ/wT+2co9DJisYKzXREMzZnEp7XcNhefs6/mie7325js471JYCZiEwi/AQ
	M77KuVDSO0j32jEuQ23w/hN8eOtLmVpkEB0DW2xhIgGAxoAkzk9A9t4SfRSWt0dJIPcG
	szaw==
X-Received: by 10.69.15.2 with SMTP id fk2mr20504371pbd.123.1398258597871;
	Wed, 23 Apr 2014 06:09:57 -0700 (PDT)
Received: from mattsbaby.amer.corp.natinst.com
	(64-186-172-226.static-ip.telepacific.net. [64.186.172.226])
	by mx.google.com with ESMTPSA id
	qx11sm4818153pab.35.2014.04.23.06.09.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Apr 2014 06:09:56 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Apr 2014 06:09:36 -0700
Message-Id: <1398258576-21567-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.9.0
Subject: [meta-networking][PATCH] ntp : Convert libcap use from PACKAGECONFIG to hard DEPEND.
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
X-List-Received-Date: Wed, 23 Apr 2014 13:09:59 -0000

If ntp is built without libcap, it refuses to start with the following
message:

Starting ntpd: /usr/sbin/ntpd: The ``user'' option has been disabled -- built
without --enable-clockctl or --enable-linuxcaps
ntpd - NTP daemon program - Ver. 4.2.6p5
USAGE:  ntpd [ -<flag> [<val>] | --<name>[{=| }<val>] ]...

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-networking/recipes-support/ntp/ntp.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 9c3e0d1..b8e9853 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -29,20 +29,21 @@ inherit autotools update-rc.d useradd systemd
 
 # The ac_cv_header_readline_history is to stop ntpdc depending on either
 # readline or curses
-EXTRA_OECONF += "--with-net-snmp-config=no --without-ntpsnmpd ac_cv_header_readline_history_h=no --with-binsubdir=sbin"
+EXTRA_OECONF += "--with-net-snmp-config=no --without-ntpsnmpd ac_cv_header_readline_history_h=no --with-binsubdir=sbin --enable-linuxcaps"
 CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ntp \
                        --shell /bin/false --user-group ntp"
 
+DEPEND = "libcap"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
                           --with-openssl-incdir=${STAGING_INCDIR} \
                           --with-crypto, \
                           --without-openssl --without-crypto, \
                           openssl"
-PACKAGECONFIG[cap] = "--enable-linuxcaps,--disable-linuxcaps,libcap"
 PACKAGECONFIG[readline] = "--with-lineeditlibs,--without-lineeditlibs,readline"
 
 do_install_append() {
-- 
1.9.0


