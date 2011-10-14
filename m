Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1REi2a-0004mF-O1
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 15:43:12 +0200
Received: (qmail invoked by alias); 14 Oct 2011 13:37:27 -0000
Received: from p5B0A29C7.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.41.199]
	by mail.gmx.net (mp044) with SMTP; 14 Oct 2011 15:37:27 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19Fmsk5ItNFXiNe8NrV+uWqD94OpzVANo/TuQrwk6
	OG/xrpyBk5A9lM
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Oct 2011 15:41:55 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <CAAQYJAuwL6f1eGGDsKh1Uf1CCfpjuLuFaCgX6LEeXt+pYHN1Pg@mail.gmail.com>
In-Reply-To: <CAAQYJAuwL6f1eGGDsKh1Uf1CCfpjuLuFaCgX6LEeXt+pYHN1Pg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201110141541.55957.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Race during build of kernel firmwares ?
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
X-List-Received-Date: Fri, 14 Oct 2011 13:43:12 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday, October 14, 2011 10:15:51 AM Andrea Adami wrote:
> Hello,
> 
> building with 4 BB_THREADS and -j5 I repeatedly see this error during build
> of linux-2.6.39.
> 
> MKDIR
> /oe/oe-core/build/tmp-eglibc/work/poodle-oe-linux-gnueabi/linux-2.6.39-r0/image/lib/firmware/cis/
> make[1]: *** No rule to make target
> `/oe/oe-core/build/tmp-eglibc/work/poodle-oe-linux-gnueabi/linux-2.6.39-r0/image/lib/firmware/./',
> needed by
> `/oe/oe-core/build/tmp-eglibc/work/poodle-oe-linux-gnueabi/linux-2.6.39-r0/image/lib/firmware/ti_3410.fw'.
> Stop.
> 
> I'm using no-distro and following layers:
> 
> openembedded-core
> meta-openembedded
> meta-handheld
> 
> Note that I'm thus using kernel.bbclass from meta-oe and linux.inc from
> meta-handheld.
> 
> I had to start bitbake core-image-minimal 5 or 6 time before the issue
> vanished itself.
> So, it could be a race or some missing dependency. I'll inspect the logs
> later this evening.
> 
> Having recently read patches about firmwares in the ML, I'm wondering maybe
> some recent commit broke the stuff...
> 
> Regards
> 
> Andrea
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
Had the same here in gumstix kernel which is based on linux-omap. AFAIK parallel install was enabled in oe-core few days ago. By adding

PARALLEL_MAKEINST = ""

it builds for me fine again

Andreas



