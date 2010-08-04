Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OgWCb-0007T0-Ik
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 07:07:45 +0200
Received: by iwn34 with SMTP id 34so5813183iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 22:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qheYfhhP+D+sNNTKRLYgfQBX+8VihPjZxKeDpiCpggc=;
	b=pOrBOCNFbW2E8/XgPxg/xkcoxhAtUxcJ61DrwGRi+jP9KqhefgXhNDd6s+ACGf57S8
	QA8lwphpXETqdSYOnBsnWhbkHpN5Qij3pz9t6nIo/IxDwxkj2NUOai89eItkFPKEFRKQ
	Mg1VqpYG2Dlt3gfgogAUdZAehEdTuyp+UO8Ec=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CYlCfqL5nMcmFGl3IWyRppZtX/LrXsG/cpH23uCAoFyL/C9Wi7NwdIzU0TZ+EQy38x
	NbvPalrH6Sq60LZn2EGEZaZfN5RNsO8T/XE94LyvV2U5owkvb7Z9HzNuQIkceN0Jwdz0
	w/dRjw8CO7ezy2rgT7q3h9c5XbRe4gTFJEfYc=
MIME-Version: 1.0
Received: by 10.231.183.81 with SMTP id cf17mr9825745ibb.32.1280898450126; 
	Tue, 03 Aug 2010 22:07:30 -0700 (PDT)
Received: by 10.231.145.77 with HTTP; Tue, 3 Aug 2010 22:07:30 -0700 (PDT)
In-Reply-To: <20100804032153.GH17391@denix.org>
References: <1280890173-31915-1-git-send-email-raj.khem@gmail.com>
	<20100804032153.GH17391@denix.org>
Date: Wed, 4 Aug 2010 14:37:30 +0930
Message-ID: <AANLkTi=WHWm67_GkH7rFSvz+F=_cjP_CgBe5m5ME4tuH@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] recipes: Dont inherit autotools_stage.
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
X-List-Received-Date: Wed, 04 Aug 2010 05:07:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 4 August 2010 12:51, Denys Dmytriyenko <denis@denix.org> wrote:
> 1. Do you expect extensive fallout after this change? Since PRs are again=
 not
> bumped, people should probably try 2 builds - with existing TMPDIR and wi=
th a
> clean one.
>
> 2. This doesn't seem right (special case not handled by your regexp):
>
> @@ -60,7 +60,7 @@ do_configure_append() {
> =A0}
>
> =A0do_stage() {
> - =A0 =A0 =A0 autotools_stage_all
> + =A0 =A0 =A0 _all
> =A0 =A0 =A0 =A0sed -i s,-l:libusb-gnur.a,,g ${STAGING_LIBDIR}/libusrp.la
> =A0}
>
> --
> Denys
>

This doesn't look right either.

--- a/recipes/bluez/bluez4-libs.inc
+++ b/recipes/bluez/bluez4-libs.inc
@@ -10,7 +10,7 @@ SRC_URI =3D
"http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \

 S =3D "${WORKDIR}/bluez-${PV}"

-inherit autotools_stage
+inherit
 AUTOTOOLS_STAGE_PKGCONFIG =3D "1"

 EXTRA_OECONF =3D "\


