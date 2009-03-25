Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LmZce-0000YK-HD
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 21:22:48 +0100
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.hex)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LmZb3-0001yk-Ue
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 23:21:09 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Mar 2009 23:21:02 +0300
User-Agent: KMail/1.9.9
References: <200902140035.13820.khimov@altell.ru>
	<200902171525.28995.khimov@altell.ru>
	<20090227043428.GA32604@gmail.com>
In-Reply-To: <20090227043428.GA32604@gmail.com>
Organization: Altell Ltd.
MIME-Version: 1.0
Message-Id: <200903252321.03022.khimov@altell.ru>
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Wed, 25 Mar 2009 20:22:48 -0000
Content-Type: text/plain;
  charset="windows-1251"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Khem Raj:
> Thanks for the recipe. I was trying to build it but it failed for me. I
> gave few rounds and came up with these two patches and added some more
> stuff to the recipe.  Still it would fail while building docs so I gave
> up. I am using latest dev tree with gcc 4.3.3
>
> The build needs to be fixed before we apply the recipe.

Khem, I've reproduced FTBFS with current OE. I guess it comes from libtool 
or automake versions mismatch between our distro configuration/version and 
what's in current -dev for angstrom and minimal.

Will fix and update the patch.


