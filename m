Received: from [209.85.146.179] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JcqEf-0007W9-4y
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Mar 2008 00:01:17 +0100
Received: by wa-out-1112.google.com with SMTP id l24so2464347waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2008 16:01:16 -0700 (PDT)
Received: by 10.115.111.1 with SMTP id o1mr6874785wam.87.1206140476044;
	Fri, 21 Mar 2008 16:01:16 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Fri, 21 Mar 2008 16:01:15 -0700 (PDT)
Message-ID: <19c1b8a90803211601r39c27fddx67d1fab239a81f84@mail.gmail.com>
Date: Fri, 21 Mar 2008 16:01:15 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1206124717.4538.3.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <F4CE5C74-22A4-4616-BE98-DD104EF609AC@student.utwente.nl>
	<1206124717.4538.3.camel@dax.rpnet.com>
Subject: Re: Kernel developers strike again - aka "why wpa is broken" aka "why I have 2 kernels installed"
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
X-List-Received-Date: Fri, 21 Mar 2008 23:01:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Mar 21, 2008 at 11:38 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> Hi,
>
>
>  On Fri, 2008-03-21 at 10:38 +0100, Koen Kooi wrote:
>  > In their supreme genius the kernel people have renamed the aes crypto
>  > module in 2.6.24, which leads to a lot of problems for people using
>  > feeds. The old modules doesn't get replaced by the new one (different
>  > name), so task-base will pull in the old aes-module and hence the old
>  > kernel. It doesn't pull in the new aes module, so your crypto is broken.
>  >
>  > A good solution would be for task-base to check the kernel version and
>  > adjust RRECOMMENDS accordingly.
>
>  This isn't a good solution since we have no way of handling package A
>  requires to know which version of package B was built.
>
>  Yes, the kernel can write a file to staging which task-base then reads
>  but this will only work with very precise ordering and I'm not keen on
>  promoting that.
>
>  How about we set:
>
>  RREPLACES_kernel-module-new-name = "kernel-module-old-name"
>  RCONFLICTS_kernel-module-new-name = "kernel-module-old-name"

something like "Obsoletes" feature of rpm

Khem


