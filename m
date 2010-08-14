Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OkIqP-0004IZ-Av
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 17:40:40 +0200
Received: by eyx24 with SMTP id 24so1826142eyx.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 08:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=V6aK8ew2jwUhwhGdwbkmYInSmZowkM66OeYVj4bsSCE=;
	b=ql/ZycKQcPegLRS8hfznnOuueVAAVPy4kBX4H2JexrfWdcQggcQhSwe0zJ4Zmu0kaG
	3E72TdqCY+R7fYS4FD8Y3X4OtyfjRPOehGoR4L5eT6KgRSzAW755WI0L1fDhtMJYqMJM
	DSD8l3oNuv6om3ARjG9tztE47S0mNK3+vxD5Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=cnVLXNu+zeIvQZ0Rk6G8ywkE7U+3BHjTt9xM+8Kh6hwDrfHSTD/IlSI7MnvCPW8g4e
	DnRKzxG4VLxGNoEd++YAP3HeO7Gcz/0hzD4O0GLmyqPfL6Yp1XTgTm07vRcvHDT+9G2Z
	nO4+7zdGWiGPnPy2eUlguDJQomtQ73k216veQ=
Received: by 10.213.37.8 with SMTP id v8mr806701ebd.1.1281800399278; Sat, 14
	Aug 2010 08:39:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.213.35.135 with HTTP; Sat, 14 Aug 2010 08:39:39 -0700 (PDT)
In-Reply-To: <AANLkTimJxb8L3Wk5nzbhFLqgACmSw=70nnT0NPEv93i1@mail.gmail.com>
References: <1281698231-26231-1-git-send-email-noor_ahsan@mentor.com>
	<1281701005.3858.129.camel@mattotaupa>
	<AANLkTinLVmyz+QJQKXRcmf-1375uTPC84RYM8Xr59V3-@mail.gmail.com>
	<i43kf7$942$1@dough.gmane.org>
	<AANLkTimJxb8L3Wk5nzbhFLqgACmSw=70nnT0NPEv93i1@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Aug 2010 08:39:39 -0700
Message-ID: <AANLkTinh79hZh6QthVobqifdbu-32p6tu2-h-RpxguPh@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]Removing Legacy staging from genboot native recipe
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
X-List-Received-Date: Sat, 14 Aug 2010 15:40:41 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 14, 2010 at 1:41 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/8/13 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 13-08-10 14:25, Frans Meulenbroeks wrote:
>>> 2010/8/13 Paul Menzel <paulepanter@users.sourceforge.net>:
>>>> Am Freitag, den 13.08.2010, 17:17 +0600 schrieb noor_ahsan@mentor.com:
>>
>>>>> +NATIVE_INSTALL_WORKS =3D "1"
>>>>
>>>> I am really a noob, but is not that for =93normal=94, i.e. no *-native=
,
>>>> recipes indicating no explicit native recipe is needed?
>>>
>>> Afaik this is not needed.
>>
>> If your -native recipe has something different than 'make install' in
>> do_install, it needs NATIVE_INSTALL_WORKS =3D "1" but only if you use
>> BBCLASSEXTEND to make it native.
>>
> The BBCLASSEXTEND part does not matter.
>
> If you have a -native recipe that does not use autotools and does not
> use make install
> NATIVE_INSTALL_WORKS =3D "1"
> is needed. Without it the following code is generated:
>
> do_stage_native() {
> =A0 =A0 =A0 =A0# If autotools is active, use the autotools staging functi=
on, else
> =A0 =A0 =A0 =A0# use our "make install" equivalent
> =A0 =A0 =A0 =A0if [ "${AUTOTOOLS_NATIVE_STAGE_INSTALL}" =3D=3D "1" ]
> =A0 =A0 =A0 =A0then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0autotools_stage_all
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oe_runmake install
> =A0 =A0 =A0 =A0fi
>
> }
>
> BTW this is a recipe that has no target equivalent so there is no
> non-native variant.


if you have staging function which is not one of use_do_install_for_stage()=
 or
autotools_stage_all() or do_stage_native() and
AUTOTOOLS_NATIVE_STAGE_INSTALL is 1

then legacy staging will be used. in such cases NATIVE_INSTALL_WORKS
is used to indicate
that whatever install function we have is good for staging so dont do
legacy staging.


>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


