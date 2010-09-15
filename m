Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1Ovruq-0007ZM-W6 for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 15:21:11 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet1.eads.net with ESMTP; 15 Sep 2010 15:06:25 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 15 Sep 2010 15:19:39 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 15 Sep 2010 15:19:39 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 15 Sep 2010 15:19:38 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5019B4F28@deimsg40.de.net.world>
In-Reply-To: <12925243.239881284555095548.JavaMail.defaultUser@defaultHost>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] net-snmp trouble
thread-index: ActU1a5GZB0BUC2PT2SZVjAX9lywUgAAlZKA
References: <12925243.239881284555095548.JavaMail.defaultUser@defaultHost>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 15 Sep 2010 13:19:39.0870 (UTC)
	FILETIME=[A6D2E7E0:01CB54D8]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: net-snmp trouble
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
X-List-Received-Date: Wed, 15 Sep 2010 13:21:11 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

>IMAGE_INSTALL +=3D "\
>	openssh		\=09
>nano		\
>	file		\
>	strace		\
>	apache2		\
>	modphp		\
>	parted		\
>	net-snmp	\
>	"

simply use packages

net-snmp-client
net-snmp-mib

for a client installation

net-snmp-server
net-snmp-mib

for a server installation

The net-snmp recipe do not provide a net-snmp package, it provides the
seen subpackages which may be installed.

Regards

Wolfgang


