Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1M4zrZ-0005WE-Fq
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 18:02:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 0E98A4B2E2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 11:55:24 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14111-09 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 15 May 2009 11:55:23 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id DCD1C494637
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 11:55:23 -0400 (EDT)
Message-ID: <4A0D906B.7060908@cbnco.com>
Date: Fri, 15 May 2009 11:55:23 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1242247998-30548-1-git-send-email-clarson@mvista.com>
In-Reply-To: <1242247998-30548-1-git-send-email-clarson@mvista.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] bitbake.conf, freeze.inc: Add version lockdown implementation and use it by	default.
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
X-List-Received-Date: Fri, 15 May 2009 16:02:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Chris Larson wrote:
> For each recipe which completes a task successfully, this emits the current
> version into ${TMPDIR}/versions.conf as a PREFERRED_VERSION line.
> ${TMPDIR}/versions.conf and conf/versions.conf are automatically included,
> in that order, in subsequent builds, to provide more deterinistic builds by
> default, and to let the user make the lockdown persist via a simple cp
> command.

Hi Chris,

If a distro doesn't lock down a particular version of a package, I 
figure after a "git pull" I'll be building the latest version of 
everything. At least, if I do a "bitbake -c clean somepkg" followed by a 
"bitbake somepkg", I'll get the latest version of somepkg.

If I understand the patch correctly, that won't happen anymore unless I 
remember to remove tmp/versions.conf. It adds an extra step to the 
process when one developer is using another's package.

I can see it leading to confusion between developers. Any time there's a 
multi-step process, humans will find a way to forget a step. :)

What's the problem the versions.conf is meant to solve? I would think if 
I'm doing a git pull and then rebuilding a package, it's because I want 
to get the latest version, but I think I'm missing something here.

Mike


