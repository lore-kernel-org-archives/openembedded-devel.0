Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M658P-0007qQ-CH
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 17:52:17 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJU00EQKJQ6FGF0@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	18 May 2009 10:44:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 514B114AF5F; Mon,
	18 May 2009 11:44:30 -0400 (EDT)
Date: Mon, 18 May 2009 11:44:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <d1b08f940905151407o4b2135bcqd18c8a1c32dfe86c@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090518154430.GB19357@denix.org>
MIME-version: 1.0
References: <1242247998-30548-1-git-send-email-clarson@mvista.com>
	<4A0CE800.5040407@dls.net>
	<d1b08f940905150033r570ee6d7ta83eb4948b8e2d5a@mail.gmail.com>
	<b6ebd0a50905150809y36426e69u96ac070414b96029@mail.gmail.com>
	<d1b08f940905151407o4b2135bcqd18c8a1c32dfe86c@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] bitbake.conf, freeze.inc: Add version lockdown	implementation and use it by default.
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
X-List-Received-Date: Mon, 18 May 2009 15:52:27 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Fri, May 15, 2009 at 11:07:33PM +0200, Andrea Adami wrote:
> >> What about adding a -u (update) option? This would just give old=
 behaviour.
> >
> > I don't understand what you'd want -u to do? =A0This patch doesn'=
t
> > modify bitbake,
>=20
> Why? Taboo?
> Adding the 'update' option to bitbake would be logic at this point.
> Buildscripts would just have to change to 'bitbake -u'.
>=20
> (see Gentoo's emerge)

I guess since bitbake is not part of OE (unlike Gentoo's emerge/porta=
ge), it=20
is less transparent for introducing new features like this one...

--=20
Denys



