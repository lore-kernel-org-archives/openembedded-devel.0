Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@emagii.com>) id 1SKJw1-0005au-W1
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 03:43:54 +0200
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 691D7C161
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 03:34:27 +0200 (CEST)
X-SENDER-IP: [83.227.58.214]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqsrAO4Yjk9T4zrWPGdsb2JhbAANN4oopSCCDgEBAQE3gj0BAQEBAzhAARALGAkUAg8JAwIBAgExFAYNAQUCAQHCCJBjBJVvkx8
X-IronPort-AV: E=Sophos;i="4.75,439,1330902000"; d="scan'208";a="97334757"
Received: from c-d63ae353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.243]) ([83.227.58.214])
	by ipb3.telenor.se with ESMTP; 18 Apr 2012 03:34:27 +0200
Message-ID: <4F8E1A23.4030606@emagii.com>
Date: Wed, 18 Apr 2012 03:34:27 +0200
From: Ulf Samuelsson <openembedded@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.28) Gecko/20120313 Thunderbird/3.1.20
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4F8DF031.60109@emagii.com> <2900608.HO3vnnHahd@helios>
In-Reply-To: <2900608.HO3vnnHahd@helios>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Support for R/W git in bitbake
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
X-List-Received-Date: Wed, 18 Apr 2012 01:43:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-04-18 01:07, Paul Eggleton wrote:
> On Wednesday 18 April 2012 00:35:29 Ulf Samuelsson wrote:
>> Today bitbake supports read only git access in recipes.
>> For various reasons, I would like to be able to do recipes
>> which would check out in a read/write mode.
> Could you elaborate on "various reasons"?
>
> Would the new externalsrc bbclass be useful in your case?
>
> Cheers,
> Paul
>

1. If I am busy working on an application, then it simplifies the 
development process.
     I can modify the code in the tree and push.
     This is mainly for kernel development.

2. If I work on a prerelease of some S/W drivers/Applications under NDA,
     then I cannot make that code publicly available
     but I still want to put  that on my Internet accessible git server.
     Typicailly this is before the release of a new chip and info about 
the chip should not be
     made public before the chip is released.

3.  I want to be able to ship something similar to the Angstrom setup 
scripts
      to someone else, and have them build an image, but it should not 
be available
      to anyone not accepted (without public key at the git server).

There are other uses for such a functionality, but those are my 
immediate needs.

As you see, this is mostly for development.
Once the code is released, then the recipe would be changed to the 
normal git access.

Didn't know anything about the externalsrc bbclass, but after checking, 
I would say no.
It won't do the two things above. I do see the use of it though.


-- 
Best Regards
Ulf Samuelsson
ulf@emagii.com
+46 722 427437



