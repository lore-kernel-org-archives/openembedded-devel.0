Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1MwzDh-0007JM-2j
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Oct 2009 16:16:24 +0200
Received: by fxm3 with SMTP id 3so8429596fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Oct 2009 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=dCadeb22FrU6puwvi0DQnN/ebrD7RehWLoh6c4vH9SM=;
	b=cahlrc+n5BnqvKdjUuD5RTZRv9tTZ43F3KpcwBE5UWFM4HDIAdGfj4YjMkQjqHdMJt
	ZJYY2k0EuX1NZTCIqfF4v7nuetObpwwlWY/JgmYPlShv36HMnq+oFZSsJuTB17kvR8wk
	GnznqL/qG4jLMJioGhEJo+2WXYiuNAeXiERR8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GPR5+HzUHK+uQwnT2Jj6ngPoG1Jvf/aQ7wHqZeAb3meQBRfH9EkIVB2b+wgD2OzSTI
	yIAmfpt/CE4YmURFp3/Jk18nkrSvmT9I/dnQGddW/13vfHqzL0h3IxMS8dBl6qCDmge8
	T0YL6EtYZq+qsDZfypivW6Xe1k/RvK588BCH0=
Received: by 10.103.84.30 with SMTP id m30mr2002474mul.23.1255270528413;
	Sun, 11 Oct 2009 07:15:28 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e10sm7357397muf.21.2009.10.11.07.15.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 11 Oct 2009 07:15:27 -0700 (PDT)
From: "Martin.Jansa" <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Oct 2009 16:15:12 +0200
Message-Id: <1255270512-22926-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.rc2
In-Reply-To: <1255270512-22926-1-git-send-email-Martin.Jansa@gmail.com>
References: <E1Mwyda-0001aa-3j@melo.openembedded.org>
	<1255270512-22926-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] Add missing patch for xorg-xserver
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
X-List-Received-Date: Sun, 11 Oct 2009 14:16:24 -0000

---
 .../xorg-xserver/xserver-xorg-1.7.0/dolt-fix.patch |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.7.0/dolt-fix.patch

diff --git a/recipes/xorg-xserver/xserver-xorg-1.7.0/dolt-fix.patch b/recipes/xorg-xserver/xserver-xorg-1.7.0/dolt-fix.patch
new file mode 100644
index 0000000..414d72d
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.7.0/dolt-fix.patch
@@ -0,0 +1,21 @@
+Index: xorg-server/m4/dolt.m4
+===================================================================
+--- xorg-server/m4/dolt.m4	2009-04-14 21:14:56.000000000 +0400
++++ xorg-server-2/m4/dolt.m4	2009-07-15 12:38:33.796848843 +0400
+@@ -147,7 +147,7 @@
+     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
+ #!$DOLT_BASH
+ __DOLTLIBTOOL__EOF__
+-    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
++    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
+ top_builddir_slash="${0%%doltlibtool}"
+ : ${top_builddir_slash:=./}
+ args=()
+@@ -163,7 +163,7 @@
+ if $modeok && $tagok ; then
+     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
+ else
+-    exec ${top_builddir_slash}libtool "$[]@"
++    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
+ fi
+ __DOLTLIBTOOL__EOF__
-- 
1.6.5.rc2



