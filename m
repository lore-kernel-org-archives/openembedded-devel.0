Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QIzvW-0003pN-WD
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 11:05:23 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QIzo3-0005lX-LT
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 10:57:39 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304837776.4124.15.camel@mattotaupa>
References: <1304524618-4864-1-git-send-email-robert@erafx.com>
	<20110508005952.GC20352@sakrah.homelinux.org>
	<1304837776.4124.15.camel@mattotaupa>
Date: Sun, 08 May 2011 10:02:36 +0100
Message-ID: <1304845356.3355.4.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] x264_r2245: fix DEPENDS for x86
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
X-List-Received-Date: Sun, 08 May 2011 09:05:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-05-08 at 08:56 +0200, Paul Menzel wrote:
> Am Samstag, den 07.05.2011, 17:59 -0700 schrieb Khem Raj:
> > On (04/05/11 11:56), Bob Foerster wrote:
> 
> You can be more specific in the commit summary.
> 
> 	do not override `DEPENDS` for x86
> 
> > > The recipe intended to add "yasm-native" to the dependencies on x86,
> 
> Use present tense. s/intended/intends/

If this is talking about the former, erroneous behaviour (which is
corrected by this patch) then the past tense is correct.

> > > -DEPENDS_x86 = "yasm-native"
> > > +DEPENDS_append_x86 = "yasm-native"
> >                          ^
> > you need a space 
> 
> You should also be able to use +=, should not you?

No, += doesn't work with overrides.  "DEPENDS_x86 +=" would do the same
wrong thing as the original "DEPENDS_x86".

p.




