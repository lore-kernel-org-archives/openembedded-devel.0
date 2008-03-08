Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JY1pI-0001fg-8z
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Mar 2008 17:23:13 +0100
Received: by fg-out-1718.google.com with SMTP id 13so760235fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Mar 2008 08:21:32 -0800 (PST)
Received: by 10.86.9.8 with SMTP id 8mr3314282fgi.70.1204993292063;
	Sat, 08 Mar 2008 08:21:32 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id e20sm6097688fga.1.2008.03.08.08.21.30
	(version=SSLv3 cipher=OTHER); Sat, 08 Mar 2008 08:21:31 -0800 (PST)
Date: Sat, 8 Mar 2008 18:24:26 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080308182426.38f46756@widy.localdomain>
In-Reply-To: <47D2B73F.7070905@gmx.de>
References: <47D2B73F.7070905@gmx.de>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 72.14.220.158
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: move do_deploy to kernel.bbclass
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
X-List-Received-Date: Sat, 08 Mar 2008 16:23:14 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sat, 08 Mar 2008 16:56:47 +0100
Thomas Kunze <thommycheck@gmx.de> wrote:

> Hi,
> 
> currently nearly every kernel recipe implements do_deploy and nearly
> all implementations are the same. This patch moved do_deploy to 
> kernel.bbclass and updates all kernel recipes to use or override it. 
> Please have a look if the change this makes to your kernel recipe is
> ok for you. IMO it would be best if you modify your kernel recipe how
> you need it after this is commited. If nobody objects I will commit
> this next Friday (mar 14th).

+1 from me. I wanted to do that for long time, but one of the
presupposition would be to use consistent kernel deploy filename, and
linux-rp was a culprit with all the installkit stuff which I was afraid
to touch.

> 
> Regards,
> Thomas
> 
> Change to kernel.bbclass:

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


