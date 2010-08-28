Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpG3F-0007hK-6a
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 09:42:09 +0200
Received: by iwn2 with SMTP id 2so3222540iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 00:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=bV1om1irHwJ81TUcAw1XcMP+dA9JVHyLOtQ6BDNpzGI=;
	b=G1C9jZ0QYQCD0CZGkHy71lDLwRPaNBxBm8VNrmV4a5WPnfLowJPiv3DGZ30IO6MvvT
	hb63TH35xpvSPPmn0rmyTrCwAPy53gkofv0w/S1YxC8jek7SpcVXxlEADlLlDjBN8Ri0
	//6JQ5p/Lh8ZT03qGNs8S1uztEGpaURly/XBU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Upb/q5xG4PQtWljkYHcSrpGqmjyj1IJoRsXq7cyRx/OqxSyo8zsgoygoyNn59sFv9l
	nz+9QJ1/4qtBz7Qd48y+e0KqymycJsPjdSQL2R0M2bgbrRr6a5r8obdQ7ATbPVPpcn21
	Sk4SiJC6QlqLx6O608yslJ9GwMhocN1IyX04Q=
Received: by 10.231.35.8 with SMTP id n8mr2359526ibd.78.1282981295285; Sat, 28
	Aug 2010 00:41:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Sat, 28 Aug 2010 00:41:14 -0700 (PDT)
In-Reply-To: <AANLkTimcy2cCSmA8juYj+ErrSwppyetANzG0kW+L28ji@mail.gmail.com>
References: <1278706889-319-1-git-send-email-raj.khem@gmail.com>
	<AANLkTimcy2cCSmA8juYj+ErrSwppyetANzG0kW+L28ji@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Aug 2010 00:41:14 -0700
Message-ID: <AANLkTimABW23gx5JezqdgzYZ6pn41QC4JKxP7vkL8hMs@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] quilt: Add option QUILT_NO_RM_SYMLINKS so follow symlinks with quilt refresh
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
X-List-Received-Date: Sat, 28 Aug 2010 07:42:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2010 at 9:03 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Fri, Jul 9, 2010 at 1:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> ++ =A0 =A0 =A0 =A0 =A0if [ "$QUILT_NO_RM_SYMLINKS" !=3D "yes" ]
>>
>
>
> I'd suggest:
> =A0 =A0 =A0 =A0 =A0if [ -L "$filename" -a "$QUILT_NO_RM_SYMLINKS" !=3D "y=
es" ]

yes seems nice. I will prepare a patch unless you beat me.


> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


