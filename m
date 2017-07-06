Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8AA6B77809
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jul 2017 15:30:21 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id i2so5233195qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jul 2017 08:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YkSjmSbZkr7YnsU+hKwFeShtzAdLZt3Z0KpLh5LaBqQ=;
	b=pdqCSVgf/qvJb69W1IkADkBpi7oFKUrcgxV/VNFPVjtFQa8/F2jSBHd2eiGCBZ+Vuz
	EBt/VbMv92bqs9S2imLmSEy4LI8jaqS26omOc0uE5OL+KcJBIVYM6GR8rbNgTq+WiOvh
	vWTmCkpzhQsunupZgkbhFqWs7BdKOhRVYNLB/c1oWYcQTcRLwsJ4tTlChSPQLsTQy8Tv
	Xn1GLDVIrnFdKFOeOCv5E626aXbxlo4FQtnfwNNvoZiuEqKPMDd3OLHhH3ghtX4c/za8
	KxiRpY/gw5M5xCJ9o+KfObv28nN3MD01691R46EcQI8/wc6woHUQX1ZQKdHo/r/1DfpZ
	XMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YkSjmSbZkr7YnsU+hKwFeShtzAdLZt3Z0KpLh5LaBqQ=;
	b=p3fvf+68RFgnCEQA8VN2EDTa5ixwjEChDH/m1pL3UXv/l+npDiUslUuv4XrIHSoQI3
	z69ZgvdE1pthBclpyNIGQSSB++Orykzz9Xelsf/r+aFcvIaSSbzaKGk/x1ZXrF1LUUms
	muosx7DCHsB7WtBhw3eFzCuAXzRjOKrpsNc6CoVTEdCX9jwPZcRyZZJP/gNxyIVGFd9N
	E7B/DN7DkE7c6Dndl3s28/WiE/tQrrVvD1Lmpr1pdrorUuWmW48pwR8RvbGpjDAKwOiN
	CildCfRwMoziF+evJ3y2T4aGp+8zFqSPYzL1Uem1IzbrMcUVEcxobTnsU6Qt6ep73XBA
	xBUw==
X-Gm-Message-State: AKS2vOxbdn28thGOwKs/MDHTVAunLsKPfcXSwth2d0IG4dgkK6KoRcrt
	KrB6Mr0W8SG0ybhy1XXbL58LZRpYksCK
X-Received: by 10.237.41.225 with SMTP id o88mr62481622qtd.27.1499355020957;
	Thu, 06 Jul 2017 08:30:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Thu, 6 Jul 2017 08:30:00 -0700 (PDT)
In-Reply-To: <20170705081133.6496-1-kai.kang@windriver.com>
References: <20170705081133.6496-1-kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Jul 2017 16:30:00 +0100
Message-ID: <CAJTo0LZrjeVU+Dz6qZBX-6VGdXVP3yxhXoEj=W1wrswCXBYzMA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/10] Fix compile errors if distro feature openssl-no-weak-ciphers exists
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
X-List-Received-Date: Thu, 06 Jul 2017 15:30:22 -0000
Content-Type: text/plain; charset="UTF-8"

On 5 July 2017 at 09:11, <kai.kang@windriver.com> wrote:

> Patches to add distro feature openssl-no-weak-ciphers have been sent to
> oe-core.
>

FWIW I'm still not very keen on a distro feature for this.

Ross

