Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7747860088
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Jul 2016 15:41:38 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id v199so57717116wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jul 2016 08:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=MUzhqiSpPzZsVEcE6yjyBQ3xFWdR2hkvt7PH7C6XUr4=;
	b=CdLqRoMMjwUjrNRAfPzYr5oQFw8oSYbVRV9ad17j/djX5sq5KJeG9fuTD1QBs0SPyq
	5Hv5wXfyDDZlc8toCU7vrIP/AJOI/33oS+SGjKINL1sY13xXvK6aBajqkg4FaJaIlbCe
	1Dji2uYcdTUfhOSJ3CUHFFsYdQZRj3Art0t0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=MUzhqiSpPzZsVEcE6yjyBQ3xFWdR2hkvt7PH7C6XUr4=;
	b=WB4Hw9ssk9G3+L9XmDbTMJ0EiHG9A+UKRC4FRQiGz2bnZcrBkm9XnAT4+X2cw7h+TG
	tnDclvWQ+a+quY7VmmJIPgudGNEFt3mlsV9xng2DzBQgkNryKQ5uxNpZGjtwFzJoFr/2
	p4ow+Cq8VPfnxaFRHim65NCuSvmZV46Ayz/did7hhBg+VH05UGmfkj4+b4xheOZQJjvD
	oMXsGJiUStE8lYAun+0YYdNkXzpl30DhcyjfOHf2MwlpGkH1IrjfOl/bn5Lj1rzE/Efu
	yGc0wmLVyRxLv/8rClP7VDxjJSd4XrucXAbydD9m3ThwvQ9oYSBilwL/xTzoow76oZCC
	rmLA==
X-Gm-Message-State: ALyK8tKbwpckO5ibOwBcLdz76UQewNd14SAWnjIvelXvfDelZ2mRdgShWIt0aml7VQ3ce/u2mJq+Swad0Qge4vT0
X-Received: by 10.194.157.162 with SMTP id wn2mr3482471wjb.103.1467474099010; 
	Sat, 02 Jul 2016 08:41:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.179.65 with HTTP; Sat, 2 Jul 2016 08:41:38 -0700 (PDT)
In-Reply-To: <20160701051457.20909-1-raj.khem@gmail.com>
References: <20160701051457.20909-1-raj.khem@gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Sat, 2 Jul 2016 18:41:38 +0300
Message-ID: <CAGNsrLAET5WkH9MkfqqTAE+=x0kRgNt1QBXimzeUywag_MTQMw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] android-tools: Fix, enhance and move from meta-shr
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
X-List-Received-Date: Sat, 02 Jul 2016 15:41:39 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 1 July 2016 at 08:14, Khem Raj <raj.khem@gmail.com> wrote:
> android tools offer filsystem tools for creating sparse
> images, so package them in package of its own.

fwiw, I plan to rework android-tools recipes for:
https://bugs.linaro.org/show_bug.cgi?id=2179

It's currently based on Ubuntu package, forked for Ubuntu phone.
I've updated Debian package built from AOSP source and up-to-date.
I've dropped the ubuntu-ism which will never be upstreamed.

The plan is to be closer to the upstream AOSP source code and be able
to update the recipe regularly.

Obviously, it doesn't prevent to get current recipe moved to meta-oe.
It's just a heads up :)

Cheers,
Fathi

