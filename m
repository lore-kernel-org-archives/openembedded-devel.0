Received: from [64.233.166.182] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GYipi-00007k-C4
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Oct 2006 14:41:42 +0200
Received: by py-out-1112.google.com with SMTP id i75so1409166pye
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Oct 2006 05:34:35 -0700 (PDT)
Received: by 10.65.191.7 with SMTP id t7mr6706987qbp;
	Sat, 14 Oct 2006 05:34:35 -0700 (PDT)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id m1sm1015164nzf.2006.10.14.05.34.34;
	Sat, 14 Oct 2006 05:34:35 -0700 (PDT)
Date: Sat, 14 Oct 2006 15:34:34 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <687683143.20061014153434@gmail.com>
To: Jamie Lenehan <lenehan@twibble.org>
In-Reply-To: <20061010221107.GB20799@twibble.org>
References: <20060914001918.GA8432@twibble.org>
	<452B83DC.2020503@dominion.kabel.utwente.nl>
	<20061010221107.GB20799@twibble.org>
MIME-Version: 1.0
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Re: site/* Common site files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Oct 2006 12:41:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Jamie,

Wednesday, October 11, 2006, 1:11:07 AM, you wrote:

> On Tue, Oct 10, 2006 at 01:28:28PM +0200, Koen Kooi wrote:
> [...]
>> 
>> The consensus is that we want this in OE, how to we proceed to get this added into .dev?

> If my implementation was ok then I can push it in over a few days.
> The order being:

>  - add config_info.bbclass

>  - modify recipes that use the site file directly to use config_info instead.

>  - update autotools.bbclass to use config_info.bbclass

> Then it's ready to actually use. Merging those x86 site files would
> be a good place to start.


  I can second that Jamie's site/* and config_info work would very
useful for anyone adding a new target to OE. We just went thru some
implementation details of it (I started this off list to not protract
the merge with ungrounded concerns), and once again see that the
framework Jamie put together is very flexible and ready to cover broad
usecases (for example, site files can be overriden down to a package
level (keyword: if needed)).


  So, please count my voice for near-term merge.




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



