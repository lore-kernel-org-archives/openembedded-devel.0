Received: from [209.85.198.187] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1II7Zd-0005o3-P7
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2007 20:45:02 +0200
Received: by rv-out-0910.google.com with SMTP id c24so1093679rvf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2007 11:42:34 -0700 (PDT)
Received: by 10.114.193.1 with SMTP id q1mr5920249waf.1186425754492;
	Mon, 06 Aug 2007 11:42:34 -0700 (PDT)
Received: by 10.114.208.14 with HTTP; Mon, 6 Aug 2007 11:42:34 -0700 (PDT)
Message-ID: <19c1b8a90708061142p29387a7fn2eb3951e4b57e539@mail.gmail.com>
Date: Mon, 6 Aug 2007 11:42:34 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <03d301c7d853$58ec39f0$6e01a8c0@twilight>
MIME-Version: 1.0
References: <03d301c7d853$58ec39f0$6e01a8c0@twilight>
Subject: Re: STAGING_LIBDIR_NATIVE needed in bitbake.conf
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
X-List-Received-Date: Mon, 06 Aug 2007 18:45:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 8/6/07, Mike (mwester) <mwester@dls.net> wrote:
> In order to fix an ncurses build bug
> (http://bugs.openembedded.org/show_bug.cgi?id=2554), we need to set
> LD_LIBRARY_PATH in the ncurses bb file.
>
> I've tested, and the following resolves the problem with ncurses not
> installing:
>
>     export LD_LIBRARY_PATH = "${STAGING_BINDIR_NATIVE}/../lib"
>
> That's not too elegant, so I'd like to create "STAGING_LIBDIR_NATIVE" in the
> bitbake.conf file instead, which will clean up the recipe and make more
> obvious what it is that we're doing.
>
>
> Anyone have any heartburn with this approach to resolving this problem?

I have encountered exactly same issue and I did the LD_LIBRARY_PATH
trick in env. Your fix looks reasonable.

>
> Thanks,
> Mike (mwester)
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


