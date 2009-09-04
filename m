Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mjdme-0000D4-Rg
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 20:45:17 +0200
Received: by fg-out-1718.google.com with SMTP id e21so190711fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2009 11:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=wBLax9tSMZV5w/RqbkFi9t7A3sAGFwwNE7V14RQxics=;
	b=L6IJGGJ3/YpNaNCHKSOK+Bvf50gG3O02ZfhQal8rS6ZKIdN/SENS1GJ0dBX//FeYXw
	gpSIDFJW9qv7wRqUl+tAxvWADHFdwuP898RQVygZ8EZ4zE5FK8leOrt7tzGxBbBeHWom
	Y9pJXtm6ssIJ/lJ1YxU2ni+oxnAs0Cp9hApvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=W4nYpIZfVDgfSOLXW7c/q7JCbh6k7fSnfL38hK85L6MM5/kuMvIipkrsAIrFj4/nFD
	DQjsZ5cgNtwKNKThR8RSb+yYHX0pYs4jaREb5wVQbt66CfJWia1nzd/51MKJeeEOpYpT
	y06dBahQhaEHCLDju/xkdn5r961m+CvYmewVs=
Received: by 10.86.220.11 with SMTP id s11mr5253584fgg.47.1252088778444;
	Fri, 04 Sep 2009 11:26:18 -0700 (PDT)
Received: from localhost (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id l19sm2162227fgb.6.2009.09.04.11.26.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Sep 2009 11:26:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Sep 2009 11:26:11 -0700
Message-Id: <1252088771-17175-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] procps_3.2.7.bb: Fix compilation when usr/bin is same as /bin
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
X-List-Received-Date: Fri, 04 Sep 2009 18:45:19 -0000

* On DISTROs like micro where bindir and base_bindir are
  same, procps does not compile because it wants to install
  binaries in both places. We have to pass the variable to
  make file since it does not use autotools.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/procps/procps_3.2.7.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/procps/procps_3.2.7.bb b/recipes/procps/procps_3.2.7.bb
index 6da975a..b31b683 100644
--- a/recipes/procps/procps_3.2.7.bb
+++ b/recipes/procps/procps_3.2.7.bb
@@ -1,6 +1,6 @@
 require procps.inc
 
-PR = "r8"
+PR = "r9"
 
 inherit update-rc.d
 
@@ -23,6 +23,9 @@ CONFFILES_${PN} = "${sysconfdir}/sysctl.conf"
 
 EXTRA_OEMAKE = "CFLAGS=-I${STAGING_INCDIR} \
                 CPPFLAGS=-I${STAGING_INCDIR} \
+		usr/bin=${D}${bindir}/ \
+		bin=${D}${base_bindir}/ \
+		usr/proc/bin=${D}${bindir}/ \
                 LDFLAGS="${LDFLAGS}" \
                 CURSES=-lncurses \
                 install='install -D' \
-- 
1.6.3.3



