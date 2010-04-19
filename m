Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O3pea-0003bO-AY
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Apr 2010 14:00:42 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id EC8A3EA7B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 07:57:08 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Mon, 19 Apr 2010 07:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=J4k/8IDbhBKaOgMqEoXDoGuAwQw=;
	b=KZ6+ZgABXP3SlU8RsTZL+Os2wZ1GlYVK5DDFyCz4hTvE4cJUYJ0POHoBwsQ5reUpNNc7hOeACVv7KzkOAPzjeIQ/jBJihlv5p1c3lS/cLpZttrp1Sew1WItklhKKFaBr5m97zN/AKrbZOD1bai4k+TorpKdqVDuLWeuZqjG7NS0=
X-Sasl-enc: TlDx/AOY4GAZcarESrv42OY/dPprwYwjb3Po+t+iJOH1 1271678228
Received: from [192.168.1.34] (hnvr-4d079781.pool.mediaWays.net [77.7.151.129])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 49550113E4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 07:57:08 -0400 (EDT)
Date: Mon, 19 Apr 2010 13:58:26 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BCACC5B.1000601@gmail.com>
Message-ID: <alpine.LNX.2.00.1004191340210.5137@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
	<alpine.DEB.1.10.1004161853380.13187@vitus.devnet.local>
	<4BCACC5B.1000601@gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/5] linux_2.6.32: add tb5200l support
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
X-List-Received-Date: Mon, 19 Apr 2010 12:00:45 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Sun, 18 Apr 2010, Marco Cavallini wrote:

> Vitus Jensen ha scritto, Il 16/04/2010 18:54:
>> [PATCH 4/5] linux_2.6.32: add tb5200l support
>>
>> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
>> ---
>>  recipes/linux/linux_2.6.32.bb   |    1 +
>>  recipes/linux/tb5200l/defconfig | 1436 +++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 1437 insertions(+), 0 deletions(-)
>>  create mode 100644 recipes/linux/tb5200l/defconfig
>>
>> diff --git a/recipes/linux/linux_2.6.32.bb b/recipes/linux/linux_2.6.32.bb
>> index 7f2ef0a..85710ac 100644
>> --- a/recipes/linux/linux_2.6.32.bb
>> +++ b/recipes/linux/linux_2.6.32.bb
>> @@ -7,6 +7,7 @@ S = "${WORKDIR}/linux-${PV}"
>>  # Mark archs/machines that this kernel supports
>>  DEFAULT_PREFERENCE = "-1"
>>  DEFAULT_PREFERENCE_simone = "1"
>> +DEFAULT_PREFERENCE_tb5200l = "1"
>>
>>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
>>             file://defconfig"
>
>
> The /linux/linux_2.6.32.bb part of this patch doesn't apply and it is
> composed by two files, next time submit each file in a single patch,
> moreover you forgot to bump PR.
>
> Please correct and resubmit.

OK, will split the patch.

Sorry, had base the patch on old revision and will rebase it.  But do you 
really think it's neccessary to bump PR?  The patch won't change the 
contents of a recreated package, nothing needs to be rebuild, an 
installed package doesn't have to be updated.  So I think it's fine to 
keep PR when adding DEFAULT_PREFERENCE.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


