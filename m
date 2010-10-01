Received: from mailde1.eads.com ([80.156.44.82])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1P1co0-00044j-07 for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 12:25:32 +0200
Received: from de-gate1.mailhub.intra.corp ([53.154.243.33]) by
	mailde1.eads.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 1 Oct 2010 12:27:01 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Fri, 1 Oct 2010 12:25:09 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 1 Oct 2010 12:25:08 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 1 Oct 2010 12:25:07 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A74937@deimsg40.de.net.world>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: svn:// fetcher do not checkout repository at every build
Thread-Index: ActF0WqNP0WhmhscQgyc1zcdtpEpIAbgJ4hw
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 01 Oct 2010 10:25:08.0483 (UTC)
	FILETIME=[EC000D30:01CB6152]
X-SA-Exim-Connect-IP: 80.156.44.82
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@cassidian.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: svn:// fetcher do not checkout repository at every build
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
X-List-Received-Date: Fri, 01 Oct 2010 10:25:32 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

unfortunately nobody answers to that question.

Has nobody an idea how to solve this problem ?

As a workaround I am searching for the best position to add a removal =
function for the tar archive after building the package or, as best =
position, after unpack.
Where I can get the used archive name to manage the removal ?

Thanks for your help
Wolfgang=20

-----Urspr=FCngliche Nachricht-----
Von: Hauser, Wolfgang (external)=20
Gesendet: Freitag, 27. August 2010 12:20
An: openembedded-devel@lists.openembedded.org
Betreff: svn:// fetcher do not checkout repository at every build

Hello,

as pointed in the bitbake user manual, the svn fetcher should checkout a =
repository at every build if SRCDATE is set to "now".

If I want to use that in OE (for our local applications), always the =
archive for the repository, stored in download cache, is used instead of =
doing a new checkout. (I user bb 1.8.18)

Is it possible to turn off the download cache check for a recipe ?=20

Regards
Wolfgang Hauser


