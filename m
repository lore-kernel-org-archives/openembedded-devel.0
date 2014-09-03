Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8694D713DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Sep 2014 10:24:12 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id dc16so3691958qab.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Sep 2014 03:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8gabztxUcRIivA8BZ1UFIkbuFJCe0n1FhHW09mGoudc=;
	b=hTnIa+gk2oQf/sDONjWoJHLyiDrlx7EdV5RoGP8Bb53eKRYhzlPjhN5itOR/FvNwqB
	bFOthpkAd/gb64UkCFkN4pRNkoxzL0l5Rtg5zB1RKNUWfwa/1WrlXI46acO9QlQhr1EM
	sgRIUTGKLbjsliClw5TNCfpD2YkIlnkrvhgWEp20PIwj1oP0qUPCPvobSWcDZMsW8t5C
	Qe/Kl4KLPzeMK0sydUZu+XJ6cuDlBHKDUq7TUCaOTpcv0OllOKK1wcafXAzzXTIZZ4Zy
	ZGrLuJ3s9JIstqnXkEqXPIx/f1y84ZOD3iK9TWeAnHZYV5s0jYZ7ajKlDRiQND2ku5zZ
	4smQ==
X-Gm-Message-State: ALoCoQlABNTkUC9/6UGwY82wi6lkveAeBFOv/FPi+GIh25cnuWUhFSQfARp/IJRyhR2WtGcbs60J
X-Received: by 10.224.79.139 with SMTP id p11mr8580629qak.93.1409739853975;
	Wed, 03 Sep 2014 03:24:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Wed, 3 Sep 2014 03:23:53 -0700 (PDT)
In-Reply-To: <CAJTo0LZCjHOZ_ve_DJDTHN2P6REWFVCWDSbmVouNwPVK1HUkWg@mail.gmail.com>
References: <20140902135015.93AF7504BC@opal.openembedded.org>
	<54067424.8050600@windriver.com>
	<CAJTo0Lbb8uWBKYUTrqvbuo0VEQm=g3uRMv1KPOPi1YNrYL619w@mail.gmail.com>
	<CAJTo0LZCjHOZ_ve_DJDTHN2P6REWFVCWDSbmVouNwPVK1HUkWg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Sep 2014 11:23:53 +0100
Message-ID: <CAJTo0LZWU-Cf8iqHk5jUMzcZ5OE74-1hD=TMg0pX2gyJUucv+A@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [oe-commits] Richard Purdie : package_rpm: Add custom extension support for spec generation.
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
X-List-Received-Date: Wed, 03 Sep 2014 10:24:15 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2014 11:16, Burton, Ross <ross.burton@intel.com> wrote:
> Actually, that patch has a typo in the logic:
>
> +    extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA", True) or "0") == "0"
>
> == "1", surely.

FYI, the patch in master-next has the correct logic.

Ross

