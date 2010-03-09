Received: from smtp.eu.citrix.com ([62.200.22.115])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thomas.horsten@citrix.com>) id 1Noxrn-0000TM-0A
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 12:44:52 +0100
X-IronPort-AV: E=Sophos;i="4.49,607,1262563200"; 
   d="scan'208";a="9851958"
Received: from lonpmailmx01.citrite.net ([10.30.224.162])
	by LONPIPO01.EU.CITRIX.COM with ESMTP/TLS/RC4-MD5;
	09 Mar 2010 11:40:48 +0000
Received: from [10.80.248.52] (10.80.248.52) by smtprelay.citrix.com
	(10.30.224.162) with Microsoft SMTP Server id 8.1.393.1; Tue, 9 Mar 2010
	11:40:48 +0000
From: Thomas Horsten <thomas.horsten@citrix.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 9 Mar 2010 11:40:47 +0000
Message-ID: <1268134848.32439.12.camel@hydra>
MIME-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 62.200.22.115
X-SA-Exim-Mail-From: thomas.horsten@citrix.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Issue with (gcc-cross-|glibc-)initial and packaged staging
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
X-List-Received-Date: Tue, 09 Mar 2010 11:44:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've spotted a rather annoying interim build failure but I'm not sure
how to best tackle the situation.

For example, gcc-cross-initial and gcc-cross install some of the same
files in staging. Normally this doesn't matter, since gcc-cross
overwrites the earlier ones installed by -initial, but when using
packaged staging and many threads (BBTHREADS=10 for example), it
sometimes happens that the pstaging packages for gcc-cross-initial and
gcc-cross get installed into staging in the wrong order (or at the same
time in two different threads), resulting in all builds after that
failing due to undefined references in the lib files from -initial.

Whether this happens or not is a timing dependent issue, so it's
sometimes hard to reproduce.

Any ideas how to solve this issue? I'm thinking that after gcc-cross
(and glibc-cross) have been built there is no need to depend on the
-initial packages any more. Another option would be to install them with
different paths.

Thomas



