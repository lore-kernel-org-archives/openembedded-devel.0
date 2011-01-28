Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Pid0S-0005xb-6T
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 02:20:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 3EE1B314D465
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 02:19:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id B0GYhjoUHR+H
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 02:19:13 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id C6735314D463
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 02:19:13 +0100 (CET)
Message-ID: <4D42198B.5070604@opendreambox.org>
Date: Fri, 28 Jan 2011 02:19:07 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101210 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296167465.14370.7.camel@utx.lan>
In-Reply-To: <1296167465.14370.7.camel@utx.lan>
Subject: Re: [RFC][PATCH] binconfig.bbclass: search configs in PKGD instead of S
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
X-List-Received-Date: Fri, 28 Jan 2011 01:20:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/27/2011 11:31 PM, Stanislav Brabec wrote:
> It seems that searching for binconfig in S makes more problems than it
> brings benefits. It breaks for example ncurses - it populates
> ncurses-config instead of ncurses5-config and ncursesw5-config).

Indeed. Installing *-config files which don't get installed by the
recipe is prone to cause subtle errors. I modified pkgconfig.bbclass in
a similar way in commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8.

"find recipes -name "*-config" -type f" shows candidates which may cause
breakage with this patch applied, in case they need to be installed but
only get copied to the source directory.

> Searching in the installed root seems to be more logical.
> 
> Most packages don't need to be ported to this change, as they install
> config file with the same name as it exists in sources. But probably
> several will need porting.

Why is this function needed at all? Isn't it possible to do the mangling
before or after do_install like in pkgconfig.bbclass?

Regards,
Andreas


