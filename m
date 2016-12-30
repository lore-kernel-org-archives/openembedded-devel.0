Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7074D6093F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 08:02:56 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id o141so206766544itc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 00:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=liSDrwKVlSf2PMRsM9Abig0fQtDFkHD66qypdYnCOko=;
	b=Xc1OkC4o3sLP541VC0GYr5U2YW3qnHpzPWA9e+e4IDhmfNGnryfoYgOukUt3nLd8ah
	+zccDmFJkKa5aN3lNTC1/IKZ64/sHIKp/DqlO1zpq8ph7Z0sq/fX40mamDiadJmB/uDB
	vJmTMbFm1VUhRHIuXHiWa15ftWNvqwFFoAOniteJQhQAuq2RqazvWblNajCoX10KOhO3
	qLn/2IwBJCMofmCt545pvcwpI3dLdkUbvqWChvfOIuSV7IiqnJTWJ4RI+pEjAgSRhKKD
	qd3c3Tix9lycTgZWmnDzrmwt18gfnN6OHn9w4asTh9DaCLwH/lTrab71NwgJqsIWH06E
	Y6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=liSDrwKVlSf2PMRsM9Abig0fQtDFkHD66qypdYnCOko=;
	b=SHaNXIMyxfZ+REt6jShlJFJBZZrsCq7yiTcOf2i/7Ra+yR7dzZdytx0GCLMuo0RF1A
	9J8KEctQJhC29lqhJtlZLTJzKCJbZDIy5vk7xRm4ImoApntLmgnlUBNAr7sJv3WhWJKU
	to8RvgwCJo6NAkHOgWFNEinvuf6NJs3A5rPfLEuJB50X2/nBTt8ooOuelnNXVGRpgf3h
	Em+Railk811yWy9eThmW3zG0Tq9tMcBBYCIFJLHmor7vl6C7VawzVAACSgMnMEz2Ff6I
	XhQ6Vq8PEjEKUYDocscQ+X0CbBLbV7kIiU+VqfgOQTBFsKn969VQKyWfw9KKQCTRs7ip
	3BPw==
X-Gm-Message-State: AIkVDXJWr3CERzyReTGK0iydx1Jwj1OB2CZR2u6YuLsk62EY+4t8SgXocqR7VxKAqOFoX8boH/apsYPm53aQ00CV
X-Received: by 10.36.76.85 with SMTP id a82mr36573277itb.67.1483084977283;
	Fri, 30 Dec 2016 00:02:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.144.99 with HTTP; Fri, 30 Dec 2016 00:02:36 -0800 (PST)
In-Reply-To: <CA+chaQeuGNX53YonpVMz5cA4EJwaaSOEWgVYpj1FjAFmCoC0Jg@mail.gmail.com>
References: <1482926435-13846-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
	<CA+chaQcgfRj827K4kSZog6-jDsMu3EX9dGCWT-QCaJihEp23aw@mail.gmail.com>
	<CAKuJqM8AC2pi7y8xGE9o5yJnCkD3GbkLz8RD9y1YSFigwJjKGw@mail.gmail.com>
	<CAMKF1srmFh83WsKAptTGtCiphnY6+hDzRbvZjVhNQBEpORx1eQ@mail.gmail.com>
	<CA+chaQeuGNX53YonpVMz5cA4EJwaaSOEWgVYpj1FjAFmCoC0Jg@mail.gmail.com>
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Date: Fri, 30 Dec 2016 09:02:36 +0100
Message-ID: <CAKuJqM8+zriHux8KZL_oxzDeubXd917tEBGJv8H=5gNqEAP_=w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] devmem2: fix broken SRC_URI
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
X-List-Received-Date: Fri, 30 Dec 2016 08:02:56 -0000
Content-Type: text/plain; charset=UTF-8

Thank you for the clarifications, Martin!

I can confirm that bitbake now manages to successfully obtain the
source code file, devmem2.c from the openembedded.org's mirror,
therefore my patch can be safely rejected.

On 29 December 2016 at 01:37, Martin Jansa <martin.jansa@gmail.com> wrote:
> It's already on OE src mirror (which is populated by my world builds for
> last couple months):
>
> http://sources.openembedded.org/devmem2.c
>
> But this mirror is already in default MIRRORS variable, so it's searched
> when original SRC_URI doesn't work.
>
> I assume Oleksandr got this error while sources.openembedded.org was down
> because of planned OE infrastructure downtime this week.
>
> On Thu, Dec 29, 2016 at 12:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Wed, Dec 28, 2016 at 4:17 AM, Oleksandr Kravchuk
>> <oleksandr.kravchuk@pelagicore.com> wrote:
>> > This is a reasonable question. I can only say that the header is
>> > slightly different, therefore I had to modify the checksums.
>> >
>> > I could use another mirror that contains original devmem2.c, but I am
>> > unfortunately not confident in their longevity.
>>
>> Can we just store these files on OE src mirror ?
>> may be send the original files to Tom and he should be able to help
>> to host them
>>
>> >
>> > On 28 December 2016 at 13:10, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> >> If it's a mirror, then why would there be different LIC_FILES_CHKSUM and
>> >> SRC_URI checksums?
>> >>
>> >> On Wed, Dec 28, 2016 at 1:00 PM, Oleksandr Kravchuk <
>> >> oleksandr.kravchuk@pelagicore.com> wrote:
>> >>
>> >>> Original SRC_URI for devmem2 source code is accessible. Use the mirror
>> >>> provided by free-electrons instead.
>> >>>
>> >>> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
>> >>> ---
>> >>>  meta-oe/recipes-support/devmem2/devmem2.bb | 8 ++++----
>> >>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> >>>
>> >>> diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb
>> >>> b/meta-oe/recipes-support/devmem2/devmem2.bb
>> >>> index e48cc92..ba9d4cb 100644
>> >>> --- a/meta-oe/recipes-support/devmem2/devmem2.bb
>> >>> +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
>> >>> @@ -1,9 +1,9 @@
>> >>>  SUMMARY = "Simple program to read/write from/to any location in
>> memory"
>> >>>  LICENSE = "GPLv2+"
>> >>> -LIC_FILES_CHKSUM = "file://devmem2.c;endline=28;md5=
>> >>> dd68f2b0a5184b3db3dc25c99e0bd0cd"
>> >>> +LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=
>> >>> a9eb9f3890384519f435aedf986297cf"
>> >>>  PR = "r7"
>> >>>
>> >>> -SRC_URI = "http://www.lartmaker.nl/lartware/port/devmem2.c \
>> >>> +SRC_URI = "http://free-electrons.com/pub/mirror/devmem2.c \
>> >>>             file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
>> >>>  S = "${WORKDIR}"
>> >>>
>> >>> @@ -18,5 +18,5 @@ do_install() {
>> >>>      install devmem2 ${D}${bindir}
>> >>>  }
>> >>>
>> >>> -SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
>> >>> -SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d652
>> >>> 1e58ac482c4e29d6c9ebca8768f699c191"
>> >>> +SRC_URI[md5sum] = "e23f236e94be4c429aa1ceac0f01544b"
>> >>> +SRC_URI[sha256sum] = "3b15515693bae1ebd14d914e46d388
>> >>> edfec2175829ea1576a7a0c8606ebbe639"
>> >>> --
>> >>> 2.7.4
>> >>>
>> >>> --
>> >>> _______________________________________________
>> >>> Openembedded-devel mailing list
>> >>> Openembedded-devel@lists.openembedded.org
>> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> >
>> >
>> > --
>> > echo "EOF" >> /var/tmp/email
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

