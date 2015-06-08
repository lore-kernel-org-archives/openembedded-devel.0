Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0AFEE732B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 18:16:21 +0000 (UTC)
Received: by wgv5 with SMTP id 5so109860966wgv.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2015 11:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=cWERB16M/UTbZoaMkYPz4bjK/tbPlpI/VgLuzFwhTtY=;
	b=SmbFYIe1bYAMOF/PE1z1OvUV+lsoJMVPV66bLUHmJ7Fmwh22Ch0p/gFnCw5B/bonR3
	y70KHQ2euulCQM/AksDvZJMfm+G/U/yT6/t5qq2Efhj8eJbPDMGe5+mlveX1x7ZjmR9T
	nA2zxJ97fVDdxFOd2z0pe/VK5dfqqSKHtBDeQf0k5Mm4lvhvGqsKeQGVLk3Eq1bm7tUP
	XBFiauDavjS06LKJD81RpKctAy/ar1t37zlFArnRHcXidOBCVj/1gktK5djpiQE59FAX
	oU6Jtbewk1fxQK2goHjW/yqEtbN2G9+nea++n3ArtrswS/Nj518Iz+PqRiEEdQ2puZVx
	UM2Q==
X-Received: by 10.194.57.211 with SMTP id k19mr34767687wjq.53.1433787382163;
	Mon, 08 Jun 2015 11:16:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id a8sm2255822wic.22.2015.06.08.11.16.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jun 2015 11:16:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 8 Jun 2015 20:16:26 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150608181626.GF2384@jama>
References: <1433782597-24380-1-git-send-email-raj.khem@gmail.com>
	<20150608170503.GD2384@jama>
	<CAMKF1spH5Fovxv6vp0S2T27GHt0BFqO6Tmm1ig3gJZ4+0M5peg@mail.gmail.com>
	<20150608172456.GE2384@jama>
	<CAMKF1spdZakWinTTr77WBh6024bhEDA_F7VnpSJTzTLq0g=69A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spdZakWinTTr77WBh6024bhEDA_F7VnpSJTzTLq0g=69A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 1/2] qtbase: Fix build with musl
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
X-List-Received-Date: Mon, 08 Jun 2015 18:16:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2015 at 01:58:03PM -0400, Khem Raj wrote:
> On Mon, Jun 8, 2015 at 1:24 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > If it's too much to ask, I'll just update b5.4* branches in
> > https://github.com/meta-qt5/qtbase myself before applying this patch,
> > but basically when I'm upgrading to newer version, I usually want to use
> > git to just rebase the patches for newer revision (or completely new
> > branch like now when upgrading from 5.4 to 5.5 and having up2data
> > patches in qtbase git repository is very useful, when I'm done I just
> > git format-patch them to refresh .patch files in meta-qt5.
> >
> > For new meta-qt5 patches it's simple, I can just use git am to add them
> > in meta-qt5/qtbase, for refreshing patches I need to be more careful not
> > to forget to do this, before I do next version/revision upgrade.
>=20
> essentially, you have created forks of qt repos from upstream. Are you
> also syncing them on regular bases ?

Yes, but I sync them only when I want to introduce new revision/version
in meta-qt5 or when I'm adding new patch sent to this ML or update of
patch (if I don't forget to do it after testing it in jenkins build).

> So we never rebase/refresh the patches but do incremental patches
> unless you decide to squash them ?

I always do rebase, but I don't expect other contributors to do it
unless they're sending patch upgrading revisions/versions used in .bb
files.

Incremental patches are always welcome even for issues like this one,
because it's easier for me to "git am" + "git rebase -i" to squash them
into correct patch and refresh with git format-patch.

> I am fine with this workflow. I have something similar in mind for
> other components.It will help us push component
> patches upstream as well. I am doing something similar for toolchain
> components on my own but in the end generating
> patches for public consumption.

Yes, it's sometimes a bit annoying churn in .patch files, but having
simple git branch with all our changes in good format for pushing them
upstream is IMHO worth it. That's why I always prefer rebase over merge,
because I want to resolve conflicts once and then have the patch ready
for upstreaming.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

