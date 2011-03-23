Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Q2C9x-0002q9-PZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 01:42:50 +0100
Received: (qmail invoked by alias); 23 Mar 2011 00:40:59 -0000
Received: from p5B0A2113.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.33.19]
	by mail.gmx.net (mp046) with SMTP; 23 Mar 2011 01:40:59 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/s1QJldl7szVO5ErCrkFo0dIUPFQnU6Ntveie4hB
	YhI89bxJxpKWkq
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2011 01:33:02 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1299591298.3785.126.camel@mattotaupa>
	<1300449625.3830.47.camel@mattotaupa>
	<im4tuv$so3$1@dough.gmane.org>
In-Reply-To: <im4tuv$so3$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201103230133.06164.schnitzeltony@gmx.de>
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
X-List-Received-Date: Wed, 23 Mar 2011 00:42:50 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 20 March 2011 14:03:27 Koen Kooi wrote:
> On 18-03-11 13:00, Paul Menzel wrote:
> > Date: Fri, 18 Mar 2011 12:03:43 +0100
> > 
> > Xfce Session build depends on the executable `iceauth`, which fails when
> > cross compiling for a different architecture.
> 
> [..]
> 
> > --- a/recipes/xfce-base/xfce4-session_4.6.1.bb
> 
> [..]
> 
> > +EXTRA_OECONF += "ac_cv_path_ICEAUTH=/usr/bin/iceauth"
> 
> Minor nit: ${bindir}/iceauth
> 
> If that's fixed:
> 
> Acked-by: Koen Kooi <koen@dominion.thruhere.net>
> 
> regards,
> 
> Koen

During preparing xfce 4.8  recipes I stumbled over 'iceauth' too: 

It is missing on the target image although 'xfce4-session' has it in DEPENDS & 
RDEPENDS_${PN} (this patch does not change missing 'iceauth' in image - so I 
would NAK if I could) 

Anyway: In 'xfce4-session' / config.log I found:

| configure:15972: checking for iceauth
| configure:15990: found */usr/bin/iceauth*
| configure:16002: result: /usr/bin/iceauth

So - as Khem suggested - and with xfce4-session: RDEPENDS_${PN}="iceauth" I:
  - changed iceauth to extent to iceauth-native.
  - changed xfce4-session: DEPENDS = "iceauth-native ..."
  - build an image

Results:
- config.log says: configure:15990: found /home/Superandi/tmp/sysroots/i686-
linux/usr/bin/iceauth
- In installed-packages.txt now 'iceauth_1:1.0.4-r5.1.9_armv7a.ipk' is found!

Since xfce4.6 means huge rebuild for me (and I did only pick up what Khem 
suggested): Can anybody test this for xfce_session_4.6.{1, 2} and create the 
patches?

Andreas


