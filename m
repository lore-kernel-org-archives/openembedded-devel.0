Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PqPtU-0002hr-Us
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 13:57:09 +0100
Received: (qmail invoked by alias); 18 Feb 2011 12:55:50 -0000
Received: from p5DE480C9.dip.t-dialin.net (EHLO localhost.localdomain)
	[93.228.128.201]
	by mail.gmx.net (mp007) with SMTP; 18 Feb 2011 13:55:50 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19TuKxrrehTmMKVWG5FxIIXmOSyiU+HZrwkt/+rSi
	ZDOCveTeRgK4X7
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 13:51:06 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <201102170226.53460.schnitzeltony@gmx.de>
	<201102171808.51219.schnitzeltony@gmx.de>
	<4D5E5568.5020308@eukrea.com>
In-Reply-To: <4D5E5568.5020308@eukrea.com>
MIME-Version: 1.0
Message-Id: <201102181351.06282.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: QA RPATH error for c++ packages?
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
X-List-Received-Date: Fri, 18 Feb 2011 12:57:09 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday 18 February 2011 12:18:00 Eric B=E9nard wrote:

> I confirm this also works for angstrom 2008.1 where I met a qa problem in
> gnutlsxx.
yes another victim...

I think this issue is fixed by removing ${STAGING_DIR_TARGET} at the end of=
=20
cross.bbclass.

I will prepare a patch on that but first wait for results on clean build...

Andreas


