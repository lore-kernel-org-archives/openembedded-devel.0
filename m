Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1UQFXU-00017J-CE
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 13:19:37 +0200
Received: by mail-vc0-f179.google.com with SMTP id hz11so1151344vcb.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 04:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=jPnzxJGNO6acEtsQAejwaaBKeExuw4tqn0NAZzZvK1k=;
	b=GbDdD0ijlfUB7QR/1r1WrKoVn/veSQ98UBcaXI+m4ndFA0qWvu1w3XohlbiOgQtqTU
	gQ2jZGxgHtuIEX/7DXDENuNTFkEE30R0MZJmLfm9JB4o3NCuBfHfN84ebp5k5zHAtQPS
	smPXymuHP9U053P8GvqBNP0mVsHu92n6TTT1mac7rYYPNvX4YW5Wqpqe0GaiiE7AnWs0
	2mV/kcEG68bBzm9Z8SlI993et6BNBEX5BfzImzh5wgpRClLOacXivg10wnQynL54fjyf
	lCoG/YreQaQ9MwWA1CrpPceG7M/apDH1U7SOK2qK4Rc9aqmvdJTafBK0mJjQvThZlfw9
	QP6g==
MIME-Version: 1.0
X-Received: by 10.220.91.17 with SMTP id k17mr4601916vcm.36.1365678133190;
	Thu, 11 Apr 2013 04:02:13 -0700 (PDT)
Received: by 10.220.33.70 with HTTP; Thu, 11 Apr 2013 04:02:13 -0700 (PDT)
In-Reply-To: <2008958.M9FfYJ4SC0@helios>
References: <cover.1365609345.git.paul.eggleton@linux.intel.com>
	<a2eefe761b129b700bbf0a1053a05999ecb69e12.1365609345.git.paul.eggleton@linux.intel.com>
	<kk438m$t0a$1@ger.gmane.org> <2008958.M9FfYJ4SC0@helios>
Date: Thu, 11 Apr 2013 13:02:13 +0200
Message-ID: <CAE4k23_me7pixpSeOc26Y+2iQtYq_8=r_2gcpDL76p_=Y4opdA@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH v2 2/2] qt4: remove bbappend content
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
X-List-Received-Date: Thu, 11 Apr 2013 11:19:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 10, 2013 at 6:26 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Wednesday 10 April 2013 18:16:28 Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Op 10-04-13 17:57, Paul Eggleton schreef:
> > > These changes to Qt's configuration need to be applied in distro
> layers,
> > > not in meta-oe.
> > >
> > > (We have to preserve the PRINC value to avoid PR going backwards.)
> > >
> > > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> ---
> > > meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend |    5 -----
> > > meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend |    5 ----- 2 files
> > > changed, 10 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> > > b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend index
> > > 27cac11..d9f1c29 100644 ---
> > > a/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend +++
> > > b/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend @@ -1,6 +1 @@
> > > -DEPENDS += "mysql5 postgresql sqlite" -QT_SQL_DRIVER_FLAGS =
> > > "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql
> > > -plugin-sql-sqlite2 -plugin-sql-sqlite" -QT_CONFIG_FLAGS +=
> > > "-I${STAGING_INCDIR}/mysql \ -
> > > -I${STAGING_INCDIR}/postgresql" - PRINC := "${@int(PRINC) + 1}" diff
> > > --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> > > b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend index
> > > 27cac11..d9f1c29 100644 ---
> > > a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend +++
> > > b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend @@ -1,6 +1 @@
> > > -DEPENDS += "mysql5 postgresql sqlite" -QT_SQL_DRIVER_FLAGS =
> > > "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql
> > > -plugin-sql-sqlite2 -plugin-sql-sqlite" -QT_CONFIG_FLAGS +=
> > > "-I${STAGING_INCDIR}/mysql \ -
> > > -I${STAGING_INCDIR}/postgresql" - PRINC := "${@int(PRINC) + 1}"
> >
> > So with the reason given "I don't want to rebuilt QT when adding
> meta-oe" to
> > remove this, this doesn't actually accomplish that. You are adding an
> extra
> > rebuild with this.
>
> That's the reason I don't want the bbappend to exist at all. In the
> absence of
> the ability to have that for now, let's at least not have the configuration
> changed and not have postgres and mysql built just by adding meta-oe.
>

I'd definitely like to have this patch applied, just for the same reason as
Paul has stated. I don't want to have to build postgres and mysql, just
because I need qt4. Currently I'm solving this using a number of
oe_filter_out's in my own bbappend, but I'd prefer to reduce them to as few
as possible.

The extra rebuild (which only will occur once) caused by applying this
patch is a small price to accomplish this.

 I'll go back and continue thinking about how a triplet version of
PACKAGECONFIG could look like...

Cheers,
Anders

-- 
Anders Darander

