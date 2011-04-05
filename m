Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickey@vanille-media.de>) id 1Q72V0-0002CN-QO
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 11:24:34 +0200
Received: from [192.168.1.15] (business-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by phalanx.drlauer-research.com (Postfix) with ESMTPSA id 156F6584125
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2011 11:45:15 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1084)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <4D99D92F.6080609@mlbassoc.com>
Date: Tue, 5 Apr 2011 11:22:26 +0200
Message-Id: <A24792C8-9E84-41EA-B52F-04A54FCECDF0@vanille-media.de>
References: <4D99D609.8020800@mlbassoc.com> <4D99D689.9050705@mlbassoc.com>
	<79CF2877-D36A-412A-AF90-6FF538AACF9C@gmail.com>
	<4D99D92F.6080609@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1084)
Subject: Re: Master broken?
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
X-List-Received-Date: Tue, 05 Apr 2011 09:24:34 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Am 04.04.2011 um 16:43 schrieb Gary Thomas:

> On 04/04/2011 08:37 AM, Sachin Kamboj wrote:
>> The problem is "angstrom-2008.1" has been retired and is no longer =
available in the master branch. Use "angstrom-2010.x" instead as your =
distro. Alternatively, use the maintenance branch:
>>=20
>> =
http://www.angstrom-distribution.org/angstrom-20081-moves-maintenance-bran=
ch
>=20
> Thanks, that got me going.
>=20
> Why didn't I get an error when I selected DISTRO=3D"angstrom-2008.1"?  =
There is no
> longer a .../conf/distro/angstrom-2008.1.conf file on the master =
branch.

Take a look at bitbake.conf The DISTRO configuration is included via the
'include' directive, which is a permissive include =96 in contrast to =
'require',
which is a mandatory include.

I don't recall our reasons for keeping it like that, but I remember that =
'require'
wasn't present at the time we wrote bitbake.conf. Perhaps we should =
reconsider
that 'include'.

Cheers,

:M:



