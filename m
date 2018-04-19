Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id E6A5060574
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 06:01:31 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id u4-v6so10543389wrg.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 23:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s8Ldnp0r9G+XCwtvzWQSz96sDudg9C7a35hdgbBSXm0=;
	b=cYcOemja5MAbzeYROkLeeSs2BuG7wqqRLJzPL4b2tCcM58y/3bzXbwh+wuw6cZUfxl
	9+T7e5Dq4v9v9LeNzhxFwWZeJDeBNH9cYlanigafIt2H5z+/DtquaRCbMYrq7e/zORjK
	dMZAWLqcaYSudRR1Ryrtq4N04nmHpHkT7tWG2XXDB1EoiSwCfa9NZIwsUzGAM1LMlT68
	cTSYRd0nwihpLP/j8Pwqbp/CSOgXV8+5FzLzw/zCR2/B8NOg2YkGnYraKjgnrl1LTgYh
	rnIar07afe01Cn48lUlUqXi++4BC6L6NmEuQfymv26A7e07jr7bg93FJ2zr6BJVn3U1j
	oQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s8Ldnp0r9G+XCwtvzWQSz96sDudg9C7a35hdgbBSXm0=;
	b=MpKIJXSL3BSUeBU1IzqzMXlLrjJ/P9eT5nxXPLW5UBhKT3wFmfaATWPwjV4XpC+3cI
	DRsUJE77axn72pmfMn/jWLKurSp2ZIDpmqiv4XsHsi9Zzlu8XCSSlKblraWtNMyjgzkK
	E9HfHs1hJKy71F1ViFPE4d3YkKL3PjDk21/+eLEwA5Ct8OKPfqMM/JHCegYVvJoL/5sv
	dOUSe+gA9pTAQnBIpniKhg6DjXgPL8vr2NUMPh/AZ8PasE9veSn6LDT/EcobfgoAKTZc
	vvxbWbe91dOBKwGJ+mERm/I4tX9dn6qi/YBQU9RRVKjRUpcsbO/qisF4wvOz0blj50ZT
	YvOQ==
X-Gm-Message-State: ALQs6tC7+LdRWUCzORTQRtDWZthHMVm5+iaF9dRW5xuXHR9tVHdmEE3M
	8n+/zDocN1fi+nxeiQRb2fvwh7Bgj1lB4b5sXCk=
X-Google-Smtp-Source: AIpwx4/YslFH9fuJ5efgJpHVyOatJjpAEXMpiVEDUSsL90UVxP77XSHvCUwmOX9f51Mi4hDnF96BVWd5ANWAVIvB3QA=
X-Received: by 2002:adf:bd03:: with SMTP id
	j3-v6mr2965350wrh.138.1524117692387; 
	Wed, 18 Apr 2018 23:01:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Wed, 18 Apr 2018 23:01:31 -0700 (PDT)
In-Reply-To: <CABXoSoX1_kbuDQX4UPHfcU7wEJTHvPxbLkD_kBkgXOoasjVLNg@mail.gmail.com>
References: <20180418100454.3171-1-samuli.piippo@qt.io>
	<CA+chaQd4ygCH0erc913ZcW2_9sesz1WfsECY-YtXrwTiWXOfRg@mail.gmail.com>
	<CABXoSoX1_kbuDQX4UPHfcU7wEJTHvPxbLkD_kBkgXOoasjVLNg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 19 Apr 2018 08:01:31 +0200
Message-ID: <CA+chaQdBh6hBdcVcK6EpSb9A+jyvWZJxEAwTj_vXJx76gMsL0Q@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][rocko][PATCH] qtbase: use mysql_config from correct path
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
X-List-Received-Date: Thu, 19 Apr 2018 06:01:32 -0000
Content-Type: text/plain; charset="UTF-8"

RSS is used since pyro release, but you probably meant HOSTTOOLS which are
used since rocko, but then it wouldn't be needed in rocko, only in older.

Please test it with master, if it works there I'll apply it to all
branches, because people tend to use different branch of meta-qt5 with
different OE releases.

On Thu, Apr 19, 2018 at 7:46 AM, Samuli Piippo <samuli.piippo@gmail.com>
wrote:

> only needed on rocko and older. With recipe-sysroot it works correctly.
>
> On 19 April 2018 at 08:42, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Is it needed in sumo and master branches as well? If yes, then it should
> be
> > applied there first.
> >
> > On Wed, Apr 18, 2018 at 12:04 PM, Samuli Piippo <samuli.piippo@qt.io>
> wrote:
> >
> >> mysql_config from host sysroot is found first which gives wrong paths
> >> for cross-compilation. Use it from crosscompile path instead.
> >>
> >> Change-Id: Ia1e7d8e0c582016130f595b1be279255e9d0b055
> >> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> >> ---
> >>  recipes-qt/qt5/qtbase_git.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/
> qtbase_git.bb
> >> index 0e3a8ac..db6280f 100644
> >> --- a/recipes-qt/qt5/qtbase_git.bb
> >> +++ b/recipes-qt/qt5/qtbase_git.bb
> >> @@ -119,7 +119,7 @@ PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
> >>  PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
> >>  PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb
> >> xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
> >>  PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
> >> -PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql5"
> >> +PACKAGECONFIG[sql-mysql] = "-sql-mysql -mysql_config
> >> ${STAGING_BINDIR_CROSS}/mysql_config,-no-sql-mysql,mysql5"
> >>  PACKAGECONFIG[sql-psql] = "-sql-psql,-no-sql-psql,postgresql"
> >>  PACKAGECONFIG[sql-odbc] = "-sql-odbc,-no-sql-odbc"
> >>  PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
> >> --
> >> 2.17.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

