Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pq9Jg-0003e5-7d
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 20:15:04 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pq9IU-0007Yp-Mn from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 11:13:50 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 17 Feb 2011 11:13:50 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 17 Feb 2011 12:13:49 -0700
Message-ID: <4D5D7369.6090309@mentor.com>
Date: Thu, 17 Feb 2011 12:13:45 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1Pq9De-0007GV-Ap@melo.openembedded.org>
In-Reply-To: <E1Pq9De-0007GV-Ap@melo.openembedded.org>
X-OriginalArrivalTime: 17 Feb 2011 19:13:49.0508 (UTC)
	FILETIME=[CE9F9840:01CBCED6]
Subject: Re: [oe-commits] Eric BENARD : bitbake.conf: export LC_ALL = "C"
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
X-List-Received-Date: Thu, 17 Feb 2011 19:15:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/17/2011 12:08 PM, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 2471584764deb2384512a767f5c6439b0b8aac37
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=2471584764deb2384512a767f5c6439b0b8aac37
>
> Author: Eric BENARD<eric@eukrea.com>
> Date:   Tue Jan 11 05:33:45 2011 +0000
>
> bitbake.conf: export LC_ALL = "C"
>
> * thus the build system language won't create troubles during builds
> (example : perl is hacking some generated files' content but only
> supports english outputs).
>
> * this problem is only met when using bitbake master
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> Signed-off-by: Tom Rini<tom_rini@mentor.com>

FYI, I acked this after noticing that Richard did the same thing to poky 
recently (and I had delegated this patch to myself in patchwork this 
past weekend with a mental TODO to bug RP about it..).

-- 
Tom Rini
Mentor Graphics Corporation


