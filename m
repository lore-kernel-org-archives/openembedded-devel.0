Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JSz2H-0004Ja-KE
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Feb 2008 19:23:47 +0100
Received: by ug-out-1314.google.com with SMTP id i24so269615ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Feb 2008 10:23:28 -0800 (PST)
Received: by 10.67.115.9 with SMTP id s9mr744460ugm.81.1203791008472;
	Sat, 23 Feb 2008 10:23:28 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id 19sm1720453ugl.13.2008.02.23.10.23.25
	(version=SSLv3 cipher=OTHER); Sat, 23 Feb 2008 10:23:26 -0800 (PST)
Date: Sat, 23 Feb 2008 20:26:06 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080223202606.633f80f7@widy.localdomain>
In-Reply-To: <19c1b8a90802222253t40394124nbf31e0028b9a252@mail.gmail.com>
References: <20080220034407.649326ee@widy.localdomain>
	<19c1b8a90802222253t40394124nbf31e0028b9a252@mail.gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.168
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
X-List-Received-Date: Sat, 23 Feb 2008 18:23:47 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Fri, 22 Feb 2008 22:53:02 -0800
"Khem Raj" <raj.khem@gmail.com> wrote:

> Hi Paul
> 
> ldconfig is provided by uclibc. Maybe we should enable
> UCLIBC_STATIC_LDCONFIG=y in default config for uclibc. Idea 2 looks
> good to me.

I hit this problem building packages for OpenWRT - they don't ship
ldconfig. So, solution #2 would indeed be better. So, I'm going to
apply it, unless there're late objections.

> 
> -Khem
> 
> On Tue, Feb 19, 2008 at 5:44 PM, Paul Sokolovsky <pmiscml@gmail.com>
> wrote:
> > Hello,
> >
> >  It appears that ldconfig is not available / optional for uclibc.
> > And yet currently package.bbclass adds calling it unconditionally
> > to lib packages' postinst, which causes error messages during
> > install.
> >
> >  Two solutions:
> >
> >  1. Add corresponding logic to package.bbclass. But it appears to be
> >  hacky to encode such facts there.
> >
> >  2. Use "[ -x /sbin/ldconfig ] && /sbin/ldconfig" in postinst. Note:
> >  currently ldconfig is called without a path.
> >
> >
> >  Thoughts?
[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


