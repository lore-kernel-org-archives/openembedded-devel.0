Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9420671633
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 17:54:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 24 Feb 2015 09:54:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,639,1418112000"; d="scan'208";a="459028882"
Received: from aryan3-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.21.162])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Feb 2015 09:39:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Bruce, Henry" <henry.bruce@intel.com>
Date: Tue, 24 Feb 2015 17:54:52 +0000
Message-ID: <2039424.onani1CoMk@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <CAP9ODKpdNS16hMUpiuogNna=YpO-m8LgCD5O87XBKFysKeQH3Q@mail.gmail.com>
References: <F81DC1078564A34BB4DA30CAE03814D127697625@ORSMSX104.amr.corp.intel.com>
	<CAP9ODKpdNS16hMUpiuogNna=YpO-m8LgCD5O87XBKFysKeQH3Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: Why no recipe for openjdk-headless?
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
X-List-Received-Date: Tue, 24 Feb 2015 17:55:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 24 February 2015 14:06:41 Otavio Salvador wrote:
> On Tue, Feb 24, 2015 at 4:00 AM, Bruce, Henry <henry.bruce@intel.com> wrote:
> > I'm putting together an OS image that includes  a Java headless
> > application. Having used the openjdk7-jre-headless package on Ubuntu I
> > was hoping to find a matching recipe, but sadly none exist,.  The
> > openjdk7-jre recipe requires the X11 distro feature which adds
> > unnecessary luggage for a small footprint IoT solution. Thanks to a
> > bbappend from https://github.com/woglinde/meta-java/issues/45 I can
> > minimize footprint, but a headless recipe would be a better solution. 
> > I'm fairly new to Yocto so could someone explain the challenges of a
> > headless recipe and where one might start when creating one?
>
> Patches are welcome. I think the link you posted has a good base of
> work done so you could start there and later follow the README file to
> post the patches here.

Perhaps more concretely, this would presumably be a place where you would use
PACKAGECONFIG to add and remove the appropriate dependencies and also options
in EXTRA_OECONF. It looks like that bbappend has a mixture of things that are
and aren't related to building without X. Henry, I'm not sure if you've come
across PACKAGECONFIG yet but just in case, here is an example from our
mpeg2dec recipe:

PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 libxext libxv"

(Obviously you'd need to use values appropriate for the openjdk recipe in
the second line.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

