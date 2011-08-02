Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qo8Qp-0001j9-A8
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 08:26:23 +0200
Received: (qmail invoked by alias); 02 Aug 2011 06:22:01 -0000
Received: from p4FDF0FCF.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.15.207]
	by mail.gmx.net (mp044) with SMTP; 02 Aug 2011 08:22:01 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19/DdIsvOd/Rek8qXwaPT9PHw2a08Alp6gckfk6jk
	75WwfJCJqPNMrO
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 2 Aug 2011 08:24:56 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
	<1312232577-7948-2-git-send-email-schnitzeltony@gmx.de>
	<2217747.GCqkKhOu6O@perseus>
In-Reply-To: <2217747.GCqkKhOu6O@perseus>
MIME-Version: 1.0
Message-Id: <201108020824.56776.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-oe 01/19] meta-xfce: Add layer information
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
X-List-Received-Date: Tue, 02 Aug 2011 06:26:23 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday, August 02, 2011 04:35:15 AM Khem Raj wrote:
> On Monday, August 01, 2011 11:02:39 PM Andreas Mueller wrote:
> > Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> > ---
> > 
> >  meta-xfce/conf/layer.conf |    9 +++++++++
> >  1 files changed, 9 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-xfce/conf/layer.conf
> > 
> > diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> > new file mode 100644
> > index 0000000..d669e4e
> > --- /dev/null
> > +++ b/meta-xfce/conf/layer.conf
> > @@ -0,0 +1,9 @@
> > +# We have a conf and classes directory, append to BBPATH
> > +BBPATH .= ":${LAYERDIR}"
> > +
> > +# We have a recipes directory, add to BBFILES
> > +BBFILES += "${LAYERDIR}/recipes-*/*/*.bb
> > ${LAYERDIR}/recipes-*/*/*.bbappend" +
> > +BBFILE_COLLECTIONS += "xfce-layer"
> > +BBFILE_PATTERN_xfce-layer := "^${LAYERDIR}/"
> > +BBFILE_PRIORITY_xfce-layer = "7"
> 
> it would be nice if there was also a README
> explaining the dependencies of this layer or any other
> information that user of this layer needs to know
Oops - will be done in V2 or further patch..

Andreas


