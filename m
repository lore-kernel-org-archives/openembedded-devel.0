Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1FF2565E1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 09:13:56 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id bm13so88359qab.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 01:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=enSEc5sUV8YMFQ64iXINpLAa4kTfVCzi+qKkyqjjG9I=;
	b=LpI8XXt6hiFa+jPBYHNAq+hrse4YbfsM2esV6/H7ofLWyTT8a9r8LjmwR6GgAPtt9w
	dtUY6Lod0m0RvV/DkIKrmbx91cGumYsfkYExq8JtejNSohyt/kNH94QKvUwNNflQ3nRQ
	sWumwmQxr/1KGXQvUMY/3O30nE+XjpUCQqEKJs6vaJDpRp9GybwfclA4M4hlOJ+59i/v
	5QlXAmsyaKA5JhR2lGcMOorIjmv1DziqyXeD/OOZ+L7kMvajjssGj2KAXIbU96JtvOIZ
	HG4lxatjN6UIVrN+LL3zM7awVfGbNVbu4uOb99K6z2yxddYwe+R0CKn4oiBbKu76G4Oz
	JUTQ==
X-Gm-Message-State: ALoCoQmVRayXshzox1ISNhhQ7U7XIPJ8b0of4x9OuQ0/KKtzxGSmDDzJg2/y4sJJaQkbFzoJuYFz
X-Received: by 10.224.138.2 with SMTP id y2mr35898270qat.52.1416906836885;
	Tue, 25 Nov 2014 01:13:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Tue, 25 Nov 2014 01:13:36 -0800 (PST)
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC73DDB681@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
	<1416811526-54855-5-git-send-email-biannm@cn.fujitsu.com>
	<CAJTo0LZeC5tu7fQcKFEhuHVvPjx77V8NwOwTtP9GqFVKDvtG-A@mail.gmail.com>
	<30DC4EDFD798C94083F3E083754532CC73DDB681@G08CNEXMBPEKD02.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Nov 2014 09:13:36 +0000
Message-ID: <CAJTo0LZ86QxZgsugoDPuJ-Rjim3V03eFGE0=7VSoJkj6eKi_9g@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 4/6] [meta-oe] printproto: Port printproto from openembedded
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
X-List-Received-Date: Tue, 25 Nov 2014 09:14:03 -0000
Content-Type: text/plain; charset=UTF-8

On 25 November 2014 at 01:14, Bian, Naimeng <biannm@cn.fujitsu.com> wrote:

> No, I don't have a plan to add every recipe from oe-classic. ^_^
> These recipes just used by our distro.
> It looks like we should change our specification.
>

Sending in recipes that you've ported is much appreciated, but in this case
as all of these X recipes are not used by any X servers available in OE you
keep them locally.  In all honesty unless you're using an old X server
they're not needed anyway.

Ross

