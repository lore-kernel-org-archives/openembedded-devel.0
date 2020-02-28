Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id CDC2160225
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 13:38:41 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l5so2994690wrx.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 05:38:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=L2VNzkIyOtj6S5gJtYgx6blI6B69v6+imtcYVVitnoA=;
	b=jEdn5Dja9PcuXqg12lrBsop85gJFBL+gJ2rYClHKUEiK5JH1clmzIAgIEaLEthGixZ
	ma8fX4nSYmjLKYXRcKkA8R9ioAizAEq3VnJDj2v8YrjBlH11jc+UVq04xoPhZOZQobd8
	DAy91K/JxTlcDPdUTpbJ8GzUNtJofhF88h2bQBAhtK+hszdVqXlmgtVHBPUNh+GG14Vv
	Ig8y+v++E+MTejJxb+xYdc5MEkTe5+ZOa1w+FOx5wpDuJQShG/jLuMPrZOCKWPkEX11v
	aKQdxVdpx3y8XefdThyG6bcTPIJEhr+gP7Spkc72BoZOsOCBrI3oWVFK8WV4PRYPFyPe
	xBwg==
X-Gm-Message-State: APjAAAWg/Df1vFX/8/Ea5MdmiJYqVBaYn9hthR/nsvjdsPge+iMt3ubD
	haiLe/wmkTEDoJYJZNP/mDrBdfqD
X-Google-Smtp-Source: APXvYqwSbHDvHV46M3FTi5/jfLbNJTr+V2LCBc94pYJUXME0bz+hnWMjW0p2YWBYxwUtxlM6nnJqpw==
X-Received: by 2002:a5d:4382:: with SMTP id i2mr4751020wrq.424.1582897122338; 
	Fri, 28 Feb 2020 05:38:42 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	f207sm2320850wme.9.2020.02.28.05.38.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 05:38:41 -0800 (PST)
Message-ID: <f631cd769f24e5130b2a17aaf33c1f781a6eeb4d.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Date: Fri, 28 Feb 2020 13:38:40 +0000
In-Reply-To: <903a8d79-9298-5f7e-db68-d3e15c62121e@gmail.com>
References: <20200227164143.24022-1-git@andred.net>
	<903a8d79-9298-5f7e-db68-d3e15c62121e@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [meta-multimedia][PATCH] meta-multimedia: s|${COREBASE}/meta/files/common-licenses|${COMMON_LICENSE_DIR}
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
X-List-Received-Date: Fri, 28 Feb 2020 13:38:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


On Thu, 2020-02-27 at 09:08 -0800, Khem Raj wrote:
> Hi André
> 
> Thanks for doing this cleanup, but perhaps subject could be more simple 
> and readable and this detail of sed operation could be in details.

Done (although I left out the sed arguments, as it's trivial :-)

Cheers,
Andre'


> 
> On 2/27/20 8:41 AM, André Draszik wrote:
> > Signed-off-by: André Draszik <git@andred.net>
> > ---
> >   .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb     | 2 +-
> >   .../recipes-multimedia/sample-content/bigbuckbunny-480p.bb      | 2 +-
> >   .../recipes-multimedia/sample-content/bigbuckbunny-720p.bb      | 2 +-
> >   .../recipes-multimedia/sample-content/tearsofsteel-1080p.bb     | 2 +-
> >   4 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-
> > multimedia/sample-content/bigbuckbunny-1080p.bb
> > index cee386c2a..70eb6e4be 100644
> > --- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
> > +++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
> > @@ -1,7 +1,7 @@
> >   SUMMARY = "Big Buck Bunny movie - 1080P"
> >   LICENSE = "CC-BY-3.0"
> >   # http://www.bigbuckbunny.org/index.php/about/
> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
> > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
> >   
> >   SRC_URI = "http://themazzone.com/big_buck_bunny_1080p_surround.avi"
> >   SRC_URI[md5sum] = "223991c8b33564eb77988a4c13c1c76a"
> > diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb b/meta-multimedia/recipes-
> > multimedia/sample-content/bigbuckbunny-480p.bb
> > index d395b9206..df2368996 100644
> > --- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
> > +++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
> > @@ -1,7 +1,7 @@
> >   SUMMARY = "Big Buck Bunny movie - 480P"
> >   LICENSE = "CC-BY-3.0"
> >   # http://www.bigbuckbunny.org/index.php/about/
> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
> > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
> >   
> >   SRC_URI = "https://archive.org/download/BigBuckBunny/big_buck_bunny_480p_surround-fix.avi"
> >   SRC_URI[md5sum] = "ed7ed01e9aefba8ddd77c13332cec120"
> > diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb b/meta-multimedia/recipes-
> > multimedia/sample-content/bigbuckbunny-720p.bb
> > index 20d562749..cb8ece0cb 100644
> > --- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
> > +++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
> > @@ -1,7 +1,7 @@
> >   SUMMARY = "Big Buck Bunny movie - 720P"
> >   LICENSE = "CC-BY-3.0"
> >   # http://www.bigbuckbunny.org/index.php/about/
> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
> > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
> >   
> >   SRC_URI = "https://archive.org/download/BigBuckBunny/big_buck_bunny_720p_surround.avi"
> >   SRC_URI[md5sum] = "0da8fe124595f5b206d64cb1400bbefc"
> > diff --git a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb b/meta-multimedia/recipes-
> > multimedia/sample-content/tearsofsteel-1080p.bb
> > index 0582a4856..04cbd2e34 100644
> > --- a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
> > +++ b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
> > @@ -1,6 +1,6 @@
> >   SUMMARY = "Tears of Steel movie - 1080P"
> >   LICENSE = "CC-BY-3.0"
> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
> > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
> >   
> >   SRC_URI = "http://ftp.nluug.nl/pub/graphics/blender/demo/movies/ToS/ToS-4k-1920.mov"
> >   SRC_URI[md5sum] = "e3fee55b1779c553e37b1d3988e6fad6"
> > 


