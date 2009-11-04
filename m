Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1N5gMg-0005Ys-E4
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 14:57:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id CAD411409727
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2009 14:53:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rm0PF1oOAF7k
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2009 14:53:32 +0100 (CET)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id A7F8E1417186
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2009 14:53:32 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1257340985.30217.95.camel@dax.rpnet.com>
References: <1257169407.11338.71.camel@dax.rpnet.com>
	<1257199740.10804.41.camel@dax.rpnet.com>
	<1257336919.14421.60.camel@hammer.suse.cz>
	<1257340985.30217.95.camel@dax.rpnet.com>
Date: Wed, 04 Nov 2009 14:56:23 +0100
Message-Id: <1257342983.14421.73.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Staging - time to end the current mess - now with patches
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
X-List-Received-Date: Wed, 04 Nov 2009 13:57:40 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:

> I'm toying with the idea of renaming the whole idea of "stage" to
> sysroot so we could have do_sysroot_package, do_sysroot_install and
> do_sysroot_mangle. That could be a lot clearer for the user?

It makes sense. But the sysroot directory itself has name "staging". It
would be nice to have consistent names.


>> It's a bit unrelated, but I would like to see temp/run.do_... script for
>> splitting install dir to sub-package dirs and packages and
>> temp/log.do_... with QA output that warns about unpackaged files.
>
>bitbake master does this already :)

Nice.

Well, just another trivial idea that can simplify life:

- files in temp/ and stamps/ can have number somewhere in its name - if
they will be sorted by name, then they will have its natural order.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



