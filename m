Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OCXT2-0002MQ-3Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 14:24:45 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OCXPF-0003tk-SE for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 08:20:49 -0400
Date: Thu, 13 May 2010 08:20:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201005131223.22252.khimov@altell.ru>
Message-ID: <alpine.DEB.2.00.1005130815410.8372@lynx>
References: <alpine.DEB.2.00.1005121722300.14972@lynx>
	<201005130953.59314.roman@khimov.ru> <20100513064037.GB3370@jama>
	<201005131223.22252.khimov@altell.ru>
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
X-List-Received-Date: Thu, 13 May 2010 12:24:45 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 13 May 2010, Roman I Khimov wrote:

... mmap_min_addr stuff snipped ...

> The real solution is in the kernel, it should be fixed for latest
> Ubuntu and hopefully Fedora will catch up on this issue too.
>
> http://git.kernel.org/?p=linux/kernel/git/jmorris/security-
> testing-2.6.git;a=commitdiff;h=822cceec7248013821d655545ea45d1c6a9d15b3
>
> Interesting that openSUSE with 2.6.31 kernel doesn't have such
> problems... And our main build machine with Debian stable + 2.6.30
> kernel works fine too. Probably this check got introduced in 2.6.32.

  not sure which kernel *version* it showed up in, but it appears to
be a result of this commit from nov of last year (which you can see
ended up being unnecessarily restrictive -- d'oh!):

commit 0e1a6ef2dea88101b056b6d9984f3325c5efced3
Author: Kees Cook <kees.cook@canonical.com>
Date:   Sun Nov 8 09:37:00 2009 -0800

    sysctl: require CAP_SYS_RAWIO to set mmap_min_addr

    Currently the mmap_min_addr value can only be bypassed during mmap when
    the task has CAP_SYS_RAWIO.  However, the mmap_min_addr sysctl value itself
    can be adjusted to 0 if euid == 0, allowing a bypass without CAP_SYS_RAWIO.
    This patch adds a check for the capability before allowing mmap_min_addr to
    be changed.

    Signed-off-by: Kees Cook <kees.cook@canonical.com>
    Acked-by: Serge Hallyn <serue@us.ibm.com>
    Signed-off-by: James Morris <jmorris@namei.org>

diff --git a/security/min_addr.c b/security/min_addr.c
index c844eed..fc43c9d 100644
--- a/security/min_addr.c
+++ b/security/min_addr.c
@@ -33,6 +33,9 @@ int mmap_min_addr_handler(struct ctl_table *table,
int write,
 {
        int ret;

+       if (!capable(CAP_SYS_RAWIO))
+               return -EPERM;
+
        ret = proc_doulongvec_minmax(table, write, buffer, lenp, ppos);

        update_mmap_min_addr();


whereupon the security-related fix is, as was mentioned previously,
submitted here:

http://git.kernel.org/?p=linux/kernel/git/jmorris/security-testing-2.6.git;a=commitdiff;h=822cceec7248013821d655545ea45d1c6a9d15b3


rday

-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


