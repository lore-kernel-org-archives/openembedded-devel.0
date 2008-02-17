Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <acassis@gmail.com>) id 1JQlRt-0004Ur-9z
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Feb 2008 16:29:07 +0100
Received: by py-out-1112.google.com with SMTP id y77so1313110pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Feb 2008 07:28:28 -0800 (PST)
Received: by 10.142.201.3 with SMTP id y3mr3636162wff.120.1203262107886;
	Sun, 17 Feb 2008 07:28:27 -0800 (PST)
Received: by 10.142.127.2 with HTTP; Sun, 17 Feb 2008 07:28:27 -0800 (PST)
Message-ID: <37367b3a0802170728r226edd39r5e8fd7c2f4fa869b@mail.gmail.com>
Date: Sun, 17 Feb 2008 12:28:27 -0300
From: "Alan Carvalho de Assis" <acassis@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080214155508.GA4163@deadlock.dhs.org>
MIME-Version: 1.0
References: <20080214155508.GA4163@deadlock.dhs.org>
X-SA-Exim-Connect-IP: 64.233.166.178
X-SA-Exim-Mail-From: acassis@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: building uClinux using OE
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
X-List-Received-Date: Sun, 17 Feb 2008 15:29:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Jin,

2008/2/14, Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>:
> Hi,
sic
>
> uClibc is also already supported by OE, not sure if I would have to add
> an option for uC-libc.
>
Although uC-libc is not so "up to date" I think it can be important to
device with small flash memory (like Netburn MOD5272) since it create
smallest binary footprint.

> So basically it seems that almost everything that is needed is already there.
>
> What is missing?
>
> - applying elf2flt processing to produced binaries
>
> - have a way of knowing that the particular build is done for the uClinux
>   targets (maybe for some tweaks in .bb files if required or to apply patches
>   only when necessary, allthough ifdef __uClinux__ defines could be used)
>
> - not sure what else?
>
> I do not have any uClinux experience yet, and it seems to be quite difficult
> to gather all the bits and pieces of information, so I'd appreciate comments
> and suggestions, especially if you see that I am missing something.
>
> I'd also be interested in your thoughts on what would be the best way to
> integrate it into OE.
>

Do you add all kernels supported by uClinux distro (2.0.x, 2.4.x and 2.6.x) ?

I think your idea to add uClinux support on OE is fantastic!

> Kind regards,
> Jin
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


