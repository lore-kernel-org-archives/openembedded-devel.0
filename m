Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 96E7F7E091
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 10:26:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Tpdr188rz43;
	Fri,  6 Dec 2019 11:26:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575627968;
	bh=4DQk5CBqs7MfBBm2s56EbrxRi+WRhTR8LhN1Z9j0udc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cVJsOnCMe47kmCxM6QN3t11Mb6Fqd1Jf4EWcHkmoUlMRBOJFMKETnJlfXRXCxAKju
	c0GOIRBxzIm7roDDsCnri5xyBwbrQ9ocE6fKy3dC5Q8mEvtWS8wJ57L1BPcuwc9vOz
	QyhJRSLMsj8e0D5JRCgRcu8yFPlEvO0W6YD1rRCB9WGKyT2T2aQ2o/yD7gkfbyL8+v
	+GaGjRFaj9g/SJhbnPZUldoUviAfQqiuzfQTDnqyKcTBHgnEg69FS5ThOcY/SZ8dBq
	AaCnotLm15O99UVQvt42RUk3TxDnZtfBMiS1CwJkYzW/8j586BOpxPriMrCY5glOYe
	+Msz5QM/heonAWxDbeIiZaHxYI7WJQXC73B1ht9SvtakXUPo66UsztXc2guXk5fGNW
	6CYUBSpByuFK6TBxckoYnFjkLxtuVFBEigI9MGoq66uOvXYQtPh0FJbYy1vsmQKt3c
	m1hiM/4wypumzSfyMjQMCaXy46xJIQih535hGE1Xo+/ZabBhp7S4PEKGl1ufEJoao6
	fnjTIbmMTyM/SApUH4Uu1xfGsfURTWZHpqrrmLvGcwK77S2RrUxnHnXXCcqe6LynKl
	1z5/2eQ0ZEUJiNHLPTfz+eilBRbw+VZrMjtHt5uW1LFvg0mll5xzjLyQg1Qged924j
	2pYirm3ru4WZPZprQmskOFrI=
Date: Fri, 6 Dec 2019 12:26:05 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191206102605.GA18604@localhost>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<CAMKF1sp1MgymCXa_3UXydMTL6Novf0PjnLYVn3+TyaAMe+=woQ@mail.gmail.com>
	<CAMKF1sqrhYHQAeFPmbh=smyU=uqJxGOhYeCup3Nteyqk6guwXg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqrhYHQAeFPmbh=smyU=uqJxGOhYeCup3Nteyqk6guwXg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/21] Gnome cleanups & desktop patches
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
X-List-Received-Date: Fri, 06 Dec 2019 10:26:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Dec 05, 2019 at 11:12:11PM -0800, Khem Raj wrote:
> Seeing below parsing errors
> 
> 20:27:29 ERROR: Nothing PROVIDES 'gdm' (but
> /mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
> DEPENDS on or otherwise requires it)
> 20:27:29 gdm was skipped: missing required distro feature 'systemd'
> (not in DISTRO_FEATURES)
>...

Making GNOME work without systemd would be a lot of extra work,
builds should be with systemd.

cu
Adrian

