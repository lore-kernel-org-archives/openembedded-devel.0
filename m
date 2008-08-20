Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KVwE2-0002Xo-Ht
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Aug 2008 00:32:22 +0200
Received: by an-out-0708.google.com with SMTP id b38so108276ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2008 15:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=YsGedF0LyzpkineStJ9RJ1FsH3BisU50a2ywjxD3x3U=;
	b=G9qteb+2EuSO5gLuhgXRZUrg0ff6FWUjYWHUwxWbkinXWWyYPxC20muqDi8BTnuM+/
	yLry1LwKvJ+tRF9RnHKK6dOtX9FGJQqZzV1wqi5DxTiW5GTUHHmgBV9ok7T2evPi4Kvj
	SUzTPOGhI1mgeUiHgejVmYcW0SmcIc/DLAOHw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=vmMMLHJrqgRE6Lg20SqnjbqrrY+ch17WV44C92lmk/mexq0cJZMjmbAev7ecc5Js++
	f2/yiBDCY6MbAj7+Py/bEBKib7ait2qAHCwJWTq7h1srWMkNY119F/M5F6sacNnUguvV
	N2+OZkggKJl39XAiI0ksK9M7VHS1EvH53/CSg=
Received: by 10.100.214.19 with SMTP id m19mr1045946ang.1.1219271475105;
	Wed, 20 Aug 2008 15:31:15 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Wed, 20 Aug 2008 15:31:15 -0700 (PDT)
Message-ID: <c384c5ea0808201531n9127e7cqdc7097d088e541f3@mail.gmail.com>
Date: Thu, 21 Aug 2008 00:31:15 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48A135E2.2090606@gmx.net>
MIME-Version: 1.0
References: <48A135E2.2090606@gmx.net>
Subject: Re: RFC: avr32 kernel - make ext2/3 builtin for mmc/sd boot
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
X-List-Received-Date: Wed, 20 Aug 2008 22:32:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Robert,

On Tue, Aug 12, 2008 at 9:04 AM, Robert Schuster <theBohemian@gmx.net> wrote:
> Hi,
> in order to boot the ngw100 from mmc/sd it needs to have ext2/3 support
> builtin instead of having it as a module.
>
> I'd like to modify the defconfig in this regard. Is everyone OK with
> that change?
>
> Do we want ext2, ext3 or both?
>

+1 on Both. ext3 is also desired for booting the rootfs of a SD card,
like on the AT32STK1000 board.

We want journalling (ext3) there.

Regards
-- 
Leon


