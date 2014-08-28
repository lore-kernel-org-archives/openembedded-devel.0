Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id E205E71164
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 12:53:21 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id i17so693272qcy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 05:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=ElHsTDmLX8rjVgMA9qZFfbH5wznuFjPbwSTIm/LCdrQ=;
	b=CROSyU05seWCtcfxyQOQU2miqsuI+qy821JFFw888eHz2NMXJkYbBz7xYOIBqbp9rS
	z4BeZQbaNWlAG3zFJgze/k8/ZHzJD1QZAAn9MVP1ioLTVsSfnPxEg0CXMzL86hIVI9or
	v2la4mup0x38Q5F3dCHOBg5aO/cShcJHZeBr9V+hqINT0WckYTYotvZt30cxfQlr5vsw
	nOzgdxOqycEsXLIb0AnxBzcyuhUvxncstkOhB359EERIXFk6sfiAFqoKko4fPvzDatPS
	VuwRtOdMuqlZgxBmQ9IHrXAhIIz9KOHeE17xbc6nYwYl2tGI7azEJuCGlfDAuwp4qlpe
	ojNA==
X-Gm-Message-State: ALoCoQnuNj3dbTGVyHqL5HbZFS9zxdFxg1RXa1LsNsfqQOMXyU1vRA+Fi0MRA72hwL3M9wjYMbOz
X-Received: by 10.140.97.131 with SMTP id m3mr5779609qge.80.1409230402494;
	Thu, 28 Aug 2014 05:53:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 28 Aug 2014 05:53:02 -0700 (PDT)
In-Reply-To: <1409227581-20888-5-git-send-email-pab@pabigot.com>
References: <1409227581-20888-1-git-send-email-pab@pabigot.com>
	<1409227581-20888-5-git-send-email-pab@pabigot.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Aug 2014 13:53:02 +0100
Message-ID: <CAJTo0LZtEMeRoxAd9h9K7dQX6peSJRdB+vFGtWQXDSNUC_UPTg@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/5] gpsd: add optional support for KPPS interface
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
X-List-Received-Date: Thu, 28 Aug 2014 12:53:29 -0000
Content-Type: text/plain; charset=UTF-8

On 28 August 2014 13:06, Peter A. Bigot <pab@pabigot.com> wrote:
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[kpps] = ",,pps-tools"

That's not actually deterministic - if pps-tools is installed but the
packageconfig option is disabled then gpsd will still enable the
support.

Ross

