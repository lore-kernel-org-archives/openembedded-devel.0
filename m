Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 343BD7423D;
	Fri, 18 Sep 2015 09:02:36 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so55499801wic.0;
	Fri, 18 Sep 2015 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YRSIy86Lk4ISrFTBW23/Vlf9uXWN0ARba9E5EM8yCgg=;
	b=G8cQDhYXWU8EWDRvjzFm7OPVfAOTfAaY1GumG8Ibf4IK663ArDm5KR0AzjZRw84f1T
	H0lWboMt/n4TVX4M58Mp0dUkX+nXo3GCjAKkwTfsZtYKiJQ3yIUhd/uCANOZxX/cBx72
	SfDseYaJZ6RfEpIhYGcgGFyaTlw8Vz2kxevKbgqzhPtuqOZKWQLengMF8OfKg7S0Lpri
	qfswjC1tVTosCOKZIuYPgpvDFAUCoHhhE1PaeWVIrHnx17EuGLe0feBM4cAPYt5Baj/1
	ytUoWDCG5XKZ/r7mI6cYafJt5Oc6h1XKP0PxaAxqjC3veSD7Kdw5AFktX0aUbXPURibU
	Ozsg==
MIME-Version: 1.0
X-Received: by 10.180.8.200 with SMTP id t8mr15067894wia.34.1442566955972;
	Fri, 18 Sep 2015 02:02:35 -0700 (PDT)
Received: by 10.28.59.138 with HTTP; Fri, 18 Sep 2015 02:02:35 -0700 (PDT)
In-Reply-To: <2142960116.32810.1442562398390.JavaMail.zimbra@neratec.com>
References: <cover.1441929533.git.raj.khem@gmail.com>
	<e4c70967dd05d254bd59bd4f8a49836c3d499bfb.1441929533.git.raj.khem@gmail.com>
	<80e3806f09d6c399ccd4ccdf5f83997386ec85bc.1441929533.git.raj.khem@gmail.com>
	<CALbNGRR=LAdpubkJGdfx=mx5FGiVW=YDTObwRN8JLAnSfiPc=g@mail.gmail.com>
	<CAMKF1so4a85NDgwLOL1RYHyXQTQcAdHJ9FM7yhaJbrnpTzdx0g@mail.gmail.com>
	<2142960116.32810.1442562398390.JavaMail.zimbra@neratec.com>
Date: Fri, 18 Sep 2015 11:02:35 +0200
Message-ID: <CA+chaQfdK4irH2DvnX-c=4pPHv2VXg3Y81mm6RuP845aJy_8yw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Adrian Freihofer <adrian.freihofer@neratec.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V2 2/3] systemd: Upgrade 219 -> 225
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Sep 2015 09:02:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

we're not accepting github's pull requests, see README.

Andreas already send many fixes for gudev, please check master-next if
something is missing from your changes and resend to ML.

On Fri, Sep 18, 2015 at 9:46 AM, Adrian Freihofer <
adrian.freihofer@neratec.com> wrote:

> Hi Andreas
>
> Here is a first patchset ready for pulling...
> https://github.com/openembedded/meta-openembedded/pull/16
>
> ------------------------------
> *Von: *"Khem Raj" <raj.khem@gmail.com>
> *An: *"Andreas M=C3=BCller" <schnitzeltony@googlemail.com>
> *CC: *openembedded-devel@lists.openembedded.org, "Patches and discussions
> about the oe-core layer" <openembedded-core@lists.openembedded.org>
> *Gesendet: *Mittwoch, 16. September 2015 23:18:50
> *Betreff: *Re: [OE-core] [PATCH V2 2/3] systemd: Upgrade 219 -> 225
>
> On Wed, Sep 16, 2015 at 2:17 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > Is anybody preparing patches for gudev (many packets in meta-oe require
> it)?
> >
> > If not I can do so. Is the home for libgudev oe-core or better meta-oe?
>
> meta-oe is better for now. I am not working on it.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

