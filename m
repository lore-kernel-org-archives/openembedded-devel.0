Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N6DMO-0004W7-Is
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 02:11:31 +0100
Received: by bwz9 with SMTP id 9so642648bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 17:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=/pXXLavjgXIqqoXeEgbw/wCwXOFAmPaR631DDV0z9gA=;
	b=aIgOx/dysdmPJIyhmIXMw2txy9eJMts65mmwyfuWbzCslz9ZQm8QxpSJ87t6nb/ciI
	hmF24/ZPrvIUMu5M4lHvlDvFUbMAId9iBokvpgahkpcpcBbvwce2ftro94o0udlp2fKr
	7LgtRKa/4DMVomemXs4RKpgadFQWDPgmvyOcs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=Ucr0rAOqo8bUiWzKgNRSDib5gMvXqkprdo1hmUft1CPfnUAKC5PxtFV4xSDm+ksI8/
	+CuYQiulcjcgTzv20iBFlygI+d3MwOjp+iQvLaTriog2UW7UmnKNhD6yKYpNkZ2uHi/e
	EU/pl0wt4EjAHUK9+NWAtVo6SwSWbx/3ykcc4=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.163.205 with SMTP id q13mr392049hbd.132.1257469414306; 
	Thu, 05 Nov 2009 17:03:34 -0800 (PST)
In-Reply-To: <20091104125439.GA20450@zlo.nu>
References: <20091104125439.GA20450@zlo.nu>
Date: Thu, 5 Nov 2009 23:03:34 -0200
X-Google-Sender-Auth: 973ba83dd1f8c011
Message-ID: <be7a9f3d0911051703p33a3f0e1p223219ead98055eb@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Add dhcp 3.1.2p1 and fix unneeded bash dependency in 3.0.*
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
X-List-Received-Date: Fri, 06 Nov 2009 01:11:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Marc,

On Wed, Nov 4, 2009 at 10:54 AM, Marc Olzheim <zlo@zlo.nu> wrote:
> Hi,
>
> The latest stable of the isc dhcp 3.x source is 3.1.2p1. I realize that
> there are already 4.x releases out too, but I have not tested any of
> them yet.
>
> In any case: the dhclient/scripts/linux is a #!/bin/bash script which
> does not use any bashisms. As this was (dependency-wise) the only reason
> for our image to contain bash, I fixed this and while at it moved from
> 3.0.2 to 3.1.2p1.

While you're on it, it would be better to make it in a patchset doing:

 - move it all to a .inc and use INC_PR (to avoid useless duplication)
 - drop the bash requirement (as you did)
 - add the new version

And please, use format-patch to export those patches so we can easily push it.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


