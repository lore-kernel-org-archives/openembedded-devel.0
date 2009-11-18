Received: from gv-out-0910.google.com ([216.239.58.189])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NAqLo-0004FH-0d
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 20:38:03 +0100
Received: by gv-out-0910.google.com with SMTP id e6so366348gvc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 11:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=OqxZBGWflrnL2PJrG6PCQqj6l516auOaTiFccd/hQ7I=;
	b=xfWrzoE29a0xUdLeaj2z6nPyNsc7//Tqafih+zHdE8kfkrOK9LMy2Fnqe+X7mCeiDc
	ZwA2Qt08Ql6Gas7wqEdqQrcGr0P3HTMSEi+aGGfOkqNP9zDbHmkZ9J+RVzs2yW+Zk/2L
	5zUq9yxRf6r4qKWfsF5yTeUV1WJhyQULKEGEo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=oDFSzOtMwuCMpHuFOUy/QlZ2Fb+bDYUhxS4vGQRFjH3la/0f2clH4fy9rIlnrR0f3r
	iAQrNCWbedu2HMZmgCykc6Agh1BiajrLANn4fTTZJbMga8bpQ9H5dVl+TC+7ctkzXJ8c
	s7Jlp243zUHUF46+Zz+DZ8sgfJLD+as793mCk=
MIME-Version: 1.0
Received: by 10.239.168.154 with SMTP id k26mr1204578hbe.104.1258572997332; 
	Wed, 18 Nov 2009 11:36:37 -0800 (PST)
In-Reply-To: <be7a9f3d0911181029u57f93a50y1715d81701191323@mail.gmail.com>
References: <1258504413-25056-1-git-send-email-leon@sidebranch.com>
	<be7a9f3d0911180509x7df420cetc4ed1575602b68e2@mail.gmail.com>
	<c384c5ea0911180814sc16a03dt3a829c5e5a8f9a@mail.gmail.com>
	<be7a9f3d0911181029u57f93a50y1715d81701191323@mail.gmail.com>
Date: Wed, 18 Nov 2009 20:36:37 +0100
Message-ID: <c384c5ea0911181136k68f3f724g84f78b9786995093@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 216.239.58.189
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] squashfs-4.0: update squashfs-tools to include upstream LZMA inclusion.
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
X-List-Received-Date: Wed, 18 Nov 2009 19:38:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Otavio,

On Wed, Nov 18, 2009 at 7:29 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Wed, Nov 18, 2009 at 2:14 PM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
>>> I agree with the move to mainline version however your recipe changes
>>> might need some improvement. You don't use the lzma recipe available
>>> in OE and instead grab it again ... IMO this is wrong since it
>>> duplicates the lzma source and also make more difficult to us to
>>> "share" fixes.
>>>
>> Yes, I noticed this.
>>
>> However, this is *exactl*y how the squashfs author designed his
>> integration of LZMA; simply referring to a specific extracted archive
>> of the LZMA SDK.
>>
>> (consider this is a lazy man's way of static linking)
>
> Anyway I think it is worth fixing it.
>
Yes, agreed, only if that approach would work (i.e. the needed
functions are correctly exported into the static library)
with the current code base.

> Duplicating sources (and the needed fixes, in case LZMA requires one)
> is wrong if avoidable so I'd say it would be nice to fix it.
>
Duplicating effort working against the upstream package is wrong too.
I would rather
go through the author to see this approach mainlined.


>> In the meantime, should I apply the patch as-is?
> You already did but I'd expect some time to reply before you pushing it.
>
Sorry I misunderstood your "good and thx" reply on IRC.
The current lzma recipe has some problems (use of dos2unix, not
building for target) that we need to fix first.

The currently committed recipe is pure metadata, builds the same way
as the upstream package does, and is tested for -native on a target,
by booting a squashfs-lzma compressed rootfs.
I propose to keep it as-is, then see if we can fix lzma, neaten the
squashfs-tools build, and bring it upstream.

Regards,
-- 
Leon


