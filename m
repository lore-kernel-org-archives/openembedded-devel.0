Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id CB5D1738FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 15:48:10 +0000 (UTC)
Received: by qgeg89 with SMTP id g89so20492436qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2015 08:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=4zAvJqxzlP5645JSW0/DQwhxHONY688UjoDIVe7DPpQ=;
	b=d7WEP1y2i0Hif8mdxt3ukUVrnGmC4xaZXGdEr01FqszAb6fNB8rZaXDfrSs2Md/Xrf
	Q1ijEUxlk1AMYNlo/td4xbWlps2e0cNIAlUh2UP19twA7uIApSf8ThPI0PVioxDIeQiI
	QKbDax4ltchbh1I/NcOmCqcNk/lZX16nwl8jwVG8jBrAFi4HZl0QHyl68OMgbI84K9xN
	Oh1ZbhVTpAKYvEu4CLeu5ylAfimiYFZQKnqX0VB9SrODu6ZR48eNdJM3isBJfQG9m41e
	4rpHItJHM0TwRxVDRoCDu9S/AE5WxcnSje7J6kCwRmL+nfqvYGsQoNsD/ELevI0tpq+w
	ddDw==
X-Gm-Message-State: ALoCoQlePL7pHJo2P9FsJEltm91Q9bmvSDOZV4hW2ogUr0PgExk4SnLbQBzqmIaZETDr9ojR6ReW
X-Received: by 10.140.196.129 with SMTP id r123mr36580244qha.93.1435765690172; 
	Wed, 01 Jul 2015 08:48:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 1 Jul 2015 08:47:50 -0700 (PDT)
In-Reply-To: <5593F569.2080008@mlbassoc.com>
References: <1435697730-12800-1-git-send-email-gary@mlbassoc.com>
	<5593A340.8030507@windriver.com> <5593F569.2080008@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Jul 2015 16:47:50 +0100
Message-ID: <CAJTo0LZVwcE2JHe5CAaaXHHKKMPJdWqC2Tw_OTQfaza_2DTcCQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser][PATCH v2] chromium: List all PACKAGECONFIG settings to avoid warning
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
X-List-Received-Date: Wed, 01 Jul 2015 15:48:11 -0000
Content-Type: text/plain; charset=UTF-8

On 1 July 2015 at 15:12, Gary Thomas <gary@mlbassoc.com> wrote:

> No, it's much better to use the standard mechanism (PACKAGECONFIG) rather
> than making up something special for this recipe.  The patch is needed only
> to suppress warnings about how it's being used.
>

I kinda of agree with Robert here - the standard method isn't being used,
but the variable is being used.

As the chromium recipe doesn't inherit autotools EXTRA_OECONF will only be
set by the PACKAGECONFIG handler, so it would be an improvement if the
enable/disable arguments were specified as usual in the flags and then
EXTRA_OEGYP just included EXTRA_OECONF.  (untested but might work, cmake
recipes certainly did this)

Ross

