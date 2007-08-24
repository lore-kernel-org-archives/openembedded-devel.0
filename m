Received: from [209.85.146.178] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1IOT5B-0004ZN-48
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2007 08:55:49 +0200
Received: by wa-out-1112.google.com with SMTP id l24so850720waf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 23:54:32 -0700 (PDT)
Received: by 10.114.56.1 with SMTP id e1mr307213waa.1187938472153;
	Thu, 23 Aug 2007 23:54:32 -0700 (PDT)
Received: by 10.115.73.16 with HTTP; Thu, 23 Aug 2007 23:54:32 -0700 (PDT)
Message-ID: <19c1b8a90708232354t16781acan31b1cac9acdcb400@mail.gmail.com>
Date: Thu, 23 Aug 2007 23:54:32 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0708231330i33cd810bw945240f8a2f24e10@mail.gmail.com>
MIME-Version: 1.0
References: <74d0deb30708230151h6601b1c3r9011b2a8d8eea2e8@mail.gmail.com>
	<c384c5ea0708231322l708a9a5cv36b4958a233f6eea@mail.gmail.com>
	<c384c5ea0708231330i33cd810bw945240f8a2f24e10@mail.gmail.com>
Subject: Re: glibc-package.bbclass: [ -f ] doesn't take multiple arguments
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
X-List-Received-Date: Fri, 24 Aug 2007 06:55:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

cp -a is not portable. e.g. on OSX  -a option is not available.  only
one file is being copied here so I think -a is not needed.

-Khem

On 8/23/07, Leon Woestenberg <leon.woestenberg@gmail.com> wrote:
> > I understand the condition fix, but are you sure the cp action should
> > not have a wildcard??
> >
> My bad, didn't read the second patch chunk. Looks good.
>
> Regards,
> --
> Leon
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


