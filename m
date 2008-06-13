Received: from [201.35.65.91] (helo=freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1K7Csh-0003zc-Uh
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jun 2008 19:17:07 +0200
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 8ABEC160E3A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2008 14:15:51 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id E4AA013CB2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2008 14:15:49 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 13 Jun 2008 14:15:48 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id DA730C1F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2008 11:16:42 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 126A6C4857A; Fri, 13 Jun 2008 14:17:42 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<74d0deb30806130306tf5ca604t7238ab26d715e03@mail.gmail.com>
	<f96d234e0806130543u7fb1e71an1f75c50a76c0d859@mail.gmail.com>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Fri, 13 Jun 2008 14:17:42 -0300
In-Reply-To: <f96d234e0806130543u7fb1e71an1f75c50a76c0d859@mail.gmail.com>
	(Cliff Brake's message of "Fri\, 13 Jun 2008 08\:43\:49 -0400")
Message-ID: <87skvhtft5.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 13 Jun 2008 17:18:32 -0000
Content-Type: text/plain; charset=us-ascii

"Cliff Brake" <cliff.brake@gmail.com> writes:

> On Fri, Jun 13, 2008 at 6:06 AM, pHilipp Zabel <philipp.zabel@gmail.com> wrote:
>> On Fri, Jun 13, 2008 at 10:20 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
>>> As always, there is a but. This change is conditional on being able to
>>> come up with a sensible commit and review policy for OE.dev. The core
>>> team does feel that the metadata quality has dropped over time in some
>>> areas and we need to have a better review process. The change to an SCM
>>> with good branch support is a vital part of this but not the only part.
>>>
>>> We've not made any decisions on what the commit/review policy should be,
>>> this is open for discussion. We're thinking it may take the form of some
>>> kind of kernel style Signed-off-by: tags and a switch to a partially
>>> pull based model rather than just push based as we use monotone so more
>>> than one developer handles any given change.
>>
>> Personally, I'd like to see every patch to OE being sent to and
>> reviewed on the mailing list.
>> About a pull based model, wouldn't we need something like the kernels'
>> subsystem maintainers to share the load? Seeing that there already
>> seems to be a serious manpower problem, who would have the time to do
>> that?
>
> One of the differences with the OE meta data is that its structure is
> rather flat instead of a nice hierarchy like the kernel.  Another
> problem is an update in one of the core components can often have
> unforeseen consequences in other packages.  So I don't think there is
> any substitute for a lot of testing.  A lot of the work to keep it all
> going is simply busy-work -- updating URI's, adding new versions of
> packages, etc, so I would hate to slow that down.  How about coming up
> with a list of directories/files that need mail list review:
>
> - classes
> - conf/bitbake.conf
> - conf/distro
> - packages/images
> - packages/tasks
> - packages/linux/linux.inc
> - packages/glibc/
> ....
>
> Perhaps with everything else (machines, random packages), it would be
> strongly advised that you get sign-off from the maintainer of that
> recipe if listed.  This would help encourage the maintainers to stay
> involved.

I guess this together with something like linux-next would be nice.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


