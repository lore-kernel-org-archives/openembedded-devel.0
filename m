Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SGFZz-0007HR-HF
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Apr 2012 22:16:19 +0200
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 53689A6228
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2012 22:07:04 +0200 (CEST)
Date: Fri, 6 Apr 2012 22:07:02 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120406220702.3a710cad@eb-e6520>
In-Reply-To: <20120406142921.323c069d@eb-e6520>
References: <20120406142921.323c069d@eb-e6520>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: toolchain-layer -> ld: error: cannot find -lm
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
X-List-Received-Date: Fri, 06 Apr 2012 20:16:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Le Fri, 6 Apr 2012 14:29:21 +0200,
Eric B=E9nard <eric@eukrea.com> a =E9crit :
> leads to :
> | /home/ebenard/WORK/MX53/oecore/build/tmp-eglibc/sysroots/x86_64-linux/u=
sr/libexec/armv7a-vfp-neon-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.4/=
ld: error: cannot find -lm
> (compressed log.do_compile attached)
>=20
> The host is a Fedora 16 x86_64.
> The problem was also reproduced on a Ubuntu 11.10 x86_64 and with a qemua=
rm target.
> I don't seem to reproduce the problem without the toolchain-layer.
>=20
> Do you have any idea of what could be wrong here ?
>=20
FWIW : adding meta-angstrom and using angstrom-bleeding doens't exhibit
the problem so I assume I miss something in the configuration when I
only have oe-core + meta-oe

Eric


