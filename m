Received: from [62.27.45.185] (helo=argo.arachnion.zzZZzz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IAvDR-0007FK-UB
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2007 00:08:24 +0200
Received: from pd953b235.dip0.t-ipconnect.de ([217.83.178.53]
	helo=olympus.klever.net)
	by argo.arachnion.zzZZzz.net with esmtpa (Exim 4.42)
	id 1IAvCt-000225-CI for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2007 00:07:47 +0200
Message-ID: <469D3D80.7040104@klever.net>
Date: Wed, 18 Jul 2007 00:06:56 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.4 (X11/20070619)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <d543f5920707171347k2845264cgbce3c02d76818810@mail.gmail.com>	<469D3681.3030004@klever.net>
	<d543f5920707171458q3c13f402x16c8c8fb37f280ea@mail.gmail.com>
In-Reply-To: <d543f5920707171458q3c13f402x16c8c8fb37f280ea@mail.gmail.com>
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
X-List-Received-Date: Tue, 17 Jul 2007 22:08:28 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

>> I do not know what 'lrelease' is (ignorant, remember?), so I'd also ask
>> if you really sure that, for instance, uicmoc is not a better place for
>> the tool than qmake?
>>
> 
> This is the tool which generates the final binary version of the
> message catalogs. The equivalent for a libintl-based project would be
> "msgfmt."

Thanks, that explains the purpose of the tool, but I would be still in 
doubt where should it go if not in lrelease-native (after all we do have 
opie-lrelease-native package).

> I had completely managed to overlook the presence of the uicmoc-native
> packages. Let me give those a try before bothering anybody further
> about this stuff.

No, I think I know it's not there.

>> The other thing is that when building uicmoc with qt3support module OE
>> has to build almost the whole qt, anyway. Would it not be better if we
>> just have qt-native package with all the tools installed? That would
>> reduce the amount of merciless and senseless patching and I believe
>> would reduce the slice of disk-space/cpu-time continuum eaten up by most
>> of the builds.
> 
> I'm pretty much agnostic about the breakdown of the particular
> packages that end up providing the native tools used during target
> builds.

I understand, this pretty general question was a call for opinions.

Love,
H


