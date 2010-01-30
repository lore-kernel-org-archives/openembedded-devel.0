Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NbEJy-0008Os-Ss
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 15:29:14 +0100
Received: (qmail 9219 invoked by uid 1003); 30 Jan 2010 14:26:44 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 30 Jan 2010 14:26:44 -0000
Message-ID: <4B6441A3.9060600@balister.org>
Date: Sat, 30 Jan 2010 09:26:43 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>
	<hk12nm$sdo$1@ger.gmane.org>
In-Reply-To: <hk12nm$sdo$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC] console-image.bb
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
X-List-Received-Date: Sat, 30 Jan 2010 14:29:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2010 05:47 AM, Rolf Leggewie wrote:
> Frans Meulenbroeks wrote:
>> Wouldn't it be cleaner to rename ANGSTROM_EXTRA_INSTALL to e.g.
>> DISTRO_EXTRA_INSTALL ?
>
> This has been discussed before, but not changed.  I think it made sense
> back then and I think it makes sense now.
>
> I believe there is even a better name than DISTRO_EXTRA_INSTALL to be
> found for the variable.  Maybe IMAGE_EXTRA_INSTALL?

I also like IMAGE_EXTRA_INSTALL. Distro's shouldn't be customizing 
images using this variable :)

The problem with this var is it means one persons console-image is not 
equal to anothers, but I am fine with this. I regularly use this 
variable to insert extra packages into an image for testing purposes.

Philip


