Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1RdjaI-0005V1-BN
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Dec 2011 15:25:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id B69DD2C7FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2011 14:07:39 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwTFfabssyTf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2011 14:07:30 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 2ECE92C7EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2011 14:07:29 +0000 (UTC)
Message-ID: <4EF33A66.3050204@gmail.com>
Date: Thu, 22 Dec 2011 15:10:46 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAAJ_Y3kksFvP84YPNV0=oQE7x8XxH0-CoDq02eO-MsODi_2B0g@mail.gmail.com>	<CA+M6bX=sR9QVCM7AmqQY-xY74Tp-y9iebQsg3L_E1rGDsJR6ZQ@mail.gmail.com>
	<CAAJ_Y3kpmycekZ+JokVjChnOdg_-aR3=TcFgvFP0gXf-r1LR6g@mail.gmail.com>
In-Reply-To: <CAAJ_Y3kpmycekZ+JokVjChnOdg_-aR3=TcFgvFP0gXf-r1LR6g@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Dec 2011 14:25:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Christopher Sarra ha scritto, Il 21/12/2011 20:52:
> I tried `git pull` but apparently everything is "Already up-to-date." A=
m I
> missing something else?
>=20
> Thanks,

Chris,
I simply removed the line
${DEBIAN_MIRROR}/main   http://snapshot.debian.net/archive/pool
from  mirrors.bbclass, and it worked smoothly.


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com



