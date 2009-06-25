Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MJszw-0004AV-GZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jun 2009 19:44:32 +0200
Received: from [10.50.1.165] (unknown [10.50.1.165])
	by hermes.mvista.com (Postfix) with ESMTP id 3EFE11ADAE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2009 10:33:12 -0700 (PDT)
Message-Id: <0396D012-255F-40C1-8A8E-C715B1FA9EDA@mvista.com>
From: Christopher Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1245949964.25917.13.camel@hammer.suse.cz>
Mime-Version: 1.0 (Apple Message framework v935.3)
Date: Thu, 25 Jun 2009 10:33:11 -0700
References: <1245871136.5939.3.camel@utx.utx.cz>
	<b6ebd0a50906241244hb9331c6nb22d82f6f04d004c@mail.gmail.com>
	<1245875929.5939.17.camel@utx.utx.cz>
	<b6ebd0a50906241347g1667f13cy83f7dc49f6e7ce86@mail.gmail.com>
	<1245880813.5939.46.camel@utx.utx.cz>
	<1245949964.25917.13.camel@hammer.suse.cz>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: [PATCH] introduction of virtual/libusb0
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
X-List-Received-Date: Thu, 25 Jun 2009 17:44:33 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


On Jun 25, 2009, at 10:12 AM, Stanislav Brabec wrote:

> Stanislav Brabec wrote:
>> Chris Larson wrote:
>>
>>> DEFAULT_PREFERENCE is just default behavior when no  
>>> PREFERRED_PROVIDER
>>> is set by the distro.
>
> It seems that it is not true. First in order it selects ordered  
> package
> name list for the requirement (using only PREFERRED_PROVIDER),  
> second in
> order it decides about best version for each package name (using
> DEFAULT_PREFERENCE and PREFERRED_VERSION variables). When no explicit
> dependence or conflict is found, best version for the package first in
> order will be selected.

Aye, good catch.  It seems that it always prefers the recipe whose PN  
is the same as the provider even when there are DEFAULT_PREFERENCE's  
in either direction in the recipes that provide it.  This seems like a  
bug to me.
-- 
Chris Larson
Software Engineer
MontaVista Software, Inc.
Email: clarson AT mvista DOT com
Email: clarson AT kergoth DOT com



