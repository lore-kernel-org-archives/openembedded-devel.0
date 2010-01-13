Received: from mail.borenet.se ([213.134.106.117] helo=mail-storage.borenet.se)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xerxes@zafena.se>) id 1NV4ui-0006Dd-Tz
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 16:13:44 +0100
Received: from [192.168.1.103] (labb.zafena.se [213.134.106.61])
	by mail-storage.borenet.se (Postfix) with ESMTP id BFF7530E3D7;
	Wed, 13 Jan 2010 16:11:29 +0100 (CET)
Message-ID: <4B4DE2A2.2030800@zafena.se>
Date: Wed, 13 Jan 2010 16:11:30 +0100
From: =?ISO-8859-1?Q?Xerxes_R=E5nby?= <xerxes@zafena.se>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, alexondi@rambler.ru
References: <490981633.1263366609.160668084.15032@mcgi30.rambler.ru>
In-Reply-To: <490981633.1263366609.160668084.15032@mcgi30.rambler.ru>
X-SA-Exim-Connect-IP: 213.134.106.117
X-SA-Exim-Mail-From: xerxes@zafena.se
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Correct way continue build after error
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
X-List-Received-Date: Wed, 13 Jan 2010 15:13:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Perepelica Alexander wrote:
> Hello!
> I look in docs but didn't find answer for subj. Problem is if build is
> failed then I change receipt or configs and then what must I do to
> continue?
> If I must recompile last stage (with configuring and/or unpacking) are
> some ways to do that?
>
>
> -- 
> Thank you.
> Perepelica Alexander
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
Hi, if you have changed the .bb recipe for the package named "foo" to
fix the error, then recompile the package from scratch using:

bitbake -c clean foo
bitbake foo

More hints are found on the wiki:
http://wiki.openembedded.net/index.php/Bitbake_cheat_sheet

Cheers
Xerxes


