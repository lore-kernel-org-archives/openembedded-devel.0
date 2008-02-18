Received: from [209.85.134.189] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JREmP-0001Ec-Aj
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2008 23:48:11 +0100
Received: by mu-out-0910.google.com with SMTP id w9so1357294mue.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2008 14:47:26 -0800 (PST)
Received: by 10.78.164.9 with SMTP id m9mr10157366hue.54.1203374846083;
	Mon, 18 Feb 2008 14:47:26 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id f3sm16046096nfh.15.2008.02.18.14.47.24
	(version=SSLv3 cipher=OTHER); Mon, 18 Feb 2008 14:47:25 -0800 (PST)
Date: Tue, 19 Feb 2008 00:47:57 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080219004757.0dcad46e@widy.localdomain>
In-Reply-To: <20080218222710.3f745f9b@cimmeria>
References: <200802182052.30981.mickey@vanille-media.de>
	<20080218222716.7fb73014@widy.localdomain>
	<1203371664.8578.46.camel@dax.rpnet.com>
	<20080219001829.07135593@widy.localdomain>
	<20080218222710.3f745f9b@cimmeria>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.134.189
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DISTRO override logic in angstrom.inc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2008 22:48:11 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Mon, 18 Feb 2008 22:27:10 +0000
Graeme Gregory <dp@xora.org.uk> wrote:

> On Tue, 19 Feb 2008 00:18:29 +0200
> Paul Sokolovsky <pmiscml@gmail.com> wrote:
> > I assume that OVERRIDES are processed in order, so if there're both
> > openmoko and angstrom override, first will have priority, otherwise
> > angstrom's will be picked up, and I guess that's desired behavior.
> > 
> Actually both are used. Hence openmoko patches in psplash are a diff
> against Angstrom patches and not the raw source.

Oh my god, it's all so tangled then. I missed the fact that I broke
openmoko build with logo-math.patch - I added it as ansgtrom-specific
override exactly because didn't want to affect OM ;-I.

Well, it needs to be pushed upstream now...

> 
> Graeme
> 


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


