Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 731BD72F8B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 17:30:58 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n127so4492840qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YmzgZt/WgX9a0n7LUSfY+3LPQx7sREKNjx7P34S3Qqk=;
	b=sgJst+a4e+ALihzHzvFa6EOkoDVxbwSgo9QBmo67Wg3Xg9gcIhHrpnzaXY8pPe1tR2
	9h53abadMf9Ldg8xjHsAaXnYnI1yN/pmhLXUh/WwQ66Ez5Ip3x9qgQ8U119YDONNcDxC
	NGoYUj5r1dbvLaB/ELVsHVwtW9jFT8w/UVUv2k+/j39KpRi2szgCurcQqi8cs759NWcp
	zPq85UIPaXQi5gKZC+JcVzeodlwp8K5cHMzVHWMF6tgwjyrHe/G9qeTLk/rmffO0gGnV
	xDjdVDDa4jcXL/Y/KrB8OCR7uIubRzflSM80knuaSJUgQqrAU3uDunLtiFncmNfLJsFh
	kMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YmzgZt/WgX9a0n7LUSfY+3LPQx7sREKNjx7P34S3Qqk=;
	b=mQ50oFyTdbEBDKMZW0bb2efwwl2eM6WnfwACRJPjqK3//RMGoUqAVMRyDyK2DNu4Lx
	nPscHisevG8jPZi2cEy831Fk9va3vadlV5QVhn77yNyJume1WcSXOOGUTLjPciMtQaUW
	8wuglCccQb/mWg8kEU4M6OUGJaPwSCWzShLsCKfpjSNMFoUCPfwW7nRT3kOqa/Awo5iJ
	fa1w8GYiIyzM5EEQuQzxl/KQN3bo+ldjx7PAis8pTPEV8zElZWCdI52v51PR5OsCGJQS
	5HA8q2fFTYQ0roYpnvvdrXiE1rmJyTJ+IP5Lcoh6oKuOoIYZQMB2Vy57qJikgFZOxzaM
	h/sA==
X-Gm-Message-State: AMke39krzozO/Tkkk76z/tDTM7nw6yu0fRcacvTcVbL5tDUaf7/0LdqPHr+bO+dggPKbJ9NrgH2sTDDsWrLuig==
X-Received: by 10.200.35.195 with SMTP id r3mr4291956qtr.282.1488303058988;
	Tue, 28 Feb 2017 09:30:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.132.68 with HTTP; Tue, 28 Feb 2017 09:30:58 -0800 (PST)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA013F52F492@ALA-MBC.corp.ad.wrs.com>
References: <20170227080959.27797-1-jackie.huang@windriver.com>
	<20170227080959.27797-2-jackie.huang@windriver.com>
	<CADkTA4OXnroiRi4Y4JGHAPf2jB4BgtAbn+fJSMoFEpN8JCY9mw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA013F52F492@ALA-MBC.corp.ad.wrs.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Feb 2017 12:30:58 -0500
Message-ID: <CADkTA4N0z-7054x-fdoQR_fx9faRrQLyqCW8AmAVi0g0=N7vJQ@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/2] dnsmasq: disable the service by default
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
X-List-Received-Date: Tue, 28 Feb 2017 17:30:58 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 27, 2017 at 8:12 PM, Huang, Jie (Jackie) <
Jackie.Huang@windriver.com> wrote:

> It can be overridden to enable the service in the conf file of the distro
>
> with witch only dnsmasq is used in the images.
>
>
>

Right .. I realized that you can turn it on, but my point was more that if
you are only including
dnsmasq, you wouldn't expect that you'd have to explicitly turn it on ..
and it wasn't the
case that you had to do that previously.

Bruce


> We can also disable the service in the distro conf file instead of in the
> recipe
>
> if it makes more sense.
>
>
>
> Thanks,
>
> Jackie
>
>
>
> *From:* Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> *Sent:* Monday, February 27, 2017 10:39 PM
> *To:* Huang, Jie (Jackie)
> *Cc:* openembedded-devel
> *Subject:* Re: [oe] [meta-networking][PATCH 2/2] dnsmasq: disable the
> service by default
>
>
>
>
>
>
>
> On Mon, Feb 27, 2017 at 3:09 AM, <jackie.huang@windriver.com> wrote:
>
> From: Jackie Huang <jackie.huang@windriver.com>
>
> The service will fail to start/stop when dnsmasq and
> bind (provides named) are both installed since they
> are using the same port 53:
>
> | dnsmasq: failed to create listening socket for port 53: Address already
> in use
>
> So disable the service by default, if the user really
> want to use two dns servives, the config needs to be
> changed to use different interfaces or ports.
>
>
>
> But what if the user is only using dnsmasq ? (which is the case in the
> images I use).
>
> This would be a behaviour change that they add dnsmasq, but don't actually
> get the
>
> service started.
>
> IMHO if someone is installing two packages that provide the same service,
> they
>
> are more aware of what is going on and can disable one (or the other) ..
> versus
>
> someone that adds a single package that provides a service .. and then
> find out that
>
> it doesn't actually start.
>
> Bruce
>
>
>
>
> As reference, other distro like centos/fedora also
> disables the services by default on installation.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> index 424a06b..9c2276f 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> @@ -81,3 +81,4 @@ RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
>  RCONFLICTS_${PN} += "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} = "dnsmasq.service"
> +SYSTEMD_AUTO_ENABLE ?= "disable"
> --
> 2.8.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
>
> --
>
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

