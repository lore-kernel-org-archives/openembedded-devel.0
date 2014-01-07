Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id 177A66C6F9
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2014 13:31:22 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.79.21) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Tue, 7 Jan 2014 14:31:11 +0100
Date: Tue, 7 Jan 2014 14:31:20 +0100
From: Anders Darander <anders@chargestorm.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20140107133119.GB2574@ad.chargestorm.se>
Mail-Followup-To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <cover.1389098317.git.anders@chargestorm.se>
	<9df199bd032977929fa715af7710e4607a19f91e.1389098317.git.anders@chargestorm.se>
	<20140107130849.GP3709@jama>
MIME-Version: 1.0
In-Reply-To: <20140107130849.GP3709@jama>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [meta-oe][PATCH 1/1] ktap: add configs for elfutils and ffi
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jan 2014 13:31:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Martin Jansa <martin.jansa@gmail.com> [140107 14:08]:

> On Tue, Jan 07, 2014 at 01:39:49PM +0100, Anders Darander wrote:
> > diff --git a/meta-oe/recipes-kernel/ktap/ktap_0.4.bb b/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
> > index f5dd62f..a703aec 100644
> > --- a/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
> > +++ b/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
> > @@ -5,8 +5,18 @@ require ktap.inc
> >  SUMMARY = "KTAP is a scripting dynamic tracing tool for Linux"
> >  DEPENDS = "ktap-module"

> > +#Available package configs:
> > +# libelf - needed to resolve symbols in DSO and for sdt
> > +# ffi    - only supports x86_64 for now!. Needs to be enabled for ktap-module too.
> > +PACKAGECONFIG ?= "libelf"
> > +
> > +PACKAGECONFIG[libelf] = ",,elfutils"
> > +PACKAGECONFIG[ffi] = ""

> This line is already in ktap.inc

Ah, damn it... Thanks for spotting this!

I had it here first, before realising that I needed the same options for
ktap-module. I'll wait a day or two before I respin the patch, to allow
for anyone else to comment on it.

Cheers,
Anders

> Otherwise looks good, I like deterministic shiny things.

-- 
Anders Darander
ChargeStorm AB / eStorm AB

