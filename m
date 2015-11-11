Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8FCB277141
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 17:34:30 +0000 (UTC)
Received: by igvg19 with SMTP id g19so74969920igv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 09:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=73PU/h9ssDWXy9wr/5loGxTvlBD8ogkvrTuFtXmOsk4=;
	b=I0wdee+Lu+ywwRqyZ2e6WIM0dKlz45YtVbcFoEd+e1uT4aq04b7yBUjxDvRdLWsS6r
	2NpqyV1HwxDprK5VZ7510IYmPT8eQBzMX3ZN3NDEZOcG/TEfcTCGwcSBQYDEGkpCQSya
	OPCi6+0x6YKxMBBUvP4NPlAzOeoHUHTPlmlnbLh88XWT56I0pgFe7R+gpKYHbt/7dC3h
	ecBwSV5rWBUjFSRLj9hlSO3Xb/oQK+n1RwkuZSfzy7TFM2br5TS7mxqANIVWG2YWLrty
	RABEraSyH9DJkS6o65JxnvKncj7EdtnKFwrj3Cmkf/1x7BHus9H53m05xKBDuXWUPxhm
	2MVA==
X-Received: by 10.50.155.106 with SMTP id vv10mr34723038igb.77.1447263270113; 
	Wed, 11 Nov 2015 09:34:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Wed, 11 Nov 2015 09:34:00 -0800 (PST)
In-Reply-To: <FE25E51D-6F1B-4DB0-8391-9B8B152ECF3F@gmail.com>
References: <33A5922B-6B36-4862-8261-4F59E0AF12AD@gmail.com>
	<892C1CD0-EAD9-4692-A296-B5635FE35385@gmail.com>
	<FE25E51D-6F1B-4DB0-8391-9B8B152ECF3F@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Nov 2015 09:34:00 -0800
Message-ID: <CAMKF1sqbxs3SDGdKMzrWsYv887M=EUe200owKo=7ZZ3gWivmKA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: =?UTF-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>
Subject: Re: [meta-oe][PATCH 3/3] libldb: make openldap optional, but default
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
X-List-Received-Date: Wed, 11 Nov 2015 17:34:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 11, 2015 at 1:11 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
>> Am 11.11.2015 um 04:26 schrieb Khem Raj <raj.khem@gmail.com>:
>>
>>>
>>> On Nov 10, 2015, at 1:26 PM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>
>>>
>>> Since openldap isn't required, but used when found, allow qualified
>>> users to disable the requirement to save some space.
>>>
>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>> ---
>>> meta-oe/recipes-support/libldb/libldb_1.1.17.bb | 5 ++++-
>>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
>>> index 44f061a..07a839d 100644
>>> --- a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
>>> +++ b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
>>> @@ -4,9 +4,12 @@ SECTION = "libs"
>>> LICENSE = "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
>>>
>>> DEPENDS += "libtdb talloc libtevent popt"
>>> -RDEPENDS_${PN} += "libtevent popt libtalloc openldap"
>>> +RDEPENDS_${PN} += "libtevent popt libtalloc"
>>> RDEPENDS_pyldb += "python libtdb libtalloc"
>>>
>>> +PACKAGECONFIG ??= "ldap"
>>> +PACKAGECONFIG[ldap] = ",,openldap"
>>> +
>>> SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
>>>           file://do-not-import-target-module-while-cross-compile.patch \
>>>          "
>>> --
>>> 1.9.1
>>>
>>> This results from analysing why there's still an openldap ...
>>>
>>> I know, having no knob to disable ldap is dirty, but there is no such switch.
>>> Even more dirty, the switch in samba_4% is for embedded samba3 source-base only,
>>> the ldb bundled with samba4 just uses ldap when found.
>>>
>>> The patch relies on the idea of qualified users - those who know that they
>>> don't want ldap, disable it everywhere and whistle.
>>
>> it seems to not fix the problem completely, for exact reasons that some other package may bring in openldap and stage it before this recipe is built so you
>> have exact same problem again. I think if this package is patched to add a knob to disable/enable openldap support explicitly then the fix will be complete and I am sure upstream will also accept such a patch.
>
> NO! Please read carefully what "qualified user expected" means!
>

I understand it well. no we don't want any user tiers here. We should
tend towards becoming user friendly
A qualified user is well equipped to maintain a patch with a
RDEPENDS_${PN}_remove in his layer.


> Forcing a dependency because someone else might introduce it either
> is insane - and adding RDEPENDS is just hiding the symptom, not

its bringing determinism to build thats an important aspect.

> fixing the root cause. The root cause is, that waf is broken
> by design.

such sweeping statements have to backed by reasoning otherwise no one
will take them seriously. IMO if you atleast report
this to waf community someone else might be able to help fixing
whatever the problem is.

>
> And no, I'm not going to fix waf.

Thats fine.

>
> Cheers
> --
> Jens Rehsack - rehsack@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

