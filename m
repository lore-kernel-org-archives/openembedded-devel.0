Received: from [64.233.162.229] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <debasreeat@gmail.com>) id 1H4Xft-0006Di-8g
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jan 2007 08:15:05 +0100
Received: by nz-out-0506.google.com with SMTP id m22so12770nzf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jan 2007 23:13:16 -0800 (PST)
Received: by 10.65.219.11 with SMTP id w11mr67224qbq.1168413196155;
	Tue, 09 Jan 2007 23:13:16 -0800 (PST)
Received: by 10.65.250.6 with HTTP; Tue, 9 Jan 2007 23:13:16 -0800 (PST)
Message-ID: <193b6ba30701092313geb37716ma1a9329bb2c808cf@mail.gmail.com>
Date: Wed, 10 Jan 2007 16:13:16 +0900
From: "Debasree Mallick" <debasreeat@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20070105084303.GA3124@hezmatt.org>
MIME-Version: 1.0
References: <193b6ba30701050001t75ae1356s3bfb93e4834e1ba7@mail.gmail.com>
	<432beae0701050004n59458e75s53436646452806c0@mail.gmail.com>
	<193b6ba30701050014t25df7b5cw16cd8b1eb40995ef@mail.gmail.com>
	<20070105084303.GA3124@hezmatt.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: Please help me
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
X-List-Received-Date: Wed, 10 Jan 2007 07:15:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Matthew,

I want to use the prebuilt toolchain for ARM 9 target...But i could
not....As i skip the command
#bitbake world  as it will take 35GB
will it necessary to use the pre buitd toolchain in OE?????...

If u can please ans me...
Thanks
Debasree

On 1/5/07, Matthew Palmer <mpalmer@hezmatt.org> wrote:
>
> [Again, a relevant subject line would help]
>
> On Fri, Jan 05, 2007 at 05:14:18PM +0900, Debasree Mallick wrote:
> > When i type bitbake nano...then
>
> [snip]
>
> > NOTE: package fakeroot-native-1.2.13: started
> > NOTE: package fakeroot-native-1.2.13-r1: task do_fetch: started
> > NOTE: fetch http://openzaurus.org/mirror/fakeroot_1.2.13.tar.gz
> > --17:11:00--  http://openzaurus.org/mirror/fakeroot_1.2.13.tar.gz
> >            => `/root/sources/fakeroot_1.2.13.tar.gz'
> > Resolving openzaurus.org... 85.214.40.226
> > Connecting to openzaurus.org|85.214.40.226|:80... connected.
> > HTTP request sent, awaiting response... 302 Found
> > Location:
> http://openzaurus.linuxtogo.org/mirror/fakeroot_1.2.13.tar.gz[following]
> > --17:11:01--
> http://openzaurus.linuxtogo.org/mirror/fakeroot_1.2.13.tar.gz
> >            => `/root/sources/fakeroot_1.2.13.tar.gz'
> > Resolving openzaurus.linuxtogo.org... 85.214.40.226
> > Reusing existing connection to openzaurus.org:80.
> > HTTP request sent, awaiting response... 404 Not Found
> > 17:11:02 ERROR 404: Not Found.
>
> Ooooh bugger.  It looks like the source mirror has lost the fakeroot
> tarball; but that's a pretty old version of fakeroot -- I'm surprised
> there
> isn't a newer version in the tree.  I've never needed to build fakeroot to
> build things like nano, though.  That might be because I've already got
> fakeroot installed on my machine, though, so perhaps you could give that a
> shot?  It's not a /solution/, as such, but it'll at least get you going.
> Meanwhile, someone probably needs to either find that source tarball
> again,
> or update the tree to use a newer version of fakeroot.
>
> - Matt
>
> --
> With enough people around there's a probability ~=1 that one of them is an
> MCSE and will give you the wrong answer to your problem.
>         -- Toni Lassila, in the Monastery
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

