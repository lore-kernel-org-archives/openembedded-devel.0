Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1NbWF0-0002fR-Gg
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 10:37:17 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 31D0D1D3607A; Sun, 31 Jan 2010 10:34:49 +0100 (CET)
Date: Sun, 31 Jan 2010 10:34:49 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100131093448.GI24852@ibawizard.net>
References: <op.u7dmmldamn1qzu@camelguo>
	<19c1b8a91001302122x5cde3628xd57639405a862736@mail.gmail.com>
	<op.u7dt8jyhmn1qzu@camelguo> <op.u7dus8qwmn1qzu@camelguo>
MIME-Version: 1.0
In-Reply-To: <op.u7dus8qwmn1qzu@camelguo>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building piccontrol - 0.4 failed due to lack of	liblua5.1.a
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
X-List-Received-Date: Sun, 31 Jan 2010 09:37:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Guo Hongruan <camelguo@gmail.com> [2010-01-31 13:56:58]:

> 2. but piccoontrol_0.4.bb tries to link liblua5.1.a, which name is  
> liblua.a.
>    20 LDFLAGS += " ${STAGING_LIBDIR}/liblua5.1.a -lpthread -lm -ldl "
>
> changing piccontrol_0.4.bb may correct the error.

I think, that correct way of fixing it would be to fix Lua recipe to install
as liblua5.1.a. Maybe creating pkgconfig for Lua would help also.

-- ynezz


