Received: from [65.55.251.16] (helo=outbound6-blu-R.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <Timothy.Bird@am.sony.com>) id 1Iv0C3-0002FP-7G
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2007 01:45:23 +0100
Received: from outbound6-blu.bigfish.com (localhost.localdomain [127.0.0.1])
	by outbound6-blu-R.bigfish.com (Postfix) with ESMTP id 7F317150254D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2007 00:43:05 +0000 (UTC)
Received: from mail204-blu-R.bigfish.com (unknown [10.1.252.3])
	by outbound6-blu.bigfish.com (Postfix) with ESMTP id 740A41D804B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2007 00:43:05 +0000 (UTC)
Received: from mail204-blu (localhost.localdomain [127.0.0.1])
	by mail204-blu-R.bigfish.com (Postfix) with ESMTP id 653E31C9028D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2007 00:43:05 +0000 (UTC)
X-BigFish: VP
X-MS-Exchange-Organization-Antispam-Report: OrigIP: 160.33.66.75;Service: EHS
Received: by mail204-blu (MessageSwitch) id 1195692185393366_31879;
	Thu, 22 Nov 2007 00:43:05 +0000 (UCT)
Received: from mail8.fw-sd.sony.com (mail8.fw-sd.sony.com [160.33.66.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail204-blu.bigfish.com (Postfix) with ESMTP id 343361A78063
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2007 00:43:05 +0000 (UTC)
Received: from mail3.sjc.in.sel.sony.com (mail3.sjc.in.sel.sony.com
	[43.134.1.211])
	by mail8.fw-sd.sony.com (8.12.11/8.12.11) with ESMTP id lAM0h4sO009651
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2007 00:43:04 GMT
Received: from USSDIXIM01.am.sony.com (ussdixim01.am.sony.com [43.130.140.33])
	by mail3.sjc.in.sel.sony.com (8.12.11/8.12.11) with ESMTP id
	lAM0h4UR002009 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2007 00:43:04 GMT
Received: from ussdixms03.am.sony.com ([43.130.140.23]) by
	USSDIXIM01.am.sony.com with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 21 Nov 2007 16:43:03 -0800
Received: from [43.135.148.58] ([43.135.148.58]) by ussdixms03.am.sony.com
	with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 21 Nov 2007 16:43:03 -0800
Message-ID: <4744D0F5.6000809@am.sony.com>
Date: Wed, 21 Nov 2007 16:44:37 -0800
From: Tim Bird <tim.bird@am.sony.com>
User-Agent: Thunderbird 1.5.0.4 (X11/20060614)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>	<4742217C.9060506@whitby.id.au>	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>	<4743201F.8000202@am.sony.com>	<617697824.20071121042405@gmail.com>	<474471B1.6020101@am.sony.com>	<1938272464.20071121202938@gmail.com>
	<4744BC8B.8020607@whitby.id.au>
In-Reply-To: <4744BC8B.8020607@whitby.id.au>
X-Enigmail-Version: 0.94.0.0
X-OriginalArrivalTime: 22 Nov 2007 00:43:03.0790 (UTC)
	FILETIME=[A3FFD0E0:01C82CA0]
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Thu, 22 Nov 2007 00:45:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Rod Whitby wrote:
> Does the OE core team simply not want people to use OE unless you are a
> distribution developer?

This is an interesting option.  I have thought what I would do
if I were making an OE-based distribution available to
my own downstream customers (CELF test lab users, at the moment).
I would NOT request that they learn OE.  The learning curve
is too steep.

In a former life, I worked on a large and ornate build system for
Lineo.  We did a fairly interesting thing there (IMO), where
we had a mechanism to capture all the individual commands used to
build the distribution, and create a straight shell script. The
script allowed a customer to reproduce that exact build.  The sources were
pre-expanded, and the whole thing was put into an archive that
people could download.

If users wanted to customize the build, they could apply patches
or modify individual commands in the script.  To actually insert
these back into Lineo's build system, it required that they learn
how our system worked (or, more commonly, they just sent their
changes back to us).

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================



