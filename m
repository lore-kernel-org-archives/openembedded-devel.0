Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id DBA80745CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 10:56:31 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id q4-v6so677381ite.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 03:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ORcaut04GFrDG2AslEGZ8hSJfw6bw7GDK89YEhBFDcI=;
	b=nHaXfROkA8WDhoCftrR8z/hCi/aI8euapNU5j+UqQH110YXY1HkD6uirfoio4z/I8P
	eRt3hc0eb7xY6DJ+RBKYiEeo+hTg9GV4UCS8+o5txFv6VwFVeQlPMwZmX4DwNClT7O9L
	IPsJ+EILXVtpDZTvd1FFpPHK0RTQmissV5sjndsKe9jMWZsgWYhxxk13MiRwK5/Zd/a5
	EZe+qcE8aGIq6DprXR/m7FrXNXKEbnNVykwtWVwvb4jH0Isw+moa7T5LX26R0haLX3SV
	LXljr22fKnRgcEhmJjl1FrSdoO/9GBy9H5hIkyMlfZCBBi5e48YcczxCzIMXv3ujYpmH
	PNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ORcaut04GFrDG2AslEGZ8hSJfw6bw7GDK89YEhBFDcI=;
	b=R8Cv2Q4WSWz5IADmn28KBsdNxiXI04LAC2INTWJVF+TkUB1m2xnB3qE8mRhQEja6l6
	lheWeFDbJEJT0I41dcCAQaTfvdNQVmVvwL+NMqnPSG63fs6+hZylsn9XgMyLDxv0cBYp
	T1Pp3ddQE2Yhtub0jv41FajYTmVcLDPd9lCkSMByFgJSLqpZ4NLDQLE/O5ujioG0Z8Ai
	oNpz5RtTiExQoGh5JRSCrepdPfDxThXbZBfOIMF4pxWd+A00cilZzW0J3fcnVUt5Q42u
	0a5xxLUewYFMyLeQ7vTpMMCEYkNhFFnvYVsL8Sojx0LB76Y7GGxPVzo2cigAIqybkGSa
	PjRw==
X-Gm-Message-State: ALKqPwdrSMDCfXoF5r6oVfM/Yl4ekK8NeHMEMQawpntBfYnAYXzyqfLe
	fThPL/tA7j5usYyHg2mPb4tLdpWnkndaY76vXCYiRQ==
X-Google-Smtp-Source: AB8JxZqGeWMxKDFhgIPvb3LHIg6lZd6B28KZ/rwae3jYq0m/wXVcRLdFUyZSuEHx0ykGglL3WoZsvmNiYUZcyfpnCts=
X-Received: by 2002:a24:496:: with SMTP id 144-v6mr303262itb.131.1526468192644;
	Wed, 16 May 2018 03:56:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Wed, 16 May 2018 03:56:12 -0700 (PDT)
In-Reply-To: <CAJTo0LbXJrAgEnS53LDjxtnGrwNxgLog_KOxUaoXa+4vb5d1xA@mail.gmail.com>
References: <20180503094308.7549-1-mac@mcrowe.com>
	<20180504183725.22134-1-mac@mcrowe.com>
	<CAJTo0LZ2G_4cMxoAQm2AWgRnkeP5VXRURH9c82qaBpA0bop59A@mail.gmail.com>
	<1526464403.32156.13.camel@andred.net>
	<CAJTo0LbXJrAgEnS53LDjxtnGrwNxgLog_KOxUaoXa+4vb5d1xA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 May 2018 11:56:12 +0100
Message-ID: <CAJTo0LYVJAoPvTrcjzurDqSCFuJrHO4V2i21cUdD=WUQc5Ymrg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Mike Crowe <mac@mcrowe.com>
Subject: Re: [meta-java][PATCHv2] jdepend: Retrieve source from Git rather than tarball
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
X-List-Received-Date: Wed, 16 May 2018 10:56:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 16 May 2018 at 11:52, Burton, Ross <ross.burton@intel.com> wrote:
> On 16 May 2018 at 10:53, Andr=C3=A9 Draszik <git@andred.net> wrote:
>> Would it be useful to add a check to patchreview.py (or elsewhere?) to
>> reject patches that contain references to github archive URLs in the rec=
ipe?
>
> patchtest.  Yes, it would!

Bug files: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12752

If anyone wants to explore patchtest, this is a good starting point.

Ross

