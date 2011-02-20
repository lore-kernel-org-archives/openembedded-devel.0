Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PrHHV-0006aM-FJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 22:57:29 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PrHGG-0001E5-U2 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 13:56:12 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 20 Feb 2011 13:56:11 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 20 Feb 2011 14:56:11 -0700
Message-ID: <4D618DF3.50406@mentor.com>
Date: Sun, 20 Feb 2011 14:56:03 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298214559-9650-1-git-send-email-tom_rini@mentor.com>
	<ijrber$3gb$1@dough.gmane.org>
In-Reply-To: <ijrber$3gb$1@dough.gmane.org>
X-OriginalArrivalTime: 20 Feb 2011 21:56:11.0426 (UTC)
	FILETIME=[FC7F9020:01CBD148]
Subject: Re: [PATCH 0/4] Pin gvfs before making 1.7.2 default
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
X-List-Received-Date: Sun, 20 Feb 2011 21:57:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/20/2011 08:19 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 20-02-11 16:09, Tom Rini wrote:
>> With the recent change to add glib-2.28.0 and make it default,
>
> I'm still not sure that was the right decision, given the current
> fallout. Next time a new version gets added, it shouldn't be the default
> untill problems like this have been fixed.

Yes.  I think moving forward we need to put glib-2.0 on the list of 
things that needs care when adding new non-default versions since it's 
used to widely (and I'll beg for the glib-mkenums patch to not be 
dropped next time around, I can't build more than minimal-image and 
meta-toolchain in my matrix without that bugfix).

-- 
Tom Rini
Mentor Graphics Corporation


