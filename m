Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PV7Jl-0006aM-9D
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 19:52:13 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PV7Je-0004CO-6F from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 10:52:06 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 21 Dec 2010 10:52:05 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 21 Dec 2010 11:52:04 -0700
Message-ID: <4D10F751.8050006@mentor.com>
Date: Tue, 21 Dec 2010 11:52:01 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1292953146-22849-1-git-send-email-vjaquez@igalia.com>
In-Reply-To: <1292953146-22849-1-git-send-email-vjaquez@igalia.com>
X-OriginalArrivalTime: 21 Dec 2010 18:52:05.0109 (UTC)
	FILETIME=[292E9A50:01CBA140]
Subject: Re: [RFC] strace: add netlink/netlink-compat.h in configure.ac
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
X-List-Received-Date: Tue, 21 Dec 2010 18:52:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/21/2010 10:39 AM, Víctor Manuel Jáquez Leal wrote:
> I found, compiling an console-image for omap4330-panda machine, that strace
> compilation broke because the netlink.h wasn't included. It was not included
> because the AC_CHECK_HEADERS failed. If failed because sa_family_t wasn't
> defined, even though linux/socket.h is supposed to define it.
>
> This patch modifies the configure.ac in order to include
> netlink/netlink-compat.h in the AC_CHECK_HEADER macro, so the header is
> detected correctly.

Is this fixed upstream or in 4.5.20 by chance?

-- 
Tom Rini
Mentor Graphics Corporation


