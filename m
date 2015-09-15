Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 22BCE73D13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 11:14:10 +0000 (UTC)
Received: by qgev79 with SMTP id v79so138771312qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 04:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=icKt6eX+Rg2hXY359Gw9gbdb5ltrukDYmmcI3MOi2vw=;
	b=eIKHhICbwQP/72uWO2L/Sn4EPW779r1CzTAsudeQta2kVy83PZTre3AR0q/+3TlPEm
	q95kAJcE6HOylpHvtGPDFOnTNYCJfPYPy1uiKVoZFjVryvnnnX6S04+LaUZ5lMdVHoZC
	GVVAvJ+VXj9sLjKXf/a8gCSxE+DgaNlF3IpYMD1sc67eF21RY+++IllrhcRNRryPLy8a
	/rAug/EFDKn0RwEh4Gfm1om9Hf8/LBcywJU10DXtSAdqd7jsJUtaHr2LVSKdyhlyNbPy
	x0PnfIR6wF7rEXZnJkLVofT/NVfVxISqkA5EdngZv+R13g84BW8vghXj4NJlylrIqrUv
	gurg==
X-Gm-Message-State: ALoCoQltv2UwSsvdsu+HsYxZqLev8R09BLTKTLqVlYgWKTqZgErzO8MlwwmCzZ7tCAyofzdlIpYa
X-Received: by 10.140.93.53 with SMTP id c50mr30208036qge.59.1442315650285;
	Tue, 15 Sep 2015 04:14:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 15 Sep 2015 04:13:50 -0700 (PDT)
In-Reply-To: <55F7EF3A.7020403@topic.nl>
References: <55F7EF3A.7020403@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Sep 2015 12:13:50 +0100
Message-ID: <CAJTo0LZQhC+QjAcNxxUuQpUkfWgXc-rVDohQe-sb8Ch1d57R2g@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: gnome-icon-theme?
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
X-List-Received-Date: Tue, 15 Sep 2015 11:14:11 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2015 at 11:13, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> With current master I get errors like this:
>
> ERROR: Nothing PROVIDES 'gnome-icon-theme' (but
> .../meta-oe/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb DEPENDS on
> or otherwise requires it). Close matches:
>   rodent-icon-theme
>   gnome-themes
>   sato-icon-theme
> ERROR: Required build target 'evince' has no buildable providers.
> Missing or unbuildable dependency chain was: ['evince', 'gnome-icon-theme']
>

Yeah this was just removed from oe-core but the addition to meta-oe hasn't
happened.  I can send a patch now if there isn't one on the list.

Ross

