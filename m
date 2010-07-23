Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OcEhY-0002JU-Aw
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 11:37:57 +0200
Received: by fxm12 with SMTP id 12so4972636fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 02:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=lSo4xqgcy8MX4/eMHwWKangZGI9GW3R8X7VftEv6AKE=;
	b=OuX5KrMHRQ3yxjkUL3KmmKTZvSyOVZC5Fon+qlBxbP2q+h+sVQh2+GIhD1LIBNe0Rx
	qXLDdA5BMrNDC7smI0TQsIprkTl38HJSo/orItPwwqaY1eRINgXnsaywi0Lj+yHkETOH
	v5yDOcYp7JQqPor8dS0YA90ZgX2d2Xgz09gD4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=AnLR0RjyFe0bBy9HkE2YbwcwP2CPxcIuOSJUccpRDMP6yOMQsCKfmQZWHkm8+Qt1xp
	dUosnTKbSvE1/Ljo0A1WQ6ynTjboGxsAEWHIY8yWXjYe+1Csb7zmRDLVU8AYpplVa5UF
	t/Kza/poaoDEXKz/MHPjpNIBFSFZn04DnbJI4=
Received: by 10.223.120.82 with SMTP id c18mr3027025far.69.1279877863721;
	Fri, 23 Jul 2010 02:37:43 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b9sm16898faq.31.2010.07.23.02.37.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 23 Jul 2010 02:37:43 -0700 (PDT)
Date: Fri, 23 Jul 2010 11:38:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100723093844.GS2189@jama>
References: <201007230134.59343.david.lanzendoerfer@o2s.ch>
	<59B9E304-2B14-4D9F-80F7-8AB7A234D404@vanille-media.de>
	<AANLkTinjBZ6TOcDYvoeeAbqKjA19Roh6XQwvg9=u006s@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinjBZ6TOcDYvoeeAbqKjA19Roh6XQwvg9=u006s@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Adding maxima recipe (tool for algebraic calculation)
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
X-List-Received-Date: Fri, 23 Jul 2010 09:37:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 23, 2010 at 11:23:21AM +0200, Frans Meulenbroeks wrote:
> 2010/7/23 Dr. Michael Lauer <mickey@vanille-media.de>
> 
> > > +DESCRIPTION="Free computer algebra environment based on Macsyma"
> > > +HOMEPAGE="http://maxima.sourceforge.net/"
> > > +SRC_URI="http://www.sfr-fresh.com/unix/misc/${P}.tar.gz<http://www.sfr-fresh.com/unix/misc/$%7BP%7D.tar.gz>
> > "
> > > +LICENSE="GPLv2"
> >
> > Whitespace, please.
> >
> > Thanks.
> >
> > Mssed that one, but yes, you are right. For the author, Mickey means having
> spaces around the =
> 
> Linebreaks also crossed my mind, but frankly speaking I'm not too sure about
> the policy there.
> Also typically LICENSE is before SRC_URI (that should be fixed too)

done
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=570b4127ed3618be84d7952ec09b4fbb094f5dca

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


