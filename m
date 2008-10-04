Received: from [85.13.140.93] (helo=dd20204.kasserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1Km5jt-0001MT-HW
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Oct 2008 13:56:01 +0200
Received: from [192.168.1.103] (91-65-152-238-dynip.superkabel.de
	[91.65.152.238])
	by dd20204.kasserver.com (Postfix) with ESMTP id D4D5D181883E0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Oct 2008 13:51:43 +0200 (CEST)
Message-ID: <48E758CB.7040209@opensimpad.org>
Date: Sat, 04 Oct 2008 13:51:39 +0200
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Thunderbird 2.0.0.17 (X11/20080925)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48E6624C.7000409@opensimpad.org> <gc72hu$i8f$1@ger.gmane.org>
In-Reply-To: <gc72hu$i8f$1@ger.gmane.org>
Subject: Re: X/Qt2 opie integration (patches included)
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
X-List-Received-Date: Sat, 04 Oct 2008 11:56:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi schrieb:
>
> NACK!
>
> +do_install() {
> [..]
> +    install -d ${D}/home/root
> +    install -m 0600 .blackboxrc ${D}/home/root
>
> A package NEVER EVER touches $HOME. NEVER! I wish ascii could produces 
> some bigger capitals that blink and have baseballbats to get the point 
> across, but sadly it can't.
>
> Imagine I don't log in as root and fire up packagekit to install that 
> packages. I don't get the .blackboxrc, but the root user suddenly has 
> his .blackboxrc overwritten without notice.
>
> So:
>
> A package NEVER EVER touches $HOME. NEVER!
>
> ${sysconfdir} exists for a reason.
>
Ok, I added a second version of the patch to the bugtracker which 
implements your suggestion.

I did use ${HOME} in the first version because it is the standard 
location for blackbox configuration [1].

Is there any way for a clean implementation to put the config to the 
standard location? With e.g postinstall? I don't like the idea of not 
using a standard location but I agree that hardcode to /home/root can 
cause trouble.


best regards
Bernhard Guillon

1 
http://blackboxwm.sourceforge.net/BlackboxDocumentation/BlackboxConfiguration#location


