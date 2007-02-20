Received: from [64.233.182.188] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1HJdbD-0003eq-Ag
	for openembedded-devel@openembedded.org; Tue, 20 Feb 2007 23:36:39 +0100
Received: by nf-out-0910.google.com with SMTP id n28so19325nfc
	for <openembedded-devel@openembedded.org>;
	Tue, 20 Feb 2007 14:36:38 -0800 (PST)
Received: by 10.49.75.2 with SMTP id c2mr134496nfl.1172010998780;
	Tue, 20 Feb 2007 14:36:38 -0800 (PST)
Received: by 10.48.217.15 with HTTP; Tue, 20 Feb 2007 14:36:38 -0800 (PST)
Message-ID: <432beae0702201436v78aa4959q59cdad54da6a2627@mail.gmail.com>
Date: Tue, 20 Feb 2007 14:36:38 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1172010661.5884.113.camel@localhost.localdomain>
MIME-Version: 1.0
References: <1172010661.5884.113.camel@localhost.localdomain>
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: Impending Kexec interface change
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
X-List-Received-Date: Tue, 20 Feb 2007 22:36:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2/20/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> Anyone watching mainline kernels will note that ARM kexec support got
> merged and will be in 2.6.21 which is good. The issue is that the
> syscall number had to change since the one its using at the moment is a
> big hack.
>
> This means we will have to change kexec-tools and at that point it
> becomes incompatible with older kernels.
>
> We can wait a bit and change when 2.6.21 is released, or update all our
> patches now to use the new proper syscall number and update OE now.
>
> I know the NSLU2 people are users of this and would value their input.
>

I use kexec on my Zaurus to test new kernels (and run multiple "ROM"s)
so I'd be ineterested in the fix as well. I don't particularly care
how it's done, though. Please let the list know again once something
is decided and done. :-)

-- 
Justin Patrin


