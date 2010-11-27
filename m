Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PMPoo-00066A-0O
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 19:48:18 +0100
Received: by wyb40 with SMTP id 40so3057900wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 10:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=R+gXN8pnBqI2ypfwf7fMA23b2bvdC7MPezatqH0A7II=;
	b=tbVZ6Etc+OfnS2X75Dx6GWbDfR/VMqrvPMqepDOz/1FUcX92Tis50YEz4XFeRGbACH
	pHKyLITmyNQzQOdXQsUy9vRR2UjWKaBAp9iaNl/tGvyJTJI/Al6FTb3zCvPv7dJMs8g1
	Gpc/W4s9tiHy0USW2oDNGcwvSGtKf2oR9dlbs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Es4nOE4iYu7tGJBkAEH+03Y+3fgspEANsaq22OortIVKhxAtHllp3I4ISxOmPOLkQb
	blHR8/VHHCQOnyr13VEEDHdUYHd0V6bgpHvavL0HsT+u3OF3JKBK1npj9VLLtbIvwG1x
	jpSFEy70Dtnfgjfq1Ue+YpU8XVjE5vd5OsBOY=
MIME-Version: 1.0
Received: by 10.216.199.81 with SMTP id w59mr1137993wen.100.1290883617126;
	Sat, 27 Nov 2010 10:46:57 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Sat, 27 Nov 2010 10:46:57 -0800 (PST)
In-Reply-To: <1290769171.20979.51.camel@mill.internal.reciva.com>
References: <AANLkTinbu9JpEw5fdX8pHcxraf4uTdCf7JKm9v1UekeS@mail.gmail.com>
	<1290769171.20979.51.camel@mill.internal.reciva.com>
Date: Sat, 27 Nov 2010 19:46:57 +0100
Message-ID: <AANLkTimQ19OxwXNNPC6FsrV-_nS=6EcA59gSWyjMLSr4@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bluez-dtl1-workaround not provided?
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
X-List-Received-Date: Sat, 27 Nov 2010 18:48:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 26, 2010 at 11:59 AM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2010-11-25 at 18:24 +0100, Andrea Adami wrote:
>> So, first doubt is: why make this mandatory for everyone having pcmcia?
>
> It shouldn't be. =A0The dependency in kernel-module-dtl1-cs should be
> sufficient to pull it in for (only) those people who are installing the
> driver that needs those bits.
>
> p.

The issue appeared again with today's metadata building
glibc/uclibc/eglibc images.
Can we clear the sensible task / classes before release?

Andrea


