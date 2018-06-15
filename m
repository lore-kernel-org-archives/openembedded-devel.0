Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9281B74CFB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 19:03:47 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id c23-v6so7064094uan.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 12:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jl0v0xZZcsz0D9SpUrotafMFsZhdnc/v+vr9f7kevLY=;
	b=IOPR85KOog/9YNY4hoDak/GHiGiAx4O+QbwSLH0R7hj0lVVxMUDqePvWlFe/ICtuUn
	z4RF1y1CrtJgj7B5bAbVxIpwNufnBgbQM30Wukn3aXBl9vQgl85GDX6f0EhjqBD5eegv
	RSMpvl2qu9CA87iSjdm3HCWrfg0aZgtnczBXK3izcOF7N4ZHilT1D8REQmoSc8f+7FFc
	LkfcW5o11aS+0CV3O4fl4omOmczwtujt+2tBqoXGcmzNLUH6ZqTrzPjIxp2+aOhE31f+
	OSENOQDJYyE+KYEc47K8fW6iTIqhO0+v0mU7Ezp3aMJ303SqSygXcdxtL3aHIfc228PW
	hjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jl0v0xZZcsz0D9SpUrotafMFsZhdnc/v+vr9f7kevLY=;
	b=HtBaazlbV8ID4pJWzJ3KOFAYMu91t3JWEP6m7vlq5u+vTgLtCFtPRaLXaoM8KFyQc3
	ybZyI+j95mREjea2AMv4wtBUGQQitBqQgdZfYo1ljIUSCrlplOeFJ1gr7o9gW4pnUK2b
	wfgwmuassscj8FPVWNRA8Fml9Evn9G3ao43aP1mXVLGygipV2ciwYhXnpT+RyIjDBBCF
	NiaqUZnH/YHRVueSuo2lOlFA1gOMpO+GCO6zH6qwbsXTxv+xuzOg+ioPJribTz8Z+f+z
	nVggnLK1FwkHPEA7ijcWd20+LIC8/IPeauqdfztZxMIm5uIcRnG/9RnUx8MF9KpAByAN
	rC5w==
X-Gm-Message-State: APt69E11NdZqtaPfT4J3YlY4O6604OQ76FEmD4Pi2hx2DwYBeen+F8MT
	x5ZjUTv2+fcpGu2w4PXKi57Kd0kjJkEui/jTJrE=
X-Google-Smtp-Source: ADUXVKK2l0UEbDwvYMn/+JAxtyNOFgeIxe+B/WQH4X1zIaQCog25NRL695XHUD1YHnnXC2tL2dbXbr2TdXxB/3souKU=
X-Received: by 2002:ab0:59e7:: with SMTP id
	k36-v6mr1964943uad.81.1529089428533; 
	Fri, 15 Jun 2018 12:03:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Fri, 15 Jun 2018 12:03:48 -0700 (PDT)
In-Reply-To: <20180615182105.727-1-joe.slater@windriver.com>
References: <20180615182105.727-1-joe.slater@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 15 Jun 2018 12:03:48 -0700
Message-ID: <CAJ86T=XEoACNdVJhYZa24R5pF3cgDtkwKsu+WOF0z-FEb1_eOA@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 1/1] syslog-ng: fix build without json
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
X-List-Received-Date: Fri, 15 Jun 2018 19:03:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 15, 2018 at 11:21 AM, Joe Slater <joe.slater@windriver.com> wrote:
> Remove configurations requiring json from target.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index cb7ca31..6c5adbd 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -85,6 +85,13 @@ do_install_append() {
>      install -d ${D}/${localstatedir}/lib/${BPN}
>      # Remove /var/run as it is created on startup
>      rm -rf ${D}${localstatedir}/run
> +
> +    # If json is not supported, remove certain conf files.
> +    if ${@bb.utils.contains('PACKAGECONFIG','json','false','true',d)} ; then

Inverting the result of bb.utils.contains() by swapping true and false
makes this a little difficult to read. Perhaps this would be clearer:

  if ! ${@bb.utils.contains('PACKAGECONFIG','json','true','false',d)} ; then

?

> +        for f in loggly logmatic cim elasticsearch ; do
> +            rm -rf ${D}${datadir}/${BPN}/include/scl/$f
> +        done
> +    fi
>  }
>
>  FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

