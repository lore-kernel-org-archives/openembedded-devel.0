Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1KnbAT-00060B-IP
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 17:41:41 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id E82C16280CE;
	Wed,  8 Oct 2008 17:37:15 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48239d390810080715l700d1ce4i46c1e1cc97279b3@mail.gmail.com>
References: <48239d390810080715l700d1ce4i46c1e1cc97279b3@mail.gmail.com>
Date: Wed, 08 Oct 2008 17:37:04 +0200
Message-Id: <1223480224.9336.12.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.0 
Subject: Re: Locale support.
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
X-List-Received-Date: Wed, 08 Oct 2008 15:41:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sergey Lapin wrote:

> But I have problems with lots of UTF-8 characters on file system
> and applications. 'date' command works properly reporting according to
> locale.

If you have a problem with VFAT and similar file systems, than you need
an appropriate kernel fs/nls module and then edit /etc/fstab and/or
/etc/udev/scripts/mount.sh.

Example: http://ftp.penguin.cz/pub/users/utx/zaurus/files/mount/
Locale definition example: http://ftp.penguin.cz/pub/users/utx/zaurus/files/czech/
(Yes, you may need empty /usr/lib/locale/{locale} for GPE login GUI.)

> wget, however have problems, inventing names which contain junk.
> However, using scp, I'm able to store normal UTF-8-named files
> from my desktop Debian. ASCII characters in names are always OK.
> both wget and ls are stand-alone in my configuration.

For historical reasons, HTTP characters are converted to 7 bits.
If you see something like "%C5%BE%C5%99%C5%A1" after using wget, then it
is not a bug, it is a feature.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



