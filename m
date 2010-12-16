Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PTCb6-0001tA-NW
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 13:06:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 3AC78314BB65
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 13:04:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 4EvBQ9d0-qTE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 13:04:31 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 9B8F1314BB3A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 13:04:31 +0100 (CET)
Message-ID: <4D0A004F.8030408@opendreambox.org>
Date: Thu, 16 Dec 2010 13:04:31 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1291813231-24536-1-git-send-email-obi@opendreambox.org>	<4D0614C6.5060105@opendreambox.org>
	<20101216052752.GC18068@gmail.com>
In-Reply-To: <20101216052752.GC18068@gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH resend] package.bbclass: call PACKAGESTRIPFUNCS before populate_packages
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
X-List-Received-Date: Thu, 16 Dec 2010 12:06:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/16/2010 06:27 AM, Khem Raj wrote:
> On (13/12/10 13:42), Andreas Oberritter wrote:
>> Ping
>>
>> On 12/08/2010 02:00 PM, Andreas Oberritter wrote:
>>>   Introduce run_strip_funcs() to call the functions in
>>>   PACKAGESTRIPFUNCS and place it before populate_packages().
>>>
>>>   This allows users of do_split_packages() to package the .debug
>>>   directories, which get created by do_runstrip().
>>>
>>>   do_split_packages() is usually prepended to populate_packages().
>>>
>>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> 
> looks ok to me. I thought .debug are automatically picked into -debug
> packages 
> In what cases will this help ?

We have a set of plugins split into one package each. With this patch, I
can create "plugin-foo-dbg" packages, which seems to be much nicer than
having one meta-dbg package containing all debug symbols, especially
with a large amount of plugins.

Regards,
Andreas


