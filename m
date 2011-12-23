Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1Re1JF-000705-UX
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Dec 2011 10:21:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id D78102C7FE;
	Fri, 23 Dec 2011 09:10:32 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V1kuubS0EpRk; Fri, 23 Dec 2011 09:10:28 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id D56902C7EC;
	Fri, 23 Dec 2011 09:10:27 +0000 (UTC)
Message-ID: <4EF44649.1000601@gmail.com>
Date: Fri, 23 Dec 2011 10:13:45 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EF2F380.80704@celestialaudio.com>
In-Reply-To: <4EF2F380.80704@celestialaudio.com>
Subject: Re: fakeroot 1.15.1 issues
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
X-List-Received-Date: Fri, 23 Dec 2011 09:21:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jesse Lackey ha scritto, Il 22/12/2011 10:08:
> I'm have exactly the same problem.  "git pull" says up to date.
>=20
> I'm continuing on by running "bitbake -k".  But things appear to be
> indeed broken, by the presumably recent removal of
> fakeroot_1.15.1.orig.tar.bz2 from the debian ftp site.
>=20
> Any assistance greatly appreciated.  I'm a total newbie with bitbake an=
d
> OE.
>=20
> J
>=20
>> Christopher Sarra chris.sarra at gmail.com
>> Wed Dec 21 20:52:32 CET 2011
>=20
>> I tried `git pull` but apparently everything is "Already up-to-date."
>> Am I
>> missing something else?
>>
>> Thanks,
>> Chris
>>



I simply removed the line
${DEBIAN_MIRROR}/main   http://snapshot.debian.net/archive/pool
from  mirrors.bbclass, and it worked smoothly.

HTH

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com



