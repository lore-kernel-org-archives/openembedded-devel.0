Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Sli8z-0007wT-Tl
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Jul 2012 17:02:29 +0200
Received: from [192.168.0.41] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 5B4BA600CA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2012 15:45:23 +0100 (BST)
Message-ID: <4FF1B5B7.4000808@communistcode.co.uk>
Date: Mon, 02 Jul 2012 15:52:39 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120616 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4FE9C8B9.5090808@communistcode.co.uk>
In-Reply-To: <4FE9C8B9.5090808@communistcode.co.uk>
Subject: Re: net-snmp build failure
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
X-List-Received-Date: Mon, 02 Jul 2012 15:02:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/12 15:35, Jack Mitchell wrote:
> Has anyone successfully built net-snmp-server for the Beaglebone under 
> the Poky distribution (or more generally using GCC 4.7.x for arm)? I 
> had a go today but it failed (see file attached) and it looks to me 
> like a bug in GCC or a bug in net-snmp that GCC 4.7 has shown up...
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

To fix this build failure I removed the systemd patch which allowed it 
to build. The issue (initially) seems that the patch enables systemd but 
there is no configure switch to disable it once the patch is applied. 
I'm sure this is wrong as it sound ridiculous, however easiest for my to 
just try to get it going was removal of the patch. I will hopefully have 
time to revisit later and see if I can put a proper fix in.

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



