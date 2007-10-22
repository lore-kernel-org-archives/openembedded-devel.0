Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1Ik240-0000RF-M6
	for openembedded-devel@openembedded.org; Mon, 22 Oct 2007 20:31:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9MIOdsm009235
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Oct 2007 19:24:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08895-08 for <openembedded-devel@openembedded.org>;
	Mon, 22 Oct 2007 19:24:36 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9MIOYMh009229
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Oct 2007 19:24:34 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <471CC31D.2010401@student.utwente.nl>
References: <4510693243.20071017152524@vanille-media.de>
	<471729ED.9080208@student.utwente.nl>
	<1192708743.6158.25.camel@localhost.localdomain>
	<471C8BF4.1050206@student.utwente.nl>
	<1193063767.6088.54.camel@localhost.localdomain>
	<471CC31D.2010401@student.utwente.nl>
Date: Mon, 22 Oct 2007 19:24:33 +0100
Message-Id: <1193077473.6088.68.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Cleaning up SDK/Toolchain
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
X-List-Received-Date: Mon, 22 Oct 2007 18:31:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-10-22 at 17:34 +0200, Koen Kooi wrote:
> Richard Purdie schreef:
> > * Each machine could have its own staging area. To do that you'd have to
> > make the populate staging stamp machine specific. That is possible
> > although bitbake might require some tweaks and it would have
> > implications for rm_work.
> 
> In essence it would make multimachine unimachine :(

Not necessarily. Only the populate_staging task would be machine
specific, not the all the tasks.

With the staging changes I'm thinking of, do_populate_staging basically
becomes a file copy. For the numbers of files we're talking about, it
should be fast. rm_work would still work as long as it preserved the
image directory under work...

> > * We implement packaged staging and only stage the dependencies needed
> > for each package.
>
> That would be a better approach. Graeme, do you still want to have a
> shot at implementing a unionfs based approach?

Hmm. Does that need root privs?

Richard



