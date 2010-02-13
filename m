Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NgOku-0008Tj-V7
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 21:38:24 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KXS0023ARUL2C19@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	13 Feb 2010 14:35:21 -0600 (CST)
Received: from vienms0046 (unknown [213.185.186.253])
	by gandalf.denix.org (Postfix) with ESMTPA id 540D614AF55; Sat,
	13 Feb 2010 15:35:08 -0500 (EST)
Date: Sat, 13 Feb 2010 20:34:54 +0000
From: "Denys Dmytriyenko" <denis@denix.org>
To: "Antonio Ospite" <ospite@studenti.unina.it> ,
	openembedded-devel@lists.openembedded.org
MIME-version: 1.0
X-Priority: 3
Message-id: <20100213203508.540D614AF55@gandalf.denix.org>
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] meta-toolchain: Run rmdir only if empty dirs are actually found.
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
X-List-Received-Date: Sat, 13 Feb 2010 20:38:24 -0000
Content-type: multipart/mixed;
	boundary="----_=_0x976594127cd5cf65e349dd567cc64df1_=_----"

------_=_0x976594127cd5cf65e349dd567cc64df1_=_----
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

> Prevent a failure in do_populate_sdk when there are no empty
> directories:
>=C2=A0 =C2=A0 /bin/rmdir: missing operand
>=C2=A0 =C2=A0 Try `/bin/rmdir --help' for more information.
>
> See also http://tinderbox.openembedded.net/packages/478437/
>
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
Acked-by: Denys Dmytriyenko <denis@denix.org>
> ---
>=C2=A0 recipes/meta/meta-toolchain.bb |=C2=A0 =C2=A0 =C2=A0 2 +-
>=C2=A0 1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolc=
hain.bb
> index a8c27ec..3169425 100644
> --- a/recipes/meta/meta-toolchain.bb
> +++ b/recipes/meta/meta-toolchain.bb
> @@ -67,7 +67,7 @@ do_populate_sdk() {
>=C2=A0 =C2=A0=C2=A0=C2=A0 rm -Rf ${SDK_OUTPUT}/usr/lib
>=C2=A0
>=C2=A0 =C2=A0=C2=A0=C2=A0 # Clean up empty directories from excluded p=
ackages
> -=C2=A0=C2=A0=C2=A0 find ${SDK_OUTPUT} -depth -type d -empty -print0 =
| xargs -0 /bin/rmdir
> +=C2=A0=C2=A0=C2=A0 find ${SDK_OUTPUT} -depth -type d -empty -print0 =
| xargs -r0 /bin/rmdir
>=C2=A0
>=C2=A0 =C2=A0=C2=A0=C2=A0 install -d ${SDK_OUTPUT}/${SDKPATH}/${TARGET=
_SYS}/${sysconfdir}
>=C2=A0 =C2=A0=C2=A0=C2=A0 install -m 0644 ${IPKGCONF_TARGET} ${IPKGCON=
F_SDK}
> ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}/
> --
> 1.6.6.2
>

------_=_0x976594127cd5cf65e349dd567cc64df1_=_------
