Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id F341371399
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Sep 2014 16:14:05 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id z60so11937597qgd.39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Sep 2014 09:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=oAFsZRNm4FrWHp9k9/qgJ/6Lv9V0c8whiwhVEBQnUUw=;
	b=Ob5woJe21730dwI1kgngyGgwSHhP3mj3oO2KvtupxdBofnhrZB6xg6TtOdek4Dz1rO
	aiz4VWwKjTLfXshp1HnxQVenumqvJgoWmIleGplA6L7hcBZgWD+GDei7saBZMjW+537T
	K/2UhXviKe6yGmNo7MSir9rAOYqIT6dztjdWzVvon9v59uVXmBvsjM9kUJn1VATpoH8g
	wTzln61vBJ5cAstGUDLjSZzSz7PcIUN/GB1AgZIj18T/xymZ5Awa1tHh3xJGQrzxYsLd
	MGEw+Zm6ZSHD37QGz4XZwo3U97Wfyo6Vtz4ZTW9MdgPIyLjYn/XAJiNp7m0nk7PDEpcB
	JSBg==
X-Gm-Message-State: ALoCoQkmAJR/cN2TWv4eXc8zrXKCXFwOk6yFVHuHCaw/yNNnsbZnbS/pAYZB/05L6SPcI7VmGxQw
X-Received: by 10.224.38.10 with SMTP id z10mr20325727qad.52.1409933646235;
	Fri, 05 Sep 2014 09:14:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Fri, 5 Sep 2014 09:13:46 -0700 (PDT)
In-Reply-To: <5409C186.8050200@topic.nl>
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
	<CAJTo0LYhvZHJEEQLWuCsfxqqbBCSXnxR3cxJZJt2Z0fgYgwEww@mail.gmail.com>
	<CALbNGRRVvT7Qv868RNWbo8_DjLwkbUjOH_cCNMjPNifFEcHu3g@mail.gmail.com>
	<5409C186.8050200@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Sep 2014 17:13:46 +0100
Message-ID: <CAJTo0LadRYbxRJHPMeyNymTJpAwF-OYWzsOk6Ov7ifY-+Td7pQ@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Style issue for recipes
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
X-List-Received-Date: Fri, 05 Sep 2014 16:14:07 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2014 14:58, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> Why not take it one step further and remove the version from the bb
> filename? Only use the "versioned" filename if there actually is more than
> one version.

I wonder what happens if there are multiple layers in place that all
have a foo.bb with different PVs set inside them.  Do they overlay as
they share the same name, or correctly as if the version was in the
filename?

Ross

