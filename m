Return-Path: <akini@synapticon.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 424616CAD8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 12:45:34 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id u14so5839561lbd.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2013 05:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=jYvN3hknsa+UhBwaZrziM9k4B++xghidHn6/2OkSKiM=;
	b=V5cMma67OOmbnoKpl45Xi8LmYMW3oCQN9Z/FBmzAEh/3SgeoQq5DOG5ggo8uApjFEQ
	kniOApct885/0Z/9aqK7bgpUSn8T2wYDMTmf59fwRH4AkMCX6nrkZY+kKyB4Zr4E4tJm
	iL2PsFSzdAfoOU/f8lp/Lu/cHkYzEoZe8Iq62qS7h78fB4lJWRCOfwY+U69fADqQ21Jl
	T2VMETD4r9rxMPsGbR38qBZk76yvk1Qaejp8bmfaC3Ec8WL+c2P9B8pQzKwMx9mqIGc+
	hzNMuwZVMR7+8FGM2IIgW1xKC879yWTm9T2ZGnsC82/MPHxTzxkIxsorgukEyArpMcwM
	m7LA==
X-Gm-Message-State: ALoCoQmWQayFtyQmgu9q9I3hHrkz0ICyD5z1d/qaAzCj+z6uXsbczbHBMpTWMPXYB8IFNS55V8A9
MIME-Version: 1.0
X-Received: by 10.152.5.162 with SMTP id t2mr24733090lat.1.1380631535279; Tue,
	01 Oct 2013 05:45:35 -0700 (PDT)
Received: by 10.114.3.8 with HTTP; Tue, 1 Oct 2013 05:45:35 -0700 (PDT)
In-Reply-To: <3515829.zzyu314FgW@helios>
References: <CAKS01onnW6h7NvP42gk4eE9k3KVskoTdPsntFD1sKaYt-xJNvA@mail.gmail.com>
	<CAJTo0Lb7+Kdzg-M6N=j0rb0CRAXZ1OWbCrxAkzNXGafWK9Fc+A@mail.gmail.com>
	<CAKS01o=pE_6PiWyk=Xct8ias3xFQ+X2CtLufLGsNeAXgj_wTkg@mail.gmail.com>
	<3515829.zzyu314FgW@helios>
Date: Tue, 1 Oct 2013 14:45:35 +0200
Message-ID: <CAKS01omncjA9JSDZaYWDfRMsQb41pDs1oODwX-Lqji=i2_+yrA@mail.gmail.com>
From: Anup Kini <akini@synapticon.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: unable to compile eglibc_2.18
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
X-List-Received-Date: Tue, 01 Oct 2013 12:45:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

Thanks for explaining the DISTRO_FEATURE_append. I am using it currently
but only with x11.

I looked up the valid values for DISTRO_FEATURES in OE below:
http://git.openembedded.org/openembedded-core/tree/meta/conf/distro/include/default-distrovars.inc
opengl doesnt seem to be a valid value here.

On the other hand, Poky from Yocto does provide opengl as a feature !!!
http://git.yoctoproject.org/cgit.cgi/poky/tree/meta-yocto/conf/distro/poky.conf

I am just trying to include virtual/libgl into my image and stuck with it
from the past two days :( :(





On 1 October 2013 14:37, Paul Eggleton <paul.eggleton@linux.intel.com>wrote:

> On Tuesday 01 October 2013 13:38:56 Anup Kini wrote:
> > Hence i used DISTRO_FEATURES += "opengl x11"
>
> To round this off, you cannot use += to set DISTRO_FEATURES in local.conf
> because the default value of DISTRO_FEATURES is set with ?= in the Poky /
> OE-
> Core distro configuration, and that is parsed after local.conf, thus if
> you set
> it to anything in local.conf the ?= statement containing all of the other
> normal values will not apply. Use _append instead which takes effect at
> the end
> of parsing, or more appropriately create your own distro configuration to
> set
> the value.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>



-- 

*Anup Kini
*Systems Engineer****
*
------------------------------
*

*Synapticon** * |  Cyber-Physical System Solutions ****

Mobile:

Direct:

+49 151 / 638 646 73

+49 7335 / 186 999 21

Fax:****
+49 7335 / 186 999 1


 **

 ****

synapticon.com <http://www.synapticon.com/>  |
@synapticon_co<https://twitter.com/#!/synapticon_co>
****

Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE
Secretary +49 7335 / 186 999 0  |  General Manager: Nikolai Ensslen
Registry Court Ulm HRB 725114  |  USt-ID DE271647127****

This message and any files transmitted with it are confidential and
intended
solely for the use of the individual or entity to whom they are addressed.
Please notify the sender immediately if you have received this e-mail by
mistake and delete it from your system.

