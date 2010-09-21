Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Oy6mZ-0004al-1d
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 19:37:33 +0200
Received: from [192.168.42.217] (unknown [92.117.88.188])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 8303D1B10C07
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 17:40:01 +0000 (UTC)
Message-ID: <4C98ED51.8040707@freyther.de>
Date: Wed, 22 Sep 2010 01:37:21 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100908 Fedora/3.1.3-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285077403-21171-1-git-send-email-eric@eukrea.com>	<1285077403-21171-2-git-send-email-eric@eukrea.com>	<1285077403-21171-3-git-send-email-eric@eukrea.com>	<1285077403-21171-4-git-send-email-eric@eukrea.com>
	<1285077403-21171-5-git-send-email-eric@eukrea.com>
In-Reply-To: <1285077403-21171-5-git-send-email-eric@eukrea.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 5/7] gdb-cross-sdk: add RDEPENDS
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
X-List-Received-Date: Tue, 21 Sep 2010 17:37:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 09/21/2010 09:56 PM, Eric B=C3=A9nard wrote:
> * actually we get :
> ./arm-angstrom-linux-gnueabi-gdb: error while loading shared libraries:
> libtinfo.so.5: cannot open shared object file: No such file or director=
y
> * adding these RDEPENDS will install ncurses-sdk and zlib-sdk into the =
SDK
>=20
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Is shlib stuff supposed to work for the -sdk packages? E.g. should someth=
ing
autodetect and install these libraries? The answer somehow feels like, ye=
s it
should.


> =20
>  DEPENDS =3D "ncurses-sdk zlib-sdk flex-native"
> +RDEPENDS =3D "ncurses-sdk zlib-sdk"
> \ No newline at end of file

this will also install the -dev packages?



