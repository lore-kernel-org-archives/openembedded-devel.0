Received: from mout.web.de ([212.227.15.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <j.schauer@email.de>) id 1U7UE5-0006BT-Re
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2013 18:10:04 +0100
Received: from localhost ([212.201.44.247]) by smtp.web.de (mrweb001) with
	ESMTPSA (Nemesis) id 0M8zhl-1U2HRE17wD-00CUeq for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 17:53:53 +0100
MIME-Version: 1.0
From: Johannes Schauer <j.schauer@email.de>
User-Agent: alot/0.3.3+
To: openembedded-devel@lists.openembedded.org
References: <20130218094145.29630.63354@hoothoot>
	<CAPESJy7YAk9vj56pPkATdJO95xv8gwysyRyA9vyEq5YX-MyD=Q@mail.gmail.com>
	<20130218142026.7849.12017@hoothoot>
	<CAPESJy5Rox_qo+g6T1j0dT0uZ_ZaUyHmZSk8hdwZZDRSh0=UzA@mail.gmail.com>
In-Reply-To: <CAPESJy5Rox_qo+g6T1j0dT0uZ_ZaUyHmZSk8hdwZZDRSh0=UzA@mail.gmail.com>
Message-ID: <20130218165351.14989.14162@hoothoot>
Date: Mon, 18 Feb 2013 17:53:51 +0100
X-Provags-ID: V02:K0:oMuSwQfsMRV2BcA0yr61PDMAW2Id9UXbcf2H4O07nBv
	U/rBQIYaqq+lIPgoX+fJ+4p+3KMUTxPoLg24m67qJJqIFiOTPG
	wY40M5WRUzgMpPrO+kqsebeeQ4SfxP+HDcl2v/sdtxjKgQGnPk
	JDE0d16V/TPa7KfIHeztLGa+5Sq6miSebo8pLmN0fjobuT+gAi
	S1X3MBYMTIg2FdJBUa7BA==
Subject: Re: build dependency cycles in openembedded
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
X-List-Received-Date: Mon, 18 Feb 2013 17:10:05 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Quoting Takeshi Hamasaki (2013-02-18 16:07:36)
> Before continuing to write reply,
> I want to make sure about the usage of the word "native":
> =

> in OpenEmbedded recipe, let's say, when you work on a x86-64 system to bu=
ild
> for target system which has ARM architecture,
> =

> if you want to borrow a xz tool from x86-64 environment: you can write
>  DEPENDS =3D xz-native
> =

> if you depends on xz tool build on target environment: you just write
>  DEPENDS =3D xz
> =

> Is this the custom you assume?
> =

> What I had to find was the word "native" is used to point the target envi=
ronment
> in [1].

The terminology can indeed become very confusing. In our setup we use the G=
NU
terminology for cross compilation.

       build machine
           The machine the package is built on.

       host machine
           The machine the package is built for.

In some tools for dependency analysis we develop (dose3) we also use the te=
rms
"native" and "target". For cross compilation, native would be the build
architecture and target would be the host architecture. By your explanation
above, the terms seem to have the same meaning in OpenEmbedded so we seem t=
o be
talking about the same things. :)

cheers, josch


