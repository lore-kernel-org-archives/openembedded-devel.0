Received: from [65.55.251.16] (helo=outbound7-blu-R.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <Timothy.Bird@am.sony.com>) id 1IuXe2-0001CC-34
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 19:16:22 +0100
Received: from outbound7-blu.bigfish.com (localhost.localdomain [127.0.0.1])
	by outbound7-blu-R.bigfish.com (Postfix) with ESMTP id EB52816FC3AD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 17:56:27 +0000 (UTC)
Received: from mail55-blu-R.bigfish.com (unknown [10.1.252.3])
	by outbound7-blu.bigfish.com (Postfix) with ESMTP id D272216A0043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 17:56:27 +0000 (UTC)
Received: from mail55-blu (localhost.localdomain [127.0.0.1])
	by mail55-blu-R.bigfish.com (Postfix) with ESMTP id 13CFB9881AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 17:56:27 +0000 (UTC)
X-BigFish: VP
X-MS-Exchange-Organization-Antispam-Report: OrigIP: 160.33.98.75;Service: EHS
Received: by mail55-blu (MessageSwitch) id 11955813872447_13295;
	Tue, 20 Nov 2007 17:56:27 +0000 (UCT)
Received: from mail8.fw-bc.sony.com (mail8.fw-bc.sony.com [160.33.98.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail55-blu.bigfish.com (Postfix) with ESMTP id DE107156006E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 17:56:24 +0000 (UTC)
Received: from mail3.sjc.in.sel.sony.com (mail3.sjc.in.sel.sony.com
	[43.134.1.211])
	by mail8.fw-bc.sony.com (8.12.11/8.12.11) with ESMTP id lAKHuNBQ013198
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 17:56:24 GMT
Received: from USSDIXIM02.am.sony.com (ussdixim02.am.sony.com [43.130.140.34])
	by mail3.sjc.in.sel.sony.com (8.12.11/8.12.11) with ESMTP id
	lAKHuNxt007628 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 17:56:23 GMT
Received: from ussdixms03.am.sony.com ([43.130.140.23]) by
	USSDIXIM02.am.sony.com with Microsoft SMTPSVC(5.0.2195.6713); 
	Tue, 20 Nov 2007 09:56:23 -0800
Received: from [43.135.148.58] ([43.135.148.58]) by ussdixms03.am.sony.com
	with Microsoft SMTPSVC(5.0.2195.6713); 
	Tue, 20 Nov 2007 09:56:22 -0800
Message-ID: <4743201F.8000202@am.sony.com>
Date: Tue, 20 Nov 2007 09:57:51 -0800
From: Tim Bird <tim.bird@am.sony.com>
User-Agent: Thunderbird 1.5.0.4 (X11/20060614)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>
	<4742217C.9060506@whitby.id.au>
	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
In-Reply-To: <74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
X-Enigmail-Version: 0.94.0.0
X-OriginalArrivalTime: 20 Nov 2007 17:56:22.0985 (UTC)
	FILETIME=[A992B390:01C82B9E]
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
X-List-Received-Date: Tue, 20 Nov 2007 18:16:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

pHilipp Zabel wrote:
> $ cat ~/bin/bitbake
> #!/bin/sh
> export OEDIR=${OEDIR:-$PWD}
> export BBPATH=${BBPATH:-$OEDIR/build:$OEDIR/openembedded}
> /usr/local/bin/bitbake $*

This is nice.  Can someone tell me why this isn't
the default behavior of bitbake now?  (I'm honestly
not trolling :-)   There must be some good reason
to allow bitbake to be used outside of a build
directory.  Make (which bitbake resembles
in some aspects), is sensitive to it's starting
directory.  Why not bitbake?
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================



