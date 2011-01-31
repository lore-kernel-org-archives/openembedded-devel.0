Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Schnitzeltony@gmx.de>) id 1PjplC-00037Z-1L
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 10:09:22 +0100
Received: (qmail 5875 invoked by uid 0); 31 Jan 2011 09:08:28 -0000
Received: from 62.225.102.139 by www187.gmx.net with HTTP;
	Mon, 31 Jan 2011 10:08:26 +0100 (CET)
Date: Mon, 31 Jan 2011 10:08:26 +0100
From: =?iso-8859-1?Q?=22Andreas_M=FCller=22?= <Schnitzeltony@gmx.de>
In-Reply-To: <1296461709.3922.4.camel@mattotaupa>
Message-ID: <20110131090826.149890@gmx.net>
MIME-Version: 1.0
References: <201101310012.51498.schnitzeltony@gmx.de>
	<1296461709.3922.4.camel@mattotaupa>
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #62780362
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX1/T2aoo8TLTnXlhhFXlFEsDezKsRz2yNnIjvBgWmx
	COuKIvkkJrZJdG/70UkMsQisuRDTuuCU+RMw== 
X-GMX-UID: OEV1dbgOMmA6T6Gf1mJnxKc5MjQ1N91V
Subject: Re: libgles-omap3 fails
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
X-List-Received-Date: Mon, 31 Jan 2011 09:09:22 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

-------- Original-Nachricht --------
> Datum: Mon, 31 Jan 2011 09:15:09 +0100
> Von: Paul Menzel <paulepanter@users.sourceforge.net>
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] libgles-omap3 fails

> Dear Andreas,
> 
> 
> Am Montag, den 31.01.2011, 00:12 +0100 schrieb Andreas Mueller:
> > I don't understand what's going on. When building libgles-omap3 I get
> > 
> > [Superandi@localhost gumstix-oe]$ bitbake libgles-omap3
> 
> […]
> 
> > Parsing of 7118 .bb files complete (0 cached, 7118 parsed). 7430
> targets, 320 skipped, 2 masked, 0 errors.
> > ERROR:
> '['/home/Superandi/data/OpenEmbedded/gumstix-oe/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb']' RDEPENDS/RRECOMMENDS or
> otherwise requires the runtime entity 'kernel-2.6.32' but it wasn't found in any
> PACKAGE or RPROVIDES variables
> > ERROR: Required build target 'libgles-omap3' has no buildable providers.
> > Missing or unbuildable dependency chain was: ['libgles-omap3',
> 'omap3-sgx-modules', 'kernel-2.6.32']
> > 
> > Build Configuration:
> > BB_VERSION        = "1.10.2"
> > METADATA_BRANCH   = "oe.org.openembedded.dev"
> > METADATA_REVISION = "aa479cd"
> > TARGET_ARCH       = "arm"
> > TARGET_OS         = "linux-gnueabi"
> > MACHINE           = "overo"
> > DISTRO            = "angstrom"
> > DISTRO_VERSION    = "2010.7-test-20110130"
> > TARGET_FPU        = "hard"
> 
> […]
> 
> > I don't find affecting changes which could have broken this. Any good
> ideas?
> 
> It looks like the same problem as in [1] and should be fixed by commit
> 09d0669e [2].
> 
> 
> Thanks,
> 
> Paul
> 
> 
> [1]
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/029355.html
> [2]
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=09d0669ed914e810bb8bd6ce9275b7a4125bc8a0

Paul thanks for responding desperate late-night noise :-)

-- 
NEU: FreePhone - kostenlos mobil telefonieren und surfen!			
Jetzt informieren: http://www.gmx.net/de/go/freephone


