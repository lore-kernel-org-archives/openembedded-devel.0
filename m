Return-Path: <gyurco@freemail.hu>
Received: from smarthost05.digicable.hu (smarthost05.digicable.hu
	[94.21.128.15])
	by mail.openembedded.org (Postfix) with ESMTP id 953A07210E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jan 2015 14:43:00 +0000 (UTC)
Received: from [92.249.128.189] (helo=relay01.digicable.hu)
	by smarthost05.digicable.hu with esmtp
	id 1YCr47-0004sA-JK for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jan 2015 15:42:59 +0100
Received: from [78.131.10.118] (helo=gyurco.localdomain)
	by relay01.digicable.hu with esmtpa
	id 1YCr47-0003rF-Fd for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jan 2015 15:42:59 +0100
From: Szombathelyi =?ISO-8859-1?Q?Gy=F6rgy?= <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2015 15:42:59 +0100
Message-ID: <1443677.77tJzovrQh@gyurco.localdomain>
User-Agent: KMail/4.14.4 (Linux/3.17.7-300.fc21.x86_64; KDE/4.14.4; x86_64;
	git-a006e5a; 2015-01-10)
In-Reply-To: <3131686.1jEHazhdRQ@gyurco.localdomain>
References: <3131686.1jEHazhdRQ@gyurco.localdomain>
MIME-Version: 1.0
X-Original: 78.131.10.118
X-Original: 92.249.128.189
Subject: Re: [meta-oe][PATCH]ntp: fix perl path
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Jan 2015 14:43:04 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

Any chance to get this into git? Now if one has a system /bin/perl, ntp=
 build=20
will fail.

Br,
Gy=F6rgy

On Tuesday 13 January 2015 22:44:03 Szombathelyi Gy=F6rgy wrote:
>     Fix perl path in ntp-wait and calc_tickadj.
>=20
>     Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
> b/meta-networking/recipes-support/ntp/ntp_4.2.8.bb index 9f74f6b..e80=
2ee7
> 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
> @@ -74,8 +74,10 @@ do_install_append() {
>      sed -i
> 's!^PATH=3D.*!PATH=3D${base_sbindir}:${base_bindir}:${sbindir}:${bind=
ir}!'
> ${D}${bindir}/ntpdate-sync sed -i '1s,#!.*perl -w,#! ${bindir}/env pe=
rl,'
> ${D}${sbindir}/ntptrace sed -i '/use/i use warnings;'
> ${D}${sbindir}/ntptrace
> -    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${sbindir}/nt=
p-wait
> +    sed -i '1s,#!.*perl,#! ${bindir}/env perl,' ${D}${sbindir}/ntp-w=
ait
>      sed -i '/use/i use warnings;' ${D}${sbindir}/ntp-wait
> +    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,'
> ${D}${sbindir}/calc_tickadj +    sed -i '/use/i use warnings;'
> ${D}${sbindir}/calc_tickadj
>=20
>      install -d ${D}/${sysconfdir}/default
>      install -m 644 ${WORKDIR}/ntpdate.default
> ${D}${sysconfdir}/default/ntpdate


