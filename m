Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0D890745C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 14:43:16 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id i5-v6so6108162oth.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 07:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=edNh078x4KLeKz9fRaM3Uoc9OMwoO72GIzF3DZuj1zc=;
	b=FlPVz7nsJSRYBNmlXR8tZmv8yLcVn0wyEeC+efmZJUYETc5u4w+3gfj6D1YoKNdjWt
	mTeKk6hqH8tyT/u6I4xWQ8Q/ia9aUEIIYhcwqIgbFrRFFzGPZQr3QvKE3WKlDCeX9or7
	qNGqnVPQA37k1L7xCpNsopVtNIbUh+3FzvPOIN2SaH48AKrPlPOBYMfdNMKh3ILsS2Vz
	pVoRTFKsOyWyIwxbTVPDwrjTFRD3V1CoL3CgF8tAGfOdVG9tHfe838jXgm//NbeNkSBK
	0ljnWRJVs3UCENAVxrRfbANGow68FjVKvm08Uq0fJtLGURgOXKD19ZGnXPXmHaRjaJwM
	zSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=edNh078x4KLeKz9fRaM3Uoc9OMwoO72GIzF3DZuj1zc=;
	b=uOwCf5xd0Rs5FtdNXdspY52tk5GMuFkzQrapFLZP1vz/N6BZa5VU+wzHIHcCVFQRx4
	lCjeBbO9pbnfeRQrpMisMzh4zvik1Kr0EH7a0nl4wZ0wStfUnPLE9lUR6dXu3g6T4dv7
	Pyz5d+AkSQpKFCEs7ol4oIynLwS6a9NGsSSwmAmzTwsUyF/CFRu6++FKPw1OHVGAVRoR
	Ehul/GGh3aXXZDQUcJ4e5r5HI8FIS5TVu5PYdAlW3YbflFRxtlnlSgmyEQzkGQPz05pq
	JGDjrIGJpglyZ8W+e9kCTLEc3BPQJbK+TdjtQWD6V0SoHuY6R/dm1LiLW/CsVJfLPDhm
	oZdA==
X-Gm-Message-State: ALQs6tBPxkzvY49/2DhtG5ymgk7kCgeD+OKpGrz6OZlnuJyOoWvJzVm1
	FikbqoeEdEqKCRwmGkgFgLplAj/cxRVwIPHNtl6bdw==
X-Google-Smtp-Source: AIpwx4+Gyg/LL1n7S8uwsyFXK0CJqCIs0SuDyy5fx4vqjxvuWUv9izYuk86KrbIBCAk+O02vSoY4uoCcJ/4Ht8gr5IA=
X-Received: by 2002:a9d:1850:: with SMTP id
	t16-v6mr4481953ott.300.1524148997949; 
	Thu, 19 Apr 2018 07:43:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Thu, 19 Apr 2018 07:42:57 -0700 (PDT)
In-Reply-To: <20180419141737.21053-1-costamagnagianfranco@yahoo.it>
References: <20180419141737.21053-1-costamagnagianfranco@yahoo.it>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Apr 2018 15:42:57 +0100
Message-ID: <CAJTo0LbNGfDv5cNtMWFRrnfF37mtj6oPDcE2n443SiPfkLGDQA@mail.gmail.com>
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] websocketpp: add new recipe based on Debian packaging
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
X-List-Received-Date: Thu, 19 Apr 2018 14:43:17 -0000
Content-Type: text/plain; charset="UTF-8"

On 19 April 2018 at 15:17, Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
> +FILES_${PN}-dev += "${libdir}/cmake"

cmake.bbclass does this:

FILES_${PN}-dev += "${libdir}/cmake ${datadir}/cmake"

So this is not required.

Ross

