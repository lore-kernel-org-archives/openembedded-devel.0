Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3jwa-0001Gs-S9
	for Openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 08:27:09 +0200
Received: by iwn7 with SMTP id 7so11127iwn.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 23:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=hSP2+W4aRvA40CRge51v4aT431DyRyI48V2XaGI4MQs=;
	b=YlzDB7SsGHduYRWMRQqX7p/dIagN1Q7yuqdS7zPIXX+TeD/hN+8X/boll/NyySMAhg
	3XO190/iLG+s9hR6OpRa05tssNbRkSnecqYKhwxxofz2OBN1f0/85rO9FRJMFJ2JjdNL
	n5P9qvMkcUW79xOBTEZ8RM8X2P3EH6gbdX5GY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=gZdv7gYYQTSfVOa9yA4X2x30BRwYiAZcdjoH8W3vMgd4aQrEOo7Hc41lGT3x95T9dJ
	nVPIg3d7HOwGwAD/gwfx8eF/C6fy/oHss/b1q9CM6NOkG8fu2T9q2oBGbb/Ev4pO/f8l
	fQSwh9k8eEJvQluHJaCuug0ApOBBgPzOZU91s=
Received: by 10.231.33.132 with SMTP id h4mr340405ibd.150.1286432809443; Wed,
	06 Oct 2010 23:26:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Wed, 6 Oct 2010 23:26:29 -0700 (PDT)
In-Reply-To: <AANLkTik3=c=HKZ+EHkan8OSZDt8JfS+bbj5ZtBgJgBpM@mail.gmail.com>
References: <AANLkTik3=c=HKZ+EHkan8OSZDt8JfS+bbj5ZtBgJgBpM@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Oct 2010 23:26:29 -0700
Message-ID: <AANLkTiknm8zsMUOFVfRXcZOGxitgjZPy8WxnnaU6hvMQ@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libvpx should not inherit autotools
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
X-List-Received-Date: Thu, 07 Oct 2010 06:27:09 -0000
X-Groupsio-MsgNum: 24467
Content-Type: multipart/mixed; boundary=0022152d6c65a26169049200fa30

--0022152d6c65a26169049200fa30
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 6, 2010 at 10:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Koen
>
> libvpx recipes are inheriting autotools while it seems to me that they
> should not. Yes it does have a configure script but its not autoconf
> generated but a hand written one
> and there are no other traces of autoconf or automake and stuff that
> goes with normal automake autoconf build systems.
>
> Would you take a look at it ?

something like attached would work. What do you think ?



>
> Thanks
> -Khem
>

--0022152d6c65a26169049200fa30
Content-Type: application/octet-stream; name=diff
Content-Disposition: attachment; filename=diff
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gez90xr30

ZGlmZiAtLWdpdCBhL3JlY2lwZXMvd2VibS9saWJ2cHguaW5jIGIvcmVjaXBlcy93ZWJtL2xpYnZw
eC5pbmMKaW5kZXggZDc3M2QzYS4uMDBlYmEyNiAxMDA2NDQKLS0tIGEvcmVjaXBlcy93ZWJtL2xp
YnZweC5pbmMKKysrIGIvcmVjaXBlcy93ZWJtL2xpYnZweC5pbmMKQEAgLTEsMTIgKzEsMTAgQEAK
IERFU0NSSVBUSU9OID0gInZweCBNdWx0aS1Gb3JtYXQgQ29kZWMgU0RLIgogTElDRU5TRSA9ICJC
U0QiCiAKLUlOQ19QUiA9ICJyNCIKK0lOQ19QUiA9ICJyNSIKIAogU1JDX1VSSSA9ICJodHRwOi8v
d2VibS5nb29nbGVjb2RlLmNvbS9maWxlcy9saWJ2cHgtJHtQVn0udGFyLmJ6MiIKIAotaW5oZXJp
dCBhdXRvdG9vbHMKLQogQ0ZMQUdTICs9ICItZlBJQyIKIAogZXhwb3J0IENDCkBAIC0yMyw3ICsy
MSwxMiBAQCBDT05GSUdVUkVPUFRTID0gIiBcCiAgICAgICAgICAgLS1lbmFibGUtbGlicyBcCiAg
ICAgICAgICAgLS1kaXNhYmxlLWluc3RhbGwtZG9jcyBcCiAiCi0KK2RvX2NvbmZpZ3VyZSgpIHsK
Kwkke1N9L2NvbmZpZ3VyZSAke0NPTkZJR1VSRU9QVFN9Cit9Citkb19jb21waWxlKCkgeworCW9l
X3J1bm1ha2UKK30KIGRvX2luc3RhbGwoKSB7CiAJb2VfcnVubWFrZSBpbnN0YWxsIERFU1RESVI9
JHtEfQogfQo=

--0022152d6c65a26169049200fa30--
