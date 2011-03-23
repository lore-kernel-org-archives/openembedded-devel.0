Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Q2JgQ-00081n-4p
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 09:44:55 +0100
Received: (qmail invoked by alias); 23 Mar 2011 08:42:59 -0000
Received: from mail2.zera.de (EHLO localhost.localdomain) [62.225.102.139]
	by mail.gmx.net (mp014) with SMTP; 23 Mar 2011 09:42:59 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19KIscLzl1KSrzlwNlyNE5K9rpVY4TTtZkK8q0/OV
	vjaW/9pGfFtUL6
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2011 09:35:01 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1299591298.3785.126.camel@mattotaupa>
	<201103230133.06164.schnitzeltony@gmx.de>
	<imc6ke$j7j$1@dough.gmane.org>
In-Reply-To: <imc6ke$j7j$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201103230935.01227.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] xfce_session_4.6.{1, 2}: explicitly pass the path of `iceauth`
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
X-List-Received-Date: Wed, 23 Mar 2011 08:45:13 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 23 March 2011 08:14:22 Koen Kooi wrote:
> On 23-03-11 01:33, Andreas Mueller wrote:
> > Anyway: In 'xfce4-session' / config.log I found:
> > | configure:15972: checking for iceauth
> > | configure:15990: found */usr/bin/iceauth*
> > | configure:16002: result: /usr/bin/iceauth
> > 
> > So - as Khem suggested - and with xfce4-session: RDEPENDS_${PN}="iceauth" I:
> >   - changed iceauth to extent to iceauth-native.
> >   - changed xfce4-session: DEPENDS = "iceauth-native ..."
> 
> No, it only wants to probe for the PATH of the binary to encode into the
> result. We do NOT want target binaries to point to your builddir instead
> of ${bindir}.
> 
> As I said before, Pauls patch does the right thing.
Got it - sorry for the noise - have an ACK on Paul's patch :-)


On Wednesday 23 March 2011 01:51:38 Paul Menzel wrote:
> I did not check that. But why does not `RDEPENDS` pull that in?
If I would understand that... But I think that is what happened to you in 
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/030721.html
xfce4-settings has iceauth in DEPENDS & RDEPENDS since long time..

> Have you run tested that? As far as I understood that path is put into
> the resulting binary and, if I am not mistaken, the path will be
> `/usr/bin/iceauth` on the target system.
now yes - it failed - see above..
> 
> > Since xfce4.6 means huge rebuild for me (and I did only pick up what Khem
> > suggested): Can anybody test this for xfce_session_4.6.{1, 2} and create
> > the patches?
> 
> Could you send me the patch to get the native recipe for Xfce 4.8?
Sorry - but what do you mean with *native* recipe for Xfce 4.8?

Andreas


