Return-Path: <ashcharles@gmail.com>
Received: from mail-ve0-f170.google.com (unknown [209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 73DD06FAC9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 15:16:28 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id db11so10862919veb.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 08:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=BGKbvTTSzSzrZ+n/xWNFo9pNMLjS/xhrmAc0GBiWgfI=;
	b=GIVufssYjHFjcx16YvYXtBg7psOuVJbLhfBg1hSUhPJw6QloJufdRaGB6Q6ltN8lCc
	oWPvV26JqJY4dGFnEJcbLNHFt8kocIXlHtjz4DASQwcdpopQ5vMEKloNOpLHW/f5my3P
	Wqwk7IQLG3WK5Qj9OFT2SDa0EnR+XunHB3nV303UdRbb6849adPPAXX6CUxIaWxmY4Sk
	L5RP+B3MFaty94NuHwE6Dqxhk4XMI5VGTegFh7olZBp5QFkhQhU4tvld2vxVyQ+47O3s
	x6AWiSFa2eVxhGNiOJ9X/iTPOdyY93P7ahb4hIxW/OkjXQaiCQVaZC9cAzOv+U5xrjJs
	59Yw==
X-Received: by 10.53.12.229 with SMTP id et5mr23513643vdd.32.1401203789016;
	Tue, 27 May 2014 08:16:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.227.67 with HTTP; Tue, 27 May 2014 08:15:58 -0700 (PDT)
In-Reply-To: <20140527091813.GA2426@jama>
References: <1401132459-26526-1-git-send-email-ashcharles@gmail.com>
	<20140527091813.GA2426@jama>
From: Ash Charles <ashcharles@gmail.com>
Date: Tue, 27 May 2014 08:15:58 -0700
Message-ID: <CAK8F28=UYXL+YmzrCcWnYppsSNhUA3vJq92awZqvV=ihsL8bTA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] eject: link po subdirectory for out-of-tree build
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
X-List-Received-Date: Tue, 27 May 2014 15:16:34 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 27, 2014 at 2:18 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> This will make version going backwards and we don't want that, you can
> drop PR only when incrementing PV or PE.
For sure.  I'l do this for v2.

@Otavio: I tried modifying the variable as you suggested as well as a
couple other ways in both the Makefile.in and Makefile.am.  Because
autoreconf gets run in do_configure though, any changes either break
the configuration step or get wiped out.  The source code explicitly
mentions that the Makefile in the po subdirectory is not using
automake, I'm stuck either copying the (100K) po subdir over to the
build directory or resorting to automake-brokensep.  What is
preferable for my updated patch?  I'm keen to un-break my build ;-).

--Ash

