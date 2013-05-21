Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3D52A6148D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 09:46:03 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id ht10so260459vcb.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 02:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=byFUyYshOf9XV4Y/kbqnuBqMzbhT05LMoPaQj9u7UMk=;
	b=nzGgtIZgBXxt1FFf2EQjvR/sI0ZllaHl384OhaN/Ka3y3GSXQmFfR4xR+8NP/m26H1
	LYCqlc0/z7BDanmTg05JFYGlAFLlaMRZHjtEmnQXGKLZKDRtUMw9MtdTQJ/+5E8rFHlh
	OPENB1qXRd84oSsGnEvRUHnPeQCCawxA5RRTxOFIwbK6OfBDTsFymIt8r7KMiZhfxVGG
	B5KMDvb05E3gTfPLfmiHqUxi30QOZMjzajsmJb5b1dwYfOi5aPUpok76aOmzaUSmxmR5
	HRAsPQ3akZmF+kCg20ffk3vCI1GtW6ARRiGf7G7pyiMN+pr0mRmlOyti/2je/wMhOFel
	ARHg==
X-Received: by 10.220.248.137 with SMTP id mg9mr563915vcb.38.1369129563711;
	Tue, 21 May 2013 02:46:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Tue, 21 May 2013 02:45:43 -0700 (PDT)
In-Reply-To: <519A68E8.9080503@pseudoterminal.org>
References: <519A68E8.9080503@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 May 2013 10:45:43 +0100
Message-ID: <CAJTo0LaYF2oHHH=Pgz1kqbLyM1D-Q4AVg5O0ChCwU_wwD_J8+w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnV3WDDGF4NoK/063VZpBqDuTMQEOQTINC9VNNi3yzqe/wZ9buaxHto8bAkci3dYUeBYsI9
Subject: Re: Error message about multiple EGL / GLES providers
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
X-List-Received-Date: Tue, 21 May 2013 09:46:03 -0000
Content-Type: text/plain; charset=UTF-8

On 20 May 2013 19:18, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> I am currently adapting the cubox layer for dylan, and get these errors:
>
> ERROR: Multiple .bb files are due to be built which each provide
> virtual/libgles1
> ERROR: Multiple .bb files are due to be built which each provide
> virtual/libgles2
> ERROR: Multiple .bb files are due to be built which each provide virtual/egl

What are the bb files that are being build?  I'm guessing mesa and
marvell-libgfx, but can you confirm this?  If you use depexp you can
find out what's pulling in mesa, but it's generally mesa-demos.  This
depends on virtual/libgl that you're not providing, so it will pull in
Mesa.

If you don't have any support for "big" GL then the easiest fix is to
take the recent patches to mesa-demos in master that let you turn off
GL using PACKAGECONFIG options.

Ross

