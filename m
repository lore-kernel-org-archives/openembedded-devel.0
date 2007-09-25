Received: from [64.233.162.239] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hvontres@gmail.com>) id 1IaD7S-0004l1-4G
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Sep 2007 18:18:42 +0200
Received: by nz-out-0506.google.com with SMTP id i11so1167510nzh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2007 09:14:16 -0700 (PDT)
Received: by 10.142.232.20 with SMTP id e20mr1189428wfh.1190736854877;
	Tue, 25 Sep 2007 09:14:14 -0700 (PDT)
Received: by 10.143.11.12 with HTTP; Tue, 25 Sep 2007 09:14:14 -0700 (PDT)
Message-ID: <a7f8874a0709250914te82f7b4sdd5d818459320baa@mail.gmail.com>
Date: Tue, 25 Sep 2007 09:14:14 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: "Uli Luckas" <u.luckas@road.de>
In-Reply-To: <200709251620.52994.u.luckas@road.de>
MIME-Version: 1.0
References: <a7f8874a0709212103h126eeea7y751fa5fd4256fb20@mail.gmail.com>
	<a7f8874a0709241217o1fbd6060ka53b75837e07be78@mail.gmail.com>
	<200709251620.52994.u.luckas@road.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Kexec Cmdline Support
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
X-List-Received-Date: Tue, 25 Sep 2007 16:18:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/25/07, Uli Luckas <u.luckas@road.de> wrote:
>
> On Monday, 24. September 2007, Hans Henry von Tresckow wrote:
> > (sorry for crossposting this,but I think more of the interested parties
> > read oe-devel then angstrom-devel)
> >
> > A while back, mwester made some patches to add the ability to modify the
> > cmdline when using kexec to load a kernel. I did some testing on poodle
> and
> > posted the results on the bug tracker
> > (http://bugs.openembedded.org/show_bug.cgi?id=2969)
> > I was wondering what the rest of the developers think of these.
> Hi Henry,
> A while back I posted a different approach [1] to this mailing list for
> review. To bad, there have not been any comments.
>
> The differences of my approach in contrast to mwester's approach have been
> discussed on the arm kernel mailing list. If there is any interest in this
> (userspace) approach at all, I will improve on the known problems (like
> hard
> coded ATAG base address).
>
> I'd really appreciate feedback from the developers.
>
> Best regerds
> Uli
>
> 1)
>
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2007-August/002840.html
>
> --
>
> ------- ROAD ...the handyPC Company - - -  ) ) )
>
> Uli Luckas
> Software Development
>
> ROAD GmbH
> Bennigsenstr. 14 | 12159 Berlin | Germany
> fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
> url: www.road.de
>
> Amtsgericht Charlottenburg: HRB 96688 B
> Managing directors: Hans-Peter Constien, Hubertus von Streit



Uli,
Do you have a link to the kernel list discussion? At this point I am more
interested in getting cmdline support than in any particular implementation.
I did try your patch on top of mike's but I had no luck. One of the issues I
have run into is the BROKEN Sharp bootloader that makes things more
interesting. Mike's patches can work around this problem by setting up a
fake ATAG list at a non-standard location.

I would love to see more progress on this, since I would like to improve
support for booting devices from non-standard locations (ie SD card) without
custom kernels.

Thank you for your help,

Henry von Tresckow (hvontres)

