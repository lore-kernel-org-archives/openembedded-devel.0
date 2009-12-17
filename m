Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NLCyG-0007T6-SZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Dec 2009 10:48:35 +0100
Received: from 88-110-14-177.dynamic.dsl.as9105.com ([88.110.14.177]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>)
	id 1NLCwX-0005Ni-1U; Thu, 17 Dec 2009 09:46:45 +0000
From: Phil Blundell <philb@gnu.org>
To: Johan Hovold <johan.hovold@lundinova.se>
In-Reply-To: <20091217091605.GB32444@lundinova.se>
References: <200912161526.36033.holger+oe@freyther.de>
	<1260980999-27920-1-git-send-email-johan.hovold@lundinova.se>
	<1260993181.6896.442.camel@lenovo.internal.reciva.com>
	<20091217091605.GB32444@lundinova.se>
Date: Thu, 17 Dec 2009 09:46:42 +0000
Message-ID: <1261043202.6896.456.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] openvpn: remove dependency on kernel module
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
X-List-Received-Date: Thu, 17 Dec 2009 09:48:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2009-12-17 at 10:16 +0100, Johan Hovold wrote:
> > -RDEPENDS = "kernel-module-tun"
> > > +RRECOMMENDS = "kernel-module-tun"
> > 
> > Did you want RRECOMMENDS_${PN} there? 
> 
> What is the reason for preferring the _${PN} form here? I notice a lot
> of recipes do not use it.

RRECOMMENDS_${PN} will only insert the recommendation into ${PN},
whereas plain RRECOMMENDS will insert the recommendation into all of the
${PACKAGES}.

p.




