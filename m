Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nu6tE-00061v-2H
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 17:23:37 +0100
Received: by ewy25 with SMTP id 25so2146919ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 09:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=MJ9b651zHoCUeb0fmqLkE7jqqINJtACYDd3c2hxRoWI=;
	b=mKIaNArCwzmdAwYVTX9lXUUONmPYB0s1/oR2R8AbiGfUTcZHZ8sDmd7dSBsnAfq9ds
	8urzRKH8zkcmplOSisa+Xo/3GXG+fzdgVHVgtiFG22xTZKBaa9LkMbmstXbDuKtwz/ru
	taGCm+A2mKYXQz6+aPLwFDNxyKtMPGMMcMa6I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=VKy2Ob83dJ/oAn9AFCrlLlZ/5yv4f/ZRw3r4jpb9VJCj7kEw9rXrqrT4GebTdG0ywL
	XOJTAVH8sQdH/dVQn5EW4N/WNnv8Hkl4ReNI7wocTzVsuK8wR8JfXHW9RZ0F8EDjDsMH
	6SEqOHpWoVh7DSESo7+GEkbq8k4HY1hfDOSzI=
Received: by 10.102.129.7 with SMTP id b7mr8975217mud.11.1269361227027;
	Tue, 23 Mar 2010 09:20:27 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 7sm30396333mup.3.2010.03.23.09.20.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 23 Mar 2010 09:20:26 -0700 (PDT)
Date: Tue, 23 Mar 2010 17:20:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100323162000.GA32576@jama>
References: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com>
	<20100323094757.GE21210@jama>
	<b6ebd0a51003230841g5fa61480t6330eda0d27596d2@mail.gmail.com>
	<20100323155700.GF21210@jama>
	<b6ebd0a51003230907u767ef141icafb3dd88b381883@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <b6ebd0a51003230907u767ef141icafb3dd88b381883@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.219.225
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBVERSIONS
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
X-List-Received-Date: Tue, 23 Mar 2010 16:23:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 23, 2010 at 09:07:01AM -0700, Chris Larson wrote:
> Fair enough, there are valid concerns here, though I think some exist with
> or without the bbversions mechanism to a certain extent.  If a minor version
> is buildable that isn't patched with the security patch, remove it from the
> BBVERSIONS variable.  Not that different from what you'd do today, just with
> less individual recipes.  I'm not proposing that we sit down and turn every
> recipe into something like what I'm playing with with nano, where you can
> build any version that exists, this is just a proof of concept, to
> experiment with the new possibilities for structuring of recipes.  I expect
> in the real world we'd start by using it to consolidate some metadata, as
> you mention, and add only versions which we already have, or have tested.
>  Do you think the feature would be useful in this way?

Sure, I'm just pointing that expected use-cases where it's really
usefull are a bit limited by those concerns above. So it was more for
your question if it's worth it :). 


> Of course, ideally, we'd set up more testing of things on the target with an
> automated testing system of some sort, to make it easier to confirm that we
> haven't broken things in other versions and other architectures (and this is
> a concern today too).
> 
> Are there any concerns about this feature existing actually being a problem,
> in that it will encourage people to start using it, or should we get it into
> master and see how it goes?  We won't be able to really utilize it in OE
> until 1.10 releases and we bump our required bitbake to 1.10 anyway, which
> is why I'm doing the testing and experimentation outside it for now.

At least I'm happy to see another dev waiting for 1.10 required by
oe.dev :).

Cheers,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


