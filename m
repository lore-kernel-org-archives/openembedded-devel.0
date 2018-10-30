Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id A641F79C5F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 11:23:08 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id p11-v6so2726645itf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 04:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=We7SEEukHchvK7KJk/NsQaMo27Ywltvkk4DdD4SDfsk=;
	b=mD2NoxFPmmr71dYdbCrt83qKksKcEDEvb0KL/dj4c6NiPcfK0DEYDENrX/pAWlWISi
	3JNgoInZxFF5UBAmekdC7ZsrN+O1AReEMvZCVQJzDKkhS/cfrLt5kvRzvGtNnOEE/aKm
	IZEQttC0KEhzfq0ReMced8vf+Z9ApovKPfLRNjOsBurJXkYwBAlUEP7L6hptCv7yFhov
	ahEox8Wtvqhpi4/RJVNKCPGpjCKvUrv52NB9m3loWu8jlVsVw7UxdzlKyjBPXGjxrSiy
	entqJfeByp6Amzz4fxoai7SbySTFMeggHXSbUc/3QEIIxSoznL+XSzJQmyorpd8d+Hyp
	+K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=We7SEEukHchvK7KJk/NsQaMo27Ywltvkk4DdD4SDfsk=;
	b=pR3W5k8mdbpoFPH4zHWq5hHibNT0IRlrwXVNKUU4n3LReJEtXZQDzNy4ZKiDm/OuTx
	1WZqI8ROaTjgibnyo2WRB9AlaLKre2U7TB7PxJYYZxbHtMvlDMnS3/Ss7qico3zrRsgO
	Pmg7h7BaEQahLCPKGVkievsKpZyXlJXbI+qoWMd8Mcoo3sx0Ftp7O5pog+PEim0No6UU
	NVxt6ARkIA0VhwyetFOklTII84R5+YZzS+r1yFOKcI6YBp1m6uMT+U84V9NDrbkuSbgl
	Kpgae4xlMZQ6ncHZtNf5MEAxJ7xF95ua/vl8OS8xs74P5s0FoYZADF3Cl5C24ELjF377
	qLYw==
X-Gm-Message-State: AGRZ1gLcnRbg5351S5xZD6g1wISQmw6q0OJVhBRFk0h0gZnFAc6lBlFE
	2vHk+TiQi3O6tEkSpyXrWmPx5ai2ckwcNpyZqAPFAg==
X-Google-Smtp-Source: AJdET5cABBKctiMYqeONFjY0GBn/vB9knrSh7AvJJRgPi2Uhxq0ect+hextw8m9Uhc5HV06FQcUmHZceHGHgCBfkAwE=
X-Received: by 2002:a24:36d2:: with SMTP id
	l201-v6mr1068572itl.130.1540898589541; 
	Tue, 30 Oct 2018 04:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<068fb23bf91af2a10eacc81156dc72dfb5d8ee79.1540830650.git.brendank310@gmail.com>
In-Reply-To: <068fb23bf91af2a10eacc81156dc72dfb5d8ee79.1540830650.git.brendank310@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 11:22:58 +0000
Message-ID: <CAJTo0LbH3UCYYHCp6E1gA33fjk2xSr+ZkZjZmn-MDvabT7_EfQ@mail.gmail.com>
To: brendank310@gmail.com
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 05/16] lcms2: add recipe for Little Color Management System
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
X-List-Received-Date: Tue, 30 Oct 2018 11:23:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Oct 2018 at 16:42, brendank310 <brendank310@gmail.com> wrote:
> +inherit autotools pkgconfig distro_features_check

distro_features_check isn't being used.

But mainly, just update the existing recipe.

Ross

