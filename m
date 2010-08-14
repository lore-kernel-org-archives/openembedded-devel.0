Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OkCJV-0003SF-3J
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 10:42:14 +0200
Received: by gwb15 with SMTP id 15so1354672gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 01:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=W4l1/dkOEfTAUoWUMB4qZsjnlO/MZSQtDPA6HFUZBU8=;
	b=I+wEzS41thJcTh6ihYYfsXeeTX290Icl1jZRHROllJMM6JkoZ+P9oesgse3nrAFd6L
	ZTZY/YEZinHHCYe0LJ3wb7ibxeJ+HUzygo3N3ERsHtvK4to0X4oEd/Fz68kea+d9Q6on
	hrttOUGwaWokSqgtl/4KJslCgk6pClcb0ci/E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=v5ovqpMsaLUE68mADIcduf8Ekpd+VY6qgqg0SHLy/WtigiBtcvkmoVzgJS+qtjfR8q
	WbADpC29Fx/djIBsBGpsx89VNa1ro0gV2gUeHvbJhZUCj/7Jz4jA1UEMxaIii/Kqriw7
	UEUDkylv5ARhvkcchW0ENQH71ivv1BQELOs38=
MIME-Version: 1.0
Received: by 10.231.39.69 with SMTP id f5mr2866622ibe.53.1281775285223; Sat,
	14 Aug 2010 01:41:25 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Sat, 14 Aug 2010 01:41:25 -0700 (PDT)
In-Reply-To: <i43kf7$942$1@dough.gmane.org>
References: <1281698231-26231-1-git-send-email-noor_ahsan@mentor.com>
	<1281701005.3858.129.camel@mattotaupa>
	<AANLkTinLVmyz+QJQKXRcmf-1375uTPC84RYM8Xr59V3-@mail.gmail.com>
	<i43kf7$942$1@dough.gmane.org>
Date: Sat, 14 Aug 2010 10:41:25 +0200
Message-ID: <AANLkTimJxb8L3Wk5nzbhFLqgACmSw=70nnT0NPEv93i1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Sat, 14 Aug 2010 08:42:14 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/8/13 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 13-08-10 14:25, Frans Meulenbroeks wrote:
>> 2010/8/13 Paul Menzel <paulepanter@users.sourceforge.net>:
>>> Am Freitag, den 13.08.2010, 17:17 +0600 schrieb noor_ahsan@mentor.com:
>
>>>> +NATIVE_INSTALL_WORKS =3D "1"
>>>
>>> I am really a noob, but is not that for =93normal=94, i.e. no *-native,
>>> recipes indicating no explicit native recipe is needed?
>>
>> Afaik this is not needed.
>
> If your -native recipe has something different than 'make install' in
> do_install, it needs NATIVE_INSTALL_WORKS =3D "1" but only if you use
> BBCLASSEXTEND to make it native.
>
The BBCLASSEXTEND part does not matter.

If you have a -native recipe that does not use autotools and does not
use make install
NATIVE_INSTALL_WORKS =3D "1"
is needed. Without it the following code is generated:

do_stage_native() {
        # If autotools is active, use the autotools staging function, else
        # use our "make install" equivalent
        if [ "${AUTOTOOLS_NATIVE_STAGE_INSTALL}" =3D=3D "1" ]
        then
                autotools_stage_all
        else
                oe_runmake install
        fi

}

BTW this is a recipe that has no target equivalent so there is no
non-native variant.

Frans


