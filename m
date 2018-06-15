Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3352176025
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 16:36:38 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id l11-v6so6798224uak.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 09:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6gWZMRm59FJurU/izNufcYqYeCqy5ZAI9j0ppdXirJM=;
	b=nmQan+9KYGA/tt12e0zY2UF87xB40b3/2MmwteqJJ4wyzVMCP15OLS7iYdKaeCVc5E
	HFics778KnoRhGBQZpkbfK5UCD0ts6JXwlSB4K3eeGW0R65pjfWqdoww2uXLnbgSqA9T
	TVVIXdMEH8LHEL0YSadRj+bAFRzqaX5K5M0Kdi7JG/psFfvNsuEApuvGorJl9eYMEOdJ
	lz6+lJbDK0PChaYWWlrZdJ0mx28lNPnX0eXTCPZyLR8e5dEw1izxqTf6+4joLc4WyGfT
	MUmfLI61q6z4WjYNX1VleOUSHde1map8tLXgPah6uYJm7bYUrUUgg7BBD2Yn8kwmGRU1
	bmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6gWZMRm59FJurU/izNufcYqYeCqy5ZAI9j0ppdXirJM=;
	b=kaazUx2Gub2f92RMzhSZDvKHqoqxJeTOiUjJooaw5+o//7sHmkVP1pP1LSKbbk7so6
	erT3AVc+cOnZxHi3fBD2Ws+wE1M3lkoeLNCOyZPvIUsTjDRFF4BVNZM0CJTNbJQtwug1
	dV1TrNou1saQXKXSMWqmVmy822L2bP6k5GWUFpMbRqxPUUJJs5J9pbAYazJCrKUGcYXy
	5UahtX6Um4RTEAFU22argT9sLAv49FbOjSz0AM30rNd+L4Clb+5WhZf0ThHgtc3rDBTp
	0zmzE/hLDJH5vbmU4ccS5FSBO+J/j/CRwq4KOWV9PybxVwtb/A2VrkIIdniCFLWk7KQn
	tueA==
X-Gm-Message-State: APt69E3vh2dM/Q6U36UZL/2JHe8k/yAe0J15TkplZJAJIAtKq+BNzzno
	HvA3waSJP992BiYRGjEb0mDAEmJRpPI6017DrYQJwg==
X-Google-Smtp-Source: ADUXVKKAaRmyV33RD/3i+cJpzUHaqZBctFpeH4IPXgzUEyAZ4iv/8Y9USf+fTSAUudzsH4sAmpgEc9ERisC3EcJbKlE=
X-Received: by 2002:ab0:50f0:: with SMTP id
	d45-v6mr1585706uaa.45.1529080598773; 
	Fri, 15 Jun 2018 09:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20180615090847.62109-1-psaavedra@igalia.com>
In-Reply-To: <20180615090847.62109-1-psaavedra@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jun 2018 09:36:12 -0700
Message-ID: <CAMKF1srY74vtfMmU=cKc+RM48YUQbu3h=wtPj5QA-3H=pxNbLQ@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-cloud-services] [PATCH] Ruby-shadow upgrade to 2.5.0
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
X-List-Received-Date: Fri, 15 Jun 2018 16:36:38 -0000
Content-Type: text/plain; charset="UTF-8"

wrong ml

see http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/tree/README
On Fri, Jun 15, 2018 at 2:09 AM Pablo Saavedra <psaavedra@igalia.com> wrote:
>
> Ruby was upgraded to 2.5.0 in sumo. A upgrade in the ruby-shadow is
> needed to build
>
> Upstream changes:
>
> * Updates code source reference
> * Fixes for rubinius and tests
> * Add friendlier method names
> * Start to add some smoke tests
> * Provide info on implementation
>
> Finally, this version of the package is alrady added in Debian Buster
> as well.
> ---
>  recipes-support/ruby-shadow/ruby-shadow_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-support/ruby-shadow/ruby-shadow_git.bb b/recipes-support/ruby-shadow/ruby-shadow_git.bb
> index 75588f3..e7db6d1 100644
> --- a/recipes-support/ruby-shadow/ruby-shadow_git.bb
> +++ b/recipes-support/ruby-shadow/ruby-shadow_git.bb
> @@ -3,10 +3,10 @@ HOMEPAGE = "https://github.com/apalmblad/ruby-shadow"
>  LICENSE = "PD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=137882914e5269b7268f0fe8e28a3f89"
>
> -PV = "2.4.1"
> +PV = "2.5.0"
>
>  SRC_URI = "git://github.com/apalmblad/ruby-shadow.git"
> -SRCREV = "4231a4838fd50022b112838f114ee0586e119605"
> +SRCREV = "d2e822d8a8bda61f0774debbfce363a7347ed893"
>  S = "${WORKDIR}/git"
>
>  inherit ruby
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

