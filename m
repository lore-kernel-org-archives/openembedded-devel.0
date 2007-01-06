Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1H3FBD-0007lz-RK
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Jan 2007 18:18:03 +0100
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id BB8D541287A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jan 2007 11:16:40 -0600 (CST)
Message-ID: <0b4201c731b6$537d7bd0$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 6 Jan 2007 11:15:51 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: Re: [oe-commits] org.oe.dev madwifi-ng: add slugos support and bump to latest snapshot
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Jan 2007 17:18:04 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

> Is there a reason why these patches are slugos-specific? I'm
> wondering because this new version of madwifi does not build for me
> anymore because the xscale patches are out of date. It does work if I
> use the slugos patches though.  The wackelf patch is handy as well.

I'm glad the changes are more generally useful than I originally thought -
they are only slugos specific to keep them from "polluting" the builds for
other devices/toolchains.

What target are you building?  Perhaps, as Koen observed, there needs to be
a different means to select the set of patches to apply, rather than using
"slugos".  Perhaps there's a very easy way to express such a conditional:
"if building xscale && compiler version >= 4 && soft_float" might do it?

Mike (mwester)




