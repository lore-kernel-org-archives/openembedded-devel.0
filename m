Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1OUNBw-00027J-3P
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 19:04:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 196BBA5672
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jul 2010 18:00:04 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id r+ot2diR0n8t
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jul 2010 18:00:03 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 42F64A5651
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jul 2010 18:00:03 +0100 (BST)
Date: Thu, 1 Jul 2010 18:00:40 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100701180040.6499bd78@xora-desktop.xora.org.uk>
In-Reply-To: <AANLkTilv__N5dfMDXUfNYcvave3Hajfjk-QulXke28GA@mail.gmail.com>
References: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk>
	<AANLkTilv__N5dfMDXUfNYcvave3Hajfjk-QulXke28GA@mail.gmail.com>
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: USE flags mumbling
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
X-List-Received-Date: Thu, 01 Jul 2010 17:04:49 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Jul 2010 09:50:11 -0700
Chris Larson <clarson@kergoth.com> wrote:

> On Thu, Jul 1, 2010 at 9:24 AM, Graeme Gregory <dp@xora.org.uk> wrote:
> 
> > We already have BBCLASSEXTENDS which modifies ${PN} of a package and
> > can use overrides to change behaviors of recipes.
> >
> > Maybe USE flags could be implemented in a similar fashing.
> >
> > DISTRO_USE = "nossl nox11"
> >
> > EXTRA_OECONF_append_use-nossl = "--disable-ssl"
> >
> > ${PN} of the recipe becomes XXXX-nossl
> 
> 
> Any particular reason to not leverage the existing DISTRO_FEATURES,
> MACHINE_FEATURES, COMBINED_FEATURES for this?

No reason, doesn't really matter how the choices are generated.

G


