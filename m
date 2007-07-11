Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <slapinid@gmail.com>) id 1I8bsp-0006M1-Ec
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Jul 2007 15:05:31 +0200
Received: by wa-out-1112.google.com with SMTP id l24so2268650waf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2007 05:59:44 -0700 (PDT)
Received: by 10.114.127.1 with SMTP id z1mr5126828wac.1184158784163;
	Wed, 11 Jul 2007 05:59:44 -0700 (PDT)
Received: by 10.114.210.2 with HTTP; Wed, 11 Jul 2007 05:59:44 -0700 (PDT)
Message-ID: <48239d390707110559n1fabf2c9jcc598bc60715d5db@mail.gmail.com>
Date: Wed, 11 Jul 2007 16:59:44 +0400
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1184101289.3683.7.camel@localhost.localdomain>
MIME-Version: 1.0
References: <48239d390707100845o17a49392vcbf74fd5991b77f3@mail.gmail.com>
	<1184101289.3683.7.camel@localhost.localdomain>
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Palms commits.
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
X-List-Received-Date: Wed, 11 Jul 2007 13:05:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 7/11/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> Hi,
Hi,
Richard, thanks for your comments!

>
> I looked at the attachment and it does give me cause for concern.
>
> What's missing from your email is a clear piece of text saying why
> you're making the changes you are. Your commits are also a bit confused.
> Updating a kernel defconfig in "Palm Zire 72 machine update" isn't very
> obvious.
Well, this particular one is mostly due to kernel version update et
al., no functional changes with device point of view, just
un-breaking.


>
> As for comments on specific things in the patch, in principle I agree
> with common machine files and kernel updates. The
> MACHINE_EXTRA_RRECOMMENDS in the patch looks horrendous however and it
> does go against the principles of task-base and friends.
>
> Problems with the MACHINE_EXTRA_RRECOMMENDS include:
>
> * the modules should have dependency information which removes the need
> for all sound modules to be listed for example, you only need the ones
> at the tips of the chains.
> * duplication with entries already in task-base

Well, that's probably my misunderstanding/ignorance here.
Could you please give me references on where to study this particular
subject (module packages dependencies).

>
> The module_autoload statements also look scary. Is the device totally
> incapable of loading some of them for itself? I know for a fact you
> don't need all the sound ones.

Yes, but there I have to resolve dependencies by hand, am I right?

Thanks a lot,
S.


