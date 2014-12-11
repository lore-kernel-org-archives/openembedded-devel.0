Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 06AC972127
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 11:14:12 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id i8so3602579qcq.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 03:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vDkMWWuEiOYyLbcSfXR01qbzpY4kHk0GZafOCj7uyH0=;
	b=mW3omHrYUbfltycA04o0vk32LqH1xIuebAM/QMAKI/16q6y0rhFPBiN3lnYhCNvLB/
	gT5MSzMNxKtJjwUVhYtUgm7E3jJil3Izrf6qabEviJdrYCHwzGtWptVXdxWi7kbEMEH9
	MK8YaFVWkIAZJbnXv1atkON6moULo2ZgYHzjYdixOKW3qmoGyMUxH1v7BVAsIHaBud8d
	Lm7q7I7NNwnquX7Mxfx6IZ5NVraPzALvbcot1JuHX+tS86qKOHQ3afKhi65fg+v97YGS
	CHqG/fYEh4RXWY2BUvVjuHtGPeR8zFBPmXjh1XYnWqTYM1HVuJUMmXZjJXtma1N6sOSy
	HVbQ==
X-Gm-Message-State: ALoCoQmfbZAwWDeOPhdR7BPRcat8xxqTylLONHYIrjBBZjWEBLMW0mpxTL7IqJFzwH5jjkTGILgR
X-Received: by 10.224.92.205 with SMTP id s13mr18848946qam.52.1418296453018;
	Thu, 11 Dec 2014 03:14:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 11 Dec 2014 03:13:51 -0800 (PST)
In-Reply-To: <20141211092332.GA2467@jama>
References: <20141211092332.GA2467@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Dec 2014 11:13:51 +0000
Message-ID: <CAJTo0LYwYW40XvxNN=rY4z6fK+4NJ2ZFxa2xsUvuspERa_MT+A@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, test-dependencies 2014-12-11
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
X-List-Received-Date: Thu, 11 Dec 2014 11:14:23 -0000
Content-Type: text/plain; charset=UTF-8

On 11 December 2014 at 09:23, Martin Jansa <martin.jansa@gmail.com> wrote:

> WARN: gst-plugins-bad: gst-plugins-bad-meta rdepends on
> gst-plugins-bad-rtmp, but it isn't a build dependency?
> ERROR: gst-plugins-bad: gst-plugins-bad-rtmp package isn't created when
> building with minimal dependencies?
> ERROR: gst-plugins-bad: gst-plugins-bad-rtmp-dev package isn't created
> when building with minimal dependencies?
>

Coincidently last night my world run gave me warnings that
gst-plugins-bad-rtmp was depending on rtmpdump without a build depends, so
I've copied the PACKAGECONFIG[rtmp] from gstreamer1.0-plugins-bad to
gst-plugins-bad.  Presumably this will fix these errors, although that
warning seems odd.

Ross

