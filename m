Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 05F8471A18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 14:14:41 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id d10so2428439itj.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 06:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DvSZwYR120j5vEk/PikexbqyCoNVwK8WddDuFuKa3Gc=;
	b=uq8h+Y6afen+SikENEddTIm3dHnZ+HFRJ2vO3kedMY+HPs7LM1GSB0hZneeqaTYsqN
	6NO7heirVeqATH+/iqVY0agMdownaDsysJNar1gxjsYlxgoO3ZQP0W30xZwnR1ghgej9
	2s3YWS0rRdD4QVMxWChKlPnt3xEnQ5Blby62brzMFqXmO8tCYmydhFGOFpz6h88UVGLx
	D3IstauV/QQa8E6ySroTYeZW+ERIkLFEnpe1+s1NVDD+0oiVkuyHImbX9e0FTpo2lkXv
	QTuWHI4YZsh5JOmkPtFLwTOqu2vArcWCy4qex17uFaCWOLrrWVvCVHLxuFcUeUqFf06e
	VEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DvSZwYR120j5vEk/PikexbqyCoNVwK8WddDuFuKa3Gc=;
	b=GcnPQgNI1rL46ztrtSqyFXQhsD9HiXqMZ9f+ulmKB0izTkr7DCJ5bhEqUrPzNKMDiF
	qfAknJUZJLLxr+HNUYLMc+7UmcfLAPg9kz4k96oosYwW0mAhaq0YfPFJBwquwukan7K/
	NeontkG8MewpKvmFpUowKNySt/KwDtEg5v7zbP1/q/kaByKynvQe7U5tfxy+nO36aGG+
	l89p/AQuQDGcrfGqwUVzBNbLgQESkrE9ZjQhfkMwHuP0vXXn1sCeXD5ArJqxERWZDAhf
	+u3uPmqMg6MZuphWm7S6ntVwZG3PaPpzmp7clccOo0EmOxI+PQd2PwRUM3nb0zSasBRB
	Mrnw==
X-Gm-Message-State: APf1xPBTC1N/rYxUjng3Ps71dhuJZJ+mHczd+Q8k7uigcErhDBcJwGY4
	+8aelqiGc1q56FDafmtXYHbmbDLsS06yfxOaiwwGoA==
X-Google-Smtp-Source: AG47ELvT3b/bW1nhJFXQ6N8gvOHFf7DtM+CavfdzuZqfhe/uwWyU2uCeckXYcmAZuQ6I0vG/bbrO1JEr7uKa6uzOGNY=
X-Received: by 10.36.82.84 with SMTP id d81mr3382626itb.34.1519222483129; Wed,
	21 Feb 2018 06:14:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Wed, 21 Feb 2018 06:14:21 -0800 (PST)
In-Reply-To: <20180221140252.d4rmbn73c3nzsvac@mentor.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
	<CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
	<CA+chaQfpXBL3=z3QwTKQ6MNBKUVhbMjA6G+nADz562zFuYUTUw@mail.gmail.com>
	<CAAQYJAsOFo6md-ZCRg+KmGQtC9O+pwFzVjpEMOXOFVFWzr4iMw@mail.gmail.com>
	<CA+chaQfcD5n9Gs+Hos26qOqE5D8ch0JwTm+7pn_ZtysPCpHmjw@mail.gmail.com>
	<20180221140252.d4rmbn73c3nzsvac@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Feb 2018 14:14:21 +0000
Message-ID: <CAJTo0LYe1koEr7kJg7RfXLDbZLVa0qQyWiig5Sng_hpRTr_3dw@mail.gmail.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Wed, 21 Feb 2018 14:14:42 -0000
Content-Type: text/plain; charset="UTF-8"

On 21 February 2018 at 14:02, Joe MacDonald <Joe_MacDonald@mentor.com>
wrote:

> Honestly, now that I'm back from my vacation, I think the right thing is
> to add the dependency and then start thinking about a way to specify
> layer dependencies with greater granularity than on a meta-layer basis.
> Like, there's no question meta-networking depends on core.  It's
> nonsense to think of it without that dependency.  But it'd be nice to be
> able to specify a layer dependency that only exists if your project
> includes specific recipes out of that layer.
>
> But that kind of mechanism seems highly prone to breakage and likely to
> be highly contentious even if it was shown to be reliable, so it may not
> get beyond a "that'd be nice" thing for me.
>
> Unless someone else has already implemented it and I'm just not aware of
> how to use it?  :-)
>

meta-freescale (iirc) does this, conditionally adds sub-layers to BBLAYERS
based on what other layers are already enabled.

Ross

