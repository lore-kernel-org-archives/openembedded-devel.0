Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leonid.titov@gmail.com>) id 1RsXxl-0002K1-3l
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 12:02:53 +0100
Received: by bke17 with SMTP id 17so945405bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 02:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=2lMTL5K0DlvH5JjtFhf7FwFoXlHht1H+QUzMRiJBcaM=;
	b=HTcj5CSgoH1qx/rydpNSYiypQQYZ+GEKnyZFMh0JbDOjHyBOc8Ys16HTy+AXiWt95x
	VC2JR8vLX+T41jNLjBrjwOIO05bpdGDJN9WzKkhbqN3EcHa5DPqTPEh/aUpyrQTr3F8B
	dbz2Gc1VH9AlNduE0jiO+vLLvYoSlsxQ1kSGo=
Received: by 10.204.154.136 with SMTP id o8mr12932060bkw.112.1328093698428;
	Wed, 01 Feb 2012 02:54:58 -0800 (PST)
Received: from [192.168.0.178] ([84.52.99.11]) by mx.google.com with ESMTPS id
	ci12sm53307155bkb.13.2012.02.01.02.54.57
	(version=SSLv3 cipher=OTHER); Wed, 01 Feb 2012 02:54:57 -0800 (PST)
Message-ID: <4F291A06.4000406@gmail.com>
Date: Wed, 01 Feb 2012 14:55:02 +0400
From: =?UTF-8?B?0JvQtdC+0L3QuNC0INCi0LjRgtC+0LI=?=
 <leonid.titov@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.0;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Can't build openembedded: fail in picosam9_git.bb
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
X-List-Received-Date: Wed, 01 Feb 2012 11:02:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello all!

I've got a problem with building console-image for MACHINE=picosam9. It 
fails while processing picosam9_git.bb with these messages:

> NOTE: Running task 1473 of 3919 (ID: 516, 
> /home/arm/stuff/openembedded/recipes/linux/picosam9_git.bb, do_fetch)
> --2012-02-01 05:17:36--  
> http://www.angstrom-distribution.org/unstable/sources/git_gitorious.org.picopc-kernel.kernel.git_5d564f090ee99a0570a2cc912ebc30b65922f7bb.tar.gz 
>
> Resolving www.angstrom-distribution.org... NOTE: package 
> picosam9-2.6.32+gitr5d564f090ee99a0570a2cc912ebc30b65922f7bb-r0: task 
> do_fetch: Started
> NOTE: fetch 
> http://www.angstrom-distribution.org/unstable/sources/git_gitorious.org.picopc-kernel.kernel.git_5d564f090ee99a0570a2cc912ebc30b65922f7bb.tar.gz 
>
> 188.40.83.200
> Connecting to www.angstrom-distribution.org|188.40.83.200|:80... 
> connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2012-02-01 05:17:37 ERROR 404: Not Found.
>
> Cloning into 
> /home/arm/sources/git/gitorious.org.picopc-kernel.kernel.git...
> fatal: The remote end hung up unexpectedly
> fatal: early EOF
> fatal: index-pack failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of 
> /home/arm/stuff/openembedded/recipes/linux/picosam9_git.bb do_fetch 
> failed
> ERROR: Task 516 
> (/home/arm/stuff/openembedded/recipes/linux/picosam9_git.bb, do_fetch) 
> failed with 256
> ERROR: '/home/arm/stuff/openembedded/recipes/linux/picosam9_git.bb' 
> failed
> NOTE: Task failed: Fetch failed: Unable to fetch URL 
> git://gitorious.org/picopc-kernel/kernel.git;protocol=git;branch=minibox-picopc-2.6.32 
> from any source.
> NOTE: package 
> picosam9-2.6.32+gitr5d564f090ee99a0570a2cc912ebc30b65922f7bb-r0: task 
> do_fetch: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of 
> /home/arm/stuff/openembedded/recipes/linux/picosam9_git.bb do_fetch 
> failed
> ERROR: Task 516 
> (/home/arm/stuff/openembedded/recipes/linux/picosam9_git.bb, do_fetch) 
> failed with 256

What can be a problem?

Thanks in advance!


