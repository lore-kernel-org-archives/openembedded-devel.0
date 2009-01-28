Received: from [82.208.44.173] (helo=ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@ibawizard.net>) id 1LS9O3-0004S4-Mp
	for openembedded-devel@openembedded.org; Wed, 28 Jan 2009 13:19:19 +0100
Received: by ibawizard.net (Postfix, from userid 1002)
	id A2B6616C001; Wed, 28 Jan 2009 13:11:44 +0100 (CET)
Date: Wed, 28 Jan 2009 13:11:44 +0100
From: Petr Stetiar <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Message-ID: <20090128121144.GG19349@ibawizard.net>
References: <1233141914-25251-1-git-send-email-ynezz@true.cz>
	<glph74$8js$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <glph74$8js$1@ger.gmane.org>
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: [PATCH] fix missing groups in udevd
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
X-List-Received-Date: Wed, 28 Jan 2009 12:19:19 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Koen Kooi <k.kooi@student.utwente.nl> [2009-01-28 12:57:23]:

> On 28-01-09 12:25, Petr =A9tetiar wrote:
> >Fix for udevd warning messages when I plug in USB stick:
> >
> >	Starting udevudevd[585]: lookup_group: specified group 'scanner'=20
> >	unknown
> >	udevd[585]: lookup_group: specified group 'nvram' unknown
> >	udevd[585]: lookup_user: specified user 'tss' unknown
> >	udevd[585]: lookup_group: specified group 'fuse' unknown
> >	udevd[585]: lookup_group: specified group 'kvm' unknown
> >	udevd[585]: lookup_group: specified group 'rdma' unknown
> >	udevd version 124 started
> >
> >Signed-off-by: Petr =A9tetiar<ynezz@true.cz>
>=20
> Would it make sense to have udev install those groups? If not, your=20
> patch looks OK, but it's missing a PR bump for udev 124.

Yep, I was thinking about the new groups also and thinking about it again=
,
it might be a better solution for the future udev releases also.

I can't decide what's better, so I rather sent this patch.

-- ynezz


