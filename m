Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1OcGi5-0006OH-Ei
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 13:46:38 +0200
Received: by fxm12 with SMTP id 12so5047280fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 04:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=eu/nEaI47V55s83XxIPEijzuwwW+FTYFM+RxUSzN39g=;
	b=pC35P3T1eezCXIhWFTox/PpFs3D5GKwt0xweiP/NwnaIYp56XTTxGgO3vn/hTx/7GV
	gLWtYROAb3VRBMqfJisa+mkCIiCmFCnJB8jNBbscIyhU0pcQSZE86LL3dIYoYxKmgWcD
	qWfNApsfPXAEZPIxI6YGseWLxQ7IH7rfbxcoA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JuiA/YG2z0xNpb+atrXmQdV1iATsb4EfUGyA58q3busgFR08NC14xy49f7k9SV1UEW
	/nX7MELI56ur9PT5neFSTAVwcGt6WtfmdSu3e1Fjp4FgTVDBf4p3dQRb+T5GC60dkkK5
	74WdATXreVkxUQFZFKsUy/NGZu8yb5LQbA+wI=
MIME-Version: 1.0
Received: by 10.239.180.140 with SMTP id i12mr206995hbg.140.1279885579681; 
	Fri, 23 Jul 2010 04:46:19 -0700 (PDT)
Received: by 10.239.181.207 with HTTP; Fri, 23 Jul 2010 04:46:19 -0700 (PDT)
In-Reply-To: <1279884267.13006.45.camel@rex>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
	<i2bg5t$mvp$1@dough.gmane.org>
	<1279872152.21888.149.camel@lenovo.internal.reciva.com>
	<i2bir6$un3$1@dough.gmane.org> <1279875548.13006.32.camel@rex>
	<AANLkTik8CaoY=od-BH7_ymJf1Yet5e-cJGJ3PFyPm42N@mail.gmail.com>
	<1279880630.2692.21.camel@mill.internal.reciva.com>
	<1279884267.13006.45.camel@rex>
Date: Fri, 23 Jul 2010 13:46:19 +0200
Message-ID: <AANLkTikMXP2-i8_fOSK7phd__1Hsg4oxh3CPrUu08MUZ@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages 	into native sysroot
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
X-List-Received-Date: Fri, 23 Jul 2010 11:46:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2010 at 1:24 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Fri, 2010-07-23 at 11:23 +0100, Phil Blundell wrote:
>> On Fri, 2010-07-23 at 11:35 +0200, Esben Haabendal wrote:
>> > config.sub will generally not accept something like armv7a-*
>>
>> That's probably true, but it ought to accept armv7a-*-* (and has done
>> for about fifteen years, so I expect almost all packages should now have
>> picked up that change). =A0I think OE always uses the triple so there
>> oughtn't to be any problem in practice.
>
> With tune-atom.inc active you'd have core2-*-* which I suspect
> config.sub will not accept. The point is the names we choose for sets of
> optimisation flags are not necessarily going to map well to config.sub
> and we shouldn't be crossing what are currently two independent
> namespaces...

Definitely not.

The question is why these two namespaces has to be independent.
But nevermind, I am just rambling here.

/Esben


