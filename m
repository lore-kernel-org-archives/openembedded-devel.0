Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SV2pF-0001Bk-VV
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 17:41:17 +0200
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 35103A625E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 17:31:00 +0200 (CEST)
Date: Thu, 17 May 2012 17:30:59 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120517173059.5a18d533@eb-e6520>
In-Reply-To: <4FB51714.8030201@mlbassoc.com>
References: <4FB508C7.4070808@mlbassoc.com> <3003401.DA8hFehsbE@helios>
	<4FB50F30.7000906@mlbassoc.com> <2161931.GEEF89rDH1@helios>
	<4FB51714.8030201@mlbassoc.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: meta-browser
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
X-List-Received-Date: Thu, 17 May 2012 15:41:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Gary,

Le Thu, 17 May 2012 09:19:48 -0600,
Gary Thomas <gary@mlbassoc.com> a =E9crit :

> It does look like there's a lot of redirecting going on which is causin=
g the
> wget behaviour:
>=20
> $ wget http://commondatastorage.googleapis.com/chromium-browser-officia=
l/chromium-19.0.1049.3.tar.bz2
> --2012-05-17 09:16:00--  http://commondatastorage.googleapis.com/chromi=
um-browser-official/chromium-19.0.1049.3.tar.bz2
> Resolving commondatastorage.googleapis.com... 74.125.225.76, 74.125.225=
.74, 74.125.225.75
> Connecting to commondatastorage.googleapis.com|74.125.225.76|:80... con=
nected.
> HTTP request sent, awaiting response... 302 Found
> Location: http://redirector-bigcache.googleapis.com/chromium-browser-of=
ficial/chromium-19.0.1049.3.tar.bz2 [following]
> --2012-05-17 09:16:01--  http://redirector-bigcache.googleapis.com/chro=
mium-browser-official/chromium-19.0.1049.3.tar.bz2
> Resolving redirector-bigcache.googleapis.com... 209.85.225.95
> Connecting to redirector-bigcache.googleapis.com|209.85.225.95|:80... c=
onnected.
> HTTP request sent, awaiting response... 302 Found
> Location: http://o-o.preferred.atl14s01.v2.lscache4.c.bigcache.googleap=
is.com/chromium-browser-official/chromium-19.0.1049.3.tar.bz2?cms_redirec=
t=3Dyes [following]
> --2012-05-17 09:16:02--  http://o-o.preferred.atl14s01.v2.lscache4.c.bi=
gcache.googleapis.com/chromium-browser-official/chromium-19.0.1049.3.tar.=
bz2?cms_redirect=3Dyes
> Resolving o-o.preferred.atl14s01.v2.lscache4.c.bigcache.googleapis.com.=
.. 173.194.11.234
> Connecting to o-o.preferred.atl14s01.v2.lscache4.c.bigcache.googleapis.=
com|173.194.11.234|:80... connected.
> HTTP request sent, awaiting response... 302 Found
> Location: http://v2.cache2.c.bigcache.googleapis.com/chromium-browser-o=
fficial/chromium-19.0.1049.3.tar.bz2?cms_redirect=3Dyes&redirect_counter=3D=
1 [following]
> --2012-05-17 09:16:03--  http://v2.cache2.c.bigcache.googleapis.com/chr=
omium-browser-official/chromium-19.0.1049.3.tar.bz2?cms_redirect=3Dyes&re=
direct_counter=3D1
> Resolving v2.cache2.c.bigcache.googleapis.com... 74.125.212.49
> Connecting to v2.cache2.c.bigcache.googleapis.com|74.125.212.49|:80... =
connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 176721817 (169M) [application/x-bzip2]
> Saving to: =93chromium-19.0.1049.3.tar.bz2?cms_redirect=3Dyes&redirect_=
counter=3D1=94
>     ...
>=20
> I wonder if wget should be using the -O option to force the resulting f=
ilename?
>=20
something seems to have changed on their hosting infrastructure.
We will try to find a workaround but there are not many places with
chromium sources tarball and this saves a lot of time vs fetching
from SCM.

Eric


