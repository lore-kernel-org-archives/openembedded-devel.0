Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1Gb2vB-0002oj-AB
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Oct 2006 00:32:57 +0200
Received: by py-out-1112.google.com with SMTP id i75so342971pye
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2006 15:25:45 -0700 (PDT)
Received: by 10.35.78.13 with SMTP id f13mr1439531pyl;
	Fri, 20 Oct 2006 14:58:54 -0700 (PDT)
Received: by 10.35.118.16 with HTTP; Fri, 20 Oct 2006 14:58:53 -0700 (PDT)
Message-ID: <432beae0610201458l1bde9ca8v7877a6964e94e710@mail.gmail.com>
Date: Fri, 20 Oct 2006 14:58:54 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <595433076.20061021003331@gmail.com>
MIME-Version: 1.0
References: <595433076.20061021003331@gmail.com>
Subject: Re: [RFC] Preferring tar.bz2 over tar.gz if there's a choice
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2006 22:32:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/20/06, Paul Sokolovsky <pmiscml@gmail.com> wrote:
> Hello openembedded-devel,
>
>   Nowadays, with multimegabyte software downloads, many projects
> provide both tar.bz2 and tar.gz archives for downloads. I'd like to
> make a proposal that we prefer tar.bz2 over .gz for obvious reason of
> saving bandwidth and disk space for lots of people using OE. In
> particular, I'd like to propose that it's ok to change .gz to .bz2 if
> such case is spotted.
>
>   We should be reasonably safe with this, as gzip can be considered
> pretty well a legacy archiver for big downloads now. The projects
> which started use bzip2 hardly give it up. And of course, many
> projects alreday use bzip2 solely, so it's not like adding a new
> dependency for OE.
>
>   Specifically, I have such patches for gdb_6.4 and libxml2_2.6.26 now
> in my tree.
>
>   (One would ask - why do I care up to the level of patchuing existing
> recipes? I'm exactly one of bandwidth-challenged, so try to use cheap
> local mirrors, and the mirrors of course usually have .bz2. I checked
> taht upstream actually provides .bz2, of course.)
>

What exactly are you referring to? Which distributed files? OE doesn't
really distribute anything but an OE db and that's one-time downloaded
when starting.

If you mean the images distributed from OE, that's a distribution
choice and OZ in particular can't just make the choice to switch
without adding a static binary of bzip2 (for flashing) and changing
its flashing script.

-- 
Justin Patrin


