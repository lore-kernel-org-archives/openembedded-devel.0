Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NUSGs-0003ax-S5
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 22:58:02 +0100
Received: (qmail 9042 invoked by uid 1003); 11 Jan 2010 21:55:49 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 11 Jan 2010 21:55:48 -0000
Message-ID: <4B4B9E63.2090906@balister.org>
Date: Mon, 11 Jan 2010 16:55:47 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.1001110722550.22930@localhost>	<4B4B2B0E.8030501@balister.org>	<alpine.LFD.2.00.1001110856460.28813@localhost>	<4B4B3301.2090808@balister.org>
	<6ec4247d1001111337x5a5572a2l74d23bf1bfa03a68@mail.gmail.com>
In-Reply-To: <6ec4247d1001111337x5a5572a2l74d23bf1bfa03a68@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake and e2fsprogs-1.41.9?
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
X-List-Received-Date: Mon, 11 Jan 2010 21:58:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2010 04:37 PM, Graham Gower wrote:
> Yes, there is a build issue with e2fsprogs 1.41.5. I experienced it on
> a slackware64-13.0 host. It is not a Fedora issue, it is a bug in the
> Makefile. If you look in the Makefile you will see that the e2fsck
> dependency resolves to something containing "-lpthread".
>
> Why this doesn't cause issues for anyone else is beyond me. I can't
> even do a native, out of oe, build of e2fsprogs 1.41.5.

Do you have a bb file for this?

Philip


>
> -Graham
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


