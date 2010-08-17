Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OlSOG-0006A7-6H
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 22:04:23 +0200
Received: by gxk2 with SMTP id 2so2849184gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 13:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=I8RnEPhWqQ6Pd+Wz8eiKOQFpFHSbcIdh8dmRGEB6C58=;
	b=XQGWpw8jXPsJsaLg8cKcnje8JQaVFJM1aNbFTSn+2qsKpX8qcuBaXfg6GsAuH1a+ei
	PsFtS2rxKQbI4Eqm+WGC/K444yCGDLICZIIdZzQSAvKP8bIKhIcPEdjKqgcZa8hhPSaA
	KG2MJjnvn28doATpaRSTmUqtG8mqQRpY99uoI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FbEUmvjHVu4qtWF53FjP/pZaIwlv1lxr60RASHPFQQGYktkTy3FkVIWaDqMpyFhtRu
	35Qqf3imBeFZS4zOhjD1dar8PMSNs+xYw18WA64POF9oEBxBBkF13hoC1A71R0Kw0ENp
	AdOkZg6SidZV0z8optzzCGUoRJnVYRX9ZxuG4=
MIME-Version: 1.0
Received: by 10.150.8.10 with SMTP id 10mr7589394ybh.391.1282075422951; Tue,
	17 Aug 2010 13:03:42 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Tue, 17 Aug 2010 13:03:42 -0700 (PDT)
In-Reply-To: <1282072782-11487-1-git-send-email-jkridner@beagleboard.org>
References: <1282072782-11487-1-git-send-email-jkridner@beagleboard.org>
Date: Tue, 17 Aug 2010 22:03:42 +0200
Message-ID: <AANLkTinvpJphbWaNu_8s=oyxC_1PN=uSXRoNfuEVr=No@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] quilt: disable packaged staging on native builds
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
X-List-Received-Date: Tue, 17 Aug 2010 20:04:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/17 Jason Kridner <jkridner@beagleboard.org>:
>
> Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
> ---
> =A0recipes/quilt/quilt-native.inc | =A0 =A03 +++
> =A0recipes/quilt/quilt_0.48.bb =A0 =A0| =A0 =A02 +-
> =A02 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/quilt/quilt-native.inc b/recipes/quilt/quilt-native.=
inc
> index 10d8183..f422b63 100644
> --- a/recipes/quilt/quilt-native.inc
> +++ b/recipes/quilt/quilt-native.inc
> @@ -6,6 +6,9 @@ RDEPENDS_${PN} =3D "diffstat-native patch-native bzip2-na=
tive util-linux-native"
> =A0FILESPATHPKG =3D. quilt-${PV}
> =A0INHIBIT_AUTOTOOLS_DEPS =3D "1"
>
> +# Several packages fail to patch when using quilt from packaged staging
> +PSTAGING_DISABLED_virtclass-native =3D "1"
> +
> =A0inherit autotools native
>
> =A0PATCHTOOL =3D "patch"
> diff --git a/recipes/quilt/quilt_0.48.bb b/recipes/quilt/quilt_0.48.bb
> index 0a066df..99dc2a2 100644
> --- a/recipes/quilt/quilt_0.48.bb
> +++ b/recipes/quilt/quilt_0.48.bb
> @@ -1,6 +1,6 @@
> =A0require quilt-package.inc
>
> -PR=3D"r1"
> +PR=3D"r2"
>
> =A0SRC_URI[md5sum] =3D "f77adda60039ffa753f3c584a286f12b"
> =A0SRC_URI[sha256sum] =3D "73fd760d3b5cbf06417576591dc37d67380d189392db90=
00c21b7cbebee49ffc"
> --
> 1.5.6.4

I have some concerns with this patch.
I have a quilt native in my pstage dir from aug 7. (pstage is outside TMPDI=
R)
Just did a bitbake beagleboard-demo-image after removing TMPDIR, with
quilt-native and quite some other packages in my pstage dir.
I am at "Running task 7313 of 11636", lots of packages have been
compiled and no patch has failed.

My proposal is to put this patch on hold until proven to be an issue
by someone else.

Frans


