Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q8ddK-0004Ov-Qt
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 21:15:46 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q8dbG-0006O6-Kf
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 21:13:38 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DA0A13A.1090406@mentor.com>
References: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
	<1301660208-31105-3-git-send-email-otavio@ossystems.com.br>
	<in4lhs$326$1@dough.gmane.org>
	<AANLkTimRF7Q3=XeF1EOHgPNAGfJwnp5PmjHGyjUhTyef@mail.gmail.com>
	<CC5D751E-FF84-40C2-B184-4C813C49F5E4@dominion.thruhere.net>
	<AANLkTimS+CcrB7cHUF+ao=XwD0aXeFqt4r1N4erHoKFs@mail.gmail.com>
	<1302330816.15056.15.camel@leto>
	<1302340789.3131.7.camel@lenovo.internal.reciva.com>
	<BANLkTinKJf85aenJia6nrVBaOdANdM44oA@mail.gmail.com>
	<4DA0A13A.1090406@mentor.com>
Date: Sat, 09 Apr 2011 20:13:32 +0100
Message-ID: <1302376412.3131.9.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 3/6] xorg-xserver-common.inc: drop .la files from packages
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
X-List-Received-Date: Sat, 09 Apr 2011 19:15:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-04-09 at 11:11 -0700, Tom Rini wrote:
> On 04/09/2011 10:36 AM, Otavio Salvador wrote:
> > On Sat, Apr 9, 2011 at 06:19, Phil Blundell <philb@gnu.org> wrote:
> >> What would be the use case for having them there?  Nothing ever links
> >> against them.  I think Otavio is right, they're better off deleted.
> > 
> > AFAIK .la files are used for in project linking not when linking with
> > system or sdk libraries. So I'd prefer to remove them.
> 
> .la files have a defined purpose in a development area.  Until / unless
> we move to globally killing .la files (see Richard talking about this on
> the poky list a few weeks ago), we should ship these in the -dev
> package.  If they're broken that probably means something isn't
> inherit'ing the right class that should be fixing them.

Well, the point about these particular .la files is that they relate to
dlopen()ed modules, not to shared libraries that one would wish to link
against.  So the "defined purpose" doesn't apply to this situation.

I don't think the files in question are broken, just useless.  It seems
silly to waste space in the -dev package with them.

p.




