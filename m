Received: from mail-ie0-f171.google.com ([209.85.223.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TiUJK-0001eb-6Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 19:12:06 +0100
Received: by mail-ie0-f171.google.com with SMTP id 17so16201401iea.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 09:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=IRGs4fjGlvqLoWeH786FICDowonkYlxq/uCj7CdJdZE=;
	b=Obdzs/dfVuDPRkbKqFE3J8FUPYi8fTYRwvgHSN63ESjm9Gal2Y3J6hjIAEAwbLI1IH
	Mk0fCbMVD4cib8o6V2IRYBJIAOsC6CuvgNUvnlbAMijyb0P5UQITyH3uu4Mj18Ezqdha
	mU2xxyMigfyFqRKmlG2GhnSs545YukgwGIjLZQE5OVRcVh/wHIqEaGqi2sHYZPIEHjpa
	3AZfTWb2DFAJxpmeI34xawiJ/LrwMd+trUo9DMjGiYiwm5EHtca233lyndlZWPIQo5Rv
	lmPt9+UFVFk2Rf7hMO/5Kio1DQt+q+ZvWdHqTZPSGQCiXZP5AobGqvOUKOeMp65TWWn4
	lmag==
MIME-Version: 1.0
Received: by 10.50.207.70 with SMTP id lu6mr10824120igc.50.1355248653040; Tue,
	11 Dec 2012 09:57:33 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Tue, 11 Dec 2012 09:57:32 -0800 (PST)
In-Reply-To: <1355222922-14422-1-git-send-email-s.stirtzel@googlemail.com>
References: <1355222922-14422-1-git-send-email-s.stirtzel@googlemail.com>
Date: Tue, 11 Dec 2012 18:57:32 +0100
Message-ID: <CALbNGRQ78cS6WmooLBav=mYJZsSc34jUKF5CK-sEVCqbW8s53Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] iceauth: Add native build
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
X-List-Received-Date: Tue, 11 Dec 2012 18:12:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2012 at 11:48 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> Some recipes require iceauth native (eg. xfce4-session)
> Without this patch they would use the build-hosts iceauth
>
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb b/meta-oe=
/recipes-graphics/xorg-app/iceauth_1.0.4.bb
> index d3fbd13..4cb3b26 100644
> --- a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
> +++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
> @@ -2,7 +2,9 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
>  DESCRIPTION =3D "Tool for manipulating ICE protocol authorization record=
s"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D13f70acf3c27f5f834bbc954df775=
f8e"
>  DEPENDS +=3D "libice"
> -PR =3D "r6"
> +PR =3D "r7"
>
>  SRC_URI[md5sum] =3D "bb2e4d2611047f7c5a1a82ec956a9de4"
>  SRC_URI[sha256sum] =3D "0ee6fd4554f0131b1ed526ee00b9cf643e7dc97eb70fb514=
48848ef2f349938d"
> +
> +BBCLASSEXTEND =3D "native"
> \ No newline at end of file
> --
> 1.7.9.5
>
Acked-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>


