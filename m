Received: from [64.233.162.238] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1I0HiN-00080n-Kh
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jun 2007 15:56:19 +0200
Received: by nz-out-0506.google.com with SMTP id n29so1219584nzf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2007 06:52:47 -0700 (PDT)
Received: by 10.114.108.15 with SMTP id g15mr6197278wac.1182174766645;
	Mon, 18 Jun 2007 06:52:46 -0700 (PDT)
Received: by 10.114.191.17 with HTTP; Mon, 18 Jun 2007 06:52:46 -0700 (PDT)
Message-ID: <f96d234e0706180652q2faea21ai29bc16199b55d0b9@mail.gmail.com>
Date: Mon, 18 Jun 2007 09:52:46 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BAY143-F24A7882AECEEB415CE95A8B9130@phx.gbl>
MIME-Version: 1.0
References: <BAY143-F24A7882AECEEB415CE95A8B9130@phx.gbl>
Subject: Re: Some help on building a new dist.
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
X-List-Received-Date: Mon, 18 Jun 2007 13:56:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 6/18/07, Pelle Svensson <pelle2004@hotmail.com> wrote:

> I have playing around with OE and builded some packages ect.
> I have a project that I would like to build with OE.
> Where and how should I start.
>
> I have a fully working system with rootfs, bootloader, kernel and
> applications
> builded with outside OE with crosstools and some scripts.
>
> Have I understand OE correctly if it has fully dependency from a the point
> where I issue 'bitbake mysystem'.

Correct.

> My questions are:
>
> 1. What 'packages/*/*.bb' file do I need to create.
> Do I need one for putting the rootfs/jffs2 toghether, one for tasks, and one
> for the kernel.
> Where should they be located.

Generally, all you need to do is define:
 - a machine file (conf/machine/<machine.conf>)
 - a local.conf
 - and a kernel

If there are platforms that are close, you may want to start with one of them.

> 2. What is the relation beetween packages files.
> Looking at opie it seems that
> .../images/opie-image.bb <- .../tasks/task-opie.bb <- a huge set of
> 'opie-..' pkg
>
> I have read this section and the manual for creating new targets
> http://www.openembedded.info/wiki/New_targets#Fileystem_image
>
> Should I start doing a copy of opie or?
> Have I forgotten anything beside 'local.conf'

local.conf may be enough if you can find a machine that works for you,
or you can put all the machine info in the local.conf file.  I would
not start with opie.  Angstrom is currently maintained and is probably
a better starting point.  I would start with:

bitbake angstrom-console-image

Once you get the console image up and running, then worry about more
complex images, switching to opie, etc.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


