Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NbrSX-00082Q-P2
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 09:16:41 +0100
Received: by iwn10 with SMTP id 10so2528881iwn.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2010 00:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9XFzFXRkCaL070Zo5Qulv0sNGO95ImG8ZsDqm4ztFRA=;
	b=EdOCFXWvRD9VtcLlzglbLAVCAh6KGRF3xmCg1jQ4ZDDoW8cfXDjTVItlVxB3nh66Ib
	1GZR6rclGlXjC0cDYHr6CqFqOwd2cJGl4rXH6l8n3+G2M2adm0cPhZq7GYL9/Cx3Mlyp
	Hr2EkDu6bePhNPCKuMg05Lzo4mw3BXCh5hJ5Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iDlwxZ+8VQ01NVhCgbjo+BXoEKcRnsWkhKzO6mssWwIHdTtOPd/6AkkjPZfDcXDJPW
	pEyrMk8j0uJIBUi7haQVvmtiLEgURcLC/snXTcnTtBmSBTD8JElhMriEfofn3Fh8nlig
	3PeQcFex97gQjc6QN+DzUUQdQExoV5L8xwgg0=
MIME-Version: 1.0
Received: by 10.231.167.65 with SMTP id p1mr3771413iby.20.1265012048105; Mon, 
	01 Feb 2010 00:14:08 -0800 (PST)
In-Reply-To: <op.u7dxg6szmn1qzu@camelguo>
References: <op.u7dxg6szmn1qzu@camelguo>
Date: Mon, 1 Feb 2010 00:14:08 -0800
Message-ID: <19c1b8a91002010014v39aa8735k6cf0852f507d36ac@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building chumby-kernel_2.6.16-chumby-1.2.bb failed due to arm-linux-ar: command not found
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
X-List-Received-Date: Mon, 01 Feb 2010 08:16:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 30, 2010 at 10:54 PM, Guo Hongruan <camelguo@gmail.com> wrote:
> Hi guys,
> =A0I tried to build openembedded with the following configuration in my
> local.conf
> MACHINE=3Dchumby
> DISTRO=3Dmicro
> LIBC=3Dglibc
> But when building chumby-kernel-2.6.16-chumby, I met an error with the
> following information:
>
> | make[1]: `include/asm-arm/mach-types.h' is up to date.
> | =A0 CHK =A0 =A0 usr/initramfs_list
> | =A0 CHK =A0 =A0 include/linux/compile.h
> | =A0 LD =A0 =A0 =A0sound/arm/built-in.o
> | /bin/sh: arm-linux-ar: command not found
>
> for more detailed information, please see
> http://tinderbox.openembedded.net/packages/451662/
>
> It seems that the ar used to build kernel is incorrect. It should be
> arm-oe-linux-gnueabi-ar not arm-linux-ar

right. Check kernel sources if its hard setting AR somewhere.

>
> --
> Guo Hongruan, Embedded Linux Consultant
> Skype: camelguo
> Twitter: camelguo
> http://www.gulessoft.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


