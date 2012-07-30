Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SvliJ-00057J-I8
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 10:52:31 +0200
Received: by yhjj56 with SMTP id j56so4068012yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 01:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=7iQUZ64hn+4HcNueGrsqzuYMbi/cS12IkWjlVe3lofs=;
	b=GjIxN3opR0efgq6GHknJKmNXoaa1H/xgyUf8vkyRTZVhiFdnXjK5kbG6/LOBOuEMuz
	ElWjGF9GCWfqAMZjJp05cnRko8t7RTkDMh7W3/fzcFvc2qLEesA5kxzz7HtLkv5+ort4
	qmiFAhH9kSl1jhC9vZdBKYg3JBIbnLKTtji9PzXpAftWr9FD/ZUiz45ApwAD90FKrt/Y
	G2jJAglVStrPjZCs9+FR61hOqS3GKY/gwRcZ2dF6UDG5IeEFTp+k+FTOd4qIBXtUc2hv
	lv8Te9OzVPU/EECmrXoHKcovlmX89dGSv9bntcTn5TjopXw8jesSxKr0C2MmUv7///JY
	OM2w==
MIME-Version: 1.0
Received: by 10.50.219.226 with SMTP id pr2mr7724684igc.51.1343637655237; Mon,
	30 Jul 2012 01:40:55 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Mon, 30 Jul 2012 01:40:55 -0700 (PDT)
In-Reply-To: <0b7f5913410c32268e0dbb388abd15cbd87497eb.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<0b7f5913410c32268e0dbb388abd15cbd87497eb.1343478744.git.Martin.Jansa@gmail.com>
Date: Mon, 30 Jul 2012 10:40:55 +0200
Message-ID: <CALbNGRRgb5i0Qa5qkRSG_J7MRvCviAcietu9zron54Vd4NQXKw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 4/5] libgee: use gobject-introspection-stub instead of -native which was removed in oe-core
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
X-List-Received-Date: Mon, 30 Jul 2012 08:52:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 28, 2012 at 2:33 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb |    7 +++----
>  1 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb b/meta-oe/re=
cipes-devtools/libgee/libgee_0.6.4.bb
> index 4e2c643..228f96c 100644
> --- a/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
> +++ b/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
> @@ -1,9 +1,8 @@
>  require libgee.inc
>  PE =3D "1"
> -PR =3D "${INC_PR}.0"
> -#autoreconf needs introspection.m4 (staged by gobject-introspection-nati=
ve) after http://git.gnome.org/browse/libgee/commit/?id=3Dd026a29b38ca1a338=
8981c6e75a92602212373d8
> -DEPENDS +=3D "gobject-introspection-native"
> -DEPENDS_virtclass-native +=3D "gobject-introspection-native"
> +PR =3D "${INC_PR}.1"
> +DEPENDS +=3D "gobject-introspection-stub"
> +DEPENDS_virtclass-native +=3D "gobject-introspection-stub-native"
>
>  SHRT_VER =3D "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getV=
ar('PV',d,1).split('.')[1]}"
>  SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/$=
{BP}.tar.xz"
> --
> 1.7.8.6
>
Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>


