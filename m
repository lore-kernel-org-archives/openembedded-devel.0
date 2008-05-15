Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Jwwqe-000628-AD
	for openembedded-devel@openembedded.org; Fri, 16 May 2008 12:07:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4FLjeaX028409
	for <openembedded-devel@openembedded.org>;
	Thu, 15 May 2008 22:45:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28372-01 for <openembedded-devel@openembedded.org>;
	Thu, 15 May 2008 22:45:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4FLjXbc028401
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 15 May 2008 22:45:34 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0805151151v35e28a99i2ccb39157d5d47f6@mail.gmail.com>
References: <c384c5ea0805141436m9f5151dje832c2da95379127@mail.gmail.com>
	<1210869726.7097.93.camel@localhost.localdomain>
	<c384c5ea0805151151v35e28a99i2ccb39157d5d47f6@mail.gmail.com>
Date: Thu, 15 May 2008 22:45:32 +0100
Message-Id: <1210887932.7097.107.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Stop on multiple providers but none explicitly	specified
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
X-List-Received-Date: Fri, 16 May 2008 10:07:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-05-15 at 20:51 +0200, Leon Woestenberg wrote:
> On Thu, May 15, 2008 at 6:42 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> > Bitbake will pick one, the options in brackets are in the order bitbake
> > will choose them. We sort them alphabetically iirc since that is more
> > deterministic than depending on parsing order which was the previous
> > approach.
>
> I agree it's more deterministic seen from the BitBake point-of-view
> and that's an improvement.
> 
> However, is it intuitive from the *user's* point-of-view to have
> BitBake make this decision?
> I think not; at least in the case of OpenEmbedded, there is at least a
> 50% chance this is not what the user intended.

You're making this sound clear cut and its not quite that easy :).
Firstly, 50% isn't a good figure, there is no limit to the number of
different packages which provide a given target so it could be 33%, 25%
or worse.

Secondly, there often is a good default choice its just bitbake doesn't
have the information to make it. For example, we'd probably all agree
that we'd like bitbake to by default:

Use uclibc for linux-uclibc/linux-uclibcgnueabi builds to satisfy virtual/libc
Use glibc for linux/linux-gnueabi builds to satisfy virtual/libc
Use libx11 to satisfy virtual/libx11

I guess what we could do is give each provider a PROVIDER_PREFERENCE =
"0". glibc then does:

PROVIDER_PREFERENCE_virtual/libc_linux = "1"
PROVIDER_PREFERENCE_virtual/libc_linux-gnueabi = "1"

uclibc does:

PROVIDER_PREFERENCE_virtual/libc_linux-uclibc = "1"
PROVIDER_PREFERENCE_virtual/libc_linux-uclibcgnueabi = "1"

libx11 does:

PROVIDER_PREFERENCE_virtual/libx11 = "1"

etc. and then it becomes a case of having bitbake use this information.
It would then be able to error if more that one entry had the highest
preference for a given provider and yet the sane defaults should work.
This should also mean no specific distro setup is needed yet the distro
can set PREFERRED_PROVIDER statements which override the above
PREFERENCES if wanted.

Does that make sense?

Cheers,

Richard



