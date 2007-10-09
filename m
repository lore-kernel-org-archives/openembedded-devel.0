Received: from [64.233.162.225] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hvontres@gmail.com>) id 1IfMJU-0005hx-OZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2007 23:08:25 +0200
Received: by nz-out-0506.google.com with SMTP id i11so986415nzh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2007 14:02:35 -0700 (PDT)
Received: by 10.143.9.5 with SMTP id m5mr3788444wfi.1191963753934;
	Tue, 09 Oct 2007 14:02:33 -0700 (PDT)
Received: by 10.143.11.12 with HTTP; Tue, 9 Oct 2007 14:02:33 -0700 (PDT)
Message-ID: <a7f8874a0710091402w7af1b580pe1fa89f95f5626de@mail.gmail.com>
Date: Tue, 9 Oct 2007 14:02:33 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: "Uli Luckas" <u.luckas@road.de>
In-Reply-To: <200709261801.13349.u.luckas@road.de>
MIME-Version: 1.0
References: <a7f8874a0709212103h126eeea7y751fa5fd4256fb20@mail.gmail.com>
	<200709260921.20447.u.luckas@road.de>
	<a7f8874a0709260729n9e4a06cy67456d4937a6dbdf@mail.gmail.com>
	<200709261801.13349.u.luckas@road.de>
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
X-List-Received-Date: Tue, 09 Oct 2007 21:08:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/26/07, Uli Luckas <u.luckas@road.de> wrote:
>
> On Wednesday, 26. September 2007, you wrote:
> > On 9/26/07, Uli Luckas <u.luckas@road.de> wrote:
> > > By the way, who is the original author of the arm-kexec-utils patch?
> I'd
> > > like
> > > to see kexec support pushed upstream which requires a sign-off of the
> > > original author.
> > >
> >
> > IIRC, Richard Purdie wrote the original kexec patch for arm. I would
> love
> > to try out your solution. Do you know which version of the vanilla
> kernel
> > now has the proper patches in place?
> I use kexec with 2.6.21.
>
> > I would most likely need to do some tweaking, since the original sharp
> > bootloader passes a cmdline that is incompatible with 2.6 kernels.
> For now you might have to modify the hard coded base address.
>
> > But I would love to see some support for kexec cmdline editing in the
> near
> > future.
> >
> > Henry von Tresckow (hvontres)
>
> Thanks,
> Uli
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
>

Ok, I have tested your patch and it works very well. I think the only real
stumbling block left is figuring out a way to get the base address for the
ATAG list without hard-coding it. I think if we can somehow access the
machine_desc structure in the kernel from user space, this would be easy.
Unfortunately I am not very good at kernel hacking yet, so if you or someone
else on the list has an idea, please let me know.

-- 
Henry von Tresckow (hvontres)

