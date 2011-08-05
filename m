Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1QpLhG-0007kM-LQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 16:48:22 +0200
Received: by gwb11 with SMTP id 11so661273gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2011 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=UQHC9ALJEqahb63+IoSCfXLnOMt1IPCQwu8TKAgJSpA=;
	b=N2mHCJ73ekFSK0V7b2oa3/mFQp5qqG33Hr3emPtF1LV8Fqy0SK26T/rilIRwrdxdS8
	XJ+PfjOxFZfKLNoP8BNkm6PV51GapjxcQ7AVn/Hd1mIcnyrFFbiNvtvtA1wYWE9hF4iG
	yvkOKB7RHKBQfioKTCqAsLeH9jx+5xLVuoLqE=
MIME-Version: 1.0
Received: by 10.236.184.194 with SMTP id s42mr3000349yhm.447.1312555434469;
	Fri, 05 Aug 2011 07:43:54 -0700 (PDT)
Received: by 10.236.110.3 with HTTP; Fri, 5 Aug 2011 07:43:54 -0700 (PDT)
In-Reply-To: <1312553761.14079.22.camel@jjg-linux>
References: <CAFu+nvEwf_hPbB0a21qJFWAHZqdCkb3MPaKaZcLFgD+xc7cGVw@mail.gmail.com>
	<4E15F6DD.2020308@mentor.com> <1312553761.14079.22.camel@jjg-linux>
Date: Fri, 5 Aug 2011 10:43:54 -0400
Message-ID: <CAFu+nvE3v+VswNB-3ZwF3dFMa42wgeSv6GMBJ4C=bYNpWKKFmw@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: classpath in 2011.03-maintenance
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
X-List-Received-Date: Fri, 05 Aug 2011 14:48:22 -0000
Content-Type: text/plain; charset=UTF-8

classpath is not actually building correctly, a bug in the shell script
wrapper for calling javac is eating the error code from javac, and making it
look like things built ok when they did not.

On Fri, Aug 5, 2011 at 10:16 AM, Jesse Gilles <jgilles@multitech.com> wrote:

> > On 07/07/2011 06:39 AM, George C. Huntington, III wrote:
> > > who are the people I should talk to about problems building classpath
> and
> > > jamvm on the  2011.03-maintenance branch?
> >
> > Start by posting your problems (and your config) to the ML.
> >
>
> I am also having issues with classpath 0.98 on the 2011.03-maintenance
> branch.  The package builds successfully, but the class library zip
> (/usr/share/classpath/glibj.zip) produced is way too small and is
> missing most classes.  The compile log shows many (around 4500) java
> compile errors, but the make doesn't error out so the bitbake task
> succeeds.
>
> current commit on my branch is 819822d3d32700dafbb3e33172450c34c6334f13
> DISTRO = "angstrom-2010.x"
> MACHINE = "at91sam9g20ek"
>
> Build machine is Ubuntu 10.04 x86_64.
>
> Lots of errors like this:
>
> 2. ERROR in ./external/asm/org/objectweb/asm/ClassVisitor.java (at line
> 65)
>    String name,
>    ^^^^^^
> String cannot be resolved to a type
>
> I attached the entire compile log for more detail.
>
> Is this perhaps an issue with ecj?
>
> Thanks,
> Jesse
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

