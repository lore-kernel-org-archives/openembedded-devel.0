Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P51Tl-0005Vi-Ht
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 21:22:45 +0200
Received: by gwb17 with SMTP id 17so546727gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 12:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=uSJzUjIP7LEBJnvw3ihLuHE9aTwRS8gYCnycmW6JPBc=;
	b=HLx4c1HGVbrczNU/CdNqqZtY8cDmJw3FYh+UvBfjOeMB4zrSI7SoHUHmhvPlK2tgXU
	QQZPlttrAq072Uig1xinS/idAOfON4kRIG4deDFKCDNOCYpxQ31yreB1nq3l5giigLr8
	YUW48gW+ycA3BVaFn+D38JthFKYJLCtGAiaHE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=edzFVb0jUNLTYpPZ73IdQYDPaIGh6UxoK/ESetTQGubC6EMxW/qZOH7+3RVM3c9Ap3
	GvpTilMuYG6KmkpvB6ZKD/u+hDptHnfLJH7Hbsm3FoJ+B68YfC/ynG1iHQVmbzW9t5SY
	oBMer6wQRnMWjpwXqx0W+Fy0jqi9oWmaHn4lw=
Received: by 10.90.53.7 with SMTP id b7mr2651110aga.117.1286738508778; Sun, 10
	Oct 2010 12:21:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.77.10 with HTTP; Sun, 10 Oct 2010 12:21:27 -0700 (PDT)
In-Reply-To: <98B362E0-7357-4934-82C7-9BBA35FEF271@mac.com>
References: <98B362E0-7357-4934-82C7-9BBA35FEF271@mac.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Oct 2010 12:21:27 -0700
Message-ID: <AANLkTint3BBfpSMj5oDExdqu2wVVKh3tF6oW7RbGXaG=@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: arm-angstrom-linux-gnueabi-gcc compiler
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
X-List-Received-Date: Sun, 10 Oct 2010 19:22:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 10, 2010 at 9:49 AM, Elvis Dowson <elvis.dowson@mac.com> wrote:
> Hi,
> =C2=A0 =C2=A0 =C2=A0I just built the omap3-console-image using a recently=
 synced version of the overo-oe repository.
>
> It no longer generates the /tmp/cross folder with the arm-angstrom-linux-=
gnueabi-gcc cross compiler.

yes cross compilers are now uder native sysroot. Look into mailing
list for the change
cross directory has been eliminated.

>
> Has somethings changed? Which recipe should I use to generate the cross c=
ompiler? Is it gcc-cross?
>
> Elvis Dowson
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


