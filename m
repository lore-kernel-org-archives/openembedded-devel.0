Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PGxM7-0002vM-34
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 18:24:12 +0100
Received: by yxd5 with SMTP id 5so11904yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 09:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=3UVEmcfgvGZAqLmJ8IEvszylaMkRWOjnOPpq+NURnms=;
	b=Iar0Sl8H7GUMgvJd9iq6jUFHjaJy647zofHEKQyOodNa7u2xpmfGxgzl12hLE2Rj0A
	fr6MxzqMzKP+zoItxUSfLm/KR1uyu+uVMxDt6M+mirBvTFT1PoCNvVTfCai5GcYRTO2g
	ed+z2JfLaW+7tiKxRSzOegb1yDkQqmPBs2VYs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=mFdkhgysJIla+Zs20FNbIY6rPhGpzAQSDYffTBrY0TaY5PL2rGdJEqtfCELguGy6Hj
	ipsLKzF7q16jiIgis9RBq+oJFSt6PLyWMKeW0Q7J8lc+QIg+5Kr8BLMs4cxl9oU24YA2
	PSKKtbwe26Bf5KcoWvuURl4BM5mQ9An7fx1GQ=
Received: by 10.90.99.8 with SMTP id w8mr3525626agb.0.1289582585426; Fri, 12
	Nov 2010 09:23:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Fri, 12 Nov 2010 09:22:45 -0800 (PST)
In-Reply-To: <1289582020-29544-1-git-send-email-harvey.tim@gmail.com>
References: <1289582020-29544-1-git-send-email-harvey.tim@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Nov 2010 09:22:45 -0800
Message-ID: <AANLkTin+TzTHxwHcV2xOvMyafy4U2yrnRe=109nomY_p@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] vim: fix do_install for those using FILESPATH* overrides
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
X-List-Received-Date: Fri, 12 Nov 2010 17:24:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 12, 2010 at 9:13 AM, Tim Harvey <harvey.tim@gmail.com> wrote:
> WORKDIR should be used for the source directory of vimrc. =C2=A0This fixe=
s breakage
> for those using FILESPATHBASE/FILESPATHPKG/FILESPATH overrides
>

indeed. Thanks for patch I will take care of it.

> Signed-off-by: Tim Harvey <harvey.tim@gmail.com>
> ---
> =C2=A0recipes/vim/vim_7.2.bb | =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/vim/vim_7.2.bb b/recipes/vim/vim_7.2.bb
> index b887ce4..99a8e31 100644
> --- a/recipes/vim/vim_7.2.bb
> +++ b/recipes/vim/vim_7.2.bb
> @@ -11,7 +11,7 @@ VIMX ?=3D "--without-x"
>
> =C2=A0require vim.inc
>
> -PR =3D "${INC_PR}.2"
> +PR =3D "${INC_PR}.3"
>
> =C2=A0# 001-411.diff contains 411 patches fetched from upstream
> =C2=A0SRC_URI +=3D "file://001-411.diff;apply=3Dno"
> @@ -28,7 +28,7 @@ do_applypatch() {
> =C2=A0addtask applypatch after do_unpack before do_patch
>
> =C2=A0do_install_append() {
> - =C2=A0 =C2=A0install -m 0644 ${FILESDIR}/vimrc ${D}/${datadir}/vim
> + =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/vimrc ${D}/${datadir}/vim
> =C2=A0}
>
> =C2=A0RCONFLICTS_${PN} =3D "gvim vim-tiny"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


