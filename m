Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RmTR1-0002Xi-QB
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 18:00:00 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0FGqNPj010322
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jan 2012 08:52:23 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 15 Jan 2012 08:52:23 -0800
Message-ID: <4F130446.5060203@windriver.com>
Date: Sun, 15 Jan 2012 10:52:22 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <CAPOJ94OspH5H4G-=wQNqb=DdHratNwV3LHYnYo2BW43sbavk+g@mail.gmail.com>
	<CABcZANmFa5CwuT0CY5pa8BE0wt70aGfZA3M4PJHPW_Rd3WA8bQ@mail.gmail.com>
	<CAPOJ94M5dbY68WWm0QU_sLwvbr+Na7sJ6ht_zjD7_WPOfCa=4g@mail.gmail.com>
In-Reply-To: <CAPOJ94M5dbY68WWm0QU_sLwvbr+Na7sJ6ht_zjD7_WPOfCa=4g@mail.gmail.com>
Subject: Re: oe-core license description practices
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
X-List-Received-Date: Sun, 15 Jan 2012 17:00:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Quick research.. Debian calls this GPLv2+... but I can find no corresponding 
evidence to what was quoted in the Debian copyright file.

What I did find was the quoted piece from the _mysql.c:

> This program is free software; you can redistribute it and/or modify
> it under the terms of the GNU General Public License as published by
> the Free Software Foundation; either version 2, or (at your option)
> any later version. Alternatively, you may use the original license
> reproduced below.
>
> Copyright 1999 by Comstar.net, Inc., Atlanta, GA, US.
>
>                         All Rights Reserved
>
> Permission to use, copy, modify, and distribute this software and its
> documentation for any purpose and without fee is hereby granted,
> provided that the above copyright notice appear in all copies and that
> both that copyright notice and this permission notice appear in
> supporting documentation, and that the name of Comstar.net, Inc.
> or COMSTAR not be used in advertising or publicity pertaining to
> distribution of the software without specific, written prior permission.
>
> COMSTAR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
> INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
> EVENT SHALL COMSTAR BE LIABLE FOR ANY SPECIAL, INDIRECT OR
> CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
> USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
> OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> PERFORMANCE OF THIS SOFTWARE.

and the comment in the README file:

> License
> -------
>
> GPL or the original license based on Python 1.5.2's license.
>
>
> :Author: Andy Dustman <andy@dustman.net>
> :Revision: $Id: README 641 2010-02-25 21:28:13Z kylev $

Based on the above, I'd call it GPLv2+ due to the one file having a specific 
license statement, and a compatible but nebulous license statement in the 
README.  I found no other license statements anywhere in the package.

--Mark

On 1/15/12 10:22 AM, Peter Bigot wrote:
> On Sun, Jan 15, 2012 at 10:05 AM, Chris Larson<clarson@kergoth.com>  wrote:
>> On Sun, Jan 15, 2012 at 8:15 AM, Peter Bigot<bigotp@acm.org>  wrote:
>>> http://www.openembedded.org/wiki/OpenEmbedded-Core states that the
>>> LICENSE field should be "as correct as possible (e.g. 'GPLv2', not
>>> just 'GPL')".  If the upstream package self-describes as "GPL", is it
>>> necessary that this be refined to a more specific version?
>>
>> Generally they may say they're GPL, but are actually GPLv2+ or
>> similar. Read the actual license text included in the source tree, and
>> the headers of the files.
>
> I have done that.  Please see the material I quoted below my question,
> and let me know how to proceed based on my description of what I found
> in the package.  Perhaps I'm being too careful, but I didn't find it
> clear enough to warrant unilaterally re-characterizing the licensing.
> Thanks.
>
> Peter
>
>> --
>> Christopher Larson
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



