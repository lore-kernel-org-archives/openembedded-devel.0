Received: from [65.55.251.16] (helo=outbound5-blu-R.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <Timothy.Bird@am.sony.com>) id 1Iutqz-00011F-LS
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 18:59:13 +0100
Received: from outbound5-blu.bigfish.com (localhost.localdomain [127.0.0.1])
	by outbound5-blu-R.bigfish.com (Postfix) with ESMTP id 7D0B9A11C74;
	Wed, 21 Nov 2007 17:56:57 +0000 (UTC)
Received: from mail27-blu-R.bigfish.com (unknown [10.1.252.3])
	by outbound5-blu.bigfish.com (Postfix) with ESMTP id 5EF2C428051;
	Wed, 21 Nov 2007 17:56:57 +0000 (UTC)
Received: from mail27-blu (localhost.localdomain [127.0.0.1])
	by mail27-blu-R.bigfish.com (Postfix) with ESMTP id 120B2D80236;
	Wed, 21 Nov 2007 17:56:56 +0000 (UTC)
X-BigFish: VP
X-MS-Exchange-Organization-Antispam-Report: OrigIP: 160.33.98.75;Service: EHS
Received: by mail27-blu (MessageSwitch) id 1195667799524224_9557;
	Wed, 21 Nov 2007 17:56:39 +0000 (UCT)
Received: from mail8.fw-bc.sony.com (mail8.fw-bc.sony.com [160.33.98.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail27-blu.bigfish.com (Postfix) with ESMTP id 0B0932C805A;
	Wed, 21 Nov 2007 17:56:39 +0000 (UTC)
Received: from mail3.sjc.in.sel.sony.com (mail3.sjc.in.sel.sony.com
	[43.134.1.211])
	by mail8.fw-bc.sony.com (8.12.11/8.12.11) with ESMTP id lALHubkr003499; 
	Wed, 21 Nov 2007 17:56:38 GMT
Received: from USSDIXIM02.am.sony.com (ussdixim02.am.sony.com [43.130.140.34])
	by mail3.sjc.in.sel.sony.com (8.12.11/8.12.11) with ESMTP id
	lALHuba7019223; Wed, 21 Nov 2007 17:56:37 GMT
Received: from ussdixms03.am.sony.com ([43.130.140.23]) by
	USSDIXIM02.am.sony.com with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 21 Nov 2007 09:56:37 -0800
Received: from [43.135.148.58] ([43.135.148.58]) by ussdixms03.am.sony.com
	with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 21 Nov 2007 09:56:36 -0800
Message-ID: <474471B1.6020101@am.sony.com>
Date: Wed, 21 Nov 2007 09:58:09 -0800
From: Tim Bird <tim.bird@am.sony.com>
User-Agent: Thunderbird 1.5.0.4 (X11/20060614)
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl>
	<4742217C.9060506@whitby.id.au>
	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
	<4743201F.8000202@am.sony.com> <617697824.20071121042405@gmail.com>
In-Reply-To: <617697824.20071121042405@gmail.com>
X-Enigmail-Version: 0.94.0.0
X-OriginalArrivalTime: 21 Nov 2007 17:56:36.0980 (UTC)
	FILETIME=[DC53EB40:01C82C67]
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 21 Nov 2007 17:59:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
>    This is attempt to put it backwards. It's not to allow bitbake
> to be used outside of build directory, it's to allow *source* be
> outside build directory. Real hardcore make users might have heard
> about VPATH envvar and out-of-source building.

I use makefiles to build source code, or affect operations
in different locations in the file system, all the time.
It is convenient and familiar to have PWD be part of the
trigger for what operation I'm performing.  I realize
this is an artifact of years of using make.  But since
it's something I and most others have already learned,
it seems like it would be nice to leverage that experience.

> 
>    Why not default? Well, because what make builds is usually ones to
> tens of megabytes, while bitbake builds tens to hundreds gigabytes.

I don't see how this is relevant.  Maybe we are considering different
use cases.

> Those who're brave to undertake such endeavour, are expected to get
> some understanding of what they're going to be thru by learning and
> doing some setup with their own hands.
I have no idea why this should be so.

A few people have mentioned this similar theme - "if OE
hides the details, users won't be forced to learn what's
going on."  In the most general terms, computers EXIST
to allow people to not learn what's going on in complete detail.
So does OE.  It's just the invocation sequence and minimum
learning curve that people seem hung up on.

I have sensed that OE seems squarely targeted
at distro developers rather than end users.  Maybe this is
the disconnect.  The use cases for OE for developers and
users will be quite different.

> I'm sure that was original
> motivation why bitbake and OE was setup that way. Of course, that was
> quite some time ago, when disks were much smaller. Let's see if this
> will change now.

Indeed.  Thanks for the response.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================



