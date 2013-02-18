Received: from mout.web.de ([212.227.15.4])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <j.schauer@email.de>) id 1U7Rpb-0001iS-W6
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2013 15:36:44 +0100
Received: from localhost ([212.201.44.247]) by smtp.web.de (mrweb101) with
	ESMTPSA (Nemesis) id 0MKJ7S-1U804r2Bao-001CBu for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 15:20:27 +0100
MIME-Version: 1.0
From: Johannes Schauer <j.schauer@email.de>
User-Agent: alot/0.3.3+
To: openembedded-devel@lists.openembedded.org
References: <20130218094145.29630.63354@hoothoot>
	<CAPESJy7YAk9vj56pPkATdJO95xv8gwysyRyA9vyEq5YX-MyD=Q@mail.gmail.com>
In-Reply-To: <CAPESJy7YAk9vj56pPkATdJO95xv8gwysyRyA9vyEq5YX-MyD=Q@mail.gmail.com>
Message-ID: <20130218142026.7849.12017@hoothoot>
Date: Mon, 18 Feb 2013 15:20:26 +0100
X-Provags-ID: V02:K0:KjMn1oCVNaCrwdr+xSZZ4ksNLt3DDlh4Bon1/or4xsJ
	uD6Gm9mIcvL/Fja6AocC1PhhrGA1HRqHGVRMGvC0ZHqwit2YwZ
	WDCXEEFBG9YT/bHVvQI2b6RCyaFVzXpVsZpDj7jZVUx4OrJ0s+
	5l+ILPgHfauQ0Dwsbp+aabRGtl9Vbx6bk+9zKYX22TmFsGYq41
	4nPdIsE5+7n5uXiMSGP0Q==
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
X-List-Received-Date: Mon, 18 Feb 2013 14:37:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Quoting Takeshi Hamasaki (2013-02-18 13:26:38)
> you can find the line like:
> DEPENDS =3D "XXXXXX-native"
> in some recipes.
> =

> So, you can describe dependency to native tools from target build if nece=
ssary.

Sure, when cross compiling you can satisfy lots of dependencies by native
binaries but others need the foreign version. In Debian based distribution,
this distinction for cross build dependency resolution is made using
Multi-Arch.

Since some of the cross build dependencies can be satisfied by (already
available) native tools, the dependency cycle situation is *much* less seve=
re
during cross compilation than it is during native compilation.

But still, even when one wants to cross compile a native, minimal Debian bu=
ild
system (just containing the init, shell and compiler) one runs into build
dependency cycles because some dependencies have to be satisfied by foreign
(not yet built) binaries and thereby creating some dependency cycles.

Is it different in OpenEmbedded?

cheers, josch


