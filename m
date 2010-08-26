Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oolky-0005yI-Lj
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 01:21:17 +0200
Received: by iwn2 with SMTP id 2so1929571iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 16:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=30S7IdQTcRyclQGh31ys6tY8esK24GLldM90DiKLfyY=;
	b=ec9GG4pyvdcmKyqnTVXI/BgFeqXTY5YSby05F/TRpu2f9otxqIFRR5U1romvcwp9of
	tI7KRR9LdK9lJADNkiw+eu+Xum3b3VItdqe1vpoD3NmBvgHm/QvVlIJkwsgKcCCx/MCo
	0HNxQp83+dcyWjsjlPMLx+yYN0bEBvXBP4+2E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=RrHBUrAuWkttAs71Z6AGo1MVVJTSO6N4q29KUI91DcZWdCYuUfX6E81lRHQ6gg6cX4
	ii/HddPfDK6/wOINGT2wRvym1GFDtq+nTiQegQd/+10CfnOWw6AjHSZbecEX6Ninef6a
	9NbwNISG1AA7xFawZMYBXih+Xa3MK+KrOkMmQ=
MIME-Version: 1.0
Received: by 10.231.35.77 with SMTP id o13mr61285ibd.92.1282864849834; Thu, 26
	Aug 2010 16:20:49 -0700 (PDT)
Received: by 10.231.167.79 with HTTP; Thu, 26 Aug 2010 16:20:49 -0700 (PDT)
In-Reply-To: <4C76CD2C.2090102@mlbassoc.com>
References: <AANLkTim6-d4krhcMuAZojQVNdy3W-m_ON-mOvK5y3tqn@mail.gmail.com>
	<4C76C597.9050302@mlbassoc.com>
	<AANLkTinnnfOCw3m_q6_d27o9Luyw4dWS-uVhJzYUTTbZ@mail.gmail.com>
	<4C76CD2C.2090102@mlbassoc.com>
Date: Fri, 27 Aug 2010 08:50:49 +0930
Message-ID: <AANLkTi=WnKFoiutD+vZHEQLDQzmFnhdrUMjYrvc_MNam@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-08-23
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
X-List-Received-Date: Thu, 26 Aug 2010 23:21:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

"""if a build fails, then issues are reported, and the testing-testing
branch is moved ahead to capture fixes made in the dev branch. Once
the issue is fixed, all combinations are retested."""

Can I suggest that the testing-testing branch not be moved ahead? Its
not really fair on testers to have to retest, especially if the branch
is moved ahead a couple of times. Obviously breakages should be fixed
and committed, but can't it just wait for the following week's testing
branch to show up as a successful build?

-Graham


