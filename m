Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SszJt-00021x-F3
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Jul 2012 18:47:49 +0200
Received: by wgbdr1 with SMTP id dr1so4751915wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2012 09:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=OxVl5Y5+49QT02LcYNXULfAr0L4j8+bY8D7zgYgtync=;
	b=0Qx/vZ6QmQ9mbfo96CiUh1W4kAQVt4+JyfztDk5ZtH3eTTcDbccsodRYS6KHq4JR6l
	V4oWfli+sQwzpedoJOwgcWIBurCpb8gNKW38ZVCIK7i9v8IC+iwObsifgwo9Cp8tYJiF
	pxV8NwFJw/G8VuTZ/axbfknnJOEofHHXUuHPp5RHBwfnMeSXazHOf3PiB5xMbNaC64JX
	NJhFJijo6I4gkRYcTkjTVzrzuGrrTxELsd74DidXhcmwYNynRxskdLFQ0DRnUMRehZc+
	+ZiorAgBaAVORfxICrjtr0SRiwGI8QSqwUvY2z7iuzepejg3AMy3T6egV1AYDZeuzNFk
	1V2Q==
Received: by 10.216.69.196 with SMTP id n46mr1988482wed.192.1342974983630;
	Sun, 22 Jul 2012 09:36:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.18.98 with HTTP; Sun, 22 Jul 2012 09:35:53 -0700 (PDT)
In-Reply-To: <jug959$3gr$1@dough.gmane.org>
References: <1342899684-4450-1-git-send-email-raj.khem@gmail.com>
	<jug959$3gr$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 Jul 2012 09:35:53 -0700
Message-ID: <CAMKF1soBGKfELcPqLALt2SeZzvp6keA2DwpumoCQinPqo1j=PQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH] systemd_git.bb: Dont inherit vala and gitpkgv
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
X-List-Received-Date: Sun, 22 Jul 2012 16:47:49 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 22, 2012 at 12:12 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> The vala one isn't needed anymore, the GUI bits are a seperate project now,
> but the gitpkgv needs to stay. We can symlink the class from meta-oe into
> meta-systemd

why do we need gitpkgv it creates unnecessary dependency on meta-oe it
would be better
to avoid it. What are downsides of not using gitpkgv ?


