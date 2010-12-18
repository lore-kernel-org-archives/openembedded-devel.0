Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PTsQS-00069a-MX
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 09:46:03 +0100
Received: by iwn8 with SMTP id 8so1643587iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 00:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Wm67aWl4mu7O8yHrsYzySaAeyaExuuXt71r1ZApznWA=;
	b=T+xPQfhEl4VYENPyHeQwSXIo4HHXRKU0C3WpUHyH9Svmu6wfTpwJ0EnNNCtdkH9q2F
	4833Bt4p0Jsqz7c1elcvF7kCF5h4Ulxx3bezyvt02k3smnxfo0qVuVIrz/ElUhL4PSj7
	Lzyuf9HSZkIq0DeJPQ8cmiqqAqGmAXdQInN3A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LhlTkS1GrfRsGjMge9U93hWbSaRLwMA0HM33wuSCQZpaWXmKLOar+SVwXUQsHNiYMz
	K+EjjhMWpexS8IyIzqu3YnVAyPSHHdLszhFYySuWueLRprZNztWK8ra6aatpF5fvrGS8
	MEtcN0kA16MzN2sTtguyuHCnJaId3BNPYTQFQ=
MIME-Version: 1.0
Received: by 10.231.31.1 with SMTP id w1mr1779671ibc.7.1292661958568; Sat, 18
	Dec 2010 00:45:58 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sat, 18 Dec 2010 00:45:58 -0800 (PST)
In-Reply-To: <4D0C65A2.6060106@zenlinux.com>
References: <AANLkTin7AtzCpMmNq_SSHcbDjZqaFXcdgd6T5fHrfb0r@mail.gmail.com>
	<4D0C65A2.6060106@zenlinux.com>
Date: Sat, 18 Dec 2010 09:45:58 +0100
Message-ID: <AANLkTi=dyL9me_pJyQeFpd47hHX+7+xYh-djOx7bdQVj@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
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
X-List-Received-Date: Sat, 18 Dec 2010 08:46:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/18 Scott Garman <sgarman@zenlinux.com>:
> On 12/17/2010 02:08 PM, Frans Meulenbroeks wrote:
>>
>> I just tried to make a jffs2 image, but got an error that mkfs.jffs2
>> was not found.
>> Apparently somewhere a dependency to mtd-utils-native should be added,
>> but I have no idea where.
>
> In conf/bitbake.conf there is a line:
>
> IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
>
> So one would think that would do the trick. Were you doing anything unusual
> to generate the jffs2 image (e.g, trying to override the default image type
> for your target)?

That line is here as well.
I did not do anything special. I was building james-image distro
minimal target sheevaplug
The only odd thing I noticed was that there was some mtd-utils output
in my recipes dir.
Maybe somewhere a build put stuff at the wrong place. Frankly no idea
how that could happen though (and didn't verify file times before I
nuked them.
We'll see if it reoccurs.

Frans.

PS: was about to press send, then Yuri mentionen a bitbake issue
causing output to end up at the wrong place.
Guess I've been bitten by that and the stamps tell that the package is
build but the exe is not there.


