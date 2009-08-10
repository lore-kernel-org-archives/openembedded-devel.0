Received: from [209.85.222.193] (helo=mail-pz0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mac5s-0000if-Ti
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 23:07:51 +0200
Received: by pzk31 with SMTP id 31so56918pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 13:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=ZZ04sKzykn4iDsQzlyuPnIYxOVMiE4mES85IDuG5SSk=;
	b=VPpJ4joEbN0UAE0RFButsj4lADK6w9ueg+esArd6/yUKkloUSJNw7K8FE5CR5NNhCx
	JKVRz6z/y11FvGkL70KMK8+KKBzfqeONMYAshvL2EHbzjWPTY+9b2a2HVRrQztOnUfXH
	2VJh33p+hUfnCR+z52PIugTS1Ij0hNDcPEkPU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=pEejUA/nOwWsffZzWCCcjx1sSCpko7gFvWL53bTrmT5jXfxehd4vZOsUwWKfDuOzIN
	26JFz/+4ORhQYpiIn8ytVZo27UGCXsJf4dfzF60TdoX2k2i7UPSNjQ0Oh3yh8buPYWtJ
	9xthdSWW3aIt6vXW8P3+c9FxCt90yMQ8sDk3E=
Received: by 10.114.177.10 with SMTP id z10mr6803554wae.219.1249937492677;
	Mon, 10 Aug 2009 13:51:32 -0700 (PDT)
Received: from gmail.com (adsl-71-146-8-242.dsl.pltn13.sbcglobal.net
	[71.146.8.242])
	by mx.google.com with ESMTPS id j26sm7967999waf.28.2009.08.10.13.51.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 Aug 2009 13:51:31 -0700 (PDT)
Date: Mon, 10 Aug 2009 13:51:24 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090810205124.GA15812@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Missing OMAP35x_Graphics_SDK_setuplinux_3_00_00_08.bin during libgles-omap3_3.00.00.08.bb
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
X-List-Received-Date: Mon, 10 Aug 2009 21:07:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I am getting this error.

NOTE: Unpacking
../openembedded/recipes/powervr-drivers/libgles-omap3/OMAP35x_Graphics_SDK_setuplinux_3_00_00_08.bin
to
uclibc/work/armv5te-oe-linux-uclibcgnueabi/libgles-omap3-3.00.00.08-r0/
cp: cannot stat
`/home/kraj/work/oe/openembedded/recipes/powervr-drivers/libgles-omap3/OMAP35x_Graphics_SDK_setuplinux_3_00_00_08.bin':
No such file or directory
NOTE: Task failed: 
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/kraj/work/oe/openembedded/recipes/powervr-drivers/libgles-omap3_3.00.00.08.bb
do_unpack failed
ERROR: Task 497
(/home/kraj/work/oe/openembedded/recipes/powervr-drivers/libgles-omap3_3.00.00.08.bb,
do_unpack) failed


It seems like this file
/home/kraj/work/oe/openembedded/recipes/powervr-drivers/libgles-omap3/OMAP35x_Graphics_SDK_setuplinux_3_00_00_08.bin
is missing in my case.

Where should it come from

Thx

-Khem


