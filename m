Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC4A7731D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 16:33:43 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id z134so197325398lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 08:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=psKbJzLzxPvwmfNz0ecqy3L2KIbGPzurh8pfePVa2hk=;
	b=cFV4lRu+IDeELT/WWzBpzuYjBnNbG6Rn6lCvGiJNjAeN5J7KeA5NMRRxT9PLteZQYf
	/PdCw9vifCl3QvP8nHx8LYn6owvKpXsBeAJ61STFmFdfelrWz5wzujz3ZQ2D44zGbUq2
	DgRMV7AEPrlMbWTXfWcjljvJUEKWJsysS0mIGV5Vea0O2kFNYVuEeTXJy7abErWDbR/c
	C6mDVx7wQ/pLSEzhvNNx1j5A/j+6br6lX8RWsv89tQ4g+OsBRdHA0H/lmRJVjKbzpiCv
	BelB4lA2W+pcFCcmjFCj3FZiYbjfdl0eS5/iyxUw8JAjfvO3yzDuf1ne10bwrxn2mls3
	+YCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=psKbJzLzxPvwmfNz0ecqy3L2KIbGPzurh8pfePVa2hk=;
	b=aYE2XX09wAR9DYwl/t872yDgh9+/OmwWpnasv8KDr2FOiJrttueZwspBNSNldFcsi0
	tsIrc3SlLizphu1oejYW3P1cr91+eIjmriiUQobf42yRs5sPLFk83Yufp2TNbvy5GjqP
	otHP7aGJEnlB7K+34UhCIz79zSW1CPKWDPeevlBIBgwp+ou/AuaJRLEl7not5/6IClzJ
	wt4TqPsN2cgGb0Al69CHtuvi3wUCMcpbejYieEXmOodrtDNZVXBUw1P80IQSkpqkfkJO
	b+To+gnhEJqQiQHApuxFmmDCqHVXs5DjUeZ2wW45kKy1GyQJy8k2wyBtneB8J3nmrQn/
	Nxzw==
X-Gm-Message-State: AIkVDXI9651dx5CVYwWaXnMyiHBoWS5SfM3s8RUpb8VHE0I6okJjtiw0gILEhX9kW3RarXYvK5xr/djkoqVrMg==
X-Received: by 10.46.1.201 with SMTP id f70mr362722lji.21.1485794023090; Mon,
	30 Jan 2017 08:33:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.163.200 with HTTP; Mon, 30 Jan 2017 08:33:22 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <20170130162926.28180-1-fabio.berton@ossystems.com.br>
References: <20170130162926.28180-1-fabio.berton@ossystems.com.br>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Mon, 30 Jan 2017 14:33:22 -0200
Message-ID: <CAAPZna2+AQA1SbqdAg9P+hiu_QUAe+2wxQubED717v9-rdvBKw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] lldpd: Update to version 0.9.6
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
X-List-Received-Date: Mon, 30 Jan 2017 16:33:44 -0000
Content-Type: text/plain; charset=UTF-8

Note:
This [1] patch should be applied to build lldpd.

[1] https://patchwork.openembedded.org/patch/136616/

On Mon, Jan 30, 2017 at 2:29 PM, Fabio Berton <fabio.berton@ossystems.com.br
> wrote:

> This update includes following changes:
>
> lldpd (0.9.6)
>   * Changes:
>     + Add a compile-time option to restore pre-0.9.2 JSON format (when
>       using json-c). Use `--enable-json0` to enable this option.
>     + Support for newer ethtool interface on Linux
>       (ETHTOOL_GLINKSETTINGS) and additional speed settings.
>     + Current MAU type is displayed even when autoneg is off.
>     + Increase netlink receive buffer by default. Can be changed at
>       compile-time through ./configure.
>   * Fixes:
>     + Correctly parse LLDP-MED civic address when the length of the
>       TLV exceeds the length of the address.
>     + Fix 100% CPU on some rare error condition.
>     + Fix lost timer when an interface is enslaved on Linux.
>
> lldpd (0.9.5)
>   * Changes:
>     + More Ethernet media supported. However, RFC4836 is quite
>       out-of-date with respected to 10G+ speeds, bringing some
>       inaccuracies.
>     + Directly get media information for an interface without using
>       the privileged process.
>     + LLDP-MED capability TLV is not sent when LLDP-MED is not
>     enabled,
>       even if other LLDP-MED TLV are present.
>   * Fixes:
>     + Compilation fix with older versions of GCC.
>     + Don't use ethtool at all to get real MAC address for enslaved
>       devices (always use /proc).
>
> lldpd (0.9.4)
>   * Changes:
>     + Make lldpd accepts a `-p` option to specify the PID file.
>     + Ability to change multicast MAC address to two additional values
>       to reach customer bridges.
>     + lldpcli will now display chassis TTL when detailed view is
>     enabled.
>   * Fixes:
>     + Fix setting of local value for port ID.
>     + Fix compilation with BSD make.
>     + Ensure lldpcli returns an error code on invalid commands.
>
> lldpd (0.9.3)
>   * Changes:
>     + Do not rely on support of constructors for liblldpctl.
>     + Always log to stderr (even in addition to syslog).
>     + `lldpcli watch` accepts a limit on the number of received
>     events.
>   * Fixes:
>     + `lldpcli -f {xml,json} watch` should work now.
>     + Consider `veth` interfaces as physical interfaces.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  .../recipes-daemons/lldpd/{lldpd_0.9.2.bb => lldpd_0.9.6.bb}          |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-daemons/lldpd/{lldpd_0.9.2.bb =>
> lldpd_0.9.6.bb} (94%)
>
> diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.9.2.bb
> b/meta-networking/recipes-daemons/lldpd/lldpd_0.9.6.bb
> similarity index 94%
> rename from meta-networking/recipes-daemons/lldpd/lldpd_0.9.2.bb
> rename to meta-networking/recipes-daemons/lldpd/lldpd_0.9.6.bb
> index 77ed09f54..0cd063720 100644
> --- a/meta-networking/recipes-daemons/lldpd/lldpd_0.9.2.bb
> +++ b/meta-networking/recipes-daemons/lldpd/lldpd_0.9.6.bb
> @@ -11,8 +11,8 @@ SRC_URI = "\
>      file://lldpd.default \
>      "
>
> -SRC_URI[md5sum] = "b809887bc927fb558fd5dd64b6c0a494"
> -SRC_URI[sha256sum] = "6054f29d41faf32186a22331853a29
> 9c87f4419b4332df4a564f76a139305a32"
> +SRC_URI[md5sum] = "0dcdee7c1b3c62362d73f6508c11edae"
> +SRC_URI[sha256sum] = "e74e2dd7e2a233ca1ff385c925ddae
> 2a916d302819d1433741407d2f8fb0ddd8"
>
>  inherit autotools update-rc.d useradd systemd pkgconfig bash-completion
>
> --
> 2.11.0
>
>

