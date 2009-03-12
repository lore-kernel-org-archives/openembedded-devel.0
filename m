Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <will.newton@gmail.com>) id 1LhoaV-0008No-R0
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 18:20:55 +0100
Received: by fxm11 with SMTP id 11so1914129fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 10:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CtVhD3OMGA9mjAZgLMzmfBO2NADFTyvw2Wvr3vEoUH8=;
	b=jPgubRv4qwzjwkZe4hs55BViPix3D+KctGc1PqbpeHox+eV1ev7G6dCOcUgghjBhgi
	mhEL4LUGn15LD6zcpOjwgwr2NdhUnrrix/AHFJ6G5E/kdpQCCIF7wWkpA4U7D4VgQias
	ZP75A+lpnTAo6EZnmqucAs8zBhC1YlqV+QL6g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=R7jLkVDldoYco/ukHcLJWThqBNKIQaz0SFonqMV5wVpt+c9bzXGkRJYTu+cNrp6sZi
	f0kC59X/zYReRPWTvJ11BFL6jTIaS4YvKkmHd9Vt6N0E/YbwwCGhPRI87klcauKcYEDl
	9QwIOeqHFD2cx4pr+HfBtIyOfzIWuyX0I7bDs=
MIME-Version: 1.0
Received: by 10.223.114.68 with SMTP id d4mr151706faq.86.1236878439821; Thu, 
	12 Mar 2009 10:20:39 -0700 (PDT)
In-Reply-To: <200903121633.44051.marcin@juszkiewicz.com.pl>
References: <200903121633.44051.marcin@juszkiewicz.com.pl>
Date: Thu, 12 Mar 2009 17:20:39 +0000
Message-ID: <87a5b0800903121020x15462cbcj40bad758ab859fb1@mail.gmail.com>
From: Will Newton <will.newton@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Benchmarks on our devices
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
X-List-Received-Date: Thu, 12 Mar 2009 17:20:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Thu, Mar 12, 2009 at 3:33 PM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
>
> Hi
>
> Some time ago I wrote post about Vortex86sx device [1] and its speed. In
> it I compared results of 'hdparm -T /dev/sda' on misc devices. But many
> people thought that it touches storage controller (which it does not in
> this test) I decided to run better set of benchmarks on embedded
> devices.
>
> The question which I want to ask is: Which benchmark tools would people
> like to see in such comparison? And which devices to compare?

lmbench has a range of micro and not-so-micro benchmarks.
There's various network benchmarks, e.g. netperf, but they can be
dependent on external network issues.


