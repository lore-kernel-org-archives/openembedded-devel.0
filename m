Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JTEN0-000828-Qa
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Feb 2008 11:46:12 +0100
Received: by fg-out-1718.google.com with SMTP id 13so856205fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2008 02:45:49 -0800 (PST)
Received: by 10.82.182.1 with SMTP id e1mr2965621buf.21.1203849949573;
	Sun, 24 Feb 2008 02:45:49 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id k5sm5844972nfd.23.2008.02.24.02.45.48
	(version=SSLv3 cipher=OTHER); Sun, 24 Feb 2008 02:45:48 -0800 (PST)
Date: Sun, 24 Feb 2008 12:48:28 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080224124828.4d5fa153@widy.localdomain>
In-Reply-To: <c384c5ea0802240225v54a79684u895d791ec463bf12@mail.gmail.com>
References: <20080220034407.649326ee@widy.localdomain>
	<19c1b8a90802222253t40394124nbf31e0028b9a252@mail.gmail.com>
	<20080223202606.633f80f7@widy.localdomain>
	<c384c5ea0802240225v54a79684u895d791ec463bf12@mail.gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 72.14.220.152
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Issue: ldconfig postinst and uclibc
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
X-List-Received-Date: Sun, 24 Feb 2008 10:46:12 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sun, 24 Feb 2008 11:25:34 +0100
"Leon Woestenberg" <leon.woestenberg@gmail.com> wrote:

> Hello all,
> 
> On Sat, Feb 23, 2008 at 7:26 PM, Paul Sokolovsky <pmiscml@gmail.com>
> wrote:
> >  > >  2. Use "[ -x /sbin/ldconfig ] && /sbin/ldconfig" in postinst.
> >  > > Note: currently ldconfig is called without a path.
> >  > >
> >  > >
> >  > >  Thoughts?
> 
> Yes, apparently we have two cases:
> 
> (1) build-time package installation only. Typically people building
> firmware for embedded systems.
> (2) both build-time and run-time package installation. Handhelds etc.
> where users can deploy packages afterwards.
> 
> Can we distuingish those two cases and then make OE
> (1) not install ipkg, ldconfig, package info, feed info etc/

Well, this question is not directly related to the original topic,
IMHO. There're already ways to do that, including multiple. See
initramfs-minimal-image.bb (installs only explicitly selected
packages, doesn't even pull their dependencies) and
initramfs-bootmenu-image.bb (force-removes known unneeded packages).
I'll intend to generalize postprocess commands from the latter, making
them "OE-global" (like zap_root_password) for easier reuse.

> (2) do install ipkg, ldconfig, etc.
> 
> Regards,
> -- 
> Leon
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


