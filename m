Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <papercrane@gmail.com>) id 1GYP65-0005qG-4x
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Oct 2006 17:37:17 +0200
Received: by py-out-1112.google.com with SMTP id i75so1079563pye
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2006 08:30:15 -0700 (PDT)
Received: by 10.35.93.19 with SMTP id v19mr5897965pyl;
	Fri, 13 Oct 2006 08:30:15 -0700 (PDT)
Received: by 10.35.118.16 with HTTP; Fri, 13 Oct 2006 08:30:14 -0700 (PDT)
Message-ID: <432beae0610130830u581b88a4o2b832c2e3aed2174@mail.gmail.com>
Date: Fri, 13 Oct 2006 08:30:15 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <20061013124655.282560@gmx.net>
MIME-Version: 1.0
References: <20061013124655.282560@gmx.net>
Subject: Re: distcc for bitbake
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
X-List-Received-Date: Fri, 13 Oct 2006 15:37:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/13/06, DecemberSoul@gmx.de <DecemberSoul@gmx.de> wrote:
> Hello
> It is my first post on this list, so please be considerately.
> I would like to use distcc for my bitbake.
> On my local copy, with some hacks, it works fine. (until the next update)
>
> Here is my way:
>
> distccd was installed (apt-get install distcc) and started on Host1, Host2 and Host3
> All hosts have the cross compiler mipsel-linux-gcc in the global PATH (or a symlink from /usr/local/bin/mipsel-linux-gcc to the cross compiler)
>
> I have created a directory:
> /bla/distcc/bin
>    mipsel-linux-c++ -> /usr/bin/distcc
>    mipsel-linux-cc -> /usr/bin/distcc
>    mipsel-linux-g++ -> /usr/bin/distcc
>    mipsel-linux-gcc -> /usr/bin/distcc
>
> If I compile a Project by calling make(without bitbake) I can use
> export PATH=/bla/distcc/bin:$PATH
> make -j6 CC=mipsel-linux-gcc
>
> make will call mipsel-linux-gcc from my path which points to distcc.
> distcc will schedule the tasks to all known hosts.
> -j6 will create 6 instances of make.
> It works fine.
>
> But now I want to use distcc with bitbake.
> I know how to use -j6 with bitbake.
> Just use "export PARALLEL_MAKE=-j6"
>
> But how to use export PATH=/bla/distcc/bin:$PATH with bitbake.
> The "distcc/bin" MUST stand in front of the PATH.
> But bitbake will place the $PATH_prepend (placed in org.openembedded.dev/conf/bitbake.conf) in front of the $PATH. My hack is now to include "/bla/distcc/bin" in front of $PATH_prepend.
> It works, but it is not nice.
>
> So please tell me where can I put it.
>

Perhaps a PATH_prepend at the beginning of your local.conf?

-- 
Justin Patrin


