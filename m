Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3057770249
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 00:36:37 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id x19so3822791ier.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 17:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=2vkmU76TvdyO62L0GwZIbN6yv3MWKg0JyR/xlraRVPo=;
	b=RVQXJjJznOj0MmjXHOe3K/YD8yGwKPWSE8Os7SYp6AyG2lgtSkv9JRFC1VpeqeKD/1
	yZF/6sWShf8MnMzEKEuUwqCfQ5EVWfNLkgfxs0jOHWvDoUuZ4yiLxSWGHQVI4WRAij3g
	/Q7CjyBD82sc37ZiUeILmYTTPquHYNoBMtjTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=2vkmU76TvdyO62L0GwZIbN6yv3MWKg0JyR/xlraRVPo=;
	b=L4H+6+pyDaL8tQPpRKkyxu1D13kJ45E4sTGtiJiBSF4/04reBKBD/dmvc1J/hQJzi7
	CFjkZJ1wMJbktCZFeTxkYVfhYtVLGcU+OdVdOlTEKa1sF06aTm9tmG8rnp8dCiMnG2J6
	Gg0oUAbPR3ZTa+LurU3f81oy/E2UtRt8FBCHHAhpGZ/wWedff2MD6+Ug16Mz9Z44xvq4
	86TOGTLitJx3UlIVma2gZUYxsZUuOyI1c8JhC+PxJonc3BQQASpbO2RGf/lw2OuMIvaR
	ab3rt3XFCw8a+JPXl37KUXPuBf3UsmqQQFQk6cpZA5OqGNU9ZyrDuyKJ6z3QyaUaNfcm
	e/Ww==
X-Gm-Message-State: ALoCoQkgjU6aadN8RcwFlhG4ksHXH9B+wBt80j3uJaO0vF58v3WFm1AnwvBYplk1LgiNk2tR7MOU
MIME-Version: 1.0
X-Received: by 10.50.136.135 with SMTP id qa7mr1771961igb.21.1405384598946;
	Mon, 14 Jul 2014 17:36:38 -0700 (PDT)
Received: by 10.50.225.73 with HTTP; Mon, 14 Jul 2014 17:36:38 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407141919070.5707@localhost>
References: <alpine.LFD.2.11.1407141457150.14590@localhost>
	<CA+gsK-p7rV+HmdcskYkU0MYRn1zesYDgOUb4raVcj6_xW9x_ag@mail.gmail.com>
	<alpine.LFD.2.11.1407141919070.5707@localhost>
Date: Mon, 14 Jul 2014 17:36:38 -0700
Message-ID: <CA+gsK-rJHEnF_KmNFmq_1KqW7wfLBnMLpKWpFBeQYvAHFZM_cg@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: defining FEATURE_PACKAGES_* in core-image.bbclass vs image.bbclass
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
X-List-Received-Date: Tue, 15 Jul 2014 00:36:44 -0000
Content-Type: text/plain; charset=UTF-8

>
>
>   is there something special about hwcodecs that suggests it should
> stay in core-image rather than moving to image as well? i'm just
> trying to understand the rationale.
>
>
Not necessarily. But I would consider them extended features and they
belong into core-image in my opinion. Not all embedded systems need them.
Many don't have video or audio support. I would even suggest to move splash
to core-image. If a device does not have video there is not reason for a
splash screen.

I consider debug-tweaks, package-management, and readonly-rootfs the basic
image features to be in image.

:rjs

