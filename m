Received: from [62.27.45.185] (helo=argo.arachnion.zzZZzz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IDK23-0006A9-45
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2007 15:02:31 +0200
Received: from pd953840f.dip0.t-ipconnect.de ([217.83.132.15]
	helo=olympus.klever.net)
	by argo.arachnion.zzZZzz.net with esmtpa (Exim 4.42)
	id 1IDK0s-0000UJ-UO for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2007 15:01:19 +0200
Message-ID: <46A5F7CF.5000105@klever.net>
Date: Tue, 24 Jul 2007 14:59:59 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.4 (X11/20070619)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <d543f5920707171347k2845264cgbce3c02d76818810@mail.gmail.com>	<469D3681.3030004@klever.net>	<d543f5920707171458q3c13f402x16c8c8fb37f280ea@mail.gmail.com>	<469D3D80.7040104@klever.net>
	<1185200908.6148.56.camel@localhost.localdomain>
In-Reply-To: <1185200908.6148.56.camel@localhost.localdomain>
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
X-List-Received-Date: Tue, 24 Jul 2007 13:02:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> 
> Will the opie-lrelease-native work? If not, a lrelease-native package
> sounds like the way to go.

I'd guess opie-lrelease-native is a bit outdated for qt4, but I've never 
used it, so I'm not sure.

>>>> The other thing is that when building uicmoc with qt3support module OE
>>>> has to build almost the whole qt, anyway. Would it not be better if we
>>>> just have qt-native package with all the tools installed? That would
>>>> reduce the amount of merciless and senseless patching and I believe
>>>> would reduce the slice of disk-space/cpu-time continuum eaten up by most
>>>> of the builds.
>>> I'm pretty much agnostic about the breakdown of the particular
>>> packages that end up providing the native tools used during target
>>> builds.
>> I understand, this pretty general question was a call for opinions.
> 
> The general idea is OE should build its own tools where its feasible to
> do so. Since most of the QT tools already exist, it sounds like we just
> need to add a missing one.
> 
> Note that anyone wanting to shortcut the builds can do so by setting the
> ASSUME_PROVIDED variable to contain the native packages they don't wish
> to build.

That wasn't a question of whether we should use build system's qt tools, 
it was about not splitting qt into many native packages, but rather 
using a single qt-native, since, for instance, qmake2-native has to 
build half a qt, anyway, to support qt3 compatibility layer. I don't 
think dropping qt3support is a feasible option. If not, then, of course 
adding a missing lrelease-native is the way to go.

Love,
H


