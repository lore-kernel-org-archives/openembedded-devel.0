Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HRa7u-0007s5-HO
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2007 21:31:15 +0100
Received: by an-out-0708.google.com with SMTP id c5so307346anc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2007 13:31:13 -0700 (PDT)
Received: by 10.100.133.9 with SMTP id g9mr2481800and.1173904273279;
	Wed, 14 Mar 2007 13:31:13 -0700 (PDT)
Received: from cube ( [82.193.98.7])
	by mx.google.com with ESMTP id r1sm12436685nzd.2007.03.14.13.31.11;
	Wed, 14 Mar 2007 13:31:12 -0700 (PDT)
Date: Wed, 14 Mar 2007 22:31:13 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1259297402.20070314223113@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1173869049.5834.16.camel@localhost.localdomain>
References: <1173869049.5834.16.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Re: RFC: Kernel image packaging
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
X-List-Received-Date: Wed, 14 Mar 2007 20:31:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Wednesday, March 14, 2007, 12:44:08 PM, you wrote:

> Hi,

> The kernel packaging has given various people concern for a while. The
> problem is some devices don't want a kernel binary installed into the
> root filesystem. We can do this at the moment but the kernel doesn't end
> up packaged and we would like those packages to be available even if
> they're not installed by default on a given device.

  Thanks for going for this issue!

[]

> For a device that doesn't want the kernel in the rootfs, it would simply
> set:

> RDEPENDS_kernel-base = ""

> in the appropriate kernel file. Perhaps the definition below should be
> a ?= and the above could then be set in the machine.conf file.

> Does anyone see a nicer way to handle this or have an alternative?

  I guess this is just the correct solution which handles this setting
where it should be, and doesn't compromise packaging.

> If nobody objects, this will probably get committed at the weekend.

  Hope to see it soon!

> Cheers,

> Richard

[]


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



