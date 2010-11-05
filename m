Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PEOv1-0007xL-3g
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 17:13:35 +0100
Received: by gwaa11 with SMTP id a11so2354513gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:message-id
	:in-reply-to:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=dJ6pwza+1KyNgmvsIAVY/CBHw3hED1u4viTEPzXT+b8=;
	b=Pg9G0wCs1xeEX93D1loA6+f6PthSuSeAUwijBCtNMUkUKYDE2UbR9zE5m7FzJajYiC
	yBLz297lGxn68ol3LMie85Jc6zu+i2PsucWtknytXWMkw2IevH4Z14yp09bZ2xl8EzLA
	iQedxE23odKmDDdal663c+hwalGDui+VB1TNw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	b=eYvRJaidDB1u5IfZQDKP3g+oemiGte2N0WLzO1YKMvoyJHy2O6owy7Yxhgk6kXjlS/
	k+IXdyOxP061hf1PGFYMfBJaHSebDC3OzkwNP744O2LqG+3+RxBTTdM/AZQnWY+aiWjR
	as1jqmeatNm4gtOXXntxr24jYPN/LZTLoPSsw=
Received: by 10.100.13.19 with SMTP id 19mr1089595anm.129.1288973560277;
	Fri, 05 Nov 2010 09:12:40 -0700 (PDT)
Received: from seeker (ip24-251-170-95.ph.ph.cox.net [24.251.170.95])
	by mx.google.com with ESMTPS id 6sm1608244anx.32.2010.11.05.09.12.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Nov 2010 09:12:39 -0700 (PDT)
Date: Fri, 5 Nov 2010 09:12:33 -0700
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <3352A94BCEB54F4D98AFFA01352951E0@gmail.com>
In-Reply-To: <1288973181-2946-1-git-send-email-robert@erafx.com>
References: <1288973181-2946-1-git-send-email-robert@erafx.com>
X-Mailer: sparrow 1.0beta4 (build 333)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: postgresql-8.1.8 : fix configure on x86
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
X-List-Received-Date: Fri, 05 Nov 2010 16:13:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline


        
        On Friday, November 5, 2010 at 9:06 AM, Bob Foerster wrote:
        
            Without this patch, postgres fails on configure:| checking alignment of int... configure: error: cannot compute alignment of int, 77NOTE: package postgresql-8.1.8-r4: task do_configure: FailedSimilar fix for arm was in 5fa3d153.Signed-off-by: Bob Foerster <robert@erafx.com>Acked-by: Christopher Larson <chris_larson@mentor.com>
From johnso87@crhc.illinois.edu Fri Nov 05 17:17:09 2010
Received: from usps1.crhc.illinois.edu ([130.126.143.230]
	helo=usps.crhc.uiuc.edu) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johnso87@crhc.illinois.edu>) id 1PEOyM-0002IQ-AN
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 17:17:05 +0100
Received: from usps.crhc.uiuc.edu (localhost [127.0.0.1])
	by usps.crhc.uiuc.edu (Postfix) with ESMTP id EF9393400463
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Nov 2010 11:16:07 -0500 (CDT)
Received: from [192.168.1.198] (unknown [63.252.64.254])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: johnso87)
	by usps.crhc.uiuc.edu (Postfix) with ESMTPSA id D0B29340009B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Nov 2010 11:16:07 -0500 (CDT)
Message-ID: <4CD42DC7.7010008@crhc.illinois.edu>
Date: Fri, 05 Nov 2010 11:16:07 -0500
From: Matt Johnson <johnso87@crhc.illinois.edu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9pre) Gecko/20100217 Lightning/1.0b1 Shredder/3.0.3pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CD42BE7.8090109@sensortherm.de>
In-Reply-To: <4CD42BE7.8090109@sensortherm.de>
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 130.126.143.230
X-SA-Exim-Mail-From: johnso87@crhc.illinois.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe] dm355_codecs_03_10_00_00.tar.gz
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
X-List-Received-Date: Fri, 05 Nov 2010 16:17:09 -0000

