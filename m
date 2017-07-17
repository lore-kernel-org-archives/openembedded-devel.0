Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A34FD77D21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 03:55:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p204so20755514wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jul 2017 20:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9I/OQCPhk+SCGT/s1vxvyvw2OJyDa1RQ/+oQaemg0AI=;
	b=nX7cNn/Qndcg8VtHQLp/zzBbmyDV+l2Sp9cqpf3urcC4C0UwJmTtwrRDJBQkRllwdh
	c6zNTKUKurMhXnPvOKMhZZ80xNGSAHp07FOT1/jcbAxRaAuGUtGcURDmy286vYbU/P+G
	QuC9eLU4gT+wenrbJD13apsWeQjL2ioaVGuDIG7jZUqkHz3nvxPkTw1ASwGCEnlEKT4Z
	ThSI4nrKl0CNsu6kgOjERkyWhauZGVc4/GLoYHLyL8zv8Y5iM1naGJzsh5SyfzrKFi8m
	PFmLYVMasEinYuXi87XjWIyasMxN3dp3sh7h4DsiJDnLIfS5a7wxfQ4JbNIMCbPIZfCK
	jkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9I/OQCPhk+SCGT/s1vxvyvw2OJyDa1RQ/+oQaemg0AI=;
	b=NwELMnHAxrrQUthEnYfjoH2Ofva5IHvczDnBzSsBXwvNnq7o3AvA9o8RE5gKIoCRVN
	Ei/LnxT/EK/BFWnSRbcOgsYes/r/LMONygYYtmNqu/QvrOeAxgfJF9bdFrFEjfzjzKPp
	KG4S/2P4zh7pB+/iQxVWXskJ15oXJl9w+SHidqWJ4H/AHhhqxnuiowKoKIJ843UuxrgF
	E5CZO0Ywl0TzIZJQ/BECai5+M5S2E5Nw+dliJuzbWh0C0IZJUy3A/xPA2RHTG//LeI1W
	z24/jSCR9zu299P+f6Fp7XwyrzGk7jwNsR33wqI551j9wQcmgyaVuz0cz3Oxl9FTX1WX
	HyWA==
X-Gm-Message-State: AIVw11242BVwzkjdA9MQu6wZyGRl5+8nT6fK43cBZFQ01hEy4mvHb+Te
	Jj6t4WMgaklHPPF8T0xjjoI5Y2bvGQ==
X-Received: by 10.80.164.185 with SMTP id w54mr15964135edb.76.1500263754215;
	Sun, 16 Jul 2017 20:55:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Sun, 16 Jul 2017 20:55:23 -0700 (PDT)
In-Reply-To: <1500259691-9782-5-git-send-email-stanley.cheong.kwan.phoong@intel.com>
References: <1500259691-9782-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
	<1500259691-9782-5-git-send-email-stanley.cheong.kwan.phoong@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Jul 2017 20:55:23 -0700
Message-ID: <CAMKF1sq06C2Q10GzW=Ud85mBvOAdDu7O7hK5u0H4cNgRdZkU6w@mail.gmail.com>
To: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
Cc: OpenEmbedded Devel Mailing List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openwrt][PATCH 4/9] Juci: fix uglify-js not found
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
X-List-Received-Date: Mon, 17 Jul 2017 03:55:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 16, 2017 at 7:48 PM, Stanley Phoong
<stanley.cheong.kwan.phoong@intel.com> wrote:
> From: "Stanley Cheong Kwan, Phoong" <stanley.cheong.kwan.phoong@intel.com>
>
> uglify-js is not found by the Makefile. This happens due to npm install
> will install into a local node_modules and this would not be reflected
> into recipe-sysroot-native/usr/bin. Added softlink to uglify-js.
>
> Signed-off-by: Stanley Cheong Kwan, Phoong <stanley.cheong.kwan.phoong@intel.com>
> ---
>  recipes-core/juci/juci_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-core/juci/juci_git.bb b/recipes-core/juci/juci_git.bb
> index 6d3d798..def6a90 100644
> --- a/recipes-core/juci/juci_git.bb
> +++ b/recipes-core/juci/juci_git.bb
> @@ -23,6 +23,7 @@ do_compile() {
>  }
>
>  do_install_append() {
> +        ln -sf ${WORKDIR}/git/node_modules/uglify-js/bin/uglifyjs ${WORKDIR}/recipe-sysroot-native/usr/bin/uglifyjs

this should be done by a native recipe. May be a new recipe to install
this would be ok.

>         oe_runmake
>         oe_runmake DESTDIR='${D}' install
>  }
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

