Received: from [72.167.82.81] (helo=p3plsmtpa01-01.prod.phx3.secureserver.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1N96uE-0003RS-CE
	for openembedded-devel@openembedded.org; Sat, 14 Nov 2009 01:54:25 +0100
Received: (qmail 4632 invoked from network); 14 Nov 2009 00:46:20 -0000
Received: from unknown (75.49.209.68)
	by p3plsmtpa01-01.prod.phx3.secureserver.net (72.167.82.81) with ESMTP;
	14 Nov 2009 00:46:20 -0000
Message-ID: <4AFDFDD6.2060504@mwester.net>
Date: Fri, 13 Nov 2009 18:46:14 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 72.167.82.81
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: owfs change - comments?
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
X-List-Received-Date: Sat, 14 Nov 2009 00:54:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Greetings.

I desire to apply the following change to the owfs recipe -- it resolves
a build failure.   (It attempts to build a perl module for owfs, which
fails.  The perl module, if desired by someone, probably needs to be
built as part of the perl recipes.)

Speak now, or forever hold your peace.

-Mike (mwester)

diff --git a/recipes/owfs/owfs_2.7p24.bb b/recipes/owfs/owfs_2.7p24.bb
index 44fc878..c3ee6d6 100644
--- a/recipes/owfs/owfs_2.7p24.bb
+++ b/recipes/owfs/owfs_2.7p24.bb
@@ -15,6 +15,7 @@ EXTRA_OECONF = " \
                  --enable-owhttpd \
                  --enable-cache \
                  --enable-mt \
+                 --disable-swig \
                  "

 do_install_prepend() {



