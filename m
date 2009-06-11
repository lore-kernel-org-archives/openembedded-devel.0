Received: from [17.148.16.96] (helo=asmtpout021.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MEkjn-0002Aq-Vl
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 15:54:40 +0200
MIME-version: 1.0
Received: from [87.201.169.78] by asmtp021.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KL200A7VU5XNE90@asmtp021.mac.com> for
	openembedded-devel@lists.openembedded.org; Thu,
	11 Jun 2009 06:44:27 -0700 (PDT)
Message-id: <CEB81C4F-48EC-4D42-84C2-F7779D133565@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1244721978.28486.107.camel@hammer.suse.cz>
Date: Thu, 11 Jun 2009 17:44:12 +0400
References: <1244366174.4412.11.camel@daniel-laptop>
	<1244384219.4431.46.camel@utx.utx.cz>
	<1244385233.4151.27.camel@lenovo.internal.reciva.com>
	<1244402010.4463.36.camel@utx.utx.cz>
	<1244402413.4151.36.camel@lenovo.internal.reciva.com>
	<1244721978.28486.107.camel@hammer.suse.cz>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: e2fsprogs-libs failed	on	latest	org.openembedded.dev	branch
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
X-List-Received-Date: Thu, 11 Jun 2009 13:54:40 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	For this issue, if you sync with the overo-oe repository, and delete  
the entire overo-oe/tmp folder and rebuild again, it should be fine.  
In the end, I used this order:

bitbake u-boot-omap3
bitbake linux-omap3-2.6.29
bitbake omap3-console-image

It was scary and fustrating to see it fail for no apparent reason, and  
I lost 2 days trying to get it to work, between initial failures and  
oe updates.

Best regards,

Elvis



