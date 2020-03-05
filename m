Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id A57EC61901
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 01:52:53 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id j34so3016997qtk.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 17:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cewBDAQfc/xhYyoRPoME9NheaFgU/2zeW8MZa3HJK0Y=;
	b=cjqH80EHo0uEZg8uJmJRnhJ4XaCd3tfeprVyFZs0BkzbDtuy6i1YHKUzrI9Pb+kFdC
	Sm2bRMcMJGz1M1De3u7BiVEQOv10AVlkFzXW/eKR8AaT9nzDqyBjDQAlqo1o5oec9Hn6
	jKdVUlONUcyYytvqHdOywrHr7jb5kAFUl1AJh/rvoYOciL00viWQmuztwpUuaePbGfAD
	S9TpUTVNVRcikVPJhj2PqEVYR6g14+M8/NoKj/Mcrg71zJOigEgLxHBunjITuG79GKmV
	A58vilaGvC6f9U/jlu2tEwiA6JIhDJAw+m+TpM/pC7i5mEHrgV5i+PLsGjEVfq19dlko
	pE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cewBDAQfc/xhYyoRPoME9NheaFgU/2zeW8MZa3HJK0Y=;
	b=ZE9lh7fAddjc1RsqTvizc8H0KFPgh5AlYDKADAnE/QPnN2He0dOP1q/nRLYdsaLTzC
	AS062lMkd5wQhWcEKQKTodZqQi1nhc53Bf0yjAHIXiYqAkd5v213TgyyX8ERXABQ2EIi
	3+btn3uRZH3UVL1PPWMEacdfaiIbnIF5pGbKHlCHl78i4Sxe6T/yJjFzfv3SmdbIO/qt
	ONaWeGnNwwJ+9A67gexzmyMdeW05TUxZJEgOZGcYvTG65Ar1NfwEVJY/QkYpiMcTPDw+
	nqkzTSsc73kxgsBcm/VrfpTL/QP2trafDSpx2DnKd+dgWL/wlvjsHMn+rDVyilnUTHCp
	IEgQ==
X-Gm-Message-State: ANhLgQ1VDeVLKF4gdapm1GlNCVaJK1wW6Lrs7P4NL/Cgel9ydJgMELcU
	+o4PqKd/k5hb17/9efGQxcgtasJ0hWlfnVpUZjU=
X-Google-Smtp-Source: ADFU+vuiaj+H26BXamiO5ZUb2/UQRLR+ASbYO0MvTnKtEpW+tHuHTFqBzSOImQVFvaIkKFgqa4914v0OrfFKemEy8v0=
X-Received: by 2002:ac8:70d4:: with SMTP id g20mr5196791qtp.146.1583373174034; 
	Wed, 04 Mar 2020 17:52:54 -0800 (PST)
MIME-Version: 1.0
References: <20200215005402.18661-1-scott.branden@broadcom.com>
	<CAMKF1srJLkYmt=uH7QWDW_-TpeS0FcrVjU3f1Ec_+1_rc4vtwA@mail.gmail.com>
	<CAMKF1sr92Rmpv_ix7zLSLsm_XrZD2CjdaPNn+Pcbp4A2kLS0wg@mail.gmail.com>
	<65fc29ea-ef37-9b1e-5dd3-316379f0b7eb@broadcom.com>
In-Reply-To: <65fc29ea-ef37-9b1e-5dd3-316379f0b7eb@broadcom.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Mar 2020 17:52:27 -0800
Message-ID: <CAMKF1spgbxCxHaDtE2P2XrawxN7Bc+DuOtmdEu2rWn7c+0fa3A@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v2] x265: add x265 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2020 01:52:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 4, 2020 at 5:33 PM Scott Branden <scott.branden@broadcom.com> wrote:
>
> Hi Khem,
>
> On 2020-03-03 11:33 p.m., Khem Raj wrote:
> > On Tue, Mar 3, 2020 at 10:42 PM Khem Raj <raj.khem@gmail.com> wrote:
> >> Hi Scott
> >>
> >> I am getting a textrel issue reported on musl builds see
> >> https://errors.yoctoproject.org/Errors/Details/393681/
> >>
> >> this recipe is already applied but would be good to root cause this issue
> >> and find appropriate fix
> >>
> >> https://errors.yoctoproject.org/Errors/Details/393681/
> > disabling asm helps on 32bit x86
> >
> > EXTRA_OECMAKE_append_i686 = " -DENABLE_ASSEMBLY=OFF"
> >
> > can you test this fix and see if this will be ok ?
> I'm sorry, I am unable to test this week.
> I am ok with you pushing this for 32bit x86 now though - we only test on
> 64bit.

OK thanks for the confirmation, I have pushed the fix for x86

> >
> >> On Fri, Feb 14, 2020 at 4:54 PM Scott Branden via Openembedded-devel
> >> <openembedded-devel@lists.openembedded.org> wrote:
> >>> Add x265 recipe for latest tag of Release_3.2 branch (3.2.1).
> >>>
> >>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> >>> ---
> >>>   .../recipes-multimedia/x265/x265_3.2.1.bb     | 22 +++++++++++++++++++
> >>>   1 file changed, 22 insertions(+)
> >>>   create mode 100644 meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
> >>>
> >>> diff --git a/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
> >>> new file mode 100644
> >>> index 0000000000..21ae596e05
> >>> --- /dev/null
> >>> +++ b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
> >>> @@ -0,0 +1,22 @@
> >>> +SUMMARY = "H.265/HEVC video encoder"
> >>> +DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
> >>> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
> >>> +
> >>> +LICENSE = "GPLv2"
> >>> +LICENSE_FLAGS = "commercial"
> >>> +LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
> >>> +
> >>> +DEPENDS = "nasm-native gnutls zlib libpcre"
> >>> +
> >>> +SRC_URI = "http://ftp.videolan.org/pub/videolan/x265/x265_${PV}.tar.gz"
> >>> +
> >>> +S = "${WORKDIR}/x265_${PV}/source"
> >>> +
> >>> +SRC_URI[md5sum] = "94808045a34d88a857e5eaf3f68f4bca"
> >>> +SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc"
> >>> +
> >>> +inherit lib_package pkgconfig cmake
> >>> +
> >>> +AS[unexport] = "1"
> >>> +
> >>> +COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
> >>> --
> >>> 2.17.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

