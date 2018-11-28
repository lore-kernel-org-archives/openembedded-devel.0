Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 64CFB6C126
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 17:19:33 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id r14so26741880qtp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 09:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=9Rnru2uot5xON21qASsA9SGFMV8K8xsjwII5RmF3+L8=;
	b=h4IhoTcuVrplR75IPGbMbwoZXSF0Uc2iiGXF5WRmhvTSN97J9w3HWlbxTbhnnFtIR8
	xbXYn1siGwnx7vkQ3ew+2l4PWp2mytSwHy4Z7rgxSZG0b8SYc8df/b3yJG/CdBFRGje6
	xlbYLVQyyGdCaSVXtIHHN9n1E1IohAK6WvTjG2PPjQZiOL+JljkQTYEPXCYznKwHpwiU
	ajPSH2qcUnCfxdK1CKyxcz+FDQ/FJs6CFWJwfDs5vSL+26JOuAFUj+/zCEXqrK2BqxdB
	4knvGDy0rRR+z1xegRAGXTScSROLD9Bd1BARS3qrlO3tlJ6eLFtzE+u6S5rA5qA2bQpC
	BQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=9Rnru2uot5xON21qASsA9SGFMV8K8xsjwII5RmF3+L8=;
	b=Kn0REVHns5s1Lb5+OiOMnUJ9EzE8xFDR6MV5gaSqJJa+U+Wvux+ZTRv/6eELondDdt
	RpmmKTepNFmyWxWffb9g9ZIAwOLava+vmhgCMuzRJyN1uJHIBlk6FMzIbvVWo64EV34l
	dExRNyh4/2ZiKzz7kaK64nmDFgbB7oqZf5PXpdOXATxgHzeYBlkp6p/CxIF3cfY7B4HG
	di5+QvYTNVvzteXM1BlIFjeAD0YOpTmrmWPOE5CvuhQTWLpLbAzmck9dKN++lDY8V4P+
	+h8HmIOp94ouKgSQQMY0J42b/kowZM9KVACnFGd0JUD/90kSRY0vlvyM/sM1G6nwF55Q
	+CrA==
X-Gm-Message-State: AA+aEWb7Wvd/hRWiBy0M6QHiCM/2o3n9W+8hrWp1+UKt91IxFkl++BM6
	xEqHfKdJ59bfVEgK1BOxD+jQcfuaGpLYLQq5TocNHh2IK0s=
X-Google-Smtp-Source: AFSGD/XCPcnedbUcyKn+QscjVVIdOA95BpKZj93KHg5k0dJkipIRJ3FZv9P9tUILUzqXDUsLIEdr8na6tesG59y43wc=
X-Received: by 2002:a0c:93e2:: with SMTP id g31mr36165039qvg.194.1543425573901;
	Wed, 28 Nov 2018 09:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20181119172519.28377-1-max+openembedded@blarg.de>
	<CAMKF1srm_TiixkGadQhAk-dLTj2CmKoj47QmKOf=9OEtK+VjJQ@mail.gmail.com>
	<20181128073447.t7zp2zmi4ozx4zb3@swift.blarg.de>
In-Reply-To: <20181128073447.t7zp2zmi4ozx4zb3@swift.blarg.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Nov 2018 09:19:07 -0800
Message-ID: <CAMKF1sokqVsg60Dm3GuVxmZ6AZvk8cTAkzi7-3q4N7Xnz4FkrQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] mpd: update to 0.21.3
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
X-List-Received-Date: Wed, 28 Nov 2018 17:19:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 27, 2018 at 11:34 PM Max Kellermann
<max+openembedded@blarg.de> wrote:
>
> On 2018/11/28 06:53, Khem Raj <raj.khem@gmail.com> wrote:
> > Hi Max
> >
> > it fails to build with systemd see
> > http://errors.yoctoproject.org/Errors/Details/202303/
> >
> > It seems the new meson change is not installing the system unit files
> > and socket file during do_install properly, one way is that we explicitly
> > install/copy them during do_install, but I think its better to fix it in mpd
> > itself if possible
>
> We had this problem already when I submitted version 0.21 for the
> first time, and my 0.21.3 patch contained more explicit options to
> enable systemd, hoping to make it fail earlier, but it didn't.
>
> Packaging with systemd works perfectly fine here on my machine, all
> the units are in the right place.  Unfortunately, your Yocto build
> logs are devoid of any hints what went wrong.
>
> So yes, I agree with you that we should fix this in MPD upstream (I am
> the MPD upstream maintainer, btw.), but I have no idea what's wrong.
> If only I could reproduce the problem.
>
> Is there any way to get more verbose logs from your build bot?
>

I can reproduce it locally as well when building for

MACHINE = "raspberrypi3"
DISTRO_FEATURES_append = " systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
VIRTUAL-RUNTIME_init_manager = "systemd"
VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"


ERROR: mpd-0.21.3-r0 do_package: SYSTEMD_SERVICE_mpd value mpd.socket
does not exist
ERROR: mpd-0.21.3-r0 do_package: Function failed: systemd_populate_packages
ERROR: Logfile of failure stored in:
/mnt/a/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/mpd/0.21.3-r0/temp/log.do_package.25748
ERROR: Task (/mnt/a/yoe/sources/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.3.bb:do_package)
failed with exit code '1'
logs are here
https://gist.github.com/b69ddd940689c5ad02bce7ef2eb89a73
https://gist.github.com/4c1dd2c382a209b03d290447146cc9c4
https://gist.github.com/675704fde3469895b4c6207d4c83041d


if you are interested here is the distro setup I use.
https://github.com/YoeDistro/yoe-distro

> Max

