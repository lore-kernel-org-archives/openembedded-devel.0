Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8256C4B1
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 19:10:12 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id o89so6134533qko.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 11:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QA5LfBxyYLkxabwsiPninMd+VVUoKZabEBLYaHxHBcQ=;
	b=LC2t+NBdjaR4kPIbVB87xM69U/G7Jf/XHA/O/dZWBG8JQOFbWaxePoRZLpgQs4ptGo
	MHB389bKlD0ERzpLrJJxswSB+l1e7cai9PM7Tq8IatDnk3PpLY+KFRN+9YBDWkW/IO6y
	Wvxyb3DzRjpiTvKZ8hDvHt0GOrIbDqeplIAn1XmYlskw9aCcEEZYQ2oBx/NeB+eauLtw
	6jXvmv13N1kcf9wtfWlmTaWHVvoWHDopk2Vu2Sl0yF1gjB3vxTI9WmIRmvo4MSTSJy8S
	MFfSQNsuRuGqB/bgypf9oRoDIaWW3FAqWUYAFy9I+JbMm58Do4ixuyWt4+OCl12kPRoj
	Dfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QA5LfBxyYLkxabwsiPninMd+VVUoKZabEBLYaHxHBcQ=;
	b=XSaKLSuwo9BVdGKyd8kf5S/uz1lqhAzTy6waWVdJCS/llB+OJUXOGKEvavC41DueE+
	S8tyJU3XVkrFekGo6r0Pc98hoOg7LV3kIyoOQ29G53LRP21AC/EZQ63coShp2TBwMzWY
	J4QO2iwpa1zl9GmP4WzfL926qIYH1Pqc4DTbJ6YgtDDQhq8Q5iJKKSbuqSxsLvYphbBa
	KuzngdgqH+c5q9ztuPpaXQTH+4nfRJx2l7Fz7D4rhaeUTIKRjcXpy9GVlVfshQUO1LUN
	M3xFnGOH6epR8+YMndKvg1+s7EDD/bFmRvGTF5G3BRP0mwk9iJboojvHQB6Vtp8OyIye
	wSsw==
X-Gm-Message-State: AA+aEWaVvRsvkayssYE0wVo6XQ+HzkhVBQohva3CFK9eNp5hSo3sRjMJ
	XoYchway4yPVFD+eaL2Pq+1/rzSPPldfamo4tDc=
X-Google-Smtp-Source: AFSGD/W/xY8LqUsg0UCDQJfPvNLkjykNMUCovgdukChACJdXWk2I8ZOCHVfvdLNo6YJvEl+ob23aa+dFWihZ13nOXVI=
X-Received: by 2002:a37:ac05:: with SMTP id e5mr12690326qkm.102.1543777812973; 
	Sun, 02 Dec 2018 11:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20181202102736.47401-1-alex.kanavin@gmail.com>
	<6d78c61b-d097-8677-8f7e-f6aa3d26f1f6@gmail.com>
	<CANNYZj8V34J0ZKWAjWtRyYV_vJVJ4YCBK2PF4dmJenF2NkgtSQ@mail.gmail.com>
	<CANNYZj_3o662t1+4+1Xk7pSU2nnK16ZadDZkwr=aSeE974w3=w@mail.gmail.com>
In-Reply-To: <CANNYZj_3o662t1+4+1Xk7pSU2nnK16ZadDZkwr=aSeE974w3=w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Dec 2018 11:09:46 -0800
Message-ID: <CAMKF1sq+iGKKHvHnNOeeM001+ATb2stsrwLwJoRdzo1o1Ed7tQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-meta-oe: drop ptest groups
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
X-List-Received-Date: Sun, 02 Dec 2018 19:10:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 2, 2018 at 8:09 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Sun, 2 Dec 2018 at 17:04, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > > My understanding all ptests are included in the auto mode. I wanted to
> > > isolate the ones for meta-oe to get a quicker test run.
> > >
> > > Am I misunderstanding ptest?
> >
> > The problem appears when ptest is in DISTRO_FEATURES (e.g. poky
> > default). Bitbake then throws an error due to duplicate entries in
> > packagegroups (-ptest stuff included twice - once via explicit
> > definition in the recipe and then again from packagegroups.bbclass):
> >
> > ERROR: packagegroup-meta-oe-1.0-r0 do_package: QA Issue:
> > packagegroup-meta-oe-ptest is listed in PACKAGES multiple times, this
> > leads to packaging errors. [packages-list]
> > ERROR: packagegroup-meta-oe-1.0-r0 do_package: Fatal QA errors found,
> > failing task.
> > ERROR: packagegroup-meta-oe-1.0-r0 do_package: Function failed: do_package
> > ERROR: Logfile of failure stored in:
> > /home/alexander/development/poky/build/tmp/work/all-poky-linux/packagegroup-meta-oe/1.0-r0/temp/log.do_package.89890
> > ERROR: Task (/home/alexander/development/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb:do_package)
> > failed with exit code '1'
> >
> > I don't think you can cherry-pick ptests at the moment.
>
> However, maybe renaming the ptest group will work. Let me try that.
>

while you are at it, send all the four patches in a single series,
current version seems to have conflicts.

> Alex
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

