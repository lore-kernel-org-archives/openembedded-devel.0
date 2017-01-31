Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id E51F471DAD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 20:08:40 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id v23so244686446qtb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hpyU5yFytWwawS1CozPB7W6weXEbkZRXt6TBDLo4sJI=;
	b=mmdFa1AHOp0IrpGDWxU5ZdUZEfAqr17pDIbRKrylWCXR1/fEoQFvAWGup+OTD0DYgM
	pb0d0NM2aIIHHoEEZY+WeYrOwciOPFh4PwVSnEeskPIeM+wELNr2+el8qKAKFbi95jrm
	aI0bCJJkWqWMk7YN7SFHHxZzf/OelKfuI/ru5tyZTsvlEAeRskoK3yOxAdANv+h6e6Up
	M+sabLGQ3yr8GRYJJ1Nix5S3ULEGgGBikWYuOi18aE7gq6dWLSs7RAx5DQGutBd2FkdN
	geYs3/J8K9GqkJWRubx12XC9wyyLx7UhkOwtcSL4Po4elKzjs1bqfz+K2KdcX8vMD6Jn
	l5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hpyU5yFytWwawS1CozPB7W6weXEbkZRXt6TBDLo4sJI=;
	b=n96UwdNosFJ53FDYDheyr/hDev6nDRmh33w8fPxG0+5QpHhWFEYASK8yW4rcBIBy5i
	TIRaC0yyBeGA+sj38NwWoI8K/JGg046RENYnlcJ3Ca5IGYbmSU6llxgosXxZ9PcrL+Gh
	/sW3GDW/IGhGWPUzndxAiYGv90h3nbRtH72C4oblGHJ8Z3GVpRQTp/5m3iL/By2P5ULH
	HovzQ6GYWEk6PgbpLoEO4N6XlhcLAGhX7jS6ANU4vVaYS6HByVz8vMb7zb+ZUAXyVgbp
	o4NC72j5hJbgGhHfcB5MRd/OnpKF3jtxGX7qcbd241yl6KbCOz5Ldvb7OfAFPTL58lew
	JfcA==
X-Gm-Message-State: AIkVDXK61OdnluIlSd6I5U69yzrzdLz28RsnKgoJiG3SgUFd5frWUbRsrg6/wu5fsx0nTV3giRQLifEd+uvGAdr4
X-Received: by 10.237.54.1 with SMTP id e1mr26103268qtb.68.1485893320883; Tue,
	31 Jan 2017 12:08:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 31 Jan 2017 12:08:20 -0800 (PST)
In-Reply-To: <20170131171049.GA3273@jama>
References: <20170131171049.GA3273@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Jan 2017 20:08:20 +0000
Message-ID: <CAJTo0LYxg6dt6bmDg_x2_X4L9GTK5dBzBic7K41=seDNUFts3Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2017-01-31
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
X-List-Received-Date: Tue, 31 Jan 2017 20:08:42 -0000
Content-Type: text/plain; charset=UTF-8

On 31 January 2017 at 17:10, Martin Jansa <martin.jansa@gmail.com> wrote:

> There is a lot more failures this time (mostly because of RSS), but
> I wanted to share it anyway, to be clear about the current state of
> other layers.
>

I presume you'll be changing this script as the minimal/maximal build runs
are redundant now that recipe-specific-sysroots has landed?

Ross

