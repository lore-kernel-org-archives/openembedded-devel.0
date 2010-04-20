Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O472G-0002vh-8V
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Apr 2010 08:34:19 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id BFFB3EA7AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Apr 2010 02:30:42 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Tue, 20 Apr 2010 02:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=w9RO6dnMdVs+ECPwYerdxVoxqTY=;
	b=BlOQVLTJtREChxIE1ZBwLJOAWrnRHNB7rOxMICbnBD2fFgU9+bJjn1yYBQpBkDm1SyUdy7baOetacsr8kD03ruQn0qUAqqH4yPUMUcyiUBybU3H4NDrwRoSF+Rq7e3OkbO/WavocigvTyrWt8DFQ0xo+6Wc9Ksu+ItlORjXAyAY=
X-Sasl-enc: PgPgZfllDw3LNqbTS6v5P0gmDG4tUyHnEzeKDVLuW9q9 1271745042
Received: from [192.168.1.34] (hnvr-4d079781.pool.mediaWays.net [77.7.151.129])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 3031C29A5A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Apr 2010 02:30:42 -0400 (EDT)
Date: Tue, 20 Apr 2010 08:32:00 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hqicrj$dp9$1@dough.gmane.org>
Message-ID: <alpine.LNX.2.00.1004200816260.5137@asterix.crazy-teaparty.dyndns.org>
References: <alpine.DEB.1.10.1004161912440.13411@vitus.devnet.local>
	<1271687665-23003-1-git-send-email-vjensen@gmx.de>
	<1271687665-23003-2-git-send-email-vjensen@gmx.de>
	<hqicrj$dp9$1@dough.gmane.org>
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
Subject: Re: [PATCH] angstrom-2008: make PREFERRED_VERSION_linux-libc-headers a weak assignment
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
X-List-Received-Date: Tue, 20 Apr 2010 06:34:22 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Mon, 19 Apr 2010, Koen Kooi wrote:

> On 19-04-10 16:34, Vitus Jensen wrote:
>>
>> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
>> ---
>>  conf/distro/angstrom-2008.1.conf |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
>> index 2b03e71..00f1a01 100644
>> --- a/conf/distro/angstrom-2008.1.conf
>> +++ b/conf/distro/angstrom-2008.1.conf
>> @@ -81,7 +81,7 @@ PREFERRED_VERSION_linux-handhelds-2.6 ?= "2.6.21-hh20"
>>  #KERNEL_INITRAMFS_PATH = "${KERNEL_INITRAMFS_DIR}/$(readlink ${KERNEL_INITRAMFS_DIR}initramfs-bootmenu-image-${MACHINE}.cpio.gz)"
>>
>>  #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
>> -PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
>> +PREFERRED_VERSION_linux-libc-headers 	?= "2.6.31"
>
> NACK, there's is a good reason it's not soft assigned. Your hack to make
> it machine specific is worse, since it means that other machines with
> the same arch now get a "random" version.

Well, if they don't prefer a version and use angstrom they get .31.

llc is only the description if the interface to kernel, IMHO a program 
should work with any version new enough to contain requested features.  I 
can think of two reasons to select a fixed version:

- either you want to use the exact same version as the kernel you are 
running (for whatever reason), in this case it's a machine-specific 
setting.

- or some userspace code has problems with newer headers.  In this case 
it's application specific and some parsing code would have to parse all 
used recipes.  But it would be better to fix userspace code in this case.

So floating would be fine with me.  But I'm on stable/2009 so I don't care 
how it's done in .dev

> What we can do is globally increase the version, which was planned
> anyway. Does can need .32 or .33? I tested using llc .32 locally, but
> hadn't pushed that change yet.

llc .32 would be good enough.


Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


