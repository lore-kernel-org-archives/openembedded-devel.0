Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1PScIf-0007IA-LO
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 22:20:46 +0100
Received: (qmail 13053 invoked by uid 1003); 14 Dec 2010 21:19:07 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@74.107.167.114)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	14 Dec 2010 21:19:07 -0000
Message-ID: <4D07DF4B.7000800@balister.org>
Date: Tue, 14 Dec 2010 16:19:07 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1PSZng-0001y3-K3@melo.openembedded.org>
	<20101214205943.GF6662@jama>
In-Reply-To: <20101214205943.GF6662@jama>
X-SA-Exim-Connect-IP: 216.168.135.166
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Steve Sakoman : coreutils: experimental coreutils fix
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
X-List-Received-Date: Tue, 14 Dec 2010 21:20:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/2010 03:59 PM, Martin Jansa wrote:
> On Tue, Dec 14, 2010 at 06:40:36PM +0000, git version control wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 6f0ed3e2cebc76cc992ddc102ade8bfa13e17acb
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=6f0ed3e2cebc76cc992ddc102ade8bfa13e17acb
>>
>> Author: Steve Sakoman<steve@sakoman.com>
>> Date:   Sat Dec 11 07:16:26 2010 -0800
>>
>> coreutils: experimental coreutils fix
>
> what was wrong?
>

Sorry, I committed a fix I pulled from Steve's repo an dhe had a quick 
message on the commit.

Basically, the coreutils post install script that linked the coreutils 
version to the correct did not work. We can't figure out why, but 
removing the test solved the problem. As a side note, Poky also dropped 
the test.

Since this changes creates output that is more correct than the old 
behavior, I pushed it.

Philip


