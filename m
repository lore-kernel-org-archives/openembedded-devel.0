Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 725BD71AD7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 09:31:00 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id t189so44060180wmt.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 02:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=E6uLOKOSpY0Yhz07rnvtMenCLyZT22WicWZHbIWiWPs=;
	b=T0B0mEGfaeuu09bzGwxO+wyQIQWxhLbBmSx1d0wjHj1T0izwgEi6U1ZCkv23hU37Du
	Usxn3Z82aq0qAUs9PiqGHjCTQ/kGF18WMqjFKEuD/V+AVV1bCYZnERmNMMSgClIyJY3B
	3urQPKQi+8O+GVJAbjjxMEVQuh8QUy2UPBSnPcVQS9iDZOm3V0qyR+Fly/EkMKeWkdrJ
	zBIFnOi1wzoSIP4yRToG9EEYxVgXxcppse7Ps5mw+xdaaI9G1SgAdecNoWH4tmJ/SKFz
	+H9tP8F9x+zPXfSL3NTUDyEPB/6rRb7X6sbGNL9+zB53DUylQNLUGwH2rI9acIvx9Jb/
	Aa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=E6uLOKOSpY0Yhz07rnvtMenCLyZT22WicWZHbIWiWPs=;
	b=k9D46OGI352VOjU+E0qBM9aoXAOMeIDhz9gp7qbaRnoMAdm+AVsLzLkISB1EiMYptQ
	6ONUFRrT1V+kv6oUUnzRpUEZ96QtXbTPgblSojTkltXHwAPULpRNFKSRrSaR8RgZE/Q9
	au04PbSBaDOHXGMVl5ottRNu4HiyuTQH6zzRykXvVG4Ha0IuFp1JNmJO2QIw3KbCmD7+
	Yiadvu5VOjfqVNSQLgDuIf1+H1d/psXYV4IDa19YoANja7JeCKxTTnALFVenEuCCtqKQ
	Ja80nO3dw03ytgWQC4fy2NnGVysfepazCDDNEKKXGrraRrtSAMuhAVN+m/RFmkh0HBi1
	04Eg==
X-Gm-Message-State: AFeK/H12xMkM/zW871RRGmg38p03XcQZn/VE453266nXZ+dMF/DJA5TJTquNVC8KnKIdBw==
X-Received: by 10.28.218.197 with SMTP id r188mr3312602wmg.0.1489915861490;
	Sun, 19 Mar 2017 02:31:01 -0700 (PDT)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	m201sm9150974wmd.19.2017.03.19.02.31.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 02:31:00 -0700 (PDT)
Message-ID: <1489915859.2234.8.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Daniel Dickinson <cshored@cshore.thecshore.com>, 
	openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 10:30:59 +0100
In-Reply-To: <20170319002834.17953566@danielf.thecshore.com>
References: <20170319002834.17953566@danielf.thecshore.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: OpenEmbedded Layer Index autobuild errors
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
X-List-Received-Date: Sun, 19 Mar 2017 09:31:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

Am Sonntag, den 19.03.2017, 00:28 -0400 schrieb Daniel Dickinson:
> Hi,
> 
> Since it wasn't clear from my last posting about this issue, that the
> issued described was that the recipe parsing for the three pre-alpha
> layers I submitted recently triggered an error condition (missing
> HOSTTOOLS) which isn't something that's an issue with the layer or
> recipes (or so I'm given to understand), I'm reposing the error message
> and this request for the hosts to get the necessary packages so the
> layer index can be updated.
> 
> Layers are:
> 
> meta-cshored - small distro along the lines of poky-tiny but for
> read-only-rootfs and taking advantage of the following layers:
> 
> meta-earlyinit - instead of initramfs run 'earlyinit' to prepare things
> for the main init and which runs from the kerne-mounted rootfs.
> 
> meta-runit-init - use busybox 'runit' commands as the main init.
> 
> 
> The error message is:
> 
> 
> Traceback (most recent call last):
>   File "update_layer.py", line 716, in <module>
>     main()
>   File "update_layer.py", line 216, in main
>     (tinfoil, tempdir) = recipeparse.init_parser(settings, branch, bitbakepath,
> nocheckout=options.nocheckout, logger=logger)
>   File "/opt/layerindex/layerindex/recipeparse.py", line 75, in init_parser
>     tinfoil = utils.setup_tinfoil(bitbakepath, enable_tracking)
>   File "/opt/layerindex/layerindex/utils.py", line 144, in setup_tinfoil
>     tinfoil.prepare(config_only = True)
>   File "/opt/workdir/bitbake/lib/bb/tinfoil.py", line 210, in prepare
>     extrafeatures)
>   File "/opt/workdir/bitbake/lib/bb/main.py", line 517, in setup_bitbake
>     server = start_server(servermodule, configParams, configuration, featureset)
>   File "/opt/workdir/bitbake/lib/bb/main.py", line 357, in start_server
>     cooker = bb.cooker.BBCooker(configuration, features)
>   File "/opt/workdir/bitbake/lib/bb/cooker.py", line 195, in __init__
>     self.initConfigurationData()
>   File "/opt/workdir/bitbake/lib/bb/cooker.py", line 358, in initConfigurationData
>     self.databuilder.parseBaseConfiguration()
>   File "/opt/workdir/bitbake/lib/bb/cookerdata.py", line 299, in parseBaseConfiguration
>     raise bb.BBHandledException
> bb.BBHandledException
> ERROR: The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH,
> please install them in order to proceed:
>   cpio chrpath gawk diffstat makeinfo

This recent commit tries to hide host applications which should not be used by recipes as they
should be provided from their -native packages (from DEPENDS) during the build.
http://cgit.openembedded.org/openembedded-core/commit/?id=fa764a403da34bb0ca9fa3767a9e9dba8d685965

With that change all tools which must be installed on the host need to be present, even if in your
use case some of them might not be used.
Did you install the prerequisites?
http://www.yoctoproject.org/docs/2.2.1/ref-manual/ref-manual.html#required-packages-for-the-host-dev
elopment-system

Max

> 
> Regards,
> 
> Daniel

