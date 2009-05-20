Received: from [192.67.63.129] (helo=rampart2.timecastle.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeff@taupro.com>) id 1M6evl-0008Ia-BS
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 08:05:33 +0200
Received: from [192.168.3.100] (adsl-68-95-128-31.dsl.rcsntx.swbell.net
	[68.95.128.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by rampart2.timecastle.net (Postfix) with ESMTPSA id DBBAE70043;
	Wed, 20 May 2009 00:58:06 -0500 (CDT)
Message-ID: <4A139BEC.9060902@taupro.com>
Date: Wed, 20 May 2009 00:58:04 -0500
From: Jeff Rush <jeff@taupro.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A12BC2C.5020402@taupro.com> <20090520002538.GF23803@denix.org>
In-Reply-To: <20090520002538.GF23803@denix.org>
X-Enigmail-Version: 0.95.7
OpenPGP: id=AA9D62B9
Subject: Re: rootfs_tar.bbclass not found?
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
X-List-Received-Date: Wed, 20 May 2009 06:05:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> On Tue, May 19, 2009 at 09:03:24AM -0500, Jeff Rush wrote:
>> Hopefully a trivial question.
>>
>> What can I add to my local.conf to 'short circuit' this logic related to the
>> building of images?
> 
> Can you try setting BBMASK = "image" in your local.conf?

Thanks that worked!  I was afraid it might just remove the build target but
not the actual parsing but it actually did both.

-Jeff


