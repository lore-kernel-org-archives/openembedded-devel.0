Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PRYO3-0005wH-J3
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 23:57:56 +0100
Received: by ywi6 with SMTP id 6so2766714ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 14:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=lCTyJCjXDim7n7xeZPYT4fV072kEQPr6P7NlVF6Xl7I=;
	b=pXqC7lvpA1E4ZO+YoEvhEEKh2kh+57JOEnGf2HPIVWukFJSdUcigbysGHnAlKs8y5p
	GmFJFC+fYHG+cVibm7cHVfff8x2wqxqb6Lh3vzabkUN0+69Ppag5JvTQd0mVjg9eb+K8
	3vIxeXTRHhomgxcFoKuu5rvOgQwQxkOtIxvSI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=UGvQW9HRVh+bo+jntSYOGiYzHe6hgi8fkshyQ8q826dNe1ndZ/mMAeXtlQiDA7IESw
	k0bupVVXJDrBOkBIPOw7P14nv6LLb+JDKgYfh0jgNtiYmeMpn6BF1mu7h5eXX556QZE8
	FFIlJgzVtA7bffBlWB6rAEkxqNtp+y9hfAMmo=
Received: by 10.90.97.19 with SMTP id u19mr3033149agb.166.1292108180010; Sat,
	11 Dec 2010 14:56:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Sat, 11 Dec 2010 14:55:59 -0800 (PST)
In-Reply-To: <AANLkTimN_uxrQ+=L9hWQWubK+xLcBeuD2Nw8oxt5z8Dh@mail.gmail.com>
References: <A24693684029E5489D1D202277BE894484FB9740@dlee02.ent.ti.com>
	<A24693684029E5489D1D202277BE89448587464B@dlee02.ent.ti.com>
	<AANLkTimN_uxrQ+=L9hWQWubK+xLcBeuD2Nw8oxt5z8Dh@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Dec 2010 14:55:59 -0800
Message-ID: <AANLkTinNEFAp__NDHi05MUXm0ewEcCSJUdcdKMiNX6XO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: srctree and stamps
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
X-List-Received-Date: Sat, 11 Dec 2010 22:57:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 11, 2010 at 7:00 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Fri, Dec 10, 2010 at 7:17 AM, Ambrose, Martin <martin@ti.com> wrote:
>> On Fri, Nov 19, 2010 at 20:01:28, Ambrose, Martin wrote:
>>
>>> I find that using the latest srctree the stamps aren't updated in the s=
ame fashion
>>> as regular recipes. In the example below I build the srctree recipe (my=
package) and
>>> then build an image depending on same. Even though the package is built=
 just prior
>>> the image build still processes several steps which seem redundant.
>>>
>>> I see some special handling of stamps in srctree.bbclass and wonder if =
this
>>> is expected/desired behavior.
>>>
>>> Thanks for any help/pointers.
>>
>> First: sorry for the double post -- some transitory problem with our mai=
l server.
>>
>> I found that the lack of expected stamps resulted in errors when buildin=
g images
>> with srctree recipes as run time dependencies. Since the do_populate_sys=
root,
>> among others, task stamp was not present it was run again. Various error=
s
>> could occur depending on the nature of the recipe but I often saw
>>
>> * resolve_conffiles: Existing conffile /home/user/work/oe/arago-tmp/root=
fs/my-image/etc/device_table is different from the conffile in the new pack=
age.
>>
>> The following patch to create the missing stamps is my resolution.
>> Comments welcome.
>
> This looks right to me. =C2=A0When it was switched from exec_task to
> exec_func to avoid other complications, I guess it was forgotten that
> exec_task is what runs make_stamp :)
hmmm seems right.


> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


