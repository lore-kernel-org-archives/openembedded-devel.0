Received: from [64.233.184.238] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mattjreimer@gmail.com>) id 1H5Re5-0005JJ-Ev
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Jan 2007 20:01:08 +0100
Received: by wr-out-0506.google.com with SMTP id i23so431372wra
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2007 10:58:53 -0800 (PST)
Received: by 10.78.185.16 with SMTP id i16mr586428huf.1168628314660;
	Fri, 12 Jan 2007 10:58:34 -0800 (PST)
Received: by 10.78.178.8 with HTTP; Fri, 12 Jan 2007 10:58:34 -0800 (PST)
Message-ID: <f383264b0701121058n43be78dbu15871cb892681801@mail.gmail.com>
Date: Fri, 12 Jan 2007 10:58:34 -0800
From: "Matt Reimer" <mattjreimer@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20070111214849.GD336@mage.jpl.nasa.gov>
MIME-Version: 1.0
References: <20070111203010.GB336@mage.jpl.nasa.gov>
	<45A6A0C2.2080400@dominion.kabel.utwente.nl>
	<20070111214849.GD336@mage.jpl.nasa.gov>
Cc: openembedded-devel@openembedded.org, familiar@handhelds.org
Subject: Re: [announce] new tagged version of ipkg
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
X-List-Received-Date: Fri, 12 Jan 2007 19:01:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/11/07, Erik Hovland <erik@hovland.org> wrote:
> > Tarball?
>
> No tarball at this time. If one is desired it can be facilitated.
>
> > ChangeLog?
>
> The ipkg/C/ChangeLog has been updated:
>
> 2007-01-11 erik ( erik@hovland.org)
>         * Version update to 0.99.164
>         * Fixed usage of temporary files to be more secure
>         * Closed several potential memory/file descriptor leaks
>         * Cleaned up warnings in several parts of the code
>         * Added checking to libbb/unzip.c so it did not use tainted data
>         * Changed code in several places where it is possible to dereference an invalid pointer

I'd like to see this added to the ChangeLog:

* Converted from storing metadata in flat files to storing it in an sqlite db

Of course, a bit of work might be needed to actually make that a true
statement. ;-)

Matt


