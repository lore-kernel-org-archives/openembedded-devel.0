Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OdgQD-0006kj-2M
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 11:26:16 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OdgPx-0005pD-18 for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 05:25:45 -0400
Date: Tue, 27 Jul 2010 05:25:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1280222125.3763.6.camel@mattotaupa>
Message-ID: <alpine.DEB.2.00.1007270523480.16599@lynx>
References: <AANLkTik+1EuG8Se996jFqVfQBXc3fFqoYPGzHh4hRsV2@mail.gmail.com>
	<1280222125.3763.6.camel@mattotaupa>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake error on ncurses_5.4.bb C compiler cannot create executables
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
X-List-Received-Date: Tue, 27 Jul 2010 09:26:40 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 27 Jul 2010, Paul Menzel wrote:

> Dear Ranjith,
>
>
> Am Dienstag, den 27.07.2010, 09:44 +0530 schrieb ranjith kannikara:
>
> > I was trying to run " bitbake fso-illume-image" and it rerturned an error
> > that do_config on ncurses5.4.bb failed
> > the respective log is
> >
> > Configuring NCURSES 5.4 ABI 5 (Tue Jul 27 09:32:35 IST 2010)
> > checking build system type... i686-pc-linux-gnu
> > checking host system type... arm-oe-linux-gnueabi
> > checking target system type... arm-oe-linux-gnueabi
> > Configuring for linux-gnueabi
> > checking for prefix... /usr
> > checking for arm-oe-linux-gnueabi-gcc... arm-oe-linux-gnueabi-gcc
> > -march=armv4t -mtune=arm920t -mthumb-interwork -mthumb
> > checking whether the C compiler works... no
> > configure: error: in
> > `/home/ranjith/test/build/tmp/work/armv4t-oe-linux-gnueabi/ncurses-5.4-r20.0/ncurses-5.4':
> > configure: error: C compiler cannot create executables
>
> Do other recipes work correctly?
>
> > See `config.log' for more details.
> >
> > and the config.log entry is
> >
> > .## ----------- ##
> > ## confdefs.h. ##
> > ## ----------- ##
> >
> > /* confdefs.h */
> > #define PACKAGE_NAME ""
> > #define PACKAGE_TARNAME ""
> > #define PACKAGE_VERSION ""
> > #define PACKAGE_STRING ""
> > #define PACKAGE_BUGREPORT ""
> > #define PACKAGE_URL ""
> > #define SYSTEM_NAME "linux-gnueabi"
> >
> > configure: exit 77
> >
> > I tried googling and tried installing gcc newer version, buildessentials,
> > epenembedded-essentials, but nothign worked for me.
> > So can any one help me in this regard to solve this issue ,,
>
> You did not provide information on what configuration and distribution
> you use. Did you try to rebuild the whole tree in a clean environment?

  not sure if this will be of any help but when i tried to build
yesterday, i also got an error on ncurses.  i didn't do any debugging,
i just waited a bit, did a "git pull", noticed some ncurses commits,
tried again and it built.  so are you working with the absolutely
latest repo contents?

  and, yes, it would be useful to know your distro and architecture.

rday

-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Top-notch, inexpensive online Linux/OSS/kernel courses
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


