Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id DC87E75258
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 18:43:02 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id o17-v6so10184467vka.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 11:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZfOgry+2bubDi546gI9hD3Wcli48E2ONJ9hiae4iODU=;
	b=ZtPENKm1ADkivqpsxtCR0412mXZHbtGC5FlItCIvUJeEGiPa6qmF/DYz8o04QuV7vn
	6oe07TzrbZyEz/54IEguwSV4l/jQpsO1xhYNsJAxMuKsDXj21qpwSY5HaDXuSYT0CUQw
	6HXQAPB0mCP5np/le/iZJn65L+/91sNldVwj6+Lld3yfz6RlLq/4ppH/bowDii4YycTB
	+gm2dkE8drB90BFotR1s42+7mIsjVa3pxM+vUx7qqanuxXCZbq0hd0VkJUwEfwKbRzpw
	9qpP4H8B5zvf594PtrEh8LO5r3q4InRcb9/wxOWlJro9PA2iEec9kBsLjLSW2WpxFP3c
	XvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZfOgry+2bubDi546gI9hD3Wcli48E2ONJ9hiae4iODU=;
	b=naLh6+C9Y+SAAjejH30NY6/ZZhOFEVZCn1Csnbu3h3I2Gb0lIEt7Ciua5cONn57CY9
	8+UO/JrL9Wl9HN74U6iikKSlV+zdzyzm75tcjTvhXxE9Ba5peb4qdlsztxaJw72CrE5I
	lull9U3c+6O4wr6of8vzmqb5mEFrF8u0Hy2F7DHMG48dW2ePjvyvh9fKW3KcbSWQHkWn
	yyGX6XYJfU9vW5EdmdmUWh8TUEIdRp+2lEG6gJCbi9Jw1A78AESe6ieKfwymCbcUSqrG
	XUBxl6/1wVJdiTOtGRDUx8+CbPD5nemIhr7o76YJjyhKiBfR6CtMXp6kH8BI5eIZi6iV
	Vi4g==
X-Gm-Message-State: APt69E3+XAQfb3iAIliKtAXEuC+JQs/QPk8NeEM2ixRindqbve8x3Wva
	OVAcW8AHIEAifMQTuEHOhQC3HwQSzaSnsA82Ypc=
X-Google-Smtp-Source: ADUXVKI/WpMPHv/dgF8ryPh6DeBvhtyuNcdi5sqk71azzptC8w0StBip39mLwRwZto619JUKZ3DsuNerz0XIUqNx8yA=
X-Received: by 2002:a1f:4b86:: with SMTP id
	y128-v6mr7324071vka.146.1529347383563; 
	Mon, 18 Jun 2018 11:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20180618183651.213080-1-joe.slater@windriver.com>
In-Reply-To: <20180618183651.213080-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jun 2018 11:42:47 -0700
Message-ID: <CAMKF1spicQZfrYmkETYCDOq7FAhdy_A9BC-8V+f7QLx0n7fJ-w@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V3 1/1] syslog-ng: fix build without json
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
X-List-Received-Date: Mon, 18 Jun 2018 18:43:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 18, 2018 at 11:37 AM Joe Slater <joe.slater@windriver.com> wrote:
>
> Remove configurations requiring json from target.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index a0ae7bd..417e8c6 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -80,6 +80,13 @@ do_install_append() {
>      # Remove /var/run as it is created on startup
>      rm -rf ${D}${localstatedir}/run
>
> +    # If json is not supported, remove certain conf files.
> +    if ! ${@bb.utils.contains('PACKAGECONFIG','json','true','false',d)} ; then
> +        for f in cim elasticsearch ewmm graylog2 loggly logmatic ; do
> +            rm -rf ${D}${datadir}/${BPN}/include/scl/$f
> +        done
> +    fi
> +

package them into a separate package and let that package rdep on json

>      # support for systemd
>      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>          install -d ${D}${systemd_unitdir}/system/
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

