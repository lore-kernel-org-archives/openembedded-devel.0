Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NI2qA-0005BW-JS
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 17:23:09 +0100
Received: by pzk30 with SMTP id 30so4677083pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Dec 2009 08:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to:cc
	:content-type; bh=kqga0VAZOeBmpjdrBtEanLYhMl9D8YHGoz0vPVOv3e0=;
	b=Iq4HWOmkbTYNHRhAudQPiNaqttnw0GCz+oZTUHq7xN4E052g1qsDLrY0QrJOl5hooI
	J3xV7N5apImegGmHUCb6SCoWNiovls+HHs93YmhRcBtFVoqFtwqWGKHA3yh63UNFjST4
	tF4mXe9K2j9cnLqulW1MtLylVTHSupjfGRkvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=AEB6N5WqgV6fqrWSEp1Gm/mFhWc5P6c7Lfut6fP9ZOxR7u6ArWSiuQx3adVExot+z2
	4ReJGq2X5uE2PClbZextPBy7BUtADQXfvallXS6TulrQmg0MVlZtPnvSkhaAK1+xtn9R
	m32uAqda20qH35N0AKiu63xVZZ88poTfNo+mk=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.4.4 with SMTP id 4mr975626wfd.214.1260289284173; Tue, 08 
	Dec 2009 08:21:24 -0800 (PST)
In-Reply-To: <4B1E7699.7000004@mlbassoc.com>
References: <BAY127-W12CD092294401BAF297F8DD88F0@phx.gbl>
	<4B1E7699.7000004@mlbassoc.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 8 Dec 2009 09:21:04 -0700
X-Google-Sender-Auth: e290be76813148c8
Message-ID: <b6ebd0a50912080821r295faf03rd8b4159561a497c6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: saleh usman <salehusman@hotmail.com>
Subject: Re: Problem using "bitbake"
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
X-List-Received-Date: Tue, 08 Dec 2009 16:23:10 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 8, 2009 at 8:54 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> On 12/08/2009 08:49 AM, saleh usman wrote:
>
>>
>> Hello
>>
>> I am trying to build   "helloworld_image"  given in openembedded
>> recipes/images directory but the following error is occuring. Please help me
>> in diagnosing the pr0blem and moving forward.
>>
>>
>> [saleh@localhost build]$ bitbake helloworld_image
>>
>> NOTE: Parsing finished. 0 cached, 0 parsed, 0 skipped, 0 masked.
>> NOTE: Cache is clean, not saving.
>> ERROR: Nothing PROVIDES 'helloword_image'
>>
>
> Try 'bitbake helloworld-image' (dash, not underscore)
>
>
The 0 cached, 0 parsed, 0 skipped, 0 masked from the parse implies that
BBFILES was not set correctly, or at all.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.

