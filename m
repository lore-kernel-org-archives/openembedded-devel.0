Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2223977E4D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 22:21:31 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id t189so1967436wmt.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Apr 2017 15:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TFe0CWkuMqmqHW6p9AKP22ccdSVSGbtCbk6WWRKFFQM=;
	b=FJNZzFPzNAytXK05ZUTQtzuCwbvigpC5XET86DIEMNR00nBQiuZxt3xCb8wEBNOMMK
	YTcePIuDiAqnxmt2Svpircfkl8iQslFBtDTRb9U0nz4patHUzgRR1AtOUXIsQqPlARRp
	+vacX8kwf/awShiHGyj3AMnNUV2hQ3n3RsbMskby63rL6yQruWAKXcJ3QTrF9xx+dSUH
	echeFGusG+bfKhrVhQSIesfU9lmD0iXDy+zwWx/EDX+e2qq3COg4V25/QO40EA+Ggljj
	AiVYijZ6qklOFdS1SYzB7gYEiTNYKAeSZnaPHsmZPEkBIANsij6d4qgt16k2OosTvbXn
	uiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TFe0CWkuMqmqHW6p9AKP22ccdSVSGbtCbk6WWRKFFQM=;
	b=tM0hY74aJ9fHE9mjNLOnhQLzCdNb0jCrTxHOSfEh+btW2nVA9Nas67vUPsLtm1fGVc
	GAfTRvwc5kOEj4kFBS9AGzNC3jBNGdZrZJ8oRS9Zl16M3xvs1G08tYUTkEgOeUbYW/G3
	ne6ax4va+Q1lO0eyfxdwgBUBAj0gaNCgbMyWLpwUM8eeha3o1DlnybL0G2d4qZR/MSwx
	vocuSTPlNJNADlPVSj9p8yBtU9CJpNdwm4kAc0yEJRAY4fKDg10bERGe0/RrSZJWGfU4
	XTZpZtpdMlU4ywm/zO9iMZo4zYdPN0mVYv5zRR4AR7tXywRGVUGxeAUGJC+5qTGURTj2
	093A==
X-Gm-Message-State: AN3rC/52o6iyqptkQUno2thxwq0tB4Rc26nCTGC4VtKvPwKVDvM70oGzVw6GWyQuYGZXWRtLKDqvPCxX9sVE7w==
X-Received: by 10.28.125.14 with SMTP id y14mr1114259wmc.101.1491603692368;
	Fri, 07 Apr 2017 15:21:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Fri, 7 Apr 2017 15:21:01 -0700 (PDT)
In-Reply-To: <20170407174249.GC3022@jama>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170331164247.5052-13-raj.khem@gmail.com>
	<20170407174249.GC3022@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Apr 2017 15:21:01 -0700
Message-ID: <CAMKF1sqxFob2R_2HAYTi=zE2k+HzyiUW7P7CP72mFOmO1Cnuqg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 13/43] poco: Upgrade to 1.7.8
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
X-List-Received-Date: Fri, 07 Apr 2017 22:21:33 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 7, 2017 at 10:42 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> WARNING: poco-1.7.8-r0 do_package: poco-1.7.8 was registered as shlib
> provider for libCppUnit.so.1, changing it to poco-cppunit-1.7.8 because
> it was built later

actually poco should not build a shared object at all since that
should come from cppunit recipe.

