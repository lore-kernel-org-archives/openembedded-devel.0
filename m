Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PEjpj-0006JI-IM
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 15:33:35 +0100
Received: from p5b036781.dip.t-dialin.net ([91.3.103.129] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PEjor-00057n-4d by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 15:32:39 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PEjop-0000M8-RY
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 15:32:35 +0100
Date: Sat, 6 Nov 2010 15:32:35 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101106143235.GI6691@excalibur.local>
References: <y> <4cc228ec.1d8b970a.4cbb.0973@mx.google.com>
	<20101024062549.GD3494@jama>
MIME-Version: 1.0
In-Reply-To: <20101024062549.GD3494@jama>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/4] Lightmediascanner: Add recipe for 0.4.0 release
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
X-List-Received-Date: Sat, 06 Nov 2010 14:33:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2010-10-24 at 08:25, Martin Jansa wrote:
> On Fri, Oct 22, 2010 at 10:14:04PM -0200, fidencio@profusion.mobi wrote:
> > From: Eduardo Lima (Etrunko) <eblima@gmail.com>
> > 
> > Also update 0.2.0 recipe to use lightmediascanner.inc
> > 
> > Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
> > ---
> >  recipes/lightmediascanner/lightmediascanner.inc    |   21 ++++++++++++++++++++
> >  .../lightmediascanner/lightmediascanner_0.2.0.0.bb |   11 +---------
> >  .../lightmediascanner/lightmediascanner_0.4.0.0.bb |    6 +++++
> >  3 files changed, 28 insertions(+), 10 deletions(-)
> >  create mode 100644 recipes/lightmediascanner/lightmediascanner.inc
> >  create mode 100644 recipes/lightmediascanner/lightmediascanner_0.4.0.0.bb
> > 
> > diff --git a/recipes/lightmediascanner/lightmediascanner.inc b/recipes/lightmediascanner/lightmediascanner.inc
> > new file mode 100644
> > index 0000000..9ba7a01
> > --- /dev/null
> > +++ b/recipes/lightmediascanner/lightmediascanner.inc
> > @@ -0,0 +1,21 @@
> > +DESCRIPTION = "Lightweight media scanner meant to be used in not-so-powerful devices"
> > +SECTION = "libs/multimedia"
> > +AUTHOR = "INdT / ProFUSION"
> > +LICENSE = "LGPL"
> > +DEPENDS += "sqlite3 libogg libvorbis flac"
> > +# DEPENDS += "mpeg4ip"
> > +
> > +PE = "1"
> > +RDEPENDS_${PN} += "glibc-gconv-utf-16 \
> > +             glibc-gconv \
> > +             "
> > +RPROVIDES_${PN} += "liblightmediascanner"
> > +
> > +inherit autotools pkgconfig
> > +
> > +FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
> > +
> > +do_stage() {
> > +	autotools_stage_all
> > +}
> 
> please don't use old staging for new stuff

Agreed.

Eduardo, can you try the patch without the do_stage function at all? It should
be take care of by the autotools class nowadays. Just remove it and see if all
files are staged correctly (e.g. by buildin an application that uses it) is all
you need.

regards
Stefan Schmidt


