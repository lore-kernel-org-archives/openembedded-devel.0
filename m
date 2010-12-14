Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1PSUzV-0008RB-3R
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 14:32:44 +0100
Received: (qmail 10199 invoked by uid 1003); 14 Dec 2010 13:30:47 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@74.107.167.114)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	14 Dec 2010 13:30:47 -0000
Message-ID: <4D077186.2050708@balister.org>
Date: Tue, 14 Dec 2010 08:30:46 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1PR45K-0000jK-SU@melo.openembedded.org>
	<01EE9A12-BE87-4EF6-9F0B-EAA20A1DBAAE@vanille-media.de>
In-Reply-To: <01EE9A12-BE87-4EF6-9F0B-EAA20A1DBAAE@vanille-media.de>
X-SA-Exim-Connect-IP: 216.168.135.166
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Philip Balister : i2c-tools : Stage i2c-dev.h header as i2c-dev-user.h.
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
X-List-Received-Date: Tue, 14 Dec 2010 13:32:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/2010 07:06 AM, Dr. Michael Lauer wrote:
> Am 10.12.2010 um 15:36 schrieb git version control:
>
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 48e6a063370a38a35f31a28efd8f6ce6ebf00840
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=48e6a063370a38a35f31a28efd8f6ce6ebf00840
>>
>> Author: Philip Balister<philip@balister.org>
>> Date:   Fri Dec 10 09:31:01 2010 -0500
>>
>> i2c-tools : Stage i2c-dev.h header as i2c-dev-user.h.
>>
>> Thanks to John Faith for suggesting this approach on the ML. The problem is
>> i2c-tools overwrites the header staged by the kernel. This breaks programs
>> that depend on the kernel header.
>
> I don't think this a good solution. Now all programs break which expect
> this very i2c-dev.h as being staged by i2c-tools. Interestingly, the
> desktop distros don't bother about staging it differently, so why
> can't we do the same? Besides, the i2c-dev.h as staged by i2c-tools
> is supposed to be a superset. If it isn't we should complain with the
> i2c-tools developers.
>
> What can we do in the meantime?

Can we get a survey of how other distros handle the situation?

My Fedora 14 box does not install the header from i2c-tools and there 
does not appear to be a dev package.

I do not think packages shoudl overwrite headers that come from the kernel.

Philip


