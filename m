Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id D48C36010B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 21:54:04 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id n127so529992iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/IFTlk7wDi8kllM/RJmCYuNxX6bqoSnCLksyXLVqEmI=;
	b=JMURJONJs6hDUPBrt/U4Fxd3J6b7dQmVUZqv3cjiubvNDTPlvvsUXjauC+pfJTDRKO
	UDZjoVN51siSYp1jE1+Dfkjcl6UzGRC9c/yeBFffZemnK799biWGHcZwBcXGaXyk4Tuo
	yFM4QZgYnEay2gycf9GmjDGSq+DYij05avCPrJgsuYlgDOxRklvECfevt9f5K1zwkdGq
	IBnMml3UbMo8ro9Pt9DWHDcEgTpoHmQNULkWOHQF1QSZvAM3ZanDS/pnkdQ5A8jQRUUX
	I8UORSVYcHizrN9s4/4ZdVKEM8Bfvv+pBSHifbFcmucSStgOVfCyp56HUeyeC1XINJQt
	gI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/IFTlk7wDi8kllM/RJmCYuNxX6bqoSnCLksyXLVqEmI=;
	b=H7olIM+P0WVF8yUU4Zd09fgDRwFUfyOXLt5YKdd1ikJF3VfJsXZqYxZ5qYt16iHnV5
	KJ9MJpsfOEXT0FGKpfHMzTmkCQYzRQ58fHXVAmuv8Wd3n0gh8qoJ03ilrMhU0l+lAu1J
	4LASJqrAtGQcI+Sxo5ag7EyIKU/WZRKe+ziJ6DOHty2rZjdDe8fhdoG1M5qg6KlKHkaz
	SWZZ2+zM4lZSWtAzH1j6BUJ4boDJ9dZbiW1loKCtF80rtb9T5aDMFIz62JZSo+jBs0zX
	C0LzTrRfv2zp8HBM5YScbeb0CmUn4e62+YOtvcp5pEWearGisYcsGyn+BbE4AdB+t8jK
	w0/A==
X-Gm-Message-State: ALyK8tLUVC/PrpNMFEtp3Q73+H1sbhz4Yq6XEea0JI9wXUPLluAF+YykLH1a8sjXMTzkIUYNvrScgeUzLCa3lPA9
X-Received: by 10.107.154.210 with SMTP id c201mr25210516ioe.99.1466459644626; 
	Mon, 20 Jun 2016 14:54:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Mon, 20 Jun 2016 14:53:45 -0700 (PDT)
In-Reply-To: <13986bd3-af12-4768-0a4c-78447c33c8b6@linuxfoundation.org>
References: <13986bd3-af12-4768-0a4c-78447c33c8b6@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Jun 2016 22:53:45 +0100
Message-ID: <CAJTo0LbdLtJRBZLetB9TL_wpU=42NkMxQY1t46q3cKaNQjQAkA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Belen Barros Pena <belen.barros.pena@intel.com>, "Perez Carranza,
	Jose" <jose.perez.carranza@intel.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-core <Openembedded-core@lists.openembedded.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	bitbake-devel <bitbake-devel@lists.openembedded.org>
Subject: Re: Patchwork users: Help test new version
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
X-List-Received-Date: Mon, 20 Jun 2016 21:54:05 -0000
Content-Type: text/plain; charset=UTF-8

On 20 June 2016 at 18:47, Michael Halstead <mhalstead@linuxfoundation.org>
wrote:

> OpenEmbedded is nearly ready to upgrade to a new version of Patchwork.
> The new version offers several new features that will allow OpenEmbedded
> to improve developer workflow and automated checks on incoming patches.
>

Woohoo!

Thanks Michael (and everyone else who helped on this over the months).

Ross

