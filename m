Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
	[209.85.210.46])
	by mail.openembedded.org (Postfix) with ESMTP id 07BD26C5AD
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 16:09:35 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id f18so9399724otl.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 08:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wSFtOT92NSbbhQKkYQv2+iSMDq99/lvkxaIh+07QvPQ=;
	b=PkdFpYDWBME4t9ltjYMUXEx/25FxuXzVMzY6kihRsfahggY3UV1Ajj4maE1jPXKQfU
	IzVKGUPB2JrUOX1JGh0V0krslQmSazb69CXbNXwTHj2xvhZHXkt49YjOBRCEwd3OYGDo
	hPrHeG4agWrY/UJuY96fjEXUZFjFWZUlgzyqBoRO6Tck2gETE8ENC9I7+d7goI2V/t8w
	uxcELU0MfiYDjiFtUfJXiOlCvBV/89whLdoH3P76+JhQ1jQIUdk2kALgt8s7OLCfg5r5
	ASUO+r+VPoibuKcWFQmiTl74rHqlU/fyTO6v4JqY8fq0AVRKYJkOhPhcPQq3w/bapwx3
	aZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wSFtOT92NSbbhQKkYQv2+iSMDq99/lvkxaIh+07QvPQ=;
	b=Ub12hJgoM2cU5dou+nFru/FOn7j22GZBLAgGxh11EQgX4NFIPdSfVRv1DybdHj1a+A
	bxGDF1TrDXvtF5TJFodt6tCJo2Y9R+uvhzzECg/UmT8Qo6qc3wDbgFRkKmsNRwwBDwee
	1p45OIJrNRUWssvkKVF7wt92C9F58r/qDbNQIjBfHpxraD0b9f/BMYZF2u3QN5YgM97p
	2J+oiDkIfh9RjtdaGXPEW74/kdOUaBZ7r0EnjMGuNQpt9FOrZm/dHKZ4kvdbNXIbYLac
	DLlINheMatrfJ9d2EUYINsAv8k5/6xijZ5/FA7RoDmkCwfCWEWBlQpDUq94xAGBgDWhX
	pawg==
X-Gm-Message-State: AA+aEWY90uC7B0aTBkLRzuwWVVlBqjMGpT8RoEqRVTx1z2Wq/e2/3t+v
	pc2av/jTevJQ9qUCb353m7BQ+hcyWtmGmdFcYnE=
X-Google-Smtp-Source: AFSGD/UPzm2sLRUEUzmUoirbn5dOtJYTGtWOkBtX4hocaYzc9Tcx/AVMDEiQFgDeYpYR3HIYbhUYdqnyvmf/CFwDezo=
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr8322868oti.367.1543766976842; 
	Sun, 02 Dec 2018 08:09:36 -0800 (PST)
MIME-Version: 1.0
References: <20181202102736.47401-1-alex.kanavin@gmail.com>
	<6d78c61b-d097-8677-8f7e-f6aa3d26f1f6@gmail.com>
	<CANNYZj8V34J0ZKWAjWtRyYV_vJVJ4YCBK2PF4dmJenF2NkgtSQ@mail.gmail.com>
In-Reply-To: <CANNYZj8V34J0ZKWAjWtRyYV_vJVJ4YCBK2PF4dmJenF2NkgtSQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 2 Dec 2018 17:09:25 +0100
Message-ID: <CANNYZj_3o662t1+4+1Xk7pSU2nnK16ZadDZkwr=aSeE974w3=w@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sun, 02 Dec 2018 16:09:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Dec 2018 at 17:04, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > My understanding all ptests are included in the auto mode. I wanted to
> > isolate the ones for meta-oe to get a quicker test run.
> >
> > Am I misunderstanding ptest?
>
> The problem appears when ptest is in DISTRO_FEATURES (e.g. poky
> default). Bitbake then throws an error due to duplicate entries in
> packagegroups (-ptest stuff included twice - once via explicit
> definition in the recipe and then again from packagegroups.bbclass):
>
> ERROR: packagegroup-meta-oe-1.0-r0 do_package: QA Issue:
> packagegroup-meta-oe-ptest is listed in PACKAGES multiple times, this
> leads to packaging errors. [packages-list]
> ERROR: packagegroup-meta-oe-1.0-r0 do_package: Fatal QA errors found,
> failing task.
> ERROR: packagegroup-meta-oe-1.0-r0 do_package: Function failed: do_package
> ERROR: Logfile of failure stored in:
> /home/alexander/development/poky/build/tmp/work/all-poky-linux/packagegroup-meta-oe/1.0-r0/temp/log.do_package.89890
> ERROR: Task (/home/alexander/development/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb:do_package)
> failed with exit code '1'
>
> I don't think you can cherry-pick ptests at the moment.

However, maybe renaming the ptest group will work. Let me try that.

Alex

