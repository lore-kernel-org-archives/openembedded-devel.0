Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Mr75X-0007Hq-0O
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Sep 2009 11:27:42 +0200
Received: by fxm3 with SMTP id 3so2243280fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2009 02:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TR38MerYJPKYoMcPOs4qtCHtlMlCxPQmR4hfWvYd72U=;
	b=AiCEp5B5bvNEAK6fJ4KeQmM5d5PhJ//F7KbTo3iacIiNDo1LtBQF3XwUqSChZ7LI+3
	a/YVUEpNZVficOg6eAbtkvnJquVreVRjjujWc9RFA3SABzSV7GPWf4r9OwxbkAd+af1f
	iyBPGqRg+q2PAKpO8NTbHary4xcJ/yWRgnlEk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hdulJJ9T38LpOBBPeYbMfsDSBPJ9xyhp7RdD+xswa+47Niayf9GKehc1FCk4Jh1P8B
	bIRxFYmnvSKW3UCiIQBGBWHAFZOcvxBb9kQm5WZ/TjsWp2tPXg50Q1akJ4hgAgPV6K81
	JM+7WJcEGifJViQJgLjb9iLapHf5Nhiwh/8xU=
MIME-Version: 1.0
Received: by 10.239.141.159 with SMTP id c31mr416427hba.147.1253870819193; 
	Fri, 25 Sep 2009 02:26:59 -0700 (PDT)
In-Reply-To: <1253172790.4490.1392.camel@lenovo.internal.reciva.com>
References: <c384c5ea0909161456r48c25a89n5d3e902e2f98b089@mail.gmail.com>
	<1253172790.4490.1392.camel@lenovo.internal.reciva.com>
Date: Fri, 25 Sep 2009 11:26:59 +0200
Message-ID: <c384c5ea0909250226q8be54t45a9c32228c6898b@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Fetch machine type list for ARM architectures
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
X-List-Received-Date: Fri, 25 Sep 2009 09:27:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Sep 17, 2009 at 9:33 AM, Phil Blundell <pb@reciva.com> wrote:
> On Wed, 2009-09-16 at 23:56 +0200, Leon Woestenberg wrote:
>> Hello,
>>
>> two (known) ARM machines currently have kernel support but their
>> "mach-types" file in arch/arm/tools/ is not up-to-date.
>
> How did this situation come about? =A0The mach-types file is normally one
> of the first things to be updated in the upstream kernel; I can't think
> of any obvious reason why that should not have happened if the patches
> to add the actual machine support have already landed in the tree.
>

Let me clearify, my phrasing was a bit off.

With "upstream" I didn't mean "mainline", but an upstream branch being
merged towards mainline regularly and soonish.

in this case the linux-kirkwood branch at Marvell (which is merged to
upstream regularly) had the machine support but not yet the machine
type.

There is often a race condition in ARM kernel development if (1) get
done before (2, 3).
1 - machine-specific code gets written/submitted to a branch
2 - machine type is requested, machine type file is generated
3 - new machine type file gets merged into the branch


I had merged this into OpenEmbedded, it was non-intrusive for other
machines and will not break when (3) has happened.

# update machine types list for ARM architecture, only for machines that ne=
ed it
do_arm_mach_types() {
  if test ${MACHINE} =3D=3D openrd-base; then

To be removed when it is upstream...


Regards,
--=20
Leon


