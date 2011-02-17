Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Pq7Rn-0001K0-CI
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 18:15:19 +0100
Received: (qmail invoked by alias); 17 Feb 2011 17:14:02 -0000
Received: from mail2.zera.de (EHLO localhost.localdomain) [62.225.102.139]
	by mail.gmx.net (mp034) with SMTP; 17 Feb 2011 18:14:02 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18blXIvgQIbjdY0UIZalxE4Psf0EOVt2zXdGja5SS
	3zdh15o7EmJ6GB
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Feb 2011 18:08:51 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <201102170226.53460.schnitzeltony@gmx.de>
	<AANLkTinefnq9o6Ygep829mGNOjeXqVMsn1hO_c8zXcRk@mail.gmail.com>
	<201102171342.16551.schnitzeltony@gmx.de>
In-Reply-To: <201102171342.16551.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201102171808.51219.schnitzeltony@gmx.de>
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
X-List-Received-Date: Thu, 17 Feb 2011 17:15:19 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

@Khem forget the last mail - sorry

My guess is still that the QA RPATH error is caused by some generic problem with
c++ sources / libstdc++ - independent of clutter-box2d or other recipes 
meantioned before. Hints on this are

1.  ALL packages which have sysroot path for 'libstdc++.la' in '.libs/*.lai
have a QA RPATH error!

2. In '/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libstdc++.la' I find

| # Directory that this library needs to be installed in:
| libdir=/home/Superandi/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib

3. So (don't kill me) I modified  '/sysroots/armv7a-angstrom-linux-
gnueabi/usr/lib/libstdc++.la' to

| # Directory that this library needs to be installed in:
| libdir=/usr/lib

And rebuild some of the QA RPATH candidates mentioned before

clutter-box2d
aspell
enchant

WITHOUT QA ERRORS!!

To me it seems as matter of gcc ( in my case 4.3.3 )

| TARGET_ARCH       = "arm"
| TARGET_OS         = "linux-gnueabi"
| MACHINE           = "overo"
| DISTRO            = "angstrom"
| DISTRO_VERSION    = "2010.7-test-20110217"

What do you think?

Andreas


