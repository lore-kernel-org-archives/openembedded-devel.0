Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QZro9-00062x-CQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 23:51:29 +0200
Received: by pzk36 with SMTP id 36so1642263pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 14:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=caS0PLD0aMkwSpvgb1DKZ7fXmhYdXYE7nUcA/YWMmHs=;
	b=tz4PuB8wV3YzqVYb+4ZEgcBOoyWJQHqVo3GVwK1YG7BbnsPfw6F3fo20yNjeq66UFh
	aQcwKT0R64NJR2H8xYVfhacZxPr07RL1EUoT9DIguosXAzYiSAoejLw2WQ1okFIHNJJK
	CrU/Fr9Dt+UBvim5rYqHCXTb0QTlgVOYk8maA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BUUsKjwKgCtBYUQAVg9AnG3wgXubjXbbPINDE1VxplUeSUXCnj7AWCo/8aBNkaMRSU
	nK369Ottuu+fjs2LKYJ6yCSKgTLVx6FfYb2VQSnoBVqUP0F90jnDy+T+OLdWHG0q+43u
	56//9bJkDn7ieTuQ/xKGly3+SRS0MMqGWTRLI=
MIME-Version: 1.0
Received: by 10.142.86.2 with SMTP id j2mr555389wfb.251.1308865672125; Thu, 23
	Jun 2011 14:47:52 -0700 (PDT)
Received: by 10.142.142.18 with HTTP; Thu, 23 Jun 2011 14:47:52 -0700 (PDT)
In-Reply-To: <1308864494-26497-1-git-send-email-GNUtoo@no-log.org>
References: <1308857384-25527-1-git-send-email-GNUtoo@no-log.org>
	<1308864494-26497-1-git-send-email-GNUtoo@no-log.org>
Date: Thu, 23 Jun 2011 23:47:52 +0200
Message-ID: <BANLkTimZJxepdh=+=3ni=msDASjGmw-bFw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v5] conf/bitbake: unbreak and improve lzma image compression handling and adapt linux-kexecboot.inc
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
X-List-Received-Date: Thu, 23 Jun 2011 21:51:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2011 at 11:28 PM, Denis 'GNUtoo' Carikli
<GNUtoo@no-log.org> wrote:
> From: Otavio Salvador <otavio@ossystems.com.br>
>
> We now use xz-native to generate lzma images
>
> Kexecboot.inc needed to be adjusted in order to reflect the dependency
> =A0change from lzma-native to xz-native
>
> The initramfs.cpio.gz were tested with linux-kexecboot on nokia900.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> ---
> =A0conf/bitbake.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A05 ++---
> =A0recipes/linux/linux-kexecboot.inc | =A0 =A04 ++--
> =A02 files changed, 4 insertions(+), 5 deletions(-)
>

<snip>
Acked-by: Andrea Adami <andrea.adami@gmail.com>


