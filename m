Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1Oow3M-0000el-8R for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 12:20:56 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet1.eads.net with ESMTP; 27 Aug 2010 12:08:15 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Fri, 27 Aug 2010 12:20:06 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 27 Aug 2010 12:20:06 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 27 Aug 2010 12:20:04 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5019B45FF@deimsg40.de.net.world>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: svn:// fetcher do not checkout repository at every build
thread-index: ActF0WqNP0WhmhscQgyc1zcdtpEpIA==
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 27 Aug 2010 10:20:06.0389 (UTC)
	FILETIME=[6B7AEA50:01CB45D1]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: svn:// fetcher do not checkout repository at every build
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
X-List-Received-Date: Fri, 27 Aug 2010 10:20:57 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

as pointed in the bitbake user manual, the svn fetcher should checkout a
repository at every build if SRCDATE is set to "now".

If I want to use that in OE (for our local applications), always the
archive for the repository, stored in download cache, is used instead of
doing a new checkout. (I user bb 1.8.18)

Is it possible to turn off the download cache check for a recipe ?=20

Regards
Wolfgang Hauser


