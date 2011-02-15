Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PpOAh-0000Fd-Cn
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 17:54:39 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PpO9Y-0001bU-Qa from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 08:53:28 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 15 Feb 2011 08:53:28 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 15 Feb 2011 09:53:27 -0700
Message-ID: <4D5AAF85.3000409@mentor.com>
Date: Tue, 15 Feb 2011 09:53:25 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D59BBC3.3080806@mlbassoc.com>
In-Reply-To: <4D59BBC3.3080806@mlbassoc.com>
X-OriginalArrivalTime: 15 Feb 2011 16:53:27.0502 (UTC)
	FILETIME=[DDE3F6E0:01CBCD30]
Subject: Re: testing release-2011.03 failure
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
X-List-Received-Date: Tue, 15 Feb 2011 16:54:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/14/2011 04:33 PM, Gary Thomas wrote:
> MACHINE = beagleboard
> DISTRO = angstrom-2010.x
> PARALLEL_MAKE ?= "-j4"
> BB_NUMBER_THREADS ?= "4"
> target = angstrom-gnome-image
> bitbake = 1.11.0
> host = Fedora 13/x86
>
> openembedded/recipes/gnome/system-tools-backends_2.10.1.bb failed
>
> Log at http://pastebin.com/rL0BnD8w

Can you try adding PARALLEL_MAKE = "" to the offending recipe?

-- 
Tom Rini
Mentor Graphics Corporation


