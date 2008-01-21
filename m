Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1JH2hv-0000Gw-Mk
	for openembedded-devel@openembedded.org; Mon, 21 Jan 2008 20:53:23 +0100
Received: (qmail 22294 invoked by uid 813007); 21 Jan 2008 19:53:24 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 21 Jan 2008 19:53:23 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jan 2008 20:53:16 +0100
User-Agent: KMail/1.9.7
References: <200801211408.31701.openembedded@haerwu.biz>
	<13810087643.20080121191622@gmail.com>
In-Reply-To: <13810087643.20080121191622@gmail.com>
MIME-Version: 1.0
Message-Id: <200801212053.17632.openembedded@haerwu.biz>
Subject: Re: Bug 2430 -- TrueType fonts handling and solution for it
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2008 19:53:23 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Monday, 21 of January 2008, Paul Sokolovsky napisa=B3:
> Monday, January 21, 2008, 3:08:31 PM, Marcin wrote:

>   Is such extra level of indirection and multiplexing really required?

Yes -- it is required. This way we will have it solved once and will not=20
have to change it just because XDE or PSDE uses fonts in other way.

> Or rather, I wish we separated this matter to 2 separate ones:
>
> 1. Adopting reusable pattern for solving task of "need to 'register'
> objects of arbitrary type".
> 2. See what kind of registration support required for objects of type
> fonts.

=46eel free to suggest other solution. This one which I summarized was=20
discussed on IRC for quite long time.

> For 1, I wish we adopted some easy scheme, like, for all packages
> containing object of type foo, to have in postinstall:
>
> [ -x /usr/bin/update-foo ] && /usr/bin/update-foo

What will be "update-foo" for fonts? Will it be "update-fonts" which Rolf=20
and I suggest or will it be "update-fonts-for-opie"=20
+ "update-fonts-for-fontconfig" + "update-fonts-for-xde" etc? I have a=20
feeling that you try to force us to go second way.

> Then, for each specific object type, specific package will handle
> registration

And thats what our suggestion do. If you install "specific object type"=20
(which TrueType/OpenType fonts are) then "specific package"=20
(update-fonts-common + scripts from each system which use TTF) will=20
handle registration of "objects" (fonts) in system.


> for example among following (but not limiting to) choices:

> 1. No registration needed at all - no /usr/bin/update-foo, nothing
> will be done.

And nothing will see TT/OT font.

> 2. In simplest case, /usr/bin/update-foo will be a symlink to tool
> handling registration for specific environment.

And when user will install other environment then which one will be=20
called?

> 3. If some objects really need registration with different facilities,
> multiplex scheme as described can be used.

If there are scripts only for one environment installed then it is like=20
your 2nd point.

I really do not see a problem where you are trying to find one.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

    If you're not the part of solution then you're part of the problem.




