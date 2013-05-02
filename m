Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UY0iW-0006Fa-Ib
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 23:07:12 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id BD8E425FA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 May 2013 22:49:12 +0200 (CEST)
Message-ID: <5182D143.8050003@pseudoterminal.org>
Date: Thu, 02 May 2013 22:49:07 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: do_split_packages and populate_packages_prepend
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
X-List-Received-Date: Thu, 02 May 2013 21:07:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I wonder if do_split_packages() can only be used inside a 
populate_packages_prepend() function. 
https://wiki.yoctoproject.org/wiki/Handling_optional_module_packaging 
seems to suggest this. Since _prepend is problematic. I tried to use 
prefuncs instead ( populate_packages[prefuncs] += " myfunc " ). But 
then, my function is not called.

So, is this a special case where _prepend must be used?

cheers


