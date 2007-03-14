Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <hvontres@gmail.com>) id 1HRatT-0008Qe-R2
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2007 22:20:24 +0100
Received: by nf-out-0910.google.com with SMTP id l24so386914nfc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2007 14:20:21 -0700 (PDT)
Received: by 10.78.200.3 with SMTP id x3mr1477333huf.1173907220449;
	Wed, 14 Mar 2007 14:20:20 -0700 (PDT)
Received: by 10.78.17.3 with HTTP; Wed, 14 Mar 2007 14:20:20 -0700 (PDT)
Message-ID: <a7f8874a0703141420i409e8b3r3f9b33e977e00af0@mail.gmail.com>
Date: Wed, 14 Mar 2007 14:20:20 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1173869049.5834.16.camel@localhost.localdomain>
MIME-Version: 1.0
References: <1173869049.5834.16.camel@localhost.localdomain>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
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
X-List-Received-Date: Wed, 14 Mar 2007 21:20:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 3/14/07, Richard Purdie <rpurdie@rpsys.net> wrote:
>
> Hi,
>
> The kernel packaging has given various people concern for a while. The
> problem is some devices don't want a kernel binary installed into the
> root filesystem. We can do this at the moment but the kernel doesn't end
> up packaged and we would like those packages to be available even if
> they're not installed by default on a given device.
>
> I'm proposing the patch below. This basically adds a
> kernel-${KERNEL_VERSION} package to the mix. This package is in the
> Dependencies of all kernel modules instead of
> kernel-image-${KERNEL_VERSION}. As standard, kernel-${KERNEL_VERSION}
> also RDEPENDS on the kernel-image.
>
> For a device that doesn't want the kernel in the rootfs, it would simply
> set:
>
> RDEPENDS_kernel-base = ""
>
> in the appropriate kernel file. Perhaps the definition below should be
> a ?= and the above could then be set in the machine.conf file.
>
> Does anyone see a nicer way to handle this or have an alternative?
>
> If nobody objects, this will probably get committed at the weekend.


Looks pretty clean and straightforward to me. :)

