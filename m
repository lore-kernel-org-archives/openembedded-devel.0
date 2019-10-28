Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9F6A77FA50
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 20:20:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4725gw1CvNz4Q;
	Mon, 28 Oct 2019 21:20:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572294044;
	bh=gAfWSGVtMidkkrf6OsjWr9LMTkONUd51cvWgwqbZ1A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zon9U2EZqBD+JcwnQb4V3bGq2ELOJCNkRancPmdTge9BiUp9R1z9xBF7sA8dseP86
	zILXhSCmYkwN9H8BTGcwX8IQ7zLLQX4I7b+GxBwG8zUryXJwD42fXuEJVelYd8LT6x
	7E46joHVtJVWm5kQ9cyTFViWCow3IdSETUjU6SPVcjrPhYCNj+HBWIRsQzy8fH89M6
	Qx2d0FIgFPdlSJYIc9A9xFbdLP9awWZsxKls8NnYtYHqDDJ9vXdh/FqiyFjxcHKijl
	ujxTDSJrXlOmKYU2Te2UdBMCAZ+J81/zzJ+jEDeDgtjPb2Ojtps2KZ4Hqj3U38YMYB
	ayfEsl9HNCgRX+n1xxJ0GJyol2QyyM0RogdpQvfrcc9kiRENZj2j6JLoUGVkI9UuYd
	Z3Opr96NsY+EZNPbEgh5xVJiq9kQm9AjxjySFlECRBXajPRfRHjWHGTHVexL2Tj/BS
	2yovNrHfFmdCyxoPYE6VDwYxKgvbtvEsTQbRK4g6+NzqiYOchc7l0NxMEySMGDgDlK
	VV3VVDmQCfxLvVHaeQusir7QXN8YsDJ6ldidr9PAQYrX1H0IUkS+rX+RtBjA+/UVv4
	5SH4SKWkhPOJf2JB7DNuNrcbe+6VmSREvvpqgWGpkut1oCVZG7gPemZflvzbfaDppv
	OAHvnlMQIKNKFDVM77LfFOBk=
Date: Mon, 28 Oct 2019 22:20:41 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191028202041.GA2753@localhost>
References: <20191028185447.3553-2-bunk@stusta.de>
	<CAMKF1soT7MoQc7CG9qEYDjJpYevDzB9M5WDPmsWCbfGZTRc1yg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soT7MoQc7CG9qEYDjJpYevDzB9M5WDPmsWCbfGZTRc1yg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH] gstd: Fix the version number
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Oct 2019 20:20:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Oct 28, 2019 at 08:36:32PM +0100, Khem Raj wrote:
> On Mon, Oct 28, 2019 at 7:55 PM Adrian Bunk <bunk@stusta.de> wrote:
>...
> > +# Remove the +really when upstream version is > 1.0
> > +PV = "1.0+really0.6.3"
> 
> We already have 1.0 so will this sort above that ?
>...

That's the point, similar to +git in PV.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


