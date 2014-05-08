Return-Path: <ross.burton@intel.com>
X-Greylist: delayed 1546 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 May 2014 15:14:45 UTC
Received: from mail-qc0-f172.google.com (unknown [209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3530A65FCD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 May 2014 15:14:45 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id l6so3089823qcy.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 May 2014 08:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=p5DvWiIJP80S/aTlrBnCTkJmnziECUjzdJsVCFjIPqE=;
	b=LmcFO610c0JpnDTKyc6XUwBMKXBuSZ+Zg4cDH+yKJJor+1z5sxotAE2uAj3rHsfZdB
	l6AMwAmvnd+SwOf04NQ1liyhZ/v4VXUh3cWy9eBKO2vPtDSJIjBrhBz57J8FfcEILiZL
	KDi2il3mI6+OSQct5WdXuOggxhV3JRFOeYMBhC3Vh+KtOGL9S3Pfi0u3a6yXZeUChXPc
	T11t594QNYfgMYY7ajNvvoQrBCvDcGQvpezsUzijbiE8Ijr8t0eIlThj+kKSPTpxxcvW
	LSkCT4WeJDNzHn06n6EHFY9EgEws0CQfAuDcs8sijpnayoTf4oFz0lIywpVt6/ZzC8k8
	6r+Q==
X-Gm-Message-State: ALoCoQl1F+0X1f50Tsyyau9RmoNdvC8U/uBQaICvmVVTqUWp7YSgLPGzy4aWIw0OerQ0lOQNGVUe
X-Received: by 10.140.28.3 with SMTP id 3mr5476775qgy.71.1399562086422; Thu,
	08 May 2014 08:14:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Thu, 8 May 2014 08:14:26 -0700 (PDT)
In-Reply-To: <4880759.hcBN3hRDv1@peggleto-mobl5.ger.corp.intel.com>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
	<4880759.hcBN3hRDv1@peggleto-mobl5.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 May 2014 16:14:26 +0100
Message-ID: <CAJTo0LbxkJxeqThO1EYGv0Gb-KQcYaC+od_JAa-2c8bzEsogXA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] GStreamer 0.10's future
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
X-List-Received-Date: Thu, 08 May 2014 15:14:46 -0000
Content-Type: text/plain; charset=UTF-8

On 8 May 2014 16:07, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> The next question is does that mean for the "old" libav (which gst-ffmpeg
> depends upon), do we move that as well or drop it?

If gst-ffmpeg is the sole consumer, then certainly yes.

Ross

