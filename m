Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1ICyur-0004nH-Af
	for openembedded-devel@openembedded.org; Mon, 23 Jul 2007 16:29:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6NESbCe026817;
	Mon, 23 Jul 2007 15:28:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26344-09; Mon, 23 Jul 2007 15:28:33 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6NESSld026799
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 23 Jul 2007 15:28:29 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <469D3D80.7040104@klever.net>
References: <d543f5920707171347k2845264cgbce3c02d76818810@mail.gmail.com>
	<469D3681.3030004@klever.net>
	<d543f5920707171458q3c13f402x16c8c8fb37f280ea@mail.gmail.com>
	<469D3D80.7040104@klever.net>
Date: Mon, 23 Jul 2007 15:28:28 +0100
Message-Id: <1185200908.6148.56.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Building auxiliary tools in qmake2-native
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
X-List-Received-Date: Mon, 23 Jul 2007 14:29:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-07-18 at 00:06 +0200, Michael Krelin wrote:
> >> I do not know what 'lrelease' is (ignorant, remember?), so I'd also ask
> >> if you really sure that, for instance, uicmoc is not a better place for
> >> the tool than qmake?
> >>
> > 
> > This is the tool which generates the final binary version of the
> > message catalogs. The equivalent for a libintl-based project would be
> > "msgfmt."
> 
> Thanks, that explains the purpose of the tool, but I would be still in 
> doubt where should it go if not in lrelease-native (after all we do have 
> opie-lrelease-native package).

Will the opie-lrelease-native work? If not, a lrelease-native package
sounds like the way to go.

> >> The other thing is that when building uicmoc with qt3support module OE
> >> has to build almost the whole qt, anyway. Would it not be better if we
> >> just have qt-native package with all the tools installed? That would
> >> reduce the amount of merciless and senseless patching and I believe
> >> would reduce the slice of disk-space/cpu-time continuum eaten up by most
> >> of the builds.
> > 
> > I'm pretty much agnostic about the breakdown of the particular
> > packages that end up providing the native tools used during target
> > builds.
> 
> I understand, this pretty general question was a call for opinions.

The general idea is OE should build its own tools where its feasible to
do so. Since most of the QT tools already exist, it sounds like we just
need to add a missing one.

Note that anyone wanting to shortcut the builds can do so by setting the
ASSUME_PROVIDED variable to contain the native packages they don't wish
to build.

Cheers,

Richard





