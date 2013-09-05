Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id ED74B61604
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:01:57 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id gf12so906311vcb.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 02:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=+c1q86YGUfxX6RRblZsCK6sz5L4J41vvTo/SOzxh15Y=;
	b=btW3xixqjoktbd+UkOdaRp/AOqTabAX78rtiVTqTkdzXu1v7Z8nxVhX6J/eZIwbsKP
	NCWbfZ99c5L3Ky2sscpXEp6ZLmsITgdz4wj8b2femTUaT+/9Dyw3aldWHJcE8m+7jkpx
	/GKldpoSXsDTmyWSjMNWFlATzYhmpHjYZgigtGCkHeROmsdDW535YuDtb+6IJfSUCell
	pRBhs1KysnMQTGT8nKKPQGc1YZofmAhEjvLqyYSBjizK8yGZAafLQ78f1v52l2opmIN2
	sUNV7nHP3DsqUi7HU40VUbA+Gq+7RQmWcqg9bpSKG74o1aHWzNyPO78jPL7vLx/i5kz+
	SoTw==
X-Gm-Message-State: ALoCoQm5wWQdyJdNaKl/QVMXXyhkUvtNzznUns8wv+jZsAehz0g358Lx3UUxZktXUEMfei1nGT3u
X-Received: by 10.52.164.16 with SMTP id ym16mr404813vdb.32.1378371719245;
	Thu, 05 Sep 2013 02:01:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 5 Sep 2013 02:01:39 -0700 (PDT)
In-Reply-To: <CADkTA4PbVB2X9abGFMKsAt6NRaZxnZa1GK86e3L+=CGzNfswdA@mail.gmail.com>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<20130904211411.GR3761@deserted.net>
	<CADkTA4PbVB2X9abGFMKsAt6NRaZxnZa1GK86e3L+=CGzNfswdA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Sep 2013 10:01:39 +0100
Message-ID: <CAJTo0LYA4pa_xSQe=PL9eYXfEr3rULSd7nJGSNLnoJKYEX_uMw@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] openflow: Add latest from git
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
X-List-Received-Date: Thu, 05 Sep 2013 09:01:58 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2013 05:39, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> The meta-virt recipe had the same _1.0.bb extension, and it's SRCREV lines up
> with the openflow-1.0.0 tag in the repository:
>
> --------
>
> commit 5ccca75a69f99791659bcfbcf35353ab1921320a
> Author: Glen Gibb <grg@stanford.edu>
> Date:   Thu Dec 31 16:00:53 2009 -0800
>
>     docs: Update ChangeLog to include 1.0.0 information
>
> :100644 100644 2f13dd7... aa0e92e... M  ChangeLog
>
> -------
>
> So it's definitely an option to keep that recipe around as the tagged 1.0, and
> create a _git that tracks newer changes (where "newer" is relative, 2011 is
> the latest commit in that repo).

FWIW, I massively prefer "releases that are taken from git" like this
(where its a git fetch on a hash that is the tag of the releases) to
be versioned correctly like _1.0.bb instead of _git.bb for clarity and
future alternatives such as true git snapshot or multiple versions.

Ross

