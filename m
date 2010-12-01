Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PNsLe-00016M-OM
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 20:28:15 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PNsKJ-0000bp-M3 from Tom_Rini@mentor.com ;
	Wed, 01 Dec 2010 11:26:51 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 1 Dec 2010 11:26:51 -0800
Received: from [172.30.80.45] ([172.30.80.45]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 1 Dec 2010 12:26:50 -0700
Message-ID: <4CF6A16D.10206@mentor.com>
Date: Wed, 01 Dec 2010 12:26:37 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <4CE682D4.1040304@mentor.com>
	<1291230954-31990-1-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1291230954-31990-1-git-send-email-rep.dot.nop@gmail.com>
X-OriginalArrivalTime: 01 Dec 2010 19:26:50.0361 (UTC)
	FILETIME=[B3D3CE90:01CB918D]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2 0/3] ext4 image support
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
X-List-Received-Date: Wed, 01 Dec 2010 19:28:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2010 12:15 PM, Bernhard Reutner-Fischer wrote:
> Changes from previous iteration:
> o factor out e2fsprogs.inc changes into separate patch
> o use do_install_append_pn-e2fsprogs
>
> Bernhard Reutner-Fischer (3):
>    e2fsprogs: add 1.41.12, remove old versions
>    e2fsprogs: fix alternatives of non-packaged native sysroot
>    add ext4 image support
>
>   conf/bitbake.conf                      |    4 +++
>   conf/local.conf.sample                 |    2 +-
>   recipes/e2fsprogs/e2fsprogs.inc        |   42 +++++++++++++------------------
>   recipes/e2fsprogs/e2fsprogs_1.41.12.bb |   10 +++++++
>   recipes/e2fsprogs/e2fsprogs_1.41.9.bb  |   10 -------
>   5 files changed, 33 insertions(+), 35 deletions(-)
>   create mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.12.bb
>   delete mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.9.bb

Whole series is:
Acked-by: Tom Rini <tom_rini@mentor.com>

-- 
Tom Rini
Mentor Graphics Corporation


