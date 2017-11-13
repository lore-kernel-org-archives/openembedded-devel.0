Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 55C5D78658
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 10:46:17 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id d66so20148248ioe.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 02:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AXZwlrv2vCYKl73FGTyRBAcJ7C+DmTQQJ4GxD5cGLO8=;
	b=Nn0he7NmJSwXOHNfGiTSruQAAqdm+othD87LRJIb5BGIxwmPzROogfNwPer5w+BvDD
	gE8h3g08MX2wcF4NufdyWGYbmSZP9DVqrhwtQ2irCLhsbOYD1uKxkteIwGhDRoqoHu+m
	J2xwYg5EDWgt2XYp+kfPLkbXNpWe8gdYdEqmYlRk6Yrb2lMvvWsSFGJR/FjTxGe04OYc
	Bxgw3SkGdfBn6Y1pIgZnGWt2WGSUf34+lGCSAyHPgRo7cxWqXwVO7NEN1ZqmSuowHF6a
	5juAyo9XUN1qsuU5UECbL5X88akNcdofKiUQBTrEdszxgMQMDPXiipBlWbXshJp6Kdso
	PiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AXZwlrv2vCYKl73FGTyRBAcJ7C+DmTQQJ4GxD5cGLO8=;
	b=OjAJ8kTccGrxszqgGCtFdbsUwsl5sUoySAeJOx2kAH50ds41qvUA/DupIUz/W70jRm
	R6LeiKV2SieTQKsqll7F3Yiz3rJTe4uqGheAIzarZWJsDoafBTbSd4WfM37eTZk6HRwk
	/kn05To83BdGcJR7NLsLQcbsHjH4tGI2wHbUtW2Ikz1OlqGoEnuRq/rE8D6RhfeIKcsD
	9YLd0MCvK1E35moznRkaKnvxSIhiF0K8wgCF73w8efBd9+D1RfzJPC3F581zTXFtf9As
	XTUXf5DYtbh67W0najYZ8c06hyIvl5UCr7IXV+APzyMjG7IRfk+RzcPLyEZ67QJUIi7n
	L/Cg==
X-Gm-Message-State: AJaThX77WZhsi9bICrp1ReoKvNEYwgDljp3IqiX/eIVKVpzznIyctuCt
	LXZgkqdq+R5P3CsUCYOIuTv6CF3nmx2jTZDpz4L60A==
X-Google-Smtp-Source: AGs4zMYqeIrWE9+CqZQsyqdLeUnUvLyFVr4upg6M1NywmDbaqE6/NK58zPfyns9YbTu4arNwL/NLyZsVSWqFEqzH+f8=
X-Received: by 10.107.11.228 with SMTP id 97mr6269894iol.227.1510569978491;
	Mon, 13 Nov 2017 02:46:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Mon, 13 Nov 2017 02:45:58 -0800 (PST)
In-Reply-To: <CAMKF1srK9j6UVu=9dHQOSREauBm_Pv89TF+fen_xXpFT3=C4Ng@mail.gmail.com>
References: <151032511199.27841.6992651845996774565@git.openembedded.org>
	<20171110144512.3538E233675@git.openembedded.org>
	<CA+chaQcCtC+UZsTFVtiQF+-rPuGSk7-0nTz+raXvv6SxcQ=N0w@mail.gmail.com>
	<CA+chaQc5S7D_gbcwPNR2+TmoB+Qxh1X3OdwzJNc5HSPDjMuAZg@mail.gmail.com>
	<CAMKF1srK9j6UVu=9dHQOSREauBm_Pv89TF+fen_xXpFT3=C4Ng@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Nov 2017 10:45:58 +0000
Message-ID: <CAJTo0LZFVJMx02aUtpfwaKPQ7bf6NfNDdCgLf4-SHhR2Dm59oQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 04/44: db: don't provide virtual/db
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
X-List-Received-Date: Mon, 13 Nov 2017 10:46:17 -0000
Content-Type: text/plain; charset="UTF-8"

Apologies, I must have failed to submit that series after it passed an
autobuilder run.  Patches for meta-oe sent.

Ross

On 12 November 2017 at 17:22, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Nov 12, 2017 at 3:48 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > Also, was this ever sent to ML for review? I haven't found it in my
> maildir
> > and google haven't found it in ML archive as well.
> >
>
> Its not on patchwork it seems to have slipped in probably by an overisight
> but I think fix is right. Probably a simple fix for meta-oe recipes to
> depend on
> db will be what we need
>
> > On Sat, Nov 11, 2017 at 11:45 PM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> >> Hi,
> >>
> >> will you please send fix for:
> >> ERROR: Nothing PROVIDES 'virtual/db' (but meta-oe/meta-networking/
> >> recipes-daemons/postfix/postfix_3.2.2.bb meta-oe/meta-networking/
> >> recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb DEPENDS on or otherwise
> >> requires it).
> >>
> >> Thanks
> >>
> >> On Fri, Nov 10, 2017 at 3:45 PM, <git@git.openembedded.org> wrote:
> >>
> >>> This is an automated email from the git hooks/post-receive script.
> >>>
> >>> rpurdie pushed a commit to branch master-next
> >>> in repository openembedded-core.
> >>>
> >>> commit dcbc45aa3fe72c528fe4d47a783da4b4ed5ff38e
> >>> Author: Ross Burton <ross.burton@intel.com>
> >>> AuthorDate: Tue Oct 31 21:10:13 2017 +0000
> >>>
> >>>     db: don't provide virtual/db
> >>>
> >>>     As there are no alternative providers for virtual/db remove the
> >>> PROVIDES and
> >>>     recipes can just depend on db.
> >>>
> >>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> >>> ---
> >>>  meta/recipes-support/db/db_5.3.28.bb | 10 ----------
> >>>  1 file changed, 10 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-support/db/db_5.3.28.bb
> >>> b/meta/recipes-support/db/db_5.3.28.bb
> >>> index fb4befb..fe71967 100644
> >>> --- a/meta/recipes-support/db/db_5.3.28.bb
> >>> +++ b/meta/recipes-support/db/db_5.3.28.bb
> >>> @@ -12,7 +12,6 @@ SECTION = "libs"
> >>>  SUMMARY = "Berkeley Database v5"
> >>>  HOMEPAGE = "http://www.oracle.com/technetwork/database/database-
> technol
> >>> ogies/berkeleydb/overview/index.html"
> >>>  LICENSE = "Sleepycat"
> >>> -VIRTUAL_NAME ?= "virtual/db"
> >>>  RCONFLICTS_${PN} = "db3"
> >>>
> >>>  PR = "r1"
> >>> @@ -37,15 +36,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1158e314
> >>> 37f4f87cdd4ab2b8613955"
> >>>
> >>>  inherit autotools
> >>>
> >>> -# Put virtual/db in any appropriate provider of a
> >>> -# relational database, use it as a dependency in
> >>> -# place of a specific db and use:
> >>> -#
> >>> -# PREFERRED_PROVIDER_virtual/db
> >>> -#
> >>> -# to select the correct db in the build (distro) .conf
> >>> -PROVIDES += "${VIRTUAL_NAME}"
> >>> -
> >>>  # The executables go in a separate package - typically there
> >>>  # is no need to install these unless doing real database
> >>>  # management on the system.
> >>>
> >>> --
> >>> To stop receiving notification emails like this one, please contact
> >>> the administrator of this repository.
> >>> --
> >>> _______________________________________________
> >>> Openembedded-commits mailing list
> >>> Openembedded-commits@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> >>>
> >>
> >>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

