Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OdtqC-0005V5-HT
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 01:45:46 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Odtpt-0006UM-TG from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 16:45:25 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 27 Jul 2010 16:45:25 -0700
Received: from [172.30.80.63] ([172.30.80.63]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 27 Jul 2010 17:45:24 -0600
Message-ID: <4C4F6F91.8000902@mentor.com>
Date: Tue, 27 Jul 2010 16:45:21 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 27 Jul 2010 23:45:24.0870 (UTC)
	FILETIME=[C8BBC260:01CB2DE5]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Disable packaged-staging for perl-native
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
X-List-Received-Date: Tue, 27 Jul 2010 23:45:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'd like to disable packaged-staging for perl-native.  The problem here 
comes from a number of things that happen.  Some of these can only 
happen in combination with packaged-staging but others I believe could 
happen today.  The problem itself is that if we have perl-native 
available from packaged-staging it can suddenly exist very early.  What 
this means in practical terms is that now we're trying to generate say 
pod2man.pl from pod2man.pl.in and @perl@ is expanded to something beyond 
the "#!" mechanic length limit and recipes start failing to build 
(fixable by changing pod2man.pl.in to use /usr/bin/env perl (and if it 
had a -w changing to Use warnings: or whatever the perl is)).

There may have been other rats nests I ran into but can't fully confirm 
weren't due to other crazy rats nests I made.  But we hit the above many 
times.

perl-native: Disable packaged-staging

Having perl-native come from packaged-staging can expose other issues.
Disable so we get the normal (potential) behavior here.

Signed-off-by: Tom Rini <tom_rini@mentor.com>

diff --git a/recipes/perl/perl-native_5.10.1.bb 
b/recipes/perl/perl-native_5.10.1.bb
index 0e0854b..98c2c3c 100644
--- a/recipes/perl/perl-native_5.10.1.bb
+++ b/recipes/perl/perl-native_5.10.1.bb
@@ -9,6 +9,9 @@ NATIVE_INSTALL_WORKS = "1"
  # Not tested enough
  DEFAULT_PREFERENCE = "-1"

+# Introduces issues when re-used too early.
+PSTAGING_DISABLED = "1"
+
  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/perl-${PV}"

  SRC_URI = 
"http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz;name=perl-${PV} \
diff --git a/recipes/perl/perl-native_5.8.8.bb 
b/recipes/perl/perl-native_5.8.8.bb
index fe1bc84..b966eeb 100644
--- a/recipes/perl/perl-native_5.8.8.bb
+++ b/recipes/perl/perl-native_5.8.8.bb
@@ -6,6 +6,9 @@ DEPENDS = "virtual/db-native gdbm-native"
  PR = "r20"
  NATIVE_INSTALL_WORKS = "1"

+# Introduces issues when re-used too early.
+PSTAGING_DISABLED = "1"
+
  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/perl-${PV}"

  SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/5.0/perl-${PV}.tar.gz \

-- 
Tom Rini
Mentor Graphics Corporation


