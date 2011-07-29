Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QmtuH-0002WH-2P
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 22:43:41 +0200
Received: from mail-gx0-f180.google.com ([209.85.161.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 29 Jul 2011 13:38:18 -0700
Received: by gxk10 with SMTP id 10so5547253gxk.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jul 2011 13:38:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.184.228 with SMTP id s64mr806206yhm.510.1311971896630;
	Fri, 29 Jul 2011 13:38:16 -0700 (PDT)
Received: by 10.236.108.9 with HTTP; Fri, 29 Jul 2011 13:38:16 -0700 (PDT)
In-Reply-To: <1311966065.3882.90.camel@mattotaupa>
References: <1311966065.3882.90.camel@mattotaupa>
Date: Fri, 29 Jul 2011 13:38:16 -0700
Message-ID: <CAPhnLPCgMbBuDOns-YYQRvgV-b3WW6cHLi3Tjxhc2zC00Z=zrA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] iceauth: Add `LICENSE = "MIT-X"`
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
X-List-Received-Date: Fri, 29 Jul 2011 20:43:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2011 at 12:01 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Date: Fri, 29 Jul 2011 20:47:22 +0200
>
> This license is listed online for example at the Web site of XFree86 [1],=
 Debian [2]. No name of the license is mentioned there. Gentoo just uses =
=BBMIT=AB [3].
>
> There are some packages in OpenEmbedded using `MIT-X` and I guess they re=
fer to the same license. I prefer =BBX/MIT=AB derived from the chapter name=
 of [1] =BBMIT/X Licenses=AB.

The LICENSE field generally has a few requirements to work correctly
for license.bbclass. One, it should be python-esque to parse
correctly. Two, it should use one of two standards. If you look in
meta/files/common-licenses you'll see a list of license text from
SPDX. If you look in license.bbclass, you'll also see a bunch of
mappings for backwards compatability:

SPDXLICENSEMAP[MIT-X] =3D "MIT"

LICENSE should use either the file name in common-licenses, or, the
mapping. In this case, we have the mapping for LICENSE, so MIT-X is
perfectly valid.

-b

>
> [1] http://www.xfree86.org/current/LICENSE5.html
> [2] http://packages.debian.org/changelogs/pool/main/x/x11-xserver-utils/x=
11-xserver-utils_7.6+3/x11-xserver-utils.copyright
> [3] http://gpo.zugaina.org/x11-apps/iceauth/euscan
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> I do not know anything about license names and just checked the WWW. It w=
ould be great if the OE crowd could decide on one name and use it consisten=
tly.

Agreed.

> ---
> =A0recipes/xorg-app/iceauth_1.0.4.bb | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/xorg-app/iceauth_1.0.4.bb b/recipes/xorg-app/iceauth=
_1.0.4.bb
> index e3b465f..bef5afb 100644
> --- a/recipes/xorg-app/iceauth_1.0.4.bb
> +++ b/recipes/xorg-app/iceauth_1.0.4.bb
> @@ -1,7 +1,8 @@
> =A0DESCRIPTION =3D "Tool for manipulating ICE protocol authorization reco=
rds"
> +LICENSE =3D "MIT-X"
> =A0DEPENDS +=3D "libice"
> =A0PE =3D "1"
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.2"
>
> =A0require xorg-app-common.inc
>
> --
> 1.7.5.4
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


