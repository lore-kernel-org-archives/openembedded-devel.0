Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1PDP63-00023a-EM
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 23:12:52 +0100
Received: from [127.0.0.1] (li38-254.members.linode.com [207.192.74.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 0EEA230423
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Nov 2010 18:11:57 -0400 (EDT)
Message-ID: <4CD08CA4.90105@zenlinux.com>
Date: Tue, 02 Nov 2010 15:11:48 -0700
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CD01D52.5020607@balister.org>	<1A82C1C5-1657-4642-B4F5-5EFCA799D1DC@dominion.thruhere.net>	<4CD06C95.7020903@zenlinux.com>
	<AANLkTimLCp34tWS7Ft5OA_Dtuv6CAtQSACsignVxQA=0@mail.gmail.com>
In-Reply-To: <AANLkTimLCp34tWS7Ft5OA_Dtuv6CAtQSACsignVxQA=0@mail.gmail.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 0EEA230423.BE46E
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded and the Yocto Project
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
X-List-Received-Date: Tue, 02 Nov 2010 22:12:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2010 03:00 PM, Leon Woestenberg wrote:
>> I am one of the folks who has been working on the Yocto Project (my work
>> email is scott.a.garman@intel.com, IRC nick zenlinuxPDX). One of my primary
>> responsibilities to date has been setting up and maintaining our
>> Buildbot-based autobuilder.
>>
> Did you keep notes on how to setup such an autobuilder that you can
> share in order to easily scale up this effort?

Hi Leon,

Actually, we even have a script to help automate setting up Buildbot:

http://git.pokylinux.org/cgit/cgit.cgi/poky-autobuilder/tree/scripts/poky-setup-autobuilder

It's been slightly sanitized and may require some minor tweaks. Also, 
we're planning on upgrading our Buildbot setup to 0.8.2 this month so 
there will be further updates coming soon. I will likely break this 
script up into master and slave setups, since Buildbot as of 0.8.1 
allows slave-only installations, which I imagine will be quite handy for 
OE testing volunteers.

In general, the poky-autobuilder repository has build and support 
scripts we're using (again, sometimes sanitized and in need of minor 
tweaks before you can run them yourself).

http://git.pokylinux.org/cgit/cgit.cgi/poky-autobuilder/

Scott


