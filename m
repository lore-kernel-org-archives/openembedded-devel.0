Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 21E8371987
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 11:01:04 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id v186so79722758lfa.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 03:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=SSjB5LFnYhMSpHyh5gfidKOCkOaNnb0ma098q9JkPRM=;
	b=E3xmbdMYPUsPU2x0fELGJQtiYCxnbW3VmBV7oxAZ9sJ3/Ywbqo+GVqZfgCM24XJlNs
	hef42oiW1Kx8s3EAPCmKz9zeMpDe3ahkyPxRi7pKZn2gNJvRLkxUXQOeneksPC7Ex72J
	9O/OjOJv1/MxRcI/7G5wRM8xNauAGIrr4WUdYV1K9W4LJI4i9VpVAkjGUeTBnNejLK8m
	S49th4Mwc2h4CeZPr3BLHBCsmZQYvQLielf/zRvvV4OnuuYFZ7o3wpj6wOUrBG6Xr1LX
	5hn4lv6jBRHhc3P0MnNOUqaNih/Mg12lX1dxoPRHbYTfbc/wbtELEqlw82gYVjLqkP5T
	+GLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=SSjB5LFnYhMSpHyh5gfidKOCkOaNnb0ma098q9JkPRM=;
	b=kuL6kMAg6n4/yNoCYlE8fEdmxPrZfOaLRd/WhKNgS1sGH6WBDP8Zd4RRAs0XXU1+F+
	SXNv7ABgwyQkDHsn9R/hdAqU/VTnAGOSEzd/B0Wa3dqTH/5/RM0Qj2BxWtIp9uLBy0dV
	BndNI2KUOrpz3fL+qg9hPafTiiyytGPVLeGhmGosU8E4IEpc9rq0JzaLVqzqGJKnxu9T
	wzwZjDdgfYHuAAlJIpp5EsmaIiac7FxPJWJBM46Yhv9mj+xdYoWijBrYpmZn5avYWFhv
	H4lE9oZzexENHE+pIldjAO5bXkr1s7CR6n6LryYwLvmv8+VaeDSHms9mnQ2eshmDU/7d
	niYg==
X-Gm-Message-State: AIkVDXI4M61RL5JU+4NZcP+6XaRd8Ci9zR8Yd4kcOlDGDBZoBxxkmJdyGuXo22mS4CJpZpE2p8yLmdu1BtnwOg==
X-Received: by 10.46.71.207 with SMTP id u198mr7584194lja.42.1486551662986;
	Wed, 08 Feb 2017 03:01:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.163.200 with HTTP; Wed, 8 Feb 2017 03:00:42 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <CAMKF1soMAwn1rkQmEoduLS7GFZtFviwepgTaa73-kWee0OhUzA@mail.gmail.com>
References: <20170207193208.5051-1-fabio.berton@ossystems.com.br>
	<CAMKF1soMAwn1rkQmEoduLS7GFZtFviwepgTaa73-kWee0OhUzA@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 8 Feb 2017 09:00:42 -0200
Message-ID: <CAAPZna2=Mvpj-=ocJP-jTTxzLGfQF+RrnFowcQrzgiqDNvm9Fw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 1/3] libev: Add recipe for version 4.24
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
X-List-Received-Date: Wed, 08 Feb 2017 11:01:05 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'll merge and send a v2.

Thanks

On Wed, Feb 8, 2017 at 4:29 AM, Khem Raj <raj.khem@gmail.com> wrote:

> There are some shortcomings in this recipe
>
> Please merge the changes from
>
> https://github.com/kraj/meta-openembedded/blob/kraj/master/
> meta-oe/recipes-extended/libev/libev_4.24.bb
>
> On Tue, Feb 7, 2017 at 11:32 AM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> > ---
> >  meta-oe/recipes-connectivity/libev/libev_4.24.bb | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >  create mode 100644 meta-oe/recipes-connectivity/libev/libev_4.24.bb
> >
> > diff --git a/meta-oe/recipes-connectivity/libev/libev_4.24.bb
> b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
> > new file mode 100644
> > index 000000000..40f7dc710
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
> > @@ -0,0 +1,14 @@
> > +SUMMARY = "A full-featured and high-performance event loop that is
> loosely \
> > +modelled after libevent."
> > +HOMEPAGE = "http://software.schmorp.de/pkg/libev.html"
> > +LICENSE = "GPLv2+"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee3
> 47"
> > +
> > +SRC_URI = "http://dist.schmorp.de/${PN}/${PN}-${PV}.tar.gz"
> > +
> > +SRC_URI[md5sum] = "94459a5a22db041dec6f98424d6efe54"
> > +SRC_URI[sha256sum] = "973593d3479abdf657674a55afe5f7
> 8624b0e440614e2b8cb3a07f16d4d7f821"
> > +
> > +S = "${WORKDIR}/${PN}-${PV}"
> > +
> > +inherit autotools
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

