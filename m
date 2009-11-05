Received: from [150.254.30.30] (helo=libra.cs.put.poznan.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1N6Avy-0002yL-UQ for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 23:36:06 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 1026D89;
	Thu,  5 Nov 2009 22:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dzTisgv7v7se; Thu,  5 Nov 2009 23:34:48 +0100 (CET)
Received: from localhost.localdomain (idss-pw.cs.put.poznan.pl [150.254.31.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id C371985;
	Thu,  5 Nov 2009 23:34:48 +0100 (CET)
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2009 23:36:52 +0100
Message-Id: <1257460612-4885-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
X-Mailer: git-send-email 1.6.3.3
X-SpamTest-Envelope-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 9691 [Sep 17 2009]
X-SpamTest-Info: {received from trusted sender
	<przemyslaw.wesolek@cs.put.poznan.pl>: common white list}
X-SpamTest-Method: white email list
X-SpamTest-Rate: 0
X-SpamTest-Status: Trusted
X-SpamTest-Status-Extended: trusted
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] usermanual: corrected a typo in XML tag.
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
X-List-Received-Date: Thu, 05 Nov 2009 22:36:06 -0000

The typo made XML invalid, two openning <literal> tags were specified
instead of <literal></literal> pair.

Signed-off-by: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
---
 docs/usermanual/chapters/getting_oe.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
index 4ec5fec..c71f32d 100644
--- a/docs/usermanual/chapters/getting_oe.xml
+++ b/docs/usermanual/chapters/getting_oe.xml
@@ -31,7 +31,7 @@ $ <command>cd</command> $OEBASE</screen>
     </para>
 
 	<para>The <varname>$OEBASE</varname> will also contain both of the
-	<literal>bitbake/<literal> and <literal>openembedded/</literal> directories.
+	<literal>bitbake/</literal> and <literal>openembedded/</literal> directories.
 	These will be discussed in <xref linkend="gettingoe_getting_bitbake"/> and
 	<xref linkend="gettingoe_getting_oe"/>.
 	</para>
-- 
1.6.3.3



