Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kg4ysn@gmail.com>) id 1QmUxC-00018Y-5m
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 20:05:42 +0200
Received: by vxh2 with SMTP id 2so2352076vxh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2011 10:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=wlqtbkNcX3vQIqGNAuJRvYDsfNhheNTHa3T4Q31FyoA=;
	b=DkgPDgtRPbRtCMRAg3X6F0UO9Zj7ZtlgZggeluw1JiIYSz8yE9Rs6X7D6IiEIh065B
	souFq1g2+guNVeXqxIPYDAkavhtjrb2hXyBSc4jwOZvrfVhCWvl+UF4/G7hgXuuBAv+d
	QX0nlobrpdAYaYWmfY1uObv2H5J6vX2mNAtYc=
MIME-Version: 1.0
Received: by 10.220.2.130 with SMTP id 2mr83567vcj.155.1311875998400; Thu, 28
	Jul 2011 10:59:58 -0700 (PDT)
Received: by 10.220.63.3 with HTTP; Thu, 28 Jul 2011 10:59:58 -0700 (PDT)
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1FAA0@nzc-ap-xch-02.ap.trimblecorp.net>
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8B5@nzc-ap-xch-02.ap.trimblecorp.net>
	<20110726220305.GA15286@jama.jama.net>
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8D9@nzc-ap-xch-02.ap.trimblecorp.net>
	<20110726222646.GB15286@jama.jama.net>
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8E2@nzc-ap-xch-02.ap.trimblecorp.net>
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F9D5@nzc-ap-xch-02.ap.trimblecorp.net>
	<ED3E0BCACD909541BA94A34C4A164D4C4003C1EB@post.tritech.se>
	<20110727141213.GA8582@cverges-dev-lnx>
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04B1FAA0@nzc-ap-xch-02.ap.trimblecorp.net>
Date: Thu, 28 Jul 2011 10:59:58 -0700
Message-ID: <CAG4_upQ48037cxN9QOLU06KUJzRT_hcaFaeanCAbTjr=VBY8TA@mail.gmail.com>
From: Chris Verges <kg4ysn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel load address issue
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
X-List-Received-Date: Thu, 28 Jul 2011 18:05:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Apologies for the top posting on this one ...

You can easily generate a zImage.  If you have devshell enabled, type
"bitbake linux -c devshell" and browse under arch/*/boot/... to find
your vmlinux image.

Try bootm 0x840000A0.  This works on my system.

Chris

On Wed, Jul 27, 2011 at 12:22 PM, Bernard Mentink
<Bernard_Mentink@trimble.com> wrote:
> Hi Chris,
>
> Many thanks for that. However I only have a uImage in my build, no zImage=
 so can't do a diff to find the offset, is there another way to find that o=
ut?
> Maybe you or someone else knows what script in openembedded calls the mki=
mage utility so I can find what parameters are passed ..
>
> By the way, I set UBOOT_LOADADDRESS and UBOOT_ENTRYPOINT to be the same (=
0x80400000, a bit past u-boot and the environment) in my config file, I am =
not sure if the entry point should be the same as the load address.
>
> Cheers,
> Bernie
>
> -------------------------------------------------------------------------=
-----------------
> I want to die peacefully in my sleep, like my grandfather, not screaming =
and yelling like the passengers in his car.
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Chris Verges
> Sent: Thursday, 28 July 2011 2:12 a.m.
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Kernel load address issue
>
> On Wed, Jul 27, 2011 at 06:00:07AM +0000, Mats K=E4rrman wrote:
>> Starting kernel ...
>>
>> And there it hangs ... I don't know who printed out the "Starting
>> kernel" was it uboot or the kernel? =A0If uboot, how do I pass kernel
>> arguments (i.e the console serial params) with this method of booting?
>
> Hi Bernie,
>
> I've experienced this before when the UBOOT_LOADADDRESS and UBOOT_ENTRYPO=
INT values in the machine config file for OpenEmbedded aren't properly set =
to the correct value. =A0You may want to double check those values.
>
> Also, try setting your bootm address just a tag higher in memory than the=
 actual UBOOT_ENTRYPOINT. =A0I forgot what the exact uboot-mkimage header p=
ut on the uImage is, but you can do a hex diff between the zImage and uImag=
e files to figure it out. =A0That offset can sometimes cause some odd booti=
ng problems.
>
> So if your ENTRYPOINT is 0x8300000 and the uboot-mkimage offset is 0xC0, =
for example, you'd need to bootm 0x83000C0. =A0(Again, double check the ubo=
ot-mkimage offset.)
>
> Good luck,
> Chris
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


