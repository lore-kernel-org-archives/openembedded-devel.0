Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MdkU4-0001nx-K9
	for openembedded-devel@openembedded.org; Wed, 19 Aug 2009 14:41:46 +0200
Received: (qmail 3255 invoked by uid 813007); 19 Aug 2009 12:24:34 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO host4.kei.pl)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Aug 2009 12:24:34 -0000
References: <1250176750.29049.1003.camel@conroy-linux><20090813155909.GC8906@gmail.com><1250612879.6785.12.camel@conroy-linux><20090818174157.GB25000@denix.org>
	<8128F0FD6C26E14C8EB4BFDB92B8D6B201B3E4@2putt.int.lantronix.com>
In-Reply-To: <8128F0FD6C26E14C8EB4BFDB92B8D6B201B3E4@2putt.int.lantronix.com>
Received: from 83.22.159.1
	(Poczta WWW KEI.pl authenticated user marcin@juszkiewicz.com.pl)
	by poczta813.kei.pl with HTTP; Wed, 19 Aug 2009 14:24:34 +0200 (CEST)
Message-ID: <19c81808ecdbf92546b395d4df864830.marcin@juszkiewicz.com.pl>
From: <marcin@juszkiewicz.com.pl>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Aug 2009 14:24:34 +0200
MIME-Version: 1.0
X-Priority: 3
X-Mailer-Version: 1.0
X-Mailer: Poczta WWW KEI.pl
X-Organisation: KEI Provider
X-User-IP: 83.22.159.1
X-Http-User-Agent: Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10.5; pl;
	rv:1.9.1.2) Gecko/20090729 Firefox/3.5.2
Subject: Re: Is there an easy way to get a minimalist image without I18nLibraries?
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
X-List-Received-Date: Wed, 19 Aug 2009 12:41:51 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Dnia Tue, 18 Aug 2009 14:39:04 -0700 napisano:

> I am playing with the m=
inimal-image on this configuration:

> To save even more flash space, is =
there also a way to disable the
> installation of opkg
> and its dependen=
cies like: libgnutls26, libcurl4?

# Disable online package management
O=
NLINE_PACKAGE_MANAGEMENT =3D "none"

Add this into your image recipe.





