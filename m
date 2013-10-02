Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id CE11F60EF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Oct 2013 16:01:39 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id x16so637671vbf.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Oct 2013 09:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=0Nsne6vqVCBA2shgT07FeeKQ3U/KOYoaFmGvswYNmsI=;
	b=G54nQ2/6Xv/MGqAGTOXqTfeGngHUjkHzsdjPOJOujM2TVaeQRk8Fma7w5WU3rsdJwU
	T+H3mS5W7AZDvaAerIK/GT8YX4P/aJeMRU0j5e3ZI61QkgdWKZkacBZrSNvCZ+abcOTS
	3Z0LuPTJabbuB+5aeSFZ9qWjyZhKsUpwQi9mnjmka2fIbYgP5atrp6PdeCAJS50kB9cT
	KzH7tjDeSp840dlAHjDsi89jsRKzabST2tJzxFXicyTVCbSrm85ObUg8/wLI9LHioAcS
	cO45ftDM0H61V5FxbPnRRKJHhXzX4fKOWd6SrizTLkYPMpUw+tnrEziij2DVT88Q1LaZ
	Ld/Q==
X-Gm-Message-State: ALoCoQnq1TG/tBh/E7wDSqjIXINXRUopUyfLgJFpaspfHHD1tLKrK7x8a7s2hclfrnIcZqQDn3Xg
X-Received: by 10.52.164.102 with SMTP id yp6mr2324628vdb.14.1380729701228;
	Wed, 02 Oct 2013 09:01:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 2 Oct 2013 09:01:20 -0700 (PDT)
In-Reply-To: <1380726101-29289-1-git-send-email-frederic.paut@linux.intel.com>
References: <1380726101-29289-1-git-send-email-frederic.paut@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Oct 2013 17:01:20 +0100
Message-ID: <CAJTo0Lbr21atGMqp7YiFjSSaP0oCNwz7GATBEfR=Wm9EnmzQDQ@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] autobahn recipe (v0.5.14)
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
X-List-Received-Date: Wed, 02 Oct 2013 16:01:40 -0000
Content-Type: text/plain; charset=UTF-8

On 2 October 2013 16:01, Frederic PAUT <frederic.paut@linux.intel.com> wrote:
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

This should be a file inside the source tree (relative paths are
resolved from $S), best practise is to checksum the license file and
the license header of a source file (you can restrict the md5 to a
subset of lines).

> +FILES_${PN}-${PV} = " \

Just FILES_${PN} here, but inherit distutils handles this for you, so
you can delete this.

Ross

