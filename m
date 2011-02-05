Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pllul-0001o8-2N
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Feb 2011 18:27:15 +0100
Received: by wwi17 with SMTP id 17so3231020wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Feb 2011 09:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=VDAlOhCDtnfeeZhB/Js1sHfn6RTT2rtfXla/IA0YHkg=;
	b=AQnNpE+V2GbNwCDlosh0s4x2CmTPogAarHJouZUdyI01KyHY8LMz6i1wgtT8AONtt8
	uSAI3jrWb36D/C7Bi9r8+WkPT61Hi021f+sUpHjvf99w//fnudO5xRw31df71WCR3anO
	ZsyX6YBHQUTONHkWTrD7NBSzO9V26REw+Adf8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=YhVduc656BTGwh5ONPOiMN8SNRPtIjMnVJqwtCOKIiIski52L4Qd3jge0iGKvxPVx5
	PLUW1IEo3KN2K4DVirhvuuqi/pgO/wpe5joqJqKEyErCnb6SJ+sbO+8rP98VFdU/lXEg
	CWp3dgNNddOeX3vSbG8vpzNfkGA/qb3/fFymo=
Received: by 10.227.196.5 with SMTP id ee5mr10876372wbb.170.1296926775831;
	Sat, 05 Feb 2011 09:26:15 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id a50sm1107431wer.42.2011.02.05.09.26.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Feb 2011 09:26:15 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Feb 2011 18:26:09 +0100
Message-Id: <1296926769-2006-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] gnu-config: removed absolute perl binary paths from gnu-configize.
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
X-List-Received-Date: Sat, 05 Feb 2011 17:27:16 -0000

Related bugzilla entry: http://bugs.openembedded.org/show_bug.cgi?id=5510
---
 recipes/gnu-config/files/gnu-configize.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gnu-config/files/gnu-configize.in b/recipes/gnu-config/files/gnu-configize.in
index be8580c..adf9c0e 100755
--- a/recipes/gnu-config/files/gnu-configize.in
+++ b/recipes/gnu-config/files/gnu-configize.in
@@ -1,7 +1,7 @@
-#! /usr/bin/perl -w
+#! /usr/bin/env perl
 # -*- perl -*-
 
-eval 'case $# in 0) exec /usr/bin/perl -S "$0";; *) exec /usr/bin/perl -S "$0" "$@";; esac'
+eval 'case $# in 0) exec perl -S "$0";; *) exec perl -S "$0" "$@";; esac'
     if 0;
 
 # gnu-configize - install the GNU config.guess / config.sub in a directory tree
-- 
1.7.1



