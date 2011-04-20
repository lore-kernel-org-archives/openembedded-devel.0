Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1QCfEG-0003po-Kq
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 23:46:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 562461417197;
	Wed, 20 Apr 2011 23:44:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8NSnfEZf-XhA; Wed, 20 Apr 2011 23:44:36 +0200 (CEST)
Received: from [192.168.1.2] (233-15-80-78.tmcz.cz [78.80.15.233])
	by ns.penguin.cz (Postfix) with ESMTP id E1FA21416BA5;
	Wed, 20 Apr 2011 23:44:35 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1303297156.3979.46.camel@mattotaupa>
References: <1302996215.3122.31.camel@utx.lan>
	<4DAD6D9B.2000909@opendreambox.org>
	<1303297156.3979.46.camel@mattotaupa>
Date: Wed, 20 Apr 2011 23:44:10 +0200
Message-ID: <1303335850.15291.3.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH 1/5] binconfig.bbclass: search configs in D instead of S
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
X-List-Received-Date: Wed, 20 Apr 2011 21:46:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Paul Menzel wrote:
> > On 04/17/2011 01:23 AM, Stanislav Brabec wrote:

> > > It fixes at least ncurses, which populates ncurses-config instead o=
f
> > > ncurses5-config and ncursesw5-config, causing secondary breakages.
>=20
> Is `alsa-utils` =E2=80=93 as written in your introduction 0/5 =E2=80=93=
 the only
> secondary breakage you found? Is that a run time problem? I can build
> `alsa-utils-1.0.24.2-r1` just fine using `minimal`.

Probably more breakages existed - basically anything that uses ncurses
may be broken. Due to ncurses breakage, alsa-utils probably used
ncurses?*-config from your host system, and as a consequence also host
system includes. It may work, it may break in runtime, it may cause
miscompilation. On hosts without ncurses development files build failed.

--=20

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



