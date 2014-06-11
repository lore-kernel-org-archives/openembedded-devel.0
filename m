Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0DEA96B71B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 19:10:54 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id l6so322774qcy.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 12:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=2nSjOX5aiD6LfKL3AVgME+N7iqlCSK6WsEntOGEOa2U=;
	b=IpyjGBGF7WGT1ZYG22xghxazjxt7MtJ4Tc2yAYrbiajx3WyFlsvcQN5ofWA+yy3tVS
	v2CZJBGsgZugj3RZ6SVJLNgN7OaYEWhzRKplGwvfpUtmbsxsR+6sRXvOBAc5xNBwkVeS
	JZOOYgDlUpUCMefySpuXmSIHtMJ0sT6F+t/aR01dRo+fJc2PruZNGcoV4QUQE4fslA4C
	1FfJTGjAYjXW9NEvBm+C9VN8Mtji2DUvvefowDJtGzdSC/kDLbcmkNUw0E3XgP+QAtIr
	q5Cp6NaDrD/nbZIjayjHVk8Iea3WOgvtdKZCBoiymWncLQ2gbuJHuCV9ITWQqElXwh1t
	Kjvw==
X-Gm-Message-State: ALoCoQleo+N63/d8/dWH4TbWIWnsHeP3DugiwtDhwJryQ2aumEChcPCX4RLCU0gr0lMJRZ7Sa2/A
X-Received: by 10.224.123.202 with SMTP id q10mr2795803qar.79.1402513855689;
	Wed, 11 Jun 2014 12:10:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.91.138 with HTTP; Wed, 11 Jun 2014 12:10:35 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Jun 2014 20:10:35 +0100
Message-ID: <CAJTo0LacXy5_wf39pX9z078RD0vU0BpvWsNTdZqcr6dMobpXWw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: RFC: automatic -dbg splitting
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
X-List-Received-Date: Wed, 11 Jun 2014 19:11:01 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

So yet again I was wrestling PACKAGES and FILES in an attempt to get
everything in the right place, the latest complication being ptest and
where they are in the PACKAGES chain making correct splitting tricky.

Again I wondered why debug packages need explicit FILES, and did a
quick hack as a proof of concept to put split debug objects and source
code into PN-dbg automatically, instead of through explicit FILES.
This hack is at best: it clears FILES_PN-dbg in bitbake.conf and as it
executes do_package FILES is set for each file it handles.  As PN-dbg
is at the beginning of PACKAGES it takes the right files before other
packages, apart from when other =+ is used as in ptest... so my
original reason for looking at this is still a problem.  This is in
ross/debug in poky-contrib, fwiw.

Before I look at this again and avoid FILES entirely, I should check
that my assumptions are valid in the greater community.  My big
assumptions here are that 1) every recipe has a single -dbg package,
2) every debug object belongs in that -dbg package, 3) only debug
objects and sources belong in that -dbg package.

I know there are recipes floating around that have multiple -dbg
packages, but I can't see a great rationale for that.  I also can't
see a reason why you'd want debug objects/sources outside of the -dbg
package, or something that wasn't a debug object or source inside the
-dbg package.

Anyone disagree?

Ross

