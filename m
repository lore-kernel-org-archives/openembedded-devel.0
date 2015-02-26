Return-Path: <daniel.markus@leica-geosystems.com>
X-Greylist: delayed 344 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 Feb 2015 07:37:00 UTC
Received: from eu-smtp-delivery-94.mimecast.com
	(eu-smtp-delivery-94.mimecast.com [207.82.80.94])
	by mail.openembedded.org (Postfix) with ESMTP id C5A66733AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 07:36:59 +0000 (UTC)
Received: from AHERSRVDOM03.lgs-net.com (ahersrvdom03.leica-geosystems.com
	[193.8.40.98]) by uk-mta-9.uk.mimecast.lan;
	Thu, 26 Feb 2015 07:30:06 +0000
MIME-Version: 1.0
In-Reply-To: <CADt1enOOO21Vnz5qNk_WGjTKiY8OT7gdzNSUBK-1CErijEoxBg@mail.gmail.com>
References: <CADt1enOOO21Vnz5qNk_WGjTKiY8OT7gdzNSUBK-1CErijEoxBg@mail.gmail.com>,
	<1424783606-8936-1-git-send-email-daniel.markus@leica-geosystems.com>
From: daniel.markus@leica-geosystems.com
To: openembedded-devel@lists.openembedded.org
X-Mailer: Lotus Domino Web Server Release 9.0.1FP1 HF275 June 13, 2014
X-MIMETrack: Serialize by HTTP Server on HXSESRVDOM01/EMEA/Leica(Release
	9.0.1FP1 HF275|June 13, 2014) at 02/26/2015 08:30:04 AM,
	Serialize complete at 02/26/2015 08:30:04 AM,
	Serialize by Router on AHERSRVDOM03/EMEA/Leica(Release 9.0.1FP3|January
	12, 2015) at 26.02.2015 08:30:06
Message-ID: <OF4ED77A65.06E70BBA-ONC1257DF8.0027D228-C1257DF8.002934CB@leica-geosystems.com>
X-Priority: 3 (Normal)
Importance: Normal
Date: Thu, 26 Feb 2015 08:30:04 +0100
X-MC-Unique: -HE6HcTzSRaaYk6hnBRpmw-1
Subject: Re: [meta-oe][PATCH] socorro-syms: Add Breakpad symbol generation adapted for Socorro
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
X-List-Received-Date: Thu, 26 Feb 2015 07:37:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> +#
> +# Use example:
> +#
> +# inherit breakpad
> +# inherit socorro-syms
> +# BREAKPAD_BIN =3D "YourBinary"
> +#
> +
> +# We depend on Breakpad creating the original symbol file.
> +DEPENDS +=3D "breakpad"
>
> Is this necessary? If the recipe using this class files your instructions
> and inherits breakpad, this is already added to DEPENDS. And of the recip=
e
> doesn't inherit breakpad, it won't work anyway...
>

I'm always keen on the idea to be explicit. This class is truly dependent o=
n
the existence of the Breakpad symbols so I think it's good to show that.

> Maybe you should have your class inherit breakpad directly, and only
> instruct the recipe author top add BREAKPAD_BIN to the recipes using this
> class?
>

Yes, that's a less verbose solution.

Thanks Anders, I'll fix that!


Best regards,
Daniel


