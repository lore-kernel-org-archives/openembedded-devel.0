Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1PJxrY-0004uM-66
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 01:33:01 +0100
Received: (qmail 5468 invoked by uid 1003); 21 Nov 2010 00:31:49 -0000
Received: from adsl-75-37-22-143.dsl.pltn13.sbcglobal.net (HELO
	?192.168.1.148?) (philip@opensdr.com@75.37.22.143)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	21 Nov 2010 00:31:49 -0000
Message-ID: <4CE86872.6010905@balister.org>
Date: Sat, 20 Nov 2010 16:31:46 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101027 Fedora/3.1.6-1.fc13 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE6FA0C.2090801@balister.org>
In-Reply-To: <4CE6FA0C.2090801@balister.org>
X-SA-Exim-Connect-IP: 216.168.135.166
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Revert commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8
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
X-List-Received-Date: Sun, 21 Nov 2010 00:33:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/2010 02:28 PM, Philip Balister wrote:
> I'd like to revert commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8. With
> this commit my build that includes angstrom-task-gnome.bb fails in a
> peculiar way. Basically, my process table is filled with a task. Looks
> like it is trying to run a pkg-config gtk+ operation. This is with
> angstrom-2010.x and a custom machine very similar to an overo.
>
> I realize this is a vague description, but I do not have time to isolate
> better at this time.
>
> Can we go ahead and revert this for now?

This has been tracked to the xmms package. Anyone have any ideas how we 
can fix the problem?

Philip


>
> Philip
>
>
> [1]
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=c2c8fe4c5629add94bd0b922f5b3446624a9f4d8
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


