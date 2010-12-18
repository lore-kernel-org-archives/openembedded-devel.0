Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PTsY4-0007uG-Nt
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 09:53:53 +0100
Received: by wwi17 with SMTP id 17so1428295wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 00:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=EUbe8VYh81csfwOzwf1VrZaBtCc/J0HSEsJOrgs7FqY=;
	b=ckHjwcmzm7UjPVTUtS8xU6MycUaxX/lO/NMm/kQvzz2seUsRKQstCpQzw0nyRs5p1s
	jnRvlYD98RQkZ5ucY11F9aZzNdzoDlWY8OKvPgdtLqfmur03a5/5+vyVT7yP30gqDRKQ
	s/eDl+2seWfd7H9UpfrKUSZLFTTbaLAb+5F24=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=W7aJ//dbAPCqJfnpkvh/YZFA1ZcsqKpSAVNx9kBoxbFWdBqgpKFcOgAW3azpy8vckX
	AmW9+SreBeZZPjGQY9uXc4z2ptF3A1U6T6Ntt1mkh8fR0yP/9nvU5BCy2Yho3Zxt7nkS
	WfkipjdOU+MQvR103iK0V23m5+oyhd21poqYc=
MIME-Version: 1.0
Received: by 10.227.129.69 with SMTP id n5mr1136565wbs.136.1292662427932; Sat,
	18 Dec 2010 00:53:47 -0800 (PST)
Received: by 10.227.155.208 with HTTP; Sat, 18 Dec 2010 00:53:47 -0800 (PST)
In-Reply-To: <AANLkTi=dyL9me_pJyQeFpd47hHX+7+xYh-djOx7bdQVj@mail.gmail.com>
References: <AANLkTin7AtzCpMmNq_SSHcbDjZqaFXcdgd6T5fHrfb0r@mail.gmail.com>
	<4D0C65A2.6060106@zenlinux.com>
	<AANLkTi=dyL9me_pJyQeFpd47hHX+7+xYh-djOx7bdQVj@mail.gmail.com>
Date: Sat, 18 Dec 2010 19:23:47 +1030
Message-ID: <AANLkTimtqBoCQf49bZqZHO8tFmUYZjHqKYRymeMO62Ec@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: do_rootfs and mkfs.jffs2
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
X-List-Received-Date: Sat, 18 Dec 2010 08:53:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 December 2010 19:15, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/12/18 Scott Garman <sgarman@zenlinux.com>:
>> On 12/17/2010 02:08 PM, Frans Meulenbroeks wrote:
>>>
>>> I just tried to make a jffs2 image, but got an error that mkfs.jffs2
>>> was not found.
>>> Apparently somewhere a dependency to mtd-utils-native should be added,
>>> but I have no idea where.
>>
>> In conf/bitbake.conf there is a line:
>>
>> IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
>>
>> So one would think that would do the trick. Were you doing anything unusual
>> to generate the jffs2 image (e.g, trying to override the default image type
>> for your target)?
>
> That line is here as well.
> I did not do anything special. I was building james-image distro
> minimal target sheevaplug
> The only odd thing I noticed was that there was some mtd-utils output
> in my recipes dir.
> Maybe somewhere a build put stuff at the wrong place. Frankly no idea
> how that could happen though (and didn't verify file times before I
> nuked them.
> We'll see if it reoccurs.
>
> Frans.
>
> PS: was about to press send, then Yuri mentionen a bitbake issue
> causing output to end up at the wrong place.
> Guess I've been bitten by that and the stamps tell that the package is
> build but the exe is not there.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

I guess you're running bitbake master, but not quite up to date. This
mtd-utils problem is a side effect of the PWD environment variable
being incorrectly set, which has now been fixed in bitbake master.

-Graham


