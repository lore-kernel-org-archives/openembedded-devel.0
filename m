Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1IUTRF-0004fd-2m
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Sep 2007 22:31:25 +0200
Received: by wa-out-1112.google.com with SMTP id l24so1456761waf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2007 13:28:31 -0700 (PDT)
Received: by 10.114.202.15 with SMTP id z15mr3079369waf.1189369711425;
	Sun, 09 Sep 2007 13:28:31 -0700 (PDT)
Received: by 10.114.208.4 with HTTP; Sun, 9 Sep 2007 13:28:31 -0700 (PDT)
Message-ID: <19c1b8a90709091328g3370f5dbyf12e05f7dd725ca7@mail.gmail.com>
Date: Sun, 9 Sep 2007 13:28:31 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <65784821.20070909143237@vanille-media.de>
MIME-Version: 1.0
References: <46E3264C.39BD31A5@vollmann.ch>
	<74d0deb30709090150g161e6059q99f23e2ce1336e1c@mail.gmail.com>
	<46E3E02B.22CEE170@vollmann.ch>
	<65784821.20070909143237@vanille-media.de>
Subject: Re: Conditional Expressions in Python
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
X-List-Received-Date: Sun, 09 Sep 2007 20:31:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

yes it looks more readable too.

On 9/9/07, Dr. Michael Lauer <mickey@vanille-media.de> wrote:
> Guys,
>
> I vote for rewriting our conditional expressions hack in .bb files:
>
> DEPENDS = "${@['virtual/${TARGET_PREFIX}gcc-initial','virtual/${TARGET_PREFIX}gcc']['nptl' in '${GLIBC_ADDONS}']}"
>
> Since Python 2.5, this can be written as:
>
> DEPENDS = "${@'virtual/${TARGET_PREFIX}gcc' if 'nptl' in '${GLIBC_ADDONS}' else 'virtual/${TARGET_PREFIX}gcc-initial'}
>
> which parses faster and is much more clear and concise. IIRC the
> resulting bytecode is also faster since there is no need to construct,
> access, and destroy temporary lists.
>
> Regards,
>
> :M:
> --
> Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


