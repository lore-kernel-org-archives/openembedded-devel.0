Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id A3DF56FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jan 2018 13:56:14 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id b77so8519576itd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jan 2018 05:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9SpiGlNQVBaSN5TkGugqE38YZTrUzg1jdy+aWMEeW7w=;
	b=Rh7OZHsMrg34qSlLcE1dVejpz0SnsXF5zp2WJh9tz5eTTjg1dYvSTT0+JZAcWnWcqh
	UZ+8BLhs80AGqa+oiXhgUqlXO2QebGwzps4wHFwQsHAd/y2vug2dZFvSjJsYQeJsJk9S
	vxtNsFSjZC2puSrW1rhwbumJoU+JvwAS+OohSJQCYE2Pl//J/If/i4gTuN4Yc3glJC5b
	v0b99e9KkwW19Vui9mEPe05p9t00hMbjnbHa7Wu8LgjTtk35sgJ+i3trKaxFNdsV62xR
	46Xl+GhNFSHRIzU5+eqsj56tq8KO9otAxbjHFnQQzu3JpqeDFggx1TnG0G8SsNAX3APF
	PwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9SpiGlNQVBaSN5TkGugqE38YZTrUzg1jdy+aWMEeW7w=;
	b=r7GRzMXZJZwiHjVLZPKKTq42Y7eB4FsFDXB8gjeZkjVukIXpsgemtpOXHoVp8QIFVp
	FYxeGKNqqCTOEE35HXiFMmtulVNjinr6mw3YkYj6mjBsDsqInHko+JjqYHpPkljahQo7
	5LQWGBeGanJ3WoqIL4GXe1BnDa/IpMxIdUUhaO4+7Ra4tCL9Ur3h1Veo9G4cUJauYksm
	A5Vgom+SGcWBIhqR1kaP95rMfc1r/3oEWpcOW9K9ioElenunxug2NMztTe8a4RfOBtEd
	ya4/W/YNmqZ4weCHN3fdpvLOlgN4OgdkcXng3XnsHjLDs4GYODFIOk5Wu5xaX6I5V8oR
	cpxg==
X-Gm-Message-State: AKGB3mJX5aILE9UPJVQhZ+hsDhv9xnaD5GR+Pl8d6xSLpdgiItS1Gc25
	2IqXmHQVRiPAqDMDTae5FBYgN3NgJcdoUvf0JzixHg==
X-Google-Smtp-Source: ACJfBovdlryUQKz0gdOPlUgSxIGT/Xt2hBxAI0w0rB1yECYclSzHd1VQvrxaeZIxdjXOJUdX8+FMjIKMdLDrvNNX1Lc=
X-Received: by 10.36.157.203 with SMTP id f194mr15583517itd.53.1515506176014; 
	Tue, 09 Jan 2018 05:56:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.147.193 with HTTP; Tue, 9 Jan 2018 05:55:55 -0800 (PST)
In-Reply-To: <1515126019-117327-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1515126019-117327-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jan 2018 13:55:55 +0000
Message-ID: <CAJTo0Lbjb7+jRncoxL7ui90hh+ZDJkFKyPELyczN+_8i=t-yhg@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH]nautilus: new add
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
X-List-Received-Date: Tue, 09 Jan 2018 13:56:14 -0000
Content-Type: text/plain; charset="UTF-8"

On 5 January 2018 at 04:20, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:

> +EXTRA_OECONF = " --disable-gtk-doc


There's a class to handle this.


> --disable-nls


Why are you disabling i18n?


> --enable-introspection=no"
>

There's a class to handle this.

Ross

