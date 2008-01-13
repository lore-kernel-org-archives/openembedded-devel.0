Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <theqmann@gmail.com>) id 1JEApm-00027a-Un
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Jan 2008 22:57:39 +0100
Received: by wa-out-1112.google.com with SMTP id l24so3532932waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2008 13:57:11 -0800 (PST)
Received: by 10.114.171.1 with SMTP id t1mr1048597wae.83.1200261429779;
	Sun, 13 Jan 2008 13:57:09 -0800 (PST)
Received: by 10.114.47.16 with HTTP; Sun, 13 Jan 2008 13:57:09 -0800 (PST)
Message-ID: <c67f1650801131357t54ba579qb060eb18c709cc64@mail.gmail.com>
Date: Sun, 13 Jan 2008 13:57:09 -0800
From: QMan <theqmann@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: kernel-module-* have disappeared?
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
X-List-Received-Date: Sun, 13 Jan 2008 21:57:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Nevermind, was just a common occurrance of brain fart.

-John

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of QMan
> Sent: Sunday, January 13, 2008 1:14 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] kernel-module-* have disappeared?
>
> I was trying to build console-image today, and
> task-base-extended complained about not being able to satisfy
> any kernel-module-* recommendations:
>
> | task-base-kernel26: unsatisfied recommendation for
> kernel-module-input
> | task-base-kernel26: unsatisfied recommendation for
> | kernel-module-uinput
> | task-base-kernel26: unsatisfied recommendation for
> | kernel-module-rtc-dev
> | task-base-kernel26: unsatisfied recommendation for
> | kernel-module-rtc-proc
> | task-base-kernel26: unsatisfied recommendation for
> | kernel-module-rtc-sysfs
> | task-base-irda: unsatisfied recommendation for
> | kernel-module-pxaficp-ir
> | task-base-irda: unsatisfied recommendation for kernel-module-irport
> | task-base-irda: unsatisfied recommendation for kernel-module-irtty
> | task-base-pcmcia: unsatisfied recommendation for
> | kernel-module-hostap-cs
> | task-base-pcmcia: unsatisfied recommendation for
> | kernel-module-spectrum-cs
> | task-base-pcmcia: unsatisfied recommendation for
> kernel-module-airo-cs
> | task-base-usbgadget: unsatisfied recommendation for
> kernel-module-pxa27x_udc
> | task-base-usbgadget: unsatisfied recommendation for
> | kernel-module-gadgetfs
> | task-base-usbgadget: unsatisfied recommendation for
> kernel-module-g-file-storage
> | task-base-usbgadget: unsatisfied recommendation for
> | kernel-module-g-serial
> | task-base-usbgadget: unsatisfied recommendation for
> | kernel-module-g-ether
> | task-base-wifi: unsatisfied recommendation for kernel-module-aes
> | task-base-ppp: unsatisfied recommendation for kernel-module-ppp-mppe
> | task-base-bluetooth: unsatisfied recommendation for
> kernel-module-bluetooth3c-cs
> | task-base-bluetooth: unsatisfied recommendation for
> kernel-module-bluetoothuart-cs
>
>  and then failed on not being able to satisfy kernel-module-ext3:
>
> | ERROR: Cannot satisfy the following dependencies for
> task-base-extended:
> |        kernel-module-ext3
>
>
> Suspecting mischief, I quickly searched for kernel-module targets:
>
> qbot@qphoenix:~/stuff/org.openembedded.dev$ find ./ | grep
> kernel-module
> ./packages/wlags-modules/kernel-module-wlags49-h1-cs_718.bb
> ./packages/wlags-modules/kernel-module-wlags49-h2-cs_718.bb
> qbot@qphoenix:~/stuff/org.openembedded.dev$
>
> Something seems to have happened to all the kernel-module
> targets on my system.  Can anyone else verify this happened?
>
>
> -John
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

