Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1OaOzY-0001qi-EF
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 10:13:01 +0200
Received: by fxm12 with SMTP id 12so1723576fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 01:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=TnoLLyzKUuRa3nTj2zDXPdkp87PuR33ZKxyP2a/qLAY=;
	b=t7djEmLHPKjWJF8lXyPyACZVgwQFym+E91V/7uUAS9lHNeWq8PCpxaWF6VPMC+QCqR
	vSsjUhrIDISma2Yns3pb+fxmeOrivmEPDhkP1hWtXpJf2dCwf0F2LewpXm58suOt4+5G
	/kVbgkunKTvp9oAJaqGtwm/gzdmOpDy5Umkzc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=D1Ec+K12kkmzKP4aPtm4ZiUmOjLWeryIhyHIt2x/OtdYhwLHGOpV85+LIXaP7eFkPU
	OEYU3+h11XunT5D6zQxPKRwKiqBs7rVNTHBPZNASMp+PQLD2lKd1uWRvHgAe2JYweC4v
	k8QmRlsoZq0BvlbziCQ6PyFbAGYru69Q3DR0k=
MIME-Version: 1.0
Received: by 10.239.161.203 with SMTP id i11mr233630hbd.116.1279440761239; 
	Sun, 18 Jul 2010 01:12:41 -0700 (PDT)
Received: by 10.239.181.207 with HTTP; Sun, 18 Jul 2010 01:12:41 -0700 (PDT)
In-Reply-To: <AANLkTikr86Xy4gg7cgLFnKEIbGEyOCFbauzMSzMZxtG3@mail.gmail.com>
References: <1279290319.10837.1747.camel@rex> <4C407EE5.6050802@cbnco.com>
	<1279297456.10837.1942.camel@rex>
	<AANLkTikr86Xy4gg7cgLFnKEIbGEyOCFbauzMSzMZxtG3@mail.gmail.com>
Date: Sun, 18 Jul 2010 10:12:41 +0200
Message-ID: <AANLkTimVmnNt95LtInA59x4kXjGTFbc4XkgzX1voX2Oq@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Bitbake-dev] A new bitbake extension: .bbappend files
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
X-List-Received-Date: Sun, 18 Jul 2010 08:13:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 16, 2010 at 6:53 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Looks like a fine idea to me (although I must say I was unaware of the amend
> class, so I cannot really compare).
>
> An alternative I was thinking of was to have a mechanism in an overlayed
> recipe that would allow you to include whatever version was in a lower
> priority overlay, but your prososal looks also quite sound.

I have been thinking of this approach several times also.
Something like

overlay_require pointercal_0.0.bb

But I like the bbappend approach also, so

+1

from me also.  Simple is good :-)

/Esben


