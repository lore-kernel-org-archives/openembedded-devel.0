Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnz5G-0005bO-Mm
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 22:27:30 +0200
Received: (qmail invoked by alias); 01 Aug 2011 20:23:10 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp013) with SMTP; 01 Aug 2011 22:23:10 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+aFbFmZdea1byqI9IWcEMj8rpTzd+eMqopRr7dc1
	MYVjXfvDp+XnEv
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 1 Aug 2011 22:26:03 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1311960660-7876-1-git-send-email-schnitzeltony@gmx.de>
	<1311963724.3882.85.camel@mattotaupa>
In-Reply-To: <1311963724.3882.85.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201108012226.03700.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-oe] iceauth: Import from oe-dev and minor cleanup
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
X-List-Received-Date: Mon, 01 Aug 2011 20:27:30 -0000
Content-Type: Text/Plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit

On Friday, July 29, 2011 08:22:04 PM Paul Menzel wrote:
> Dear Andreas,
> 
> 
> thank you for your patch.
> 
> Am Freitag, den 29.07.2011, 19:31 +0200 schrieb Andreas Mueller:
> 
> When importing from somewhere please always reference the used commit id
> as requested in the guidelines [1]. Also mentioning the version in the
> summary would be nice.
> 
> 	iceauth: Import 1.0.4 from oe.dev
> 
> > Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> > ---
> > 
> >  meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb |   10 ++++++++++
> >  1 files changed, 10 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
> > 
> > diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
> > b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb new file mode
> > 100644
> > index 0000000..e98c0cb
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
> > @@ -0,0 +1,10 @@
> > +DESCRIPTION = "Tool for manipulating ICE protocol authorization records"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=13f70acf3c27f5f834bbc954df775f8e"
> 
> What license is it?
As you said: MIT-X is included by xorg-app-common.inc
> 
> > +PR = "${INC_PR}.0"
> > +
> > +DEPENDS += " libice"
> 
> This should go in front of PR according to the style guide [2].
Do you want V2 with different sequence?
> 
> > +
> > +require xorg-app-common.inc
> > +
> > +SRC_URI[md5sum] = "bb2e4d2611047f7c5a1a82ec956a9de4"
> > +SRC_URI[sha256sum] =
> > "0ee6fd4554f0131b1ed526ee00b9cf643e7dc97eb70fb51448848ef2f349938d"
> 
> I will try to make the updates in oe.dev and maybe you can resync
> afterward.
Sorry for the impatience, but I am about to send out a patch series for xfce48 
and xfce4-session RDEPENDs on iceauth to work properly.

Andreas 


