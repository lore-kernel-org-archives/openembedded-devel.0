Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JNo9u-00037T-41
	for openembedded-devel@openembedded.org; Sat, 09 Feb 2008 12:46:14 +0100
Received: by py-out-1112.google.com with SMTP id p76so6679480pyb.2
	for <openembedded-devel@openembedded.org>;
	Sat, 09 Feb 2008 03:46:27 -0800 (PST)
Received: by 10.65.216.19 with SMTP id t19mr27075021qbq.95.1202557586692;
	Sat, 09 Feb 2008 03:46:26 -0800 (PST)
Received: from widy.localdomain ( [88.231.85.196])
	by mx.google.com with ESMTPS id 35sm4450116nfu.12.2008.02.09.03.46.23
	(version=SSLv3 cipher=OTHER); Sat, 09 Feb 2008 03:46:24 -0800 (PST)
Date: Sat, 9 Feb 2008 13:48:50 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080209134850.13fe8d93@widy.localdomain>
In-Reply-To: <1201565225.4687.98.camel@localhost.localdomain>
References: <20080129014117.60ed9f77@widy.localdomain>
	<1201565225.4687.98.camel@localhost.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Setting default IMAGE_FSTYPES to tar.gz in bitbake.conf
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
X-List-Received-Date: Sat, 09 Feb 2008 11:46:14 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 29 Jan 2008 00:07:05 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> On Tue, 2008-01-29 at 01:41 +0200, Paul Sokolovsky wrote:
> > Currently, we have in bitbake.conf:
> > 
> > IMAGE_FSTYPES ?= "jffs2"
> > 
> > jffs2 is a special filesystem format, suitable for limited number of
> > hardware on the global scale. So I would like to propose to replace
> > that default with some neutral and well-know format, say tar.gz.
> 
> This has been discussed before and I'd like to see that changed. The
> complication is that "bitbake image" is meant to give a sane default
> image for a given machine without any tweaking by the user and a load
> of machines depend on the jffs2 default. 

Unfortunately, this is not achievable and not sustainable goal. It's
not achievable because there's no single criteria for "sane", it
depends first of all on user's needs. So, trying to make adhoc choices
instead of user would mean that for some group of users they will be
unpredictable and thus insane. So, it would make more sense to use "not
insane" criteria instead and use some neutral, well-known format, which
is why this RFC is being made.

> 
> I'm not an ipaq expert but I'd guess a number of them use jffs2, as
> probably do some of the htcs, the at91 board and the motorola phones.
> Someone needs to go through and check the machines. Since this is
> pretty daunting to fix, I've just gone through and I think the
> following files need that line adding as they appear to use jffs2 in
> some form:

[]

> 
> I'm unsure of the following machines:

And those above is why it's not sustainable - now it comes that to
achieve that goal it takes to be a machine expert, etc. etc. Of course,
noone is expert in all machines, some people are not experts in the
machine they add/hack on, all people can not know something, make
mistakes and wrong choices, etc. In the end and overall, presence of
jffs2 in specific machine's config turns out to be rather random
matter. We may want to rethink that to be based on more firm grounds.
One possible way:

1. IMAGE_FSTYPES is not a machine config variable.
2. IMAGE_FSTYPES is a top-level parameter specified by user. User needs
specific format, user requests it. There's a default though offering
least surprise as integrated over user base - i.e. neutral, well-known
format.
3. Alternatively, a *distro* may constrain a way in which images are
used, and thus force a particular image format. So, for a dumb headless
router machine, one distro will try to follow vendor's way and generate
images in an adhoc format. Yet another for the same machine will assume
that bootloader was replaced with some generic one and will use generic
flash image format like jffs2. And yet another will be intended for the
people who soldered few wires at the appropriate place and use bit-bang
to boot from SD.


Well, as usual, thoughts aloud. I'm going to add 
IMAGE_FSTYPES ?= "jffs2" to the machines from your 1st list to get
matter going.


[]
> 
> Regards,
> 
> Richard
> 



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


