Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OmTlp-00010M-O5
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 17:44:42 +0200
Received: by iwn2 with SMTP id 2so470507iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 08:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=aoXzV2hg3Miy6/OuGBaMLzJLZfr51/lvmDV4i8KKX+E=;
	b=dCSM8gIi07WI4qGtx6vrXU/A+Dn7efchPDqFIMuYQlQJNi2j2SK5fa6Jbg0m9caezk
	xIu/vwJKkoyZrgYJRNOC8UpXRWP34QC3QhSk01x0cX8hLcMtd4lQsUESXz4kvCS0xq92
	r/c7UnHqfEHAyws2GJA//GhlETHy5R6kuHN48=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=PBO3m8CjvFqD/h/lJOeqKq+DN5yzh+GgUOOzsJKbFj69JSFjfukW+5TJN4DDhO5ZUP
	YA77MtIgufw/0EUSRge7DIPM9L8rVtPXsfNZQduxiy27YmGVF/itYXXjHXocLuMrJO70
	N3hgqR+BFIlar2/PhJTQODyfUaBTm+yxDmYoo=
Received: by 10.231.191.16 with SMTP id dk16mr1706886ibb.161.1282319061333;
	Fri, 20 Aug 2010 08:44:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.199 with HTTP; Fri, 20 Aug 2010 08:44:01 -0700 (PDT)
In-Reply-To: <AANLkTin4OrsobbFpGe-vaTfUCdbjAi=XF65VfJzYjrWm@mail.gmail.com>
References: <1282313977-31805-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1282315196.13038.44.camel@mill.internal.reciva.com>
	<AANLkTin4OrsobbFpGe-vaTfUCdbjAi=XF65VfJzYjrWm@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Aug 2010 08:44:01 -0700
Message-ID: <AANLkTi=T03QKXLOxx11BtG0=LcAGuzVqaqXx7yF+jTjV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] native.bbclass: add (re)definitions for TARGET_SYS and HOST_SYS
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
X-List-Received-Date: Fri, 20 Aug 2010 15:44:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 20, 2010 at 8:34 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Aug 20, 2010 at 7:39 AM, Phil Blundell <philb@gnu.org> wrote:
>> On Fri, 2010-08-20 at 16:19 +0200, Frans Meulenbroeks wrote:
>>> @@ -23,6 +23,7 @@ TARGET_VENDOR =3D "${BUILD_VENDOR}"
>>> =A0TARGET_PREFIX =3D "${BUILD_PREFIX}"
>>> =A0TARGET_CC_ARCH =3D "${BUILD_CC_ARCH}"
>>> =A0TARGET_EXEEXT =3D "${BUILD_EXEEXT}"
>>> +TARGET_SYS =3D "${BUILD_SYS}"
>
> bitbake.conf already has
>
> TARGET_SYS=3D${TARGET_ARCH}${TARGET_VENDOR}${@['-' +
> bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d,
> 1) =3D=3D ('' or 'custom')]}
>
> so once you have TARGET_OS set correctly this should work well for native=
 too.


hmm _local ok if you override TARGET_OS locally then lot of other
things will change
because now TARGET_OS will not be reset to whatever native wants. even if y=
ou
redefine TARGET_SYS may not be sufficient. Somehow if you can make
native.bbclass
to stubbornly ignore TARGET_OS override that might work.

>
>>
>> I don't think this is the right thing; native.bbclass already assigns
>> TARGET_OS =3D "${BUILD_OS}".
>>
>> Do you really need to use a _local override for TARGET_OS? =A0If so then=
 I
>> guess you need to find a way to stop it applying for virtclass-native.
>>
>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>


