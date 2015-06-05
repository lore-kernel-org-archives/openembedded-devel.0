Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 775586AC43
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jun 2015 11:22:34 +0000 (UTC)
Received: by padj3 with SMTP id j3so49020350pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jun 2015 04:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=UsUo6EgSfvxmuvCAC006sQOmo4evyE+NyFcxfos+ZxE=;
	b=fMPuM/MNoSqD223qqcWQV9un6m6E2E4hkadwxPx1bFZeP30RnpqB7pYCN+fMOMOzWB
	ArBOWZkwDCbP3cA/7H44tvGULgyjNhKmLRtgYFKusNil2s8E7gQcGNyF27M1NTVCmO+E
	IWgZvW78liqbzfPeLwvrvf7xiRJ3C92QddvAW2eWdLeE72m+QZMbb4BUpNFMWeiOzvaR
	kFuFLg+ID7KtOBQHXqq0SUdkdRS0AMlHSrN5gPbpIomhhK9mbetf982HBHwl/7GLDNsf
	bxgZFRMZXQsWQLoKEeCfsCmhcc1TtXMw02o+offtsu0qd/kshFE9h0iiIdSIRb9RPDMK
	HCSw==
MIME-Version: 1.0
X-Received: by 10.70.47.9 with SMTP id z9mr725949pdm.69.1433503355928; Fri, 05
	Jun 2015 04:22:35 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Fri, 5 Jun 2015 04:22:35 -0700 (PDT)
In-Reply-To: <1433502626-4154-1-git-send-email-Martin.Jansa@gmail.com>
References: <CALbNGRQ9CdHqJJzLB1ojkuVBPXfXcK4iwGttMC591y4=aFziFw@mail.gmail.com>
	<1433502626-4154-1-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 5 Jun 2015 13:22:35 +0200
Message-ID: <CALbNGRRf_DXUN8vdPP+NXJzOt4GHd5gZC=jNsM7ZantwfxgLPg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt3d: fix DEPENDS
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
X-List-Received-Date: Fri, 05 Jun 2015 11:22:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2015 at 1:10 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> * nativesdk dependencies were incorrectly introduced in:
>   commit 48ee17af942ac9860e834c8dec049370e7802a56
>   Author: Martin Jansa <Martin.Jansa@gmail.com>
>   Date:   Thu May 28 14:58:06 2015 +0200
>   Subject: qt5: merge .inc and _git.bb files
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-qt/qt5/qt3d_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
> index 3bebcb5..62f17e1 100644
> --- a/recipes-qt/qt5/qt3d_git.bb
> +++ b/recipes-qt/qt5/qt3d_git.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.GPL;md5=3Dd32239bcb673463ab874e80d47fae504 \
>  "
>
> -DEPENDS =3D "nativesdk-qtbase qtbase-native qtdeclarative"
> +DEPENDS =3D "qtdeclarative"
>
>  FILES_${PN}-qmlplugins +=3D " \
>      ${OE_QMAKE_PATH_QML}/*/*/*.bez \
> --
> 2.4.2
>
FWIW :)

Acked-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

