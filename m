Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Nlr3z-0007r9-Jn
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 22:52:39 +0100
Received: (qmail 17458 invoked by uid 1003); 28 Feb 2010 21:49:45 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 28 Feb 2010 21:49:45 -0000
Message-ID: <4B8AE4F8.1000906@balister.org>
Date: Sun, 28 Feb 2010 16:49:44 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1267383448-7009-1-git-send-email-ospite@studenti.unina.it>
	<hmehnp$n57$1@dough.gmane.org>
In-Reply-To: <hmehnp$n57$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ezx: Use pulseaudio 0.9.15
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
X-List-Received-Date: Sun, 28 Feb 2010 21:52:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2010 02:55 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 28-02-10 19:57, Antonio Ospite wrote:
>> Pulseaudio versions newer than 0.9.15 don't build on ezx machines (and
>> presumably on any armv5te), stick to this version until the problem is
>> handled upstream and a patch is available.
>>
>> Cfr: http://bugs.openembedded.org/show_bug.cgi?id=5404
>>
>> Signed-off-by: Antonio Ospite<ospite@studenti.unina.it>
>> ---
>>   conf/machine/include/motorola-ezx-base.inc |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
>> index 75c0f42..4d17211 100644
>> --- a/conf/machine/include/motorola-ezx-base.inc
>> +++ b/conf/machine/include/motorola-ezx-base.inc
>> @@ -2,6 +2,7 @@ TARGET_ARCH = "arm"
>>
>>   PREFERRED_PROVIDER_xserver = "xserver-kdrive"
>>   PREFERRED_PROVIDER_virtual/kernel ?= "openezx-kernel"
>> +PREFERRED_VERSION_pulseaudio = "0.9.15"
>
> NAK: machines have no business setting versions (except for kernels and
> even that is debatable).
>
> If it doesn't build, fix your distro.

I'm with Koen here, machines may be used by other distros so forcing 
revision selection for recipes (other than directly impact the machine) 
has no business in machine files.

Philip


