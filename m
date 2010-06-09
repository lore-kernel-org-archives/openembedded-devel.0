Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OMM14-0001c7-6n
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 16:12:26 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OMLwr-0001Uf-JY
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 15:08:05 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OMLwr-0003gZ-CD
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 15:08:05 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C0F9D6B.6000105@gmail.com>
References: <1275578113-17291-1-git-send-email-chase.maupin@ti.com>
	<hu8ivf$250$1@dough.gmane.org> <20100603165055.GA4402@denix.org>
	<4C0F9D6B.6000105@gmail.com>
Date: Wed, 09 Jun 2010 15:08:04 +0100
Message-ID: <1276092484.31317.145.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4-embedded: rename qtdemo file
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
X-List-Received-Date: Wed, 09 Jun 2010 14:12:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-06-09 at 15:55 +0200, Marco Cavallini wrote:
> #Append an E to the qtdemo file
> if [${QT_LIBINFIX} == "E"] ; then
> 	    mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
> fi

I think you need some quotes around ${QT_LIBINFIX} in the argument to [,
otherwise you are liable to get an error if the variable is empty.  It
might also make more sense to test something like '-n "${QT_LIBINFIX"',
rather than testing for it being 'E' specifically.  But yes, clearly the
current code is not satisfactory in the case of an empty infix.

p.




