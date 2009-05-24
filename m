Received: from [128.222.32.20] (helo=mexforward.lss.emc.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Lin_Lynn@emc.com>) id 1M8AvT-0005fY-Di
	for openembedded-devel@openembedded.org; Sun, 24 May 2009 12:27:31 +0200
Received: from hop04-l1d11-si04.isus.emc.com (HOP04-L1D11-SI04.isus.emc.com
	[10.254.111.24])
	by mexforward.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	n4OAJaHM027413
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 24 May 2009 06:19:36 -0400 (EDT)
From: Lin_Lynn@emc.com
Received: from mailhub.lss.emc.com (nagas.lss.emc.com [10.254.144.15]) by
	hop04-l1d11-si04.isus.emc.com (Tablus Interceptor) for
	<openembedded-devel@openembedded.org>;
	Sun, 24 May 2009 06:19:30 -0400
Received: from corpussmtp2.corp.emc.com (corpussmtp2.corp.emc.com
	[128.221.14.146])
	by mailhub.lss.emc.com (Switch-3.3.2mp/Switch-3.3.2mp) with ESMTP id
	n4OAJTgS015986 for <openembedded-devel@openembedded.org>;
	Sun, 24 May 2009 06:19:29 -0400
Received: from CORPUSMX100C.corp.emc.com ([128.222.76.50]) by
	corpussmtp2.corp.emc.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 24 May 2009 06:19:29 -0400
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Sun, 24 May 2009 06:19:24 -0400
Message-ID: <065E68EB87448440A3E75B4DBB5E871C3DA985@CORPUSMX100C.corp.emc.com>
In-Reply-To: <gvandm$f73$1@ger.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [patch] fix rpm package in qa stage error
Thread-Index: AcncNG/c65Q0j5m4RZu6xTqCEokG2wAJCc4g
References: <065E68EB87448440A3E75B4DBB5E871C3DA962@CORPUSMX100C.corp.emc.com>
	<gvandm$f73$1@ger.gmane.org>
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 24 May 2009 10:19:29.0535 (UTC)
	FILETIME=[1F7E70F0:01C9DC59]
X-EMM-EM: Active
Subject: Re: [patch] fix rpm package in qa stage error
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
X-List-Received-Date: Sun, 24 May 2009 10:27:31 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Rolf:
    according to suggestions,I move that patch to openembedded-dev from
bugzilla.
    It works for me in do_configure task,Could you post configure log?
    Thanks

Lynn=20

-----Original Message-----
From: openembedded-devel-bounces@openembedded.org
[mailto:openembedded-devel-bounces@openembedded.org] On Behalf Of Rolf
Leggewie
Sent: Sunday, May 24, 2009 1:54 PM
To: openembedded-devel@openembedded.org
Subject: Re: [oe] [patch] fix rpm package in qa stage error

Lin_Lynn@emc.com wrote:
> In rpm package,some .debug file weren't in any .debug package
> The following patch to fix this bug,pls review ,thanks

Lynn, thank you for this patch.  This is bug 5069.  It generally looks=20
sane to me.  I can't verify it, though, because rpm fails do_configure=20
for me.  Does it work for you?


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



