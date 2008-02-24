Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JTE3Q-0007bE-6K
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Feb 2008 11:25:58 +0100
Received: by an-out-0708.google.com with SMTP id b33so243002ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2008 02:25:34 -0800 (PST)
Received: by 10.100.207.5 with SMTP id e5mr3631729ang.96.1203848734550;
	Sun, 24 Feb 2008 02:25:34 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Sun, 24 Feb 2008 02:25:34 -0800 (PST)
Message-ID: <c384c5ea0802240225v54a79684u895d791ec463bf12@mail.gmail.com>
Date: Sun, 24 Feb 2008 11:25:34 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080223202606.633f80f7@widy.localdomain>
MIME-Version: 1.0
References: <20080220034407.649326ee@widy.localdomain>
	<19c1b8a90802222253t40394124nbf31e0028b9a252@mail.gmail.com>
	<20080223202606.633f80f7@widy.localdomain>
X-SA-Exim-Connect-IP: 209.85.132.244
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
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
X-List-Received-Date: Sun, 24 Feb 2008 10:25:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

On Sat, Feb 23, 2008 at 7:26 PM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
>  > >  2. Use "[ -x /sbin/ldconfig ] && /sbin/ldconfig" in postinst. Note:
>  > >  currently ldconfig is called without a path.
>  > >
>  > >
>  > >  Thoughts?

Yes, apparently we have two cases:

(1) build-time package installation only. Typically people building
firmware for embedded systems.
(2) both build-time and run-time package installation. Handhelds etc.
where users can deploy packages afterwards.

Can we distuingish those two cases and then make OE
(1) not install ipkg, ldconfig, package info, feed info etc/
(2) do install ipkg, ldconfig, etc.

Regards,
-- 
Leon