On 11/05/2010 11:08 AM, Klaus Schwarzkopf wrote:
> Hi,
>
> i try to install the recipe ti-codecs-dm355_3.10.00.00.bb:
>
> MACHINE=dm355-leopard bitbake -b  ti-codecs-dm355_3.10.00.00.bb
>
> I get the following error:
>
> klaus@ubuntu:~/development/oe$ MACHINE=dm355-leopard bitbake -b
> ti-codecs-dm355_3.10.00.00.bb
> NOTE: preferred version 1_13_000 of ti-codecs-dm355 not available (for
> item ti-codecs-dm355)
>
> Build Configuration:
> BB_VERSION        = "1.8.18"
> METADATA_BRANCH   = "master"
> METADATA_REVISION = "a33cf7368366d425c71369339e88a50d5660b7c0"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "dm355-leopard"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "2010.7-test-20101104"
> TARGET_FPU        = "soft"
>
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 2 of 17 (ID: 8,
> /home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.00.00.bb, 
>
>
> do_fetch)
> NOTE: fetch
> ftp://gtftp01.gt.design.ti.com/arago/dm355_codecs_03_10_00_00.tar.gz
> --2010-11-04 20:28:42--
> ftp://gtftp01.gt.design.ti.com/arago/dm355_codecs_03_10_00_00.tar.gz
>            =>
> `/home/klaus/development/oe/downloads/dm355_codecs_03_10_00_00.tar.gz'
> Resolving gtftp01.gt.design.ti.com... failed: Name or service not known.
> wget: unable to resolve host address `gtftp01.gt.design.ti.com'
> NOTE: fetch 
> http://mirrors.openembedded.org//dm355_codecs_03_10_00_00.tar.gz
> --2010-11-04 20:28:42--
> http://mirrors.openembedded.org//dm355_codecs_03_10_00_00.tar.gz
> Resolving mirrors.openembedded.org... 82.197.159.157
> Connecting to mirrors.openembedded.org|82.197.159.157|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2010-11-04 20:28:42 ERROR 404: Not Found.
>
> NOTE: fetch 
> http://sources.openembedded.org//dm355_codecs_03_10_00_00.tar.gz
> --2010-11-04 20:28:43--
> http://sources.openembedded.org//dm355_codecs_03_10_00_00.tar.gz
> Resolving sources.openembedded.org... 140.211.169.165
> Connecting to sources.openembedded.org|140.211.169.165|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2010-11-04 20:28:43 ERROR 404: Not Found.
>
> NOTE: fetch
> http://www.angstrom-distribution.org/unstable/sources/dm355_codecs_03_10_00_00.tar.gz 
>
> --2010-11-04 20:28:43--
> http://www.angstrom-distribution.org/unstable/sources/dm355_codecs_03_10_00_00.tar.gz 
>
> Resolving www.angstrom-distribution.org... 188.40.83.200
> Connecting to www.angstrom-distribution.org|188.40.83.200|:80... 
> connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2010-11-04 20:28:43 ERROR 404: Not Found.
>
> NOTE: Task failed: Fetch failed:
> ftp://gtftp01.gt.design.ti.com/arago/dm355_codecs_03_10_00_00.tar.gz;name=dm355codecsbin 
>
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.00.00.bb 
>
>
> do_fetch failed
> ERROR: Task 8
> (/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.00.00.bb, 
>
>
> do_fetch) failed
> NOTE: Tasks Summary: Attempted 1 tasks of which 1 didn't need to be
> rerun and 1 failed.
> ERROR:
> '/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.00.00.bb' 
>
>
> failed
> klaus@ubuntu:~/development/oe$
>
>
>
> Where is the file? Is the recipe to old?
>
> Thanks!
>
> Regards,
> Klaus
>
>
>
>
Klaus,
     ti-codecs is now at 3.10.00.02, but I think the larger issue is 
just one of server-side directory reorganization since the recipe was 
updated.  That tarball is part of the DVSDK, which can be downloaded 
here 
http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_3_10/latest/index_FDS.html
     We should probably update the recipe at some point not to attempt 
to fetch the tarball directly, unless someone else has it hosted separately.
-Matt

-- 
Matt Johnson
Graduate Student
University of Illinois at Urbana-Champaign, Dept. of ECE
Coordinated Science Lab, Rm. 213


