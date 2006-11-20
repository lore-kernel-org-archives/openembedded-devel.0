Received: from [64.233.162.207] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Gm5Cb-00034T-4H
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Nov 2006 10:12:33 +0100
Received: by nz-out-0102.google.com with SMTP id z6so779043nzd
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2006 01:09:54 -0800 (PST)
Received: by 10.65.224.11 with SMTP id b11mr7525793qbr.1164013793243;
	Mon, 20 Nov 2006 01:09:53 -0800 (PST)
Received: by 10.65.243.9 with HTTP; Mon, 20 Nov 2006 01:09:53 -0800 (PST)
Message-ID: <c384c5ea0611200109i719a94cega65377b7b4d26b43@mail.gmail.com>
Date: Mon, 20 Nov 2006 10:09:53 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1163982989.5560.86.camel@localhost.localdomain>
MIME-Version: 1.0
References: <1163982989.5560.86.camel@localhost.localdomain>
Subject: Re: RFC: Bitbake dependency graph output
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
X-List-Received-Date: Mon, 20 Nov 2006 09:12:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I use the depgraph very often to tweak and remove the dependencies by
editing the package or its configuration, or even patches. (i.e. what
Gentoo does by  USE - flags, I do manually).

Therefore I like the current package dependencies. I am not per se
interested in the bitbake tasks for that job.

However, for future use, like a real-time graphical progress
indicator, the bitbake tasks dependencies are in fact very useful.

Any chance both are achievable?

> * Should -I IGNORED_DOT_DEPS become a more general commandline option to
> be appended to ASSUME_PROVIDED (which my replacement graph code does
> internally atm)? Do we want this to support regexps?
>
I would like that, I think it is very handy for ignoring for example
all '*-native' packages.

> http://www.rpsys.net/openzaurus/temp/bitbake_depgraph.patch is the patch
> I have atm.
>
(I think independently from this) here is my local regexp patch:

http://www.sidebranch.com/openembedded/bitbake/bitbake_graph_ignore_regexp.patch

Leon.


