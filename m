Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P2sdj-0008Sx-GU
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 23:32:09 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P2sdM-0005zG-9e from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 14:31:44 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 4 Oct 2010 14:31:43 -0700
Received: from [172.30.80.69] ([172.30.80.69]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 4 Oct 2010 15:31:40 -0600
Message-ID: <4CAA47A8.2040807@mentor.com>
Date: Mon, 04 Oct 2010 14:31:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=7CfOcg=8odi3k95kbMM5qxjNfunqLnLTBxKzs@mail.gmail.com>
In-Reply-To: <AANLkTi=7CfOcg=8odi3k95kbMM5qxjNfunqLnLTBxKzs@mail.gmail.com>
X-OriginalArrivalTime: 04 Oct 2010 21:31:40.0812 (UTC)
	FILETIME=[88866CC0:01CB640B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question about check data file clashes
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
X-List-Received-Date: Mon, 04 Oct 2010 21:32:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

J. L. wrote:
> I am trying to get my image to build and running into a check data
> file clash and not sure why or how to fix. It says two packages are
> trying to install the same file, so how do you make this get through
> and still have both packages installed? Here is the error I got:
> 
> | Collected errors:
> |  * check_data_file_clashes: Package linux-libc-headers-dev wants to
> install file /home/vdubhack/overo-oe/tmp/rootfs/qEnlightDesktop/usr/include/scsi/scsi.h
> | 	But that file is already provided by package  * libc6-dev
> 
> Thanks for any help on this.

Your provider of linux-libc-headers is broken and needs a fix ala the 
2.6.31/2.6.32 recipes have.

-- 
Tom Rini
Mentor Graphics Corporation


