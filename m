Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Q2nKb-0005jP-Hi
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 17:24:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 845C2314F491
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 17:22:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id INfGucCSpUA5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 17:22:16 +0100 (CET)
Received: from [172.22.22.61] (ip-109-90-23-193.unitymediagroup.de
	[109.90.23.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id D543E314F446
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 17:22:16 +0100 (CET)
Message-ID: <4D8B6FB4.1040906@opendreambox.org>
Date: Thu, 24 Mar 2011 17:22:12 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110307 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimPH65gqiSJGt9YtgJ2afpmPqX=snyMmMzP_+d4@mail.gmail.com>	<1300981024-9111-1-git-send-email-obi@opendreambox.org>
	<4D8B6AB8.8030300@cbnco.com>
In-Reply-To: <4D8B6AB8.8030300@cbnco.com>
Subject: Re: MACHINE_KERNEL_PR overrides PR for modules
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
X-List-Received-Date: Thu, 24 Mar 2011 16:24:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/24/2011 05:00 PM, Michael Smith wrote:
> Andreas Oberritter wrote:
>> how about this solution? For MACHINE_KERNEL_PR = "r11" and PR = "r20" it
>> creates PR = "r11.20", to mimic the revision numbers commonly seen with
>> recipes using INC_PR.
> 
> I'd rather see PR before MACHINE_KERNEL_PR as PR seems more "major". But
> like either way better than the current situation.

Actually, that's what I'd prefer, too. But I wanted to provide a
seamless upgrade path, as suggested by Frans.

I'm just starting to use MACHINE_KERNEL_PR, so for me there would be no
big difference either way.

One minor thing: If MACHINE_KERNEL_PR comes last, then
MACHINE_KERNEL_PR_append_local will IMO yield a nicer result.

In the meantime, I've sent an updated patch, moving the code to its own
bbclass file.

Regards,
Andreas



