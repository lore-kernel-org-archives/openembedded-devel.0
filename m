Received: from fg-out-1718.google.com ([72.14.220.155])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NlQep-0002y9-D1
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Feb 2010 18:40:51 +0100
Received: by fg-out-1718.google.com with SMTP id e21so269618fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2010 09:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=mMQMGaLec2l5BruADZJhqvvl+AX8AdM398N3m99rNbo=;
	b=NX5gkRu6coAJxwaKtwqklbnz2zJ7j6e4mNwmNuG3237+9GV1udaZJAIE6EdaD56ftG
	pxhh8X6EflZhfK3IBD902qnH5LdNC1iDGIs8Pih7ozhKzSzjvKuuas75RwBvpWapBmQA
	TdkR+gGtzVLnGTuOZm0GGx+SqhOVZ+SYWgSVg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=eKlN8pIBn1TLQLmdedUyweqf2OFpomO2OQ+V/g/iU2DkqAcMqLzLVgJnA6YXSOoRSc
	eQr3umCA3zLr883Eesv7iAQ1hm6cY4jPLTXygPl/sknMiOWFHVjFe669lkACzIZaxdT5
	hGrZsZCJBW6zupK3xv1u5Rzl4P8xQTQFDidLc=
Received: by 10.87.76.9 with SMTP id d9mr1470324fgl.71.1267292285253;
	Sat, 27 Feb 2010 09:38:05 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm977048fxm.8.2010.02.27.09.38.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 27 Feb 2010 09:38:04 -0800 (PST)
Date: Sat, 27 Feb 2010 18:38:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100227173814.GI3206@jama>
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
	<20100227165600.GD30145@xora-desktop.xora.org.uk>
	<ac9c93b11002270921rb738980ye29c6fd93913107a@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11002270921rb738980ye29c6fd93913107a@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Sat, 27 Feb 2010 17:40:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 27, 2010 at 06:21:58PM +0100, Frans Meulenbroeks wrote:
> 2010/2/27 Graeme Gregory <dp@xora.org.uk>:
> > On Sat, Feb 27, 2010 at 04:25:27PM +0100, Frans Meulenbroeks wrote:
> >> Dear all,
> One could do:
> BBFILES = "${OE}/org.openembedded.dev/recipes/*/${DISTRO}/*.bb"
> BBFILES += "${OE}/org.openembedded.dev/recipes/*/*.bb"

images directory doesn't look so messy to me as some other directories
and also image recipes are usually quite easy to read/understand, so
I'm not sure why they need to be moved.

> > The other option, angstrom images used to be in recipes/angstrom and we
> > were asked to move them out so other distros can use them. Id be quite
> > happy with them to return to angstrom/ as it seems they are not useful
> > to other distros anyway.
> 
> (and on a personal note: maybe 25+ angstrom recipes is a little bit
> overkill, are these all actually used? )

even 25+ images seems more usefull to me than ie 19 mesa recipes and 17x
pixman (I already moved few and all libpixman to obsolete).

So from my point of view, image recipes doesn't need so much maintenance
as just pulls some subset of packages, why should someone remove them?

On the other side, additional patches are usually added only to latest,
most used recipe (where they are usually also tested) and older recipes
are just getting dust.

Hmm I'm already a bit off-topic, but nobody replied to my "Policy for moving
 older versions to obsolete" :/.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


