Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1Om4g4-0002su-KC for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 14:57:06 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet2.eads.net with ESMTP; 19 Aug 2010 14:53:18 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Thu, 19 Aug 2010 14:56:41 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 19 Aug 2010 14:56:41 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 19 Aug 2010 14:56:39 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5019B425C@deimsg40.de.net.world>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: mpfr-native_svn.bb: Problems accessing the repository(s) behind
	a proxy
Thread-Index: Acs9/+yMbDeB8TquRtygedKLlVUdZg==
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 19 Aug 2010 12:56:41.0493 (UTC)
	FILETIME=[F8180450:01CB3F9D]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: mpfr-native_svn.bb: Problems accessing the repository(s) behind a proxy
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
X-List-Received-Date: Thu, 19 Aug 2010 12:57:06 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>Hello,
>
>as I am sitting behind an restrictive proxy, I'm unable to use svn:
protocol.
>
>The svn repository used for mpfr-native_svn.bb is accessible via svn:
or https: .
>The https: access needs an authentication (--username=3D =
--password=3D=3D)
according to the webpage.

>Is there a possibility to send the authentication for SRC_URIs using
https: and ignore the ?
>FETCHCOMMAND_SVN ?

>Or, how can I pin the mpfr_3.0.0.bb for native stage ?

I managed the pinning, again I struggled with <distro>.conf against
local.conf leadage.=20

Never the less, as I want to keep track on the latest development tree,
I need a solution to be able to (Test)build the actual tree of OE for my
personal images using the original settings.=20
Therefore a solution for svn https: access with user/pass is necessary
to be able to get the repository behind a proxy.=20

Is it possible to set FETCHCOMMAND_SVN for a specific package (like
FETCHCOMMAND_SVN_mpfr) ?

Regards
Wolfgang Hauser


