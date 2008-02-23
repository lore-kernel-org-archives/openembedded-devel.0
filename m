Received: from [66.249.82.235] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <raj.khem@gmail.com>) id 1JSoG6-0002mo-6r
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Feb 2008 07:53:20 +0100
Received: by wx-out-0506.google.com with SMTP id h27so672383wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2008 22:53:03 -0800 (PST)
Received: by 10.114.192.1 with SMTP id p1mr100151waf.47.1203749582666;
	Fri, 22 Feb 2008 22:53:02 -0800 (PST)
Received: by 10.114.234.12 with HTTP; Fri, 22 Feb 2008 22:53:02 -0800 (PST)
Message-ID: <19c1b8a90802222253t40394124nbf31e0028b9a252@mail.gmail.com>
Date: Fri, 22 Feb 2008 22:53:02 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080220034407.649326ee@widy.localdomain>
MIME-Version: 1.0
References: <20080220034407.649326ee@widy.localdomain>
X-SA-Exim-Connect-IP: 66.249.82.235
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Sat, 23 Feb 2008 06:53:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Paul

ldconfig is provided by uclibc. Maybe we should enable UCLIBC_STATIC_LDCONFIG=y
in default config for uclibc. Idea 2 looks good to me.

-Khem

On Tue, Feb 19, 2008 at 5:44 PM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
> Hello,
>
>  It appears that ldconfig is not available / optional for uclibc. And
>  yet currently package.bbclass adds calling it unconditionally to lib
>  packages' postinst, which causes error messages during install.
>
>  Two solutions:
>
>  1. Add corresponding logic to package.bbclass. But it appears to be
>  hacky to encode such facts there.
>
>  2. Use "[ -x /sbin/ldconfig ] && /sbin/ldconfig" in postinst. Note:
>  currently ldconfig is called without a path.
>
>
>  Thoughts?
>
>  --
>  Best regards,
>   Paul                          mailto:pmiscml@gmail.com
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


