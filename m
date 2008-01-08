Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JCE4o-0001MW-RT
	for openembedded-devel@openembedded.org; Tue, 08 Jan 2008 14:01:06 +0100
Received: by fg-out-1718.google.com with SMTP id e12so4063126fga.0
	for <openembedded-devel@openembedded.org>;
	Tue, 08 Jan 2008 04:54:08 -0800 (PST)
Received: by 10.86.66.1 with SMTP id o1mr21223515fga.23.1199795105594;
	Tue, 08 Jan 2008 04:25:05 -0800 (PST)
Received: from paul.bn.lan ( [194.79.8.34])
	by mx.google.com with ESMTPS id 28sm30000529fkx.11.2008.01.08.04.25.03
	(version=SSLv3 cipher=OTHER); Tue, 08 Jan 2008 04:25:04 -0800 (PST)
Date: Tue, 8 Jan 2008 14:30:55 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <45430662.20080108143055@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1199742459.4680.69.camel@localhost.localdomain>
References: <1068494393.20080104031751@gmail.com>
	<1199663243.4658.71.camel@localhost.localdomain>
	<116173998.20080107221856@gmail.com>
	<1199738665.4680.66.camel@localhost.localdomain>
	<1199742459.4680.69.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: Another weird case of PACKAGES_DYNAMIC and task deps, it seems
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2008 13:01:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Monday, January 7, 2008, 11:47:39 PM, you wrote:

> On Mon, 2008-01-07 at 20:44 +0000, Richard Purdie wrote:
>> My money is on:
>> 
>> DEPENDS_collie += "bc-native"
>> 
>> in linux-rp.inc. Try removing that...

> Confirmed and fixed in 00610b176af0e4f4563f78fb71dc1219c777d13e.

> Let me stress once again, += and overrides do not do what you expect. It
> adds "bc_native" to the variable named "DEPENDS_collie", not "DEPENDS".

> DEPENDS_append_collie = " bc-native" 

> is a very different thing and corrects this problem...

  Mea culpa, thanks for fixing it. I know it was it when you posted
that line, but didn't have time to test then.

  But maybe we indeed should do something about it on bitbake level.
If not teach to do the intuitive thing, then at least add adhoc test
with warning for += on UPPER_lower variable. Should be simple but
effective.

> Cheers,

> Richard



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



