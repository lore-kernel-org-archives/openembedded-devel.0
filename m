Received: from mail-iw0-f171.google.com ([209.85.223.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OACFj-00011a-Pb
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 03:21:33 +0200
Received: by iwn1 with SMTP id 1so693104iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 18:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YVQ/01gAWNc3IFjUkLtQYp2+bMiVH70RKLqYtEef/+8=;
	b=wU7qULWUnmwm12bzHVugrZmFFl1c/2/JrrQnZ5Iypw5GaAi8mYdNHicwzsA23zNGU3
	DjRHgV4mGHepBr9FlrJKXvWxeEe7oIO7aA+jwsVzdGwtF88jfhIiERWWK+o+lCB8WdB9
	AMzNATVDjYBwkl/Y4fMTiVazwTCLEdDWSBzU4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=mm/2kvmYZmpu2UKtgyu2LSzL8Gfob7l8b0RClvC0ne3Il73bGf0oIVKcDJzN2omsxU
	MWoD2m+druwdyT0AppWM5kCRMdwSucw1Jig9A/C4CQnc4V3lI52hFtThdXMbfm85eM+d
	reo4DoTT/H2o3MtzSA1icdcMedksTyLg10hcg=
MIME-Version: 1.0
Received: by 10.231.152.83 with SMTP id f19mr2922709ibw.82.1273195043907; Thu, 
	06 May 2010 18:17:23 -0700 (PDT)
Received: by 10.231.39.73 with HTTP; Thu, 6 May 2010 18:17:23 -0700 (PDT)
In-Reply-To: <1273175555.457.296.camel@trini-m4400>
References: <1273102999.5743.49.camel@rex>
	<1273104883.457.56.camel@trini-m4400>
	<1273175555.457.296.camel@trini-m4400>
Date: Thu, 6 May 2010 18:17:23 -0700
Message-ID: <s2g19c1b8a91005061817i5719e011z51260b5361e708e7@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.171
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The rpurdie/work-in-progress branch has been merged
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
X-List-Received-Date: Fri, 07 May 2010 01:21:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2010 at 12:52 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On Wed, 2010-05-05 at 17:14 -0700, Tom Rini wrote:
>> On Thu, 2010-05-06 at 00:43 +0100, Richard Purdie wrote:
>> > I finally felt the time was right so I've merged the work-in-progress
>> > branch I've been talking about to OE.dev. This contains various
>> > architecture improvements and legacy staging cleanups that have been
>> > used in Poky for a while with great benefit.
>>
>> I've started testing DISTRO=3Dminimal with the machines and images I sai=
d
>> earlier. =A0Will report eventually (it's a lotta stuff).
>
> For DISTRO=3Dminimal, mpc8315e-rdb and calamari fail, both before and
> after these changes.

is it the same error about missing function from libgcc or something else ?


 =A0For qemux86, qemuarm, qemumips and db1200,
> minimal-image builds and for the QEMU boards, x11-image builds as well.
>
> --
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


