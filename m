Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 9850260FCA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2013 06:30:39 +0000 (UTC)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 6CD933F532
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2013 08:30:40 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -4.4
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, KHOP_THREADED=-1.5] autolearn=no
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2013 08:30:38 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2013 08:30:38 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.1.438.0;
	Thu, 3 Oct 2013 08:30:40 +0200
Message-ID: <524D0F0D.40803@topic.nl>
Date: Thu, 3 Oct 2013 08:30:37 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1379667640-2763-1-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <1379667640-2763-1-git-send-email-mike.looijmans@topic.nl>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: [meta-oe][PATCH] fuse-exfat, ntfs-3g-ntfsprogs: Move util-linux-mount to RRECOMMENDS
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
X-List-Received-Date: Thu, 03 Oct 2013 06:30:40 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFJust a "ping" to inform if this patch will ever make it into mains=
tream,=20
of if there's something wrong with it.

Mike.

On 09/20/2013 11:00 AM, Mike Looijmans wrote:
> Soften the dependency to allow distros to use another mount provider
> like busybox instead of being forced to use util-linux-mount.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>   .../fuse-exfat/fuse-exfat_1.0.1.bb                 |    2 +-
>   .../ntfs-3g-ntfsprogs_2013.1.13.bb                 |    3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1=
.0.1.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.=
bb
> index d29dc0a..f984c4b 100644
> --- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb
> +++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673=
463ab874e80d47fae504"
>   SRC_URI =3D "${DEBIAN_MIRROR}/main/f/fuse-exfat/fuse-exfat_${PV}.orig.t=
ar.gz \
>   "
>   DEPENDS =3D "fuse virtual/libc"
> -RDEPENDS_${PN} +=3D "util-linux-mount"
> +RRECOMMENDS_${PN} =3D "util-linux-mount"
>
>   inherit scons
>
> diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-=
3g-ntfsprogs_2013.1.13.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-nt=
fsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
> index e084187..c1392cc 100644
> --- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfs=
progs_2013.1.13.bb
> +++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfs=
progs_2013.1.13.bb
> @@ -23,7 +23,8 @@ EXTRA_OEMAKE =3D "LDCONFIG=3Decho"
>   PACKAGES =3D+ "ntfs-3g ntfsprogs libntfs-3g"
>
>   FILES_ntfs-3g =3D "${base_sbindir}/*.ntfs-3g ${bindir}/ntfs-3g* ${base_=
sbindir}/mount.ntfs"
> -RDEPENDS_ntfs-3g +=3D "fuse util-linux-mount"
> +RDEPENDS_ntfs-3g +=3D "fuse"
> +RRECOMMENDS_ntfs-3g =3D "util-linux-mount"
>
>   FILES_ntfsprogs =3D "${base_sbindir}/* ${bindir}/* ${sbindir}/*"
>   FILES_libntfs-3g =3D "${libdir}/*${SOLIBS}"
>



Met vriendelijke groet / kind regards,

Mike Looijmans

TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) =E2=80=93 (0)499 - 33.69.79
Telefax: (+31) - (0)499 - 33.69.70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn uitsluit=
end bestemd voor de geadresseerde, zoals die blijkt uit het e-mail bericht =
en/of de bijlagen. Er kunnen gegevens met betrekking tot een derde instaan.=
 Indien u als niet-geadresseerde dit bericht en de bijlagen ontvangt, terwi=
jl u niet bevoegd of gemachtigd bent om dit bericht namens de geadresseerde=
 te ontvangen, wordt u verzocht de afzender hierover direct te informeren e=
n het e-mail bericht met de bijlagen te vernietigen. Ieder gebruik van de i=
nhoud van het e-mail bericht, waaronder de daarbij behorende bijlagen, door=
 een ander dan de geadresseerde is onrechtmatig jegens ons dan wel de event=
ueel in het e-mail bericht of de bijlagen voorkomende andere personen. TOPI=
C Embedded Systems is niet aansprakelijk voor enigerlei schade voortvloeien=
d uit het gebruik en/of acceptatie van dit e-mail bericht of de daarbij beh=
orende bijlagen.

The contents of this message, as well as any enclosures, are addressed pers=
onally to, and thus solely intended for the addressee. They may contain inf=
ormation regarding a third party. A recipient who is neither the addressee,=
 nor empowered to receive this message on behalf of the addressee, is kindl=
y requested to immediately inform the sender of receipt, and to destroy the=
 message and the enclosures. Any use of the contents of this message and/or=
 the enclosures by any other person than the addressee or person who is emp=
owered to receive this message, is illegal towards the sender and/or the af=
orementioned third party. TOPIC Embedded Systems is not  liable for any dam=
age as a result of the use and/or acceptance of this message and as well as=
 any enclosures.

