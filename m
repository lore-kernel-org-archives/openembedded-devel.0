Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.visioncatalog.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 54B6678240
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 09:18:55 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 1D753A0039E;
	Fri, 30 Jun 2017 11:20:05 +0200 (CEST)
Received: from [IPv6:::1] ([172.16.0.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017063011185556-147448 ;
	Fri, 30 Jun 2017 11:18:55 +0200 
To: Martin Jansa <martin.jansa@gmail.com>
References: <1498745449-26690-1-git-send-email-s.mueller-klieser@phytec.de>
	<CA+chaQfEO+s0K1sj7xqcgmZ91HTYqcw6inmQiRx01pFehN4f0Q@mail.gmail.com>
From: =?UTF-8?Q?Stefan_M=c3=bcller-Klieser?= <s.mueller-klieser@phytec.de>
Message-ID: <5ba360ae-8523-3680-c1ae-a24a992671df@phytec.de>
Date: Fri, 30 Jun 2017 11:20:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfEO+s0K1sj7xqcgmZ91HTYqcw6inmQiRx01pFehN4f0Q@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 30.06.2017 11:18:55,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 30.06.2017 11:18:55
X-TNEFEvaluated: 1
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][pyro][PATCH] qtquickcontrols: fix qa issue installed-vs-shipped
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Jun 2017 09:18:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 29.06.2017 17:21, Martin Jansa wrote:
> Isn't it needed in master as well? I don't see it in my builds, but if=20
> the issue exists in some configuration you're using then it should be=20
> reproducible with master branch as well as they are currently identical=20
> with pyro.
Yes, you are right. I checked it against pyro and master-next,=20
overlooked that the 5.9 stuff is not yet pushed. So for 5.9, I did not=20
see it. But at the momemt it should be required for master and pyro.

>=20
> On Thu, Jun 29, 2017 at 4:10 PM, Stefan M=C3=BCller-Klieser=20
> <s.mueller-klieser@phytec.de <mailto:s.mueller-klieser@phytec.de>> wrote:
>=20
>     QML dialogs ship an icons.ttf which does not get picked up by the
>     default FILES mask.
>=20
>     Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de
>     <mailto:s.mueller-klieser@phytec.de>>
>     ---
>       recipes-qt/qt5/qtquickcontrols=5Fgit.bb
>     <http://qtquickcontrols=5Fgit.bb> | 2 ++
>       1 file changed, 2 insertions(+)
>=20
>     diff --git a/recipes-qt/qt5/qtquickcontrols=5Fgit.bb
>     <http://qtquickcontrols=5Fgit.bb>
>     b/recipes-qt/qt5/qtquickcontrols=5Fgit.bb <http://qtquickcontrols=5Fg=
it.bb>
>     index 69f3d3b..c72ac4f 100644
>     --- a/recipes-qt/qt5/qtquickcontrols=5Fgit.bb
>     <http://qtquickcontrols=5Fgit.bb>
>     +++ b/recipes-qt/qt5/qtquickcontrols=5Fgit.bb
>     <http://qtquickcontrols=5Fgit.bb>
>     @@ -22,3 +22,5 @@ SRC=5FURI +=3D " \
>       "
>=20
>       SRCREV =3D "201c86391c7ff78d570fdec6e0c0b71eb1e9aae4"
>     +
>     +FILES=5F${PN}-qmlplugins +=3D "${OE=5FQMAKE=5FPATH=5FQML}/*/*/*/*.tt=
f"
>     --
>     1.9.1
>=20
>     --
>     =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>=20
>=20


