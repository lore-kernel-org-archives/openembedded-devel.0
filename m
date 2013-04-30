Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UXGV4-0006p3-0o
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 21:46:17 +0200
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 42ABBA610F;
	Tue, 30 Apr 2013 21:28:10 +0200 (CEST)
Date: Tue, 30 Apr 2013 21:28:09 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130430212809.1f69d054@e6520eb>
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: martin.jansa@gmail.com
Subject: Re: [meta-oe][dylan][PATCH 00/12] README and llvm2.9 changes for dylan
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
X-List-Received-Date: Tue, 30 Apr 2013 19:46:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Le Tue, 30 Apr 2013 18:32:50 +0200,
Martin Jansa <martin.jansa@gmail.com> a =C3=A9crit :

> Some changes from master I would like to get in dylan
>=20
> The following changes since commit 8a350e3b4d3431f68d440f9d6ec079fdd13666=
17:
>=20
>   update README to dylan (2013-04-23 18:52:43 +0200)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib jansa/for-dylan
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/for-dylan
>=20
> Martin Jansa (12):
>   llvm2.9: Import from meta-java
>   llvm2.9: fix build with gcc-4.7
>   llvm2.9: try to fix thumb build and disable it after failure
>   llvm2.9: remove X86 from LLVM_TARGETS_TO_BUILD
>   llvm2.9: add LLVM_EXTRA_ARCH to enable X86 unless building for x86
>   e-wm-0.17.2.1: Update checksums, tarball was repackaged upstream :/
>   meta-gnome: add README file
>   meta-ruby: Fix subject-prefix
>   README: add -M to git send-email example
>   toolchain-layer, meta-networking: README: add dylan to subject-prefix
>     and update branch in depends
>   meta-multimedia/README: add dependency on meta-ruby
>   README: show github mirror URL in layer dependencies
>=20
as discussed, here is the list of commits I plan to push to dylan-next
tomorrow (hashes are local ones here) :

cca735e apache2: fix multilib builds
6cbeee1 modphp: update to 5.4.14
05d7a65 hiawatha: update to 9.1
a8c0bcb libnotify3, nautilus3: exclude from world
0957300 compat-wireless: exclude from world
6e7b548 lxdm: fix postinst-code
0e0c01f gateone: fix license name
8120bd1 ttf-inconsolata: fix license name
3e0ef7a xfce4-mixer: add missing dep on libunique
1281b23 xfce4-xkb-plugin: Update to latest git
148a239 qtserialport-e: Various fixes per openembedded-devel list comments.
0dc2885 qtserialport: Adds initial recipe.
ceac946 README: show github mirror URL in layer dependencies
258e8cc meta-multimedia/README: add dependency on meta-ruby
2c6ca82 toolchain-layer, meta-networking: README: add dylan to subject-pref=
ix and update branch in depends
20a10ba README: add -M to git send-email example
c9d9301 meta-ruby: Fix subject-prefix
4a89aae meta-gnome: add README file
7e95a68 e-wm-0.17.2.1: Update checksums, tarball was repackaged upstream :/
00003b0 llvm2.9: add LLVM_EXTRA_ARCH to enable X86 unless building for x86
27b6ea6 llvm2.9: remove X86 from LLVM_TARGETS_TO_BUILD
6970589 llvm2.9: try to fix thumb build and disable it after failure
db8e72e llvm2.9: fix build with gcc-4.7
7ee1b70 llvm2.9: Import from meta-java

Eric


