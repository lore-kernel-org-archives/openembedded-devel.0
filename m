Received: from mail-yw0-f172.google.com ([209.85.211.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NbVbQ-000426-6k
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 09:56:23 +0100
Received: by ywh2 with SMTP id 2so2407771ywh.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2010 00:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ffz2gm/SyLGmuGbFGhKYijWODsCmtxfYzyph5zpo/cs=;
	b=Rcf3zYP71ro9t/p9dqnoseX2z0sLVc7ge6FE02qAgw1UGQcD0Cy8vidnimYeekNQZk
	saDN2XV7fxI0x26XovP8ULB4kxEOK6ypYiXrMsAYIXb6ZHwzw3aldUEG1cVx4S7ma/SC
	BctyzRdDJofpoqV+UuUVehSjiOVpKWdEspnlg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uz9WT/uQEvByonjvj4pm4gcal8L5y6vNkOAULFAB07Q3QmPOehKdISypla7TvhaOO4
	NrjqOSeKki+S0J8OVbvelELwYZ3gezS/eWiex8EzXdJwsXbHtyi/+J/fi9XnyhExN8CS
	9E3wtGJ7lhxPqj/m/f0C2clWBBaP/P/fl15Pk=
MIME-Version: 1.0
Received: by 10.101.168.12 with SMTP id v12mr3431600ano.122.1264928034689; 
	Sun, 31 Jan 2010 00:53:54 -0800 (PST)
In-Reply-To: <op.u7dzok03mn1qzu@camelguo>
References: <op.u7dzok03mn1qzu@camelguo>
Date: Sun, 31 Jan 2010 09:53:54 +0100
Message-ID: <ac9c93b11001310053u3e5322b4y293ac14f7b473c16@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.172
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building linux-kirkwood_2.6.33-rc5.bb for openrd-base failed and it causes bitbake exception
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
X-List-Received-Date: Sun, 31 Jan 2010 08:56:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/31 Guo Hongruan <camelguo@gmail.com>:
> Hi guys,
> =A0I tried to build openembedded with the following configuration:
> MACHINE=3Dopenrd-base
> DISTRO=3Dmicro
> LIBC=3Dglibc
> But when building linux kernel ( linux-kirkwood_2.6.33-rc5.bb ), there ar=
e
> some patches failed to be applied and bitbake raised some exceptions with
> unknow reason. The attachment is the raw error information captured from =
the
> screen. Hope it is useful.
>

I must admit that when moving to rc5 I only build openrd-client, not base.
I'll look into it later today or otherwise tomorrow.

Then again I sincerely doubt that the right patches are applied.
Two examples from your txt doc:

patching file drivers/macintosh/smu.c
Hunk #1 FAILED at 85.
Hunk #2 succeeded at 150 with fuzz 2 (offset 14 lines).
Hunk #3 FAILED at 239.
Hunk #4 FAILED at 493.
Hunk #5 succeeded at 574 with fuzz 2 (offset 23 lines).
3 out of 5 hunks FAILED -- rejects in file drivers/macintosh/smu.c


patching file drivers/net/pcmcia/smc91c92_cs.c
Hunk #1 FAILED at 559.
1 out of 1 hunk FAILED -- rejects in file drivers/net/pcmcia/smc91c92_cs.c

I strongly doubt that an openrd patch would touch a macintosh or pcmcia dri=
ver.

While I'll have a go at it, I suggest you clean out your tmp dir and try ag=
ain

It seems the bad patch is penrd-base-enable-pcie.patch
Can't look at that one right now.

Meanwhileyou can also set DEFAULT_PREFERENCE to -1, that will give you
the rc1 kernel.

Frans


