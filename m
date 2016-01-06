Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id C44BC731DF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 10:04:53 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g73so14916131ioe.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2016 02:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PCvtuPPXDLfIoI7kOOjBtyaBFu4MAirPQsGn1jDtENA=;
	b=Wai0ip+y9e1cqWm3mYGJdW3B3y6ByJh18QE1AFYCzKTeqz3/Dh1nGI1uqz01yf4pT+
	WIEDwVBywRwmdBq2yqoXovDVRMVTg/tIepyUN4HvrfDBNnwFPfvTdjAb7Jol0wGlTTGB
	Eq+r6F4npNAVydbGnY5rgl0Nxjjnuz6wW3r0luaJZQPrjtMXRjJBmZxlRZg2LugOHJJk
	QtX6E7EpsTX/B7rntKX9lo2T431s9cXnfWQJwWfGMkpMZMqoiMGOXyQgvG2A8AVn+rGL
	xW4VTfqQlgsnzjdynKvfltN1+oBhfzeqyZdhSxCFtoPZc5mY41b2qv4/XP+/Pe08/Oyn
	RONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PCvtuPPXDLfIoI7kOOjBtyaBFu4MAirPQsGn1jDtENA=;
	b=ipq9J5RtRjbSO/P+Bsg5aMKDn5veInTZi2AdK0HqS7zfxD/muQMqUtFXnuEs0ID4YJ
	7c4iV6eDo3C5KKOo1VSg5zDLK0Msfzx5vkPBpaB2zF4GYGjl6Xn/aPV4TLRuOgRTIEFh
	eYlpaRCW7ONM5ooRGtXoWzvmkvpK5fiaic6rLIW3c9BDVm3xJhN2m4uAOgEw9icvlB4n
	E5bXYMq5mFTHoravvX8y3Gv16ca8GF4Crq91sYbhuB2615AFdAsBqrNwcX0myBa9V4Eh
	JGNpTOLNn3vmkt4iAl/SgpAuFSaWdWtdK20PDcohiVo6bzRgCOPqlNq7yjpfLxqODON6
	WklQ==
X-Gm-Message-State: ALoCoQmAzfCSIfkBXYX49uTLbuKiVPwk8eQ5gYZwXkXBimyP9iREWjPWD8wsuPjaSBi6UV38jECfDPu28X4MqwrBnBc5Bh2e7pxmVbUKKq6X0PBKxnMhCHI=
X-Received: by 10.107.3.154 with SMTP id e26mr83249738ioi.99.1452074693924;
	Wed, 06 Jan 2016 02:04:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 6 Jan 2016 02:04:34 -0800 (PST)
In-Reply-To: <8AE765C7-71E0-46D1-A086-A86AEEFE3F6B@gmail.com>
References: <CAMKF1sqAGXMFx9re3YgB1u9aLPGRT9KRCR-0Drux=4P5igirWw@mail.gmail.com>
	<CAJTo0LbB02LR=6Yyy0-3=Hg1tjcdX=DmMKN2MEJqctnvi5n0Kg@mail.gmail.com>
	<A374083C-8331-42F2-A3F5-9D5EB49538F7@gmail.com>
	<2007809.DSH5DR9lFx@peggleto-mobl.ger.corp.intel.com>
	<8AE765C7-71E0-46D1-A086-A86AEEFE3F6B@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Jan 2016 10:04:34 +0000
Message-ID: <CAJTo0LazG6N2L898BLyr0jCZ-Xv5UK=GBs0DoXP+AK4_geQouQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFT] glibc 2.23
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
X-List-Received-Date: Wed, 06 Jan 2016 10:04:54 -0000
Content-Type: text/plain; charset=UTF-8

On 6 January 2016 at 03:16, Khem Raj <raj.khem@gmail.com> wrote:

> Same branch now has updated glibc patchset, if you have cycles please try
> once more.
>

Thanks Khem.  When meta-fsl-ppc doesn't cause several failures in every run
I'll re-fire it so we can actually get an all-green build!

Ross

