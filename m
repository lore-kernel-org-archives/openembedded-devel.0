Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1ShcaA-00008s-KM
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 10:17:38 +0200
Received: by dalh21 with SMTP id h21so513088dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 01:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=FI9RgEPledeirmMpPXry/zTDKoYukJhu7uRRvyFZrhY=;
	b=x3Ugih0ih+lUij9wdH72R73NriTaVc7RQWP2NFhLiHkCdzbAKg+N3k7n8q8KQEfz0u
	iaEv+lwK72iq31OrJnftAtEi+QFaB1RDA0Q1rjk7wcEEDJmLz8LS/4weta0JcAr7eK/l
	Gz4KN3VwN606MB/a109Sv8tIMxtDrGbTm2HjK0eb+hnhGH1megxbdQXoAMm03ljm0SGC
	aPJEoTwryUHmWgmKMzxG81HtcyAVhkxGaglfCaFIZezadS1uKIH5EW9zy60ye1Nk+FKD
	OCqevXC/pDh1o7VXEKdWjE+5ALEQWdYH4JMhnboqbodk+rRdU7vlYCmffVvwgPtaUcWD
	OXQg==
MIME-Version: 1.0
Received: by 10.68.236.129 with SMTP id uu1mr40979489pbc.77.1340266011447;
	Thu, 21 Jun 2012 01:06:51 -0700 (PDT)
Received: by 10.142.188.4 with HTTP; Thu, 21 Jun 2012 01:06:51 -0700 (PDT)
In-Reply-To: <20120616070059.GB3140@jama.jama.net>
References: <1337788230-8841-1-git-send-email-Martin.Jansa@gmail.com>
	<20120616070059.GB3140@jama.jama.net>
Date: Thu, 21 Jun 2012 10:06:51 +0200
Message-ID: <CAAQYJAtahm6KjMFG4UV=zmq-Nyji0m9jDzykbyitwkVRYYEbUw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-initramfs][PATCH] meta-initramfs: append to BBPATH instead of prepend so order of bblayers.conf is respected
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
X-List-Received-Date: Thu, 21 Jun 2012 08:17:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 16, 2012 at 9:00 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, May 23, 2012 at 05:50:30PM +0200, Martin Jansa wrote:
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> ping
>
>> ---
>> =A0meta-initramfs/conf/layer.conf | =A0 11 ++++++++---
>> =A01 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.=
conf
>> index 469cde5..cc78c1a 100644
>> --- a/meta-initramfs/conf/layer.conf
>> +++ b/meta-initramfs/conf/layer.conf
>> @@ -1,11 +1,16 @@
>> =A0# Layer configuration for meta-initramfs layer
>>
>> -# We have a conf and classes directory, prepend to BBPATH to prefer our=
 versions
>> -BBPATH :=3D "${LAYERDIR}:${BBPATH}"
>> +# We have a conf and classes directory, append to BBPATH
>> +BBPATH .=3D ":${LAYERDIR}"
>>
>> =A0# We have a recipes directory, add to BBFILES
>> -BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recip=
es-*/*/*.bbappend"
>> +BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb=
append"
>>
>> =A0BBFILE_COLLECTIONS +=3D "meta-initramfs"
>> =A0BBFILE_PATTERN_meta-initramfs :=3D "^${LAYERDIR}/"
>> +
>> +# Define the priority for recipes (.bb files) from this layer,
>> +# choosing carefully how this layer interacts with all of the
>> +# other layers.
>> +
>> =A0BBFILE_PRIORITY_meta-initramfs =3D "8"
>> --
>> 1.7.8.6
>>
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Bump?
Acked-by: Andrea Adami <andrea.adami@gmail.com>


