Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id A891265CAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 10:50:04 +0000 (UTC)
Received: by wizk4 with SMTP id k4so94158046wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 03:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=zncHLPEk07hUBxNgpMUYwxHHc9LYHBL597vrllEfRTA=;
	b=vN+/aliMHdlwT4SDbP0xOwjSEYZhMPRi8cgHCNaE48S/JoW3IKOOYNmeGffvn6E8c/
	FLlrc3HjcgkyM+MKzrEMfO2kI8ijW27+eqidpgINewgYcy9QVoWSTMI5+Wyk+cQnh0O4
	515Hdk1iLhb88Kp60eQqcGRc91iwKCU1WsGiNTpIp0PQ4O6tATGotolAy+1a0FtGVkIf
	wgZCVJssF8QE8kbb3FBUAhhTkdMcpYrEV4v07fLhFUCl3WxZQrRAd/1L776tk6Gl2C/A
	cIS7SXvnwRhpJnrwDQQN2OCcviCXdv4O5pgNAYSy8jRhl+iAIFVzy9OkwoEv3Obkgicr
	l9bA==
X-Received: by 10.180.92.228 with SMTP id cp4mr19165372wib.62.1430131804771;
	Mon, 27 Apr 2015 03:50:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	z12sm28870671wjw.39.2015.04.27.03.50.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 03:50:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Apr 2015 12:51:00 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150427105100.GB2379@jama>
References: <1426861220-30221-1-git-send-email-funman@videolan.org>
	<550E94BF.50908@videolan.org> <20150322155513.GN4738@jama>
	<550EFAA0.7080202@videolan.org>
MIME-Version: 1.0
In-Reply-To: <550EFAA0.7080202@videolan.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] vim: add checksum
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
X-List-Received-Date: Mon, 27 Apr 2015 10:50:07 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2015 at 06:23:44PM +0100, Rafa=EBl Carr=E9 wrote:
> On 03/22/2015 04:55 PM, Martin Jansa wrote:
> > On Sun, Mar 22, 2015 at 11:09:03AM +0100, Rafa=EBl Carr=E9 wrote:
> >> Hello,
> >>
> >> I couldn't reproduce the checksum error with a fresh build with an emp=
ty
> >> downloads/ folder.
> >>
> >> So this patch is apparently needed only when populating downloads/
> >> folder before fetching vim.
> >>
> >> I will investigate a bit more, I think the patch should actually be in
> >> bitbake
> >> (missing supports_checksum for Hg.py)
> >=20
> > Should bitbake support checksums for hg? We don't use them for any other
> > SCM like git or svn, if we do that for hg, what will be included in th
> > checksum? Whole directory with hg checkout? Is it stable (e.g. doesn't
> > hg fetch everything and then checkout required revision like git does?)
>=20
> Exactly, what I meant was Hg.py needs to explicitely say checksums are
> disabled:
>=20
> supports_checksum(foo):
>     return False

Did you send such patch to bitbake-devel? I haven't seen it there.

Regards,

>=20
>=20
> > I've included this patch in master-next, but now when I see that it's
> > fetched from hg I'll drop it.
> >=20
> >> On 03/20/2015 03:20 PM, Rafa=EBl Carr=E9 wrote:
> >>> ---
> >>>  meta-oe/recipes-support/vim/vim_7.4.481.bb | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/rec=
ipes-support/vim/vim_7.4.481.bb
> >>> index afdea84..ac59077 100644
> >>> --- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
> >>> +++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
> >>> @@ -10,6 +10,10 @@ SRC_URI =3D "hg://vim.googlecode.com/hg/;protocol=
=3Dhttps;module=3Dvim \
> >>>             file://disable_acl_header_check.patch;patchdir=3D.. \
> >>>             file://vim-add-knob-whether-elf.h-are-checked.patch;patch=
dir=3D.. \
> >>>  "
> >>> +
> >>> +SRC_URI[md5sum] =3D "5fd5d754581a673a25733c12367cf9d2"
> >>> +SRC_URI[sha256sum] =3D "e2cc416dabea503e9e5631afc21bb00dcbfb9d054816=
41b75f247fd89ff4d7e8"
> >>> +
> >>>  SRCREV =3D "v7-4-481"
> >>> =20
> >>>  S =3D "${WORKDIR}/vim/src"
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

