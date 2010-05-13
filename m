Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OCVXV-0000HU-4B
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 12:21:15 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OCVTj-0001Pj-2M for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 06:17:19 -0400
Date: Thu, 13 May 2010 06:17:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100513064037.GB3370@jama>
Message-ID: <alpine.DEB.2.00.1005130614210.7555@lynx>
References: <alpine.DEB.2.00.1005121722300.14972@lynx>
	<201005130953.59314.roman@khimov.ru> <20100513064037.GB3370@jama>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: some possible fixes in the OE web pages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 May 2010 10:21:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 13 May 2010, Martin Jansa wrote:

... my initially innocuous observation snipped ...

> On some systems (I have report from fedora and kubuntu) it still
> needs 0 in mmap_min_addr :/.
>
> Investigating why, but it's slow because it doesn't fail on my box.
>
> My guess is that this chunk from
> http://git.qemu.org/qemu.git/tree/linux-user/main.c cannot work on
> systems where normal user is not allowed to read
> /proc/sys/vm/mmap_min_addr and mmap_min_addr is not initialized with
> sane value.
>
>     /*
>      * Read in mmap_min_addr kernel parameter.  This value is used
>      * When loading the ELF image to determine whether guest_base
>      * is needed.  It is also used in mmap_find_vma.
>      */
>     {
>         FILE *fp;
>
>         if ((fp = fopen("/proc/sys/vm/mmap_min_addr", "r")) != NULL) {
>             unsigned long tmp;
>             if (fscanf(fp, "%lu", &tmp) == 1) {
>                 mmap_min_addr = tmp;
>                 qemu_log("host mmap_min_addr=0x%lx\n", mmap_min_addr);
>             }
>             fclose(fp);
>         }
>     }
>

  i'm confused ... unless my memory is failing, i've always been able
to at least *read* that file as a normal user since it was
world-readable, but this baffles me:

$ ls -l /proc/sys/vm/mmap_min_addr
-rw-r--r-- 1 root root 0 2010-05-12 20:42 /proc/sys/vm/mmap_min_addr
$ cat $_
cat: /proc/sys/vm/mmap_min_addr: Operation not permitted
$

  what am i misunderstanding?  the file perms state world-readable so
i'm assuming something in the actual kernel code is checking the
caller ID and rejecting the read request?

rday

-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


