Received: from [64.233.166.182] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <philipp.zabel@gmail.com>) id 1GM2B7-00051w-P2
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Sep 2006 14:43:21 +0200
Received: by py-out-1112.google.com with SMTP id i75so1155831pye
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Sep 2006 05:40:13 -0700 (PDT)
Received: by 10.35.40.10 with SMTP id s10mr4872400pyj;
	Sat, 09 Sep 2006 05:40:12 -0700 (PDT)
Received: by 10.35.96.8 with HTTP; Sat, 9 Sep 2006 05:40:12 -0700 (PDT)
Message-ID: <74d0deb30609090540l27c7675q8a6b4a2c2d85da2b@mail.gmail.com>
Date: Sat, 9 Sep 2006 14:40:12 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	"Jamie Lenehan" <lenehan@twibble.org>
In-Reply-To: <20060909044554.GA10625@twibble.org>
MIME-Version: 1.0
References: <E1GLfnq-00056C-UM@linuxtogo.org>
	<20060909044327.GA10580@twibble.org>
	<20060909044554.GA10625@twibble.org>
Subject: Re: PCRE breakage [libpcre: added new port]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Sep 2006 12:43:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/9/06, Jamie Lenehan <lenehan@twibble.org> wrote:
> On Sat, Sep 09, 2006 at 02:43:28PM +1000, Jamie Lenehan wrote:
> > On Fri, Sep 08, 2006 at 02:49:50PM +0200, "MartinDietze commit" wrote:
> > > libpcre: added new port.
> >
> > You added libpcre and removed pcre and in the process you've also:
> >
> >  - Broken 20+ recipes which DEPEND on pcre. These would all need to
> >    be modified to depend on libpcre now instead.

I tried to fix this one in 38f8d73bd80424075b07707fb224234553155085.

> >  - Removed the clearning of PARALLEL_MAKE so libpcre no longer builds
> >    for anyone doing parallel builds.
> >
> >  - It looks like you've also removed the fix which was added to stop
> >    libtool linking against the host libriares when somethings it
> >    attempts to link in libpcre on x86_64 hosts.
>
> And another one:
>
>    - Removed the LICENSE field from the recipe as well.
>
> --
>  Jamie Lenehan <lenehan@twibble.org>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


