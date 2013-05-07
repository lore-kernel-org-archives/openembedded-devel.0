Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UZilk-0003jd-Uj
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 May 2013 16:21:56 +0200
Received: by mail-vc0-f179.google.com with SMTP id hz10so523947vcb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 07:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=5A3Z3mraJ7TQtkGE7knH4lKD17O0xSEwzH1s9c+l71c=;
	b=lsdr1U7PREAPc1jGrJofLTAp2uzwC9/tO1Y0X3ln3DhSa3IT2iSBapC/qAfZA+sgZC
	zlToy9Dw99CGnbryXmBgX1eX1vNTPwOOAdJlWcDEOVl17Qr9ZRNiYvwjr06wfuHCZ/1m
	v3Azb5lNFYPzClnkkb2pv49Ik1rc/rmD39FKCz9nc4GFy32pPoQoZ0YJZB8L942vwxHl
	EFIFw2UvRIKLX97SK1t/b5UU2n2vuenP7bGo4eEF88qfgdqZ8ZFVCbVSVIzwT8EdaMea
	ajsFgGcqDGNsqYjSyYaynzDAwnY1kTBJuobs5m7LhsgABz/rhQlOikUgLla49rnxutzG
	zO+A==
X-Received: by 10.58.207.97 with SMTP id lv1mr1280955vec.39.1367935407619;
	Tue, 07 May 2013 07:03:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 7 May 2013 07:03:07 -0700 (PDT)
In-Reply-To: <5188DC2B.9080909@pseudoterminal.org>
References: <2924564.6VWmlqGvL5@helios> <5182701F.5030605@pseudoterminal.org>
	<1714072.P9NRZQZN5F@helios>
	<969F26A8BAB325438E7EB80D3C3134FB1622BB2A@IRSMSX102.ger.corp.intel.com>
	<5188DC2B.9080909@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 May 2013 15:03:07 +0100
Message-ID: <CAJTo0LZ75KduLU-rTXYUm02fLfcuLk87W1u5SoYEbDC1Fu9umw@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
X-Gm-Message-State: ALoCoQk6lEuejFgGpRbpFVwICVLaXHFam3SEXNiKfxaADOgh/Ak7zFLC2uO5Ryoa78whnejFA9bU
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Please submit your unindexed layers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 14:22:56 -0000
Content-Type: text/plain; charset=UTF-8

On 7 May 2013 11:49, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> * it uses _prepend in various places; I was able to replace all but one of
> them with prefuncs. The remaining one is populate_packages_prepend , and I
> just do not see how this could be turned into a prefunc. (And it is
> necessary to use it, because do_packages_split apparently cannot be used
> anywhere else.)
>   I think prefuncs are cleaner, because they do not modify an existing
> function. Also, if the indentation style changes again someday, prefuncs
> cause less problems than _prepend does.

The preferred way to do this is to use PACKAGESPLITFUNCS, examples in
the systemd and update-rc.d classes.

Ross


