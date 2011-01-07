Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PbD8c-0002cO-PC
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 15:17:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 831F1314CA2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jan 2011 15:17:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id k2Je-zRGtpoA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jan 2011 15:17:22 +0100 (CET)
Received: from [172.22.22.61] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 80444314C9FF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jan 2011 15:17:22 +0100 (CET)
Message-ID: <4D272079.5000402@opendreambox.org>
Date: Fri, 07 Jan 2011 15:17:29 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101210 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294392497-24747-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=UUDxkTNDoWBoOxaCPDyupG8BazYtt6nGs3-7E@mail.gmail.com>
In-Reply-To: <AANLkTi=UUDxkTNDoWBoOxaCPDyupG8BazYtt6nGs3-7E@mail.gmail.com>
Subject: Re: [PATCH] eglibc: Make it configurable by tuning eglibc	options
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
X-List-Received-Date: Fri, 07 Jan 2011 14:17:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/07/2011 02:47 PM, Otavio Salvador wrote:
> On Fri, Jan 7, 2011 at 07:28, Khem Raj <raj.khem@gmail.com> wrote:
>> * Look for disabled features in DISTRO_FEATURES and disable them while building eglibc
>> * By default all features are built
>> * One can disable a feature by specifying DISTRO_FEATURES += "noinet6 nobsd ...." e.g.
> 
> Awesome.
> 
> Do you think we could do something similar to busybox to avoid having
> many defconfigs?
> 

Maybe it would be better to introduce EGLIBC_FEATURES and
BUSYBOX_FEATURES, possibly presetting some values with options already
present in DISTRO_FEATURES.

Now it seems to be possible to specify both ipv6 and noipv6, which seems
inintuitive to me. It's not defined, which one would take precedence
over the other, or whether such conflicts could be catched to display an
error message.

Also, as an example, nobsd's name doesn't contain an implicit
relationship to eglibc, so one might think that it would affect other
packages as well.

Regards,
Andreas


