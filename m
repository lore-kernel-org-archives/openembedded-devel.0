Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PW0kP-0005Ik-PY
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 07:03:25 +0100
Received: by wyb40 with SMTP id 40so6917744wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 22:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=nqWn3MmdnnEXEwtQzYbjqydrtsE4q5St4DyMxtOZUXA=;
	b=H2edozY7rVld11GsZLcOgkVeKnBVclBE6qTh22V6NnAvV6VlCTPPhDNGWxNRTJux2t
	IlRkpRIj94+ImcsHQQ6alzzIe+BaiNlgn0HH5TZrPvKGk4soKlYwhtJcamDfhabXKKMz
	HIVDmjoquXKKe8QtwxqpAsEEAieHwdKPu7Lw8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=taRXr5JQX4zKMpNWTbt6RlyGGz7qQ1AZq86CBYx5pAHm3Liim082madqI0t1KGghdO
	pdyABlC+2wiYGrMNUcNdco+9Fn1rw9eC2W7HhgCeYcOKp3K6x3nZwpUhIPU+6KZ5vBVi
	UdB/faYbdtf7Ou0dX7V2XECUefyawxc3WKavs=
MIME-Version: 1.0
Received: by 10.227.129.69 with SMTP id n5mr5461350wbs.136.1293170596308; Thu,
	23 Dec 2010 22:03:16 -0800 (PST)
Received: by 10.227.155.208 with HTTP; Thu, 23 Dec 2010 22:03:16 -0800 (PST)
In-Reply-To: <AANLkTimVUHDNfVMR7o2Pj5xEgZf-JTphHGOaEdGjCmWE@mail.gmail.com>
References: <4D13F894.4010100@gmail.com>
	<Pine.LNX.4.64.1012232251340.7526@juice.ott.cti.com>
	<AANLkTin+LDH+6kXJjgWSGzyAc0q8Qie=h337xLH9QDen@mail.gmail.com>
	<AANLkTimVUHDNfVMR7o2Pj5xEgZf-JTphHGOaEdGjCmWE@mail.gmail.com>
Date: Fri, 24 Dec 2010 16:33:16 +1030
Message-ID: <AANLkTikb1Z4LWHiGj2ECeLZg6ZY31vNx=bjjUbehPUTo@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] micro.conf: Pin an older udev to avoid space consuming dependencies.
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
X-List-Received-Date: Fri, 24 Dec 2010 06:03:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 24 December 2010 15:11, Graham Gower <graham.gower@gmail.com> wrote:
> On 24 December 2010 15:10, Graham Gower <graham.gower@gmail.com> wrote:
>> On 24 December 2010 14:24, Michael Smith <msmith@cbnco.com> wrote:
>>> On Fri, 24 Dec 2010, Graham Gower wrote:
>>>
>>>> micro-uclibc/micro-image with udev 124 = 957207 bytes.
>>>> micro-uclibc/micro-image with udev 162 = 2303604 bytes.
>>>
>>> Could you be convinced to try udev 141? When I build it, its only
>>> runtime dependencies are glibc and libvolume-id.
>>
>> I'll do some testing with 124.
>
> Miscommunication between brain and keyboard. I meant, i'll test 141.
>

Well udev 141 seems to work ok, but micro-uclibc/micro-image is 100k
bigger, at 1069155 bytes.

Perhaps IMAGE_DEV_MANAGER = "busybox-mdev" should be a distro policy
for one or both of the micros.


