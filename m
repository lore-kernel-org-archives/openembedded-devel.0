Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id D4F24771E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 16:11:36 +0000 (UTC)
Received: by oies6 with SMTP id s6so35711972oie.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 08:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=C0Mmo79Efvcdd2ZBybP0NatIGJOrk8cKT9g3YCB1uJE=;
	b=k67f9x0TbnAzpr+dqoUPTpUm8VazxU++sdwlhO5VfgxyeoodM+vk5D81xk66naW1lk
	P70N6gfvOcPwGMzQmAkCdP/bYgXPXnUNFMre4sLAakSv6/9n5GRLx2zmQtfhc4Dbfs+4
	FNYQ9mY10l8wjAZOmMLwHg9Ts/aAZmV3WUJVeUB0he6BRoWaam+aG4sGaS1f87EemGmc
	TA8cFyngHwySfcdZu229vD3KLai/qQrTK947YnT+/UmwnqAsPUfXr+oTGU5OHL8+p6VA
	of+jDHpGhUQy/YuEMXw1ql55H9PZ13wDSp2eeUqexPlANiCcJiQjbQOOPtdyXlqtp3Do
	vWhw==
MIME-Version: 1.0
X-Received: by 10.202.69.85 with SMTP id s82mr8718879oia.46.1447344696590;
	Thu, 12 Nov 2015 08:11:36 -0800 (PST)
Received: by 10.76.75.135 with HTTP; Thu, 12 Nov 2015 08:11:36 -0800 (PST)
In-Reply-To: <1447343800-21460-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447343800-21460-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 17:11:36 +0100
Message-ID: <CALbNGRRrYKrn5jh-UnktCy9w8CCZ1hYrZApqOpDRbS+OW-9B_g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-xfce] xfce4-session: exclude machine-host dependency with SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Thu, 12 Nov 2015 16:11:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 4:56 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * this whole machine-host is very bad idea, all changes from postinst
>   will be removed when netbase package is upgraded (it has CONFFILES
>   set but most users won't know that this entry was appended by
>   machine-host package)
> * see:
>   http://lists.openembedded.org/pipermail/openembedded-devel/2015-Septemb=
er/103271.html
> * fixes:
> ERROR: xfce4-session different signature for task do_package_write_ipk.si=
gdata between qemux86copy and qemux86
> runtaskdeps changed from ['dbusdbus_1.8.20.bb.do_packagedata', 'opkg-util=
sopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4=
.bb.do_populate_sysroot:virtual:native', 'upowerupower_0.9.14.bb.do_package=
data', 'xfce4-sessionmachine-host.bb.do_packagedata', 'xfce4-sessionxfce4-s=
ession_4.12.1.bb.do_package', 'xfce4-sessionxfce4-session_4.12.1.bb.do_pack=
agedata', 'xorg-appiceauth_1.0.7.bb.do_packagedata', 'xorg-appxinit_1.3.4.b=
b.do_packagedata'] to ['dbusdbus_1.8.20.bb.do_packagedata', 'opkg-utilsopkg=
-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.d=
o_populate_sysroot:virtual:native', 'upowerupower_0.9.14.bb.do_packagedata'=
, 'xfce4-sessionmachine-host.bb.do_packagedata', 'xfce4-sessionxfce4-sessio=
n_4.12.1.bb.do_package', 'xfce4-sessionxfce4-session_4.12.1.bb.do_packageda=
ta', 'xorg-appiceauth_1.0.7.bb.do_packagedata', 'xorg-appxinit_1.3.4.bb.do_=
packagedata']
> meta-openembedded/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb.do=
_packagedata with hash 7b3f9a883729dfe908e17980476d10e2
>  changed to
> meta-openembedded/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb.do=
_packagedata with hash f51309cb641c82a6d8e2dc5387bb6484
> Hash for dependent task xfce4-sessionmachine-host.bb.do_packagedata chang=
ed from 7b3f9a883729dfe908e17980476d10e2 to f51309cb641c82a6d8e2dc5387bb648=
4
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-xfce/conf/layer.conf | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> index 55bcef6..64b1077 100644
> --- a/meta-xfce/conf/layer.conf
> +++ b/meta-xfce/conf/layer.conf
> @@ -17,3 +17,7 @@ LAYERDEPENDS_xfce-layer +=3D "openembedded-layer"
>  LAYERDEPENDS_xfce-layer +=3D "gnome-layer"
>  LAYERDEPENDS_xfce-layer +=3D "openembedded-layer"
>  LAYERDEPENDS_xfce-layer +=3D "meta-python"
> +
> +SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
> +  xfce4-session->machine-host \
> +"
> --
I missed that - there should be another way to go for this problem.
Two questions

* What exactly does SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS do? I checked your
original patch in oe-core but do not understand what the result of
setting SIGGEN_EXCLUDE_.. is.
* How much time do you give me to come around with a proper solution -
without machine-host quirk? I would like to avoid getting this into
jethro.

Andreas

