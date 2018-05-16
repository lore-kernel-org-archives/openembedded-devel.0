Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id E8FD6745BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 10:53:01 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id p3-v6so680339itc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 03:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PhXOsqD9xDMYkTicFTmTJ2yvMZf9c47PCfjzphh0jaM=;
	b=rSofICew1CgKOvp0R5hS7CdhCJGrqhJWiroxHcpWkD+/wKnAIK4iWdqVyroK7dL+J8
	CWlJOTmjNp86xcRirQ8we+jH1aBHGjnAuQdqqp9z5znLiT6O+Iv8VOtfx+u12M8R50Tp
	1RkZ9iPcm+KqtkzzdvibuUSLi3Vef5yN80GjkQEuLBURitBkSOV+fuu9zIC8y/0+CtUe
	kv8O9fwBTVWReT3JAov6KfeftUbLvx6EnWvuSFW71V7782QP7kEa/Q5/tTN40olTzjGF
	UF3hJEwAuSJHd6F7SFPt7bPiMq6OYkF7ZnpoZI7eZm+waXDSJSey9gCEf3KJPymmxfgh
	cBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PhXOsqD9xDMYkTicFTmTJ2yvMZf9c47PCfjzphh0jaM=;
	b=Qn1TYxmA2iMo+5zVnmXvxM8/ocWaUvMguq/Ukjxevhe2U3xxm7Ej6WSutnq1J9UDR9
	kJZHBKmg0BDQ64nfdoIXNOqw4rBLwYFnK2tQ8lsTtcyrsbRpQuniMKcDA7LGmYqgu0iP
	txT7JhXZ8LopncRKDWEEAwTolMVcJOYDFN7nIxs0hPJ4fwxo+EmOKgSCdfA+bFczyfPQ
	TA521Lo95bgagIDTDy3Sl8HnExm4HZ11Rk5BTLcL4hxJT8iOKdnTz41Ng8ohHMbg3bgW
	2/D2IGL2FBqDoqPjAkcFTGMLtphRfxqxlB4fn1CA1BLKElfrXmNXehQnLRMJx6jlpGX3
	AA/A==
X-Gm-Message-State: ALKqPwejGrd6aBHSCLo5bw+YlPi0K9E5KSJiEEVNjqUke2dPEJ6ug85W
	XDvCFtjDbPWrVLUO+Ru05DO2cCZiPiuXk51MHUI+/g==
X-Google-Smtp-Source: AB8JxZo5qqJWA994hQGttN/Rldmsj/A1VwB6O/SpG5U3QnlRrAIZxJ8WN4an2b9c1Ig9OlGI4Ltf3r/y99y1CWTGS6Q=
X-Received: by 2002:a24:d2c4:: with SMTP id
	z187-v6mr364422itf.60.1526467982605; 
	Wed, 16 May 2018 03:53:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Wed, 16 May 2018 03:52:42 -0700 (PDT)
In-Reply-To: <1526464403.32156.13.camel@andred.net>
References: <20180503094308.7549-1-mac@mcrowe.com>
	<20180504183725.22134-1-mac@mcrowe.com>
	<CAJTo0LZ2G_4cMxoAQm2AWgRnkeP5VXRURH9c82qaBpA0bop59A@mail.gmail.com>
	<1526464403.32156.13.camel@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 May 2018 11:52:42 +0100
Message-ID: <CAJTo0LbXJrAgEnS53LDjxtnGrwNxgLog_KOxUaoXa+4vb5d1xA@mail.gmail.com>
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
X-List-Received-Date: Wed, 16 May 2018 10:53:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 16 May 2018 at 10:53, Andr=C3=A9 Draszik <git@andred.net> wrote:
> Would it be useful to add a check to patchreview.py (or elsewhere?) to
> reject patches that contain references to github archive URLs in the reci=
pe?

patchtest.  Yes, it would!

Ross

