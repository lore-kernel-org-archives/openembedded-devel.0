Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OUS4g-0004nu-H9
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 00:17:40 +0200
Received: by pvg13 with SMTP id 13so1128519pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 15:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=Nx/qXzUMUYvCSgOL/q8awVKkUZgRKbtxcoYjqT+g2/E=;
	b=Z9c6a4/C2Uqx+d70scThi8MDezDEjcbZn1hHVtV/ul+EiLIS6csJZvRFrjvSkhRalK
	c++/4SQPEv4dYppXJXsrAA5NZloa4TzXWLF+KwyUY15Nv60UZKD3HEMXjqiibVh5cfeZ
	DsS9z/DpfvBKQtKzo981Brrb0D7vk66KZ02T8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=AyWKInUZV03CIvhItk28cZA0tVuTXPjYBOhiJhKT2L2NZXr/DmTWlQHDvsdGWNvZ3p
	nv6wtDoktcqh5Adr0OkCt3nYQUBr7R1s2eiXt0Vo+M8hn960+YzVuthEWdyYidtsUxT0
	4Zdc4lHRwcsHUwaNQkDTYEfOri2AZPXgoN+ck=
Received: by 10.142.143.7 with SMTP id q7mr159734wfd.205.1278022372285; Thu, 
	01 Jul 2010 15:12:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.177.19 with HTTP; Thu, 1 Jul 2010 15:12:32 -0700 (PDT)
In-Reply-To: <i0iv84$7qt$1@dough.gmane.org>
References: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk> 
	<i0iv84$7qt$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 1 Jul 2010 15:12:32 -0700
X-Google-Sender-Auth: X9sruXJZa7Nzo1qys98AboIKAqs
Message-ID: <AANLkTimBosjYQ6pBzy6t63TU_vc6unh8QpnCvKcvR2iL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Thu, 01 Jul 2010 22:17:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 1, 2010 at 1:53 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 01-07-10 18:24, Graeme Gregory wrote:
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
> >
> > Thoughts?
>
> Just that USE flags shouldn't be used if seperate recipes can solve it
> as well.


In general I disagree with this, though I understand where you're coming
from (Tom Rini made it clear in a discussion earlier).  I don't think it'd
be terribly difficult to be able to automatically encode the use flags (at
least for non-default) in the PKG, while having it RPROVIDES ${PN}, so that
it would be obvious looking at the feeds.  Alternatively, we can in the
future utilize the code I'm working on for checksumming the metadata or
portions of the metadata to ensure that variants are encoded in the package
naming.  Opinions?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

