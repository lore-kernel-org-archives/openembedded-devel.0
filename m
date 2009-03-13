Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Li6nU-0001TB-F7
	for openembedded-devel@openembedded.org; Fri, 13 Mar 2009 13:47:35 +0100
Received: (qmail 3526 invoked by uid 813007); 13 Mar 2009 12:47:12 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Mar 2009 12:47:12 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Mar 2009 13:47:11 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc7-00188-gebdcc81; KDE/4.2.1; x86_64; ;
	)
References: <1236900736.26901.8.camel@grond.atmel.com>
In-Reply-To: <1236900736.26901.8.camel@grond.atmel.com>
MIME-Version: 1.0
Message-Id: <200903131347.11719.marcin@juszkiewicz.com.pl>
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Fri, 13 Mar 2009 12:47:38 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=C4=85tek, 13 marca 2009 o 00:32:16 Ulf Samuelsson napisa=C5=82(a):

> Is there any activity to make this more useful?
> Just managed to install a Core i7 machine, which speeded
> up my Buildroot build from about 4 hours to less than 1 hour.
> (There was an error in the build right at the end,
> so it could have been downto 40 minutes or so)
> Building the cross compiler took 10 minutes with "make -j 16"
> compared to 1-2 hours on a P4 @ 3GHz.

I use core2quad at home and dual quadcore Xeon at one client office.=20
Both are 100% busy during my builds. On my quad I use=20
PARALLEL_MAKE=3D"-j4" with 4 BB threads and on 8core I have 10 BBthreads=20
with -j12 but thats for nightly builds when no one other use this=20
machine. Using ccache also speeds next compilations.

> Last time I built OE on a P4@ 3 GHz it took ~40 hours
> for the SAM9263, so some speedup would be nice.
> Maybe we should make an effort?

You mean 'time bitbake console-image'? I can test on my local machine=20
how much time it takes.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




