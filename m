Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1U7p3H-0003sR-Cv
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 16:24:20 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.279.5; Tue, 19 Feb 2013
	16:08:00 +0100
X-TM-IMSS-Message-ID: <21a9f8220000a257@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 21a9f8220000a257 ;
	Tue, 19 Feb 2013 16:07:55 +0100
Message-ID: <5123954F.1000306@nedap.com>
Date: Tue, 19 Feb 2013 16:07:59 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <511E373D.1070109@nedap.com>
	<CAPESJy6N4oTvAz9GBLN29UBZ=i1CgfKJ5DOQv3R6BS18AABe1Q@mail.gmail.com>
	<5121F224.4080906@nedap.com>
	<CAPESJy4eKSJq3VMtTKDDsYaR+0s=pAk+4kASqT74WzS2xQrVDg@mail.gmail.com>
	<51238222.40804@nedap.com>
	<CAPESJy6xoZS3hGLwiFY2d7NRsH438hPDgK+=gJXFZd0Q1Cxd6w@mail.gmail.com>
In-Reply-To: <CAPESJy6xoZS3hGLwiFY2d7NRsH438hPDgK+=gJXFZd0Q1Cxd6w@mail.gmail.com>
Subject: Re: opkg-make-index not found
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
X-List-Received-Date: Tue, 19 Feb 2013 15:24:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 02/19/2013 03:33 PM, Takeshi Hamasaki wrote:
> Then I recommend to look into log files. For my case, after executing commands:
>
> $ bitbake package-index -c cleansstate
> $ bitbake -D -D package-index > bitbake-d-d.package-index 2> errlog
>
> I have at least four log files.
> 1. bitbake-d-d.package-index in current dir
> 2. errlog   in current dir
> 3. run.do_package_index.* in
> build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/package-index-1.0-r0
> 4. log.do_package_index.* in
> build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/package-index-1.0-r0
>
> (Actually, I skipped to generate 2., my build succeed.)
> I guess you can find some clue looking into 4., 3., and maybe 1.
>
> I attach mine to this mail, and hope they might be some help for you.
Thanks for all your help!
I've been comparing the run.do_package_index file from myself and from 
the buildserver.
If I look at it the only real difference (besides paths etc) are in the 
SHELL
 > export SHELL="/usr/local/bin/bash-wrapper"
< export SHELL="/bin/bash"
I will ask my administrator to change it and will retry.




