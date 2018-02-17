Return-Path: <jpewhacker@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 081016FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Feb 2018 16:57:46 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id 24so4509258oij.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Feb 2018 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EdrNueHgWyiE3iIN4hqDVu2hQU/419uRmNsFi9Lc3vs=;
	b=FyJQtS3MSr8KfZ6YJyrrjeEQ9mKSEJZDdekSechoZRzHQLX+/7auz8KbRBbpcohzDY
	XTzW7RVbKnw54N0nHb0HKkeUZKn/y+VGEwr3UHUfc2+0UpUiq00q0zkam5iSD384mUOp
	HSJt5VlsiJjlVpln297O/3PmjrPcyW7DoE7W4GI/9jQ/E8Xxlq0OoINSZrSyGTo8lPQr
	QaSeZ79p0ALA9xSqJOHsTrpnpeguGIuq2pxy5HL5VkinArbLeTHEdgGPO9WOhODJ/pYa
	ReU+sk8mM0+OVFRKxf97YU0ihK8TNUDYWHa2vzK4pZeBd7yuvlcaaU0SkKTqKiGcB/4/
	dxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EdrNueHgWyiE3iIN4hqDVu2hQU/419uRmNsFi9Lc3vs=;
	b=bkWAMwqYY4R9nwbolVmWt57LfVSdAKqLac+LzYqIi1ylopCB73gyHI5dgxupu3j1kz
	VMfvz1ynQQeiUI/kjXoo/u0xi+2JhSIwodT7it9IGHq2hhWdu/kRwvOjy8buUED4iAIe
	ibUZ5NeITX0CcGtO3NibgDtT30BCBd37e4GmUnvjHvIpqR3uJlnHxnOtLrU4fx4f2uOq
	RtThsAt9TEBLGbTT5DCTbKjfDK67KH+am6YJuSpy5sFHTIlPmTNgGLRBN44wqqu+I7Pe
	+Mnex2fol2Etm0QKw2ph/T3obTjz0Ue48PZF/YJFtT0vOVfy3nYtBP9YSxrBT8I+/N9G
	K7QQ==
X-Gm-Message-State: APf1xPDzFxxMoMRzgENVoejt4BUauEAP3gp+ypFHQwwc78vfqWh8+WaG
	uZ7PpngWnHAGdji1v8377b4ddi/EcDUJPUU7Hlo=
X-Google-Smtp-Source: AH8x227cSDCUjHIxdtzubeWycvMu/EyP0PtGjshPxntS5b+5D4TN4aQXo4e3GPKYstmatH0aQvGQbCbwYEW8RJ//j1k=
X-Received: by 10.202.208.92 with SMTP id h89mr6619599oig.126.1518886668083;
	Sat, 17 Feb 2018 08:57:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.48.29 with HTTP; Sat, 17 Feb 2018 08:57:47 -0800 (PST)
Received: by 10.157.48.29 with HTTP; Sat, 17 Feb 2018 08:57:47 -0800 (PST)
In-Reply-To: <BA94AA8C-F764-4EC2-ABA5-6ACC1E805F90@linux.intel.com>
References: <20180216213511.117-1-Martin.Jansa@gmail.com>
	<1518819754.6900.50.camel@gmail.com>
	<CA+chaQcKXbteCmzE7SCZdZ5zjBnnAefyH+JdJDGChKmUpNvG+g@mail.gmail.com>
	<BA94AA8C-F764-4EC2-ABA5-6ACC1E805F90@linux.intel.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 17 Feb 2018 10:57:47 -0600
Message-ID: <CAJdd5GZ6ga96Gzue=FD8qTOrg=faKxojYZWtxY4RiC9KAOF5Sg@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] waf-samba: use new oe.utils.parallel_make_argument function instead of removed get_waf_parallel_make
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
X-List-Received-Date: Sat, 17 Feb 2018 16:57:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Feb 17, 2018 10:39, "Tim Orling" <timothy.t.orling@linux.intel.com>
wrote:

Now libevent fails:

08:35:10
ERROR: ExpansionError during parsing /workdir/openembedded-core/../
meta-openembedded/meta-networking/recipes-support/libtevent/
libtevent_0.9.33.bb

08:35:10
Traceback (most recent call last):

08:35:10
bb.data_smart.ExpansionError: Failure expanding variable do_compile,
expression was     python ./buildtools/bin/waf
${@oe.utils.parallel_make_argument(d,
'-j%d', limit=3D64)}

08:35:10  which triggered exception AttributeError: module 'oe.utils' has
no attribute =E2=80=98parallel_make_argument'


Make sure you have the latest oe-core


> On Feb 16, 2018, at 3:10 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> This is just to fix the parsing ASAP, you can still send your updated
> change which removes the waf inherit completely.
>
> On Fri, Feb 16, 2018 at 11:22 PM, Joshua Watt <jpewhacker@gmail.com>
wrote:
>
>> On Fri, 2018-02-16 at 21:35 +0000, Martin Jansa wrote:
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>> meta-networking/classes/waf-samba.bbclass | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-
>>> networking/classes/waf-samba.bbclass
>>> index e490176241..a63842cadc 100644
>>> --- a/meta-networking/classes/waf-samba.bbclass
>>> +++ b/meta-networking/classes/waf-samba.bbclass
>>> @@ -87,7 +87,7 @@ do_configure() {
>>> }
>>>
>>> do_compile () {
>>> -    python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
>>> +    python ./buildtools/bin/waf ${@oe.utils.parallel_make_argument(d
>>> , '-j%d', limit=3D64)}
>>
>> Ah, beat me to it. Either way, I approve FWIW.
>>
>>> }
>>>
>>> do_install() {
>>> --
>>> 2.15.1
>>>
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

