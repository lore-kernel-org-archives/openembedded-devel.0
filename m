Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1AA60B45
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 18:49:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48Xjbv3dJKz43;
	Wed,  4 Mar 2020 19:49:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583347787;
	bh=mnGmeDFdzDttQkDS1DPpY2+9jGTg/c7E8nIRxBfRwvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gzn5oBdn0sN5MSJTKK0fbViQDGoDk5JXvaaY5c42uRUR8ZbK8S1/c/4Q0KfTEvCfX
	ozzAJGUzbk8IxSmVKvK/3GRGmEgC4WLNANt6s6mRoXdCmftiUr56Fw9pANOep5+MMn
	hFPmxzY26xyF9dNuZxs7+dn44HI3cRjd5wVFmXqi6/Azgz59NG8caGPwO5lIKzdKTI
	+Qu7UWuarLv3k8QC6xJwpgf2HoahTENIq8eG4U+i0O3degVUFooY30+TzZb6XOECYM
	SvzzAQ05TeMnIk7qAs7xo/WfzfH7pjClzm2RaKdmFKoDkRez3KJ0i1cVJ2tEF44oQ7
	bPH7gLWHIYfTiCegYDVxLaxd3Pn8OjSbeHHwC/jLpv40eJNIe3qxPxHhz9zmqb74a8
	5K6IS9Nyfqcsne1Kb5fxlZhtORWouT6gyiD5R2ro7LpFQh7Zzgoefl55EqrHn8xTo2
	sjypNsdKiA4+E6bC4zfiOwby3oQEAcGX8yY+xRBdFx4RoVKbWjK+upTp8cwEf2H+UJ
	o1z/Xayg63JOaRXByTA8eduA8O2Kjan3LnOpg7w6+Snnp0h2Qs+mfMapYI7ew6XSwh
	ReRr8EFcDveJvTa9MGQCE//yfFNfiFtN8JaYj44i/94m8CkswX0yQShFHjHdQRxNgI
	/QQhhYn0vIn4N9ePC1PCu04I=
Date: Wed, 4 Mar 2020 20:49:42 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200304184942.GA7858@localhost>
References: <20200304171927.2068660-1-raj.khem@gmail.com>
	<20200304171927.2068660-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200304171927.2068660-2-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH 2/5] vlc: Depend on gst-1.0 ugly plugins instead of 0.10
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
X-List-Received-Date: Wed, 04 Mar 2020 18:49:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Mar 04, 2020 at 09:19:24AM -0800, Khem Raj wrote:
>...
> -PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base gst-plugins-bad"
> +PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
>...

The subject should say bad, not ugly (ugly is a different set of plugins).

cu
Adrian

