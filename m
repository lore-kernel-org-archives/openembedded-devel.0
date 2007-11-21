Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1Iugw3-0004nT-6P
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 05:11:35 +0100
Received: by ug-out-1314.google.com with SMTP id m3so27044ugc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 20:09:22 -0800 (PST)
Received: by 10.67.20.3 with SMTP id x3mr1296783ugi.1195611845491;
	Tue, 20 Nov 2007 18:24:05 -0800 (PST)
Received: from ?192.168.2.2? ( [88.231.78.200])
	by mx.google.com with ESMTPS id 32sm919483ugd.2007.11.20.18.24.03
	(version=SSLv3 cipher=OTHER); Tue, 20 Nov 2007 18:24:04 -0800 (PST)
Date: Wed, 21 Nov 2007 04:24:05 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <617697824.20071121042405@gmail.com>
To: Tim Bird <tim.bird@am.sony.com>
In-Reply-To: <4743201F.8000202@am.sony.com>
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl>
	<4742217C.9060506@whitby.id.au>
	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
	<4743201F.8000202@am.sony.com>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 21 Nov 2007 04:11:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Tim,

Tuesday, November 20, 2007, 7:57:51 PM, you wrote:

> pHilipp Zabel wrote:
>> $ cat ~/bin/bitbake
>> #!/bin/sh
>> export OEDIR=${OEDIR:-$PWD}
>> export BBPATH=${BBPATH:-$OEDIR/build:$OEDIR/openembedded}
>> /usr/local/bin/bitbake $*

> This is nice.  Can someone tell me why this isn't
> the default behavior of bitbake now?  (I'm honestly
> not trolling :-)   There must be some good reason
> to allow bitbake to be used outside of a build
> directory.  Make (which bitbake resembles
> in some aspects), is sensitive to it's starting
> directory.  Why not bitbake?

   This is attempt to put it backwards. It's not to allow bitbake
to be used outside of build directory, it's to allow *source* be
outside build directory. Real hardcore make users might have heard
about VPATH envvar and out-of-source building.

   Why not default? Well, because what make builds is usually ones to
tens of megabytes, while bitbake builds tens to hundreds gigabytes.
Those who're brave to undertake such endeavour, are expected to get
some understanding of what they're going to be thru by learning and
doing some setup with their own hands. I'm sure that was original
motivation why bitbake and OE was setup that way. Of course, that was
quite some time ago, when disks were much smaller. Let's see if this
will change now.


>  -- Tim


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



