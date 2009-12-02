Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NFtas-0004QO-Nn for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 19:06:29 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NFtZL-0005G6-P0
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 19:04:51 +0100
Received: from 167.225.107.17 ([167.225.107.17])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Dec 2009 19:04:51 +0100
Received: from jerm7861 by 167.225.107.17 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Dec 2009 19:04:51 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Jeremy Williams <jerm7861@yahoo.com>
Date: Wed, 2 Dec 2009 18:04:21 +0000 (UTC)
Message-ID: <loom.20091202T190012-888@post.gmane.org>
References: <4A365C10.8020307@mta.it> <200906172309.40571.raj.khem@gmail.com>
	<4A3A5A84.6090602@mta.it> <200906261759.56663.raj.khem@gmail.com>
	<loom.20091130T021309-622@post.gmane.org>
	<19c1b8a90911301045i6934e415h9e2adb0f0f3ae82f@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 167.225.107.17 (Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1;
	.NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152;
	.NET CLR 3.5.30729; MS-RTC LM 8))
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: nof/libgcc_s.so installed instead of libgcc_s.so on powerpc
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
X-List-Received-Date: Wed, 02 Dec 2009 18:06:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Khem Raj <raj.khem <at> gmail.com> writes:

> 
> could be that its from one of intermediate gcc stages.
> 
libgcc_s.so.1 is provided by both the host package gcc-cross-sdk and the target 
package libgcc1, both installed to the same place. 

[root@msvm1 powerpc-angstrom-linux]# opkg files gcc-cross-sdk | grep libgcc
/usr/local/angstrom/powerpc/powerpc-angstrom-linux/lib/libgcc_s.so
/usr/local/angstrom/powerpc/powerpc-angstrom-linux/lib/nof/libgcc_s.so.1
/usr/local/angstrom/powerpc/lib/gcc/powerpc-angstrom-linux/4.3.3/libgcc.a
/usr/local/angstrom/powerpc/powerpc-angstrom-linux/lib/libgcc_s.so.1
/usr/local/angstrom/powerpc/powerpc-angstrom-linux/lib/nof/libgcc_s.so
/usr/local/angstrom/powerpc/lib/gcc/powerpc-angstrom-linux/4.3.3/libgcc_eh.a
[root@msvm1 powerpc-angstrom-linux]# opkg-target files libgcc1
Package libgcc1 (4.3.3-r7.1.4) is installed on root and has the following files:
/usr/local/angstrom/powerpc/powerpc-angstrom-linux/lib/libgcc_s.so.1

Since the files in the image directory of gcc-cross-sdk are correct, I suspect 
that it is the fault of libgcc1. I am looking into this further today...after I 
get past the latest meta-toolchain build issue... :)

-jeremy




