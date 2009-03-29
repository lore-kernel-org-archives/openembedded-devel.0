Received: from [74.125.44.155] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Lo4vS-0004SZ-W6
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 02:00:27 +0200
Received: by yx-out-1718.google.com with SMTP id 3so1213737yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2009 16:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=kShBaj8FIPH1nqcCicQRh6kf2rAEOkNIzPVT0lomm5I=;
	b=BHsJkfNQ2ysFL5rgyf9SZYMjlDFFFSp78DWvThVT7uvK68JVDiyox2wClo5Uz3kGWa
	Ca0EV9ogRVR/DXfS7vkkQSfMyMI1fXfCIAbj8NXJ0pN6Yt1tf4voD0gANY7uIxzNqHPU
	u+z9o9ahn46IOsTVrbvvXFsHHJrnEHLdMPsy0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=EF2edtzdqXwGE4dMx2/RdvSE6d+m2ZkxPuTMcSvllA5QoMjxIev0hYYtxnHfGPOdmz
	25k3kZbA7rbOR92Gak3EFX892E1FThFVH9jNBU+4TRz/33NzetEm8ZRgNONNrffRYvdM
	g7/TaLv90pg43kvSUWK2P3BjUPF6xB1qRYrd0=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.15.20 with SMTP id s20mr7828686ybi.165.1238371104185; Sun, 
	29 Mar 2009 16:58:24 -0700 (PDT)
In-Reply-To: <200903291856.30655.mickey@vanille-media.de>
References: <20090329151859.F156EE806C@amethyst.openembedded.net>
	<200903291856.30655.mickey@vanille-media.de>
Date: Sun, 29 Mar 2009 16:58:24 -0700
X-Google-Sender-Auth: 1a654193753a9bf1
Message-ID: <b6ebd0a50903291658s70319275s204de543bc9192e@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: RFILES (was: ltp: Fix two QA issues; .debug leak and 	GNU_HASH.)
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
X-List-Received-Date: Mon, 30 Mar 2009 00:00:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2009 at 9:56 AM, Michael 'Mickey' Lauer
<mickey@vanille-media.de> wrote:
> On Sunday 29 March 2009 17:18:59 GIT User account wrote:
>> -FILES_${PN}-dbg =3D =C2=A0"${libexecdir}/ltp/*/*/*/*/*/.debug"
>> +FILES_${PN}-dbg =C2=A0=3D "${libexecdir}/ltp/*/*/*/*/*/*/*/*/*/.debug"
>> +FILES_${PN}-dbg +=3D "${libexecdir}/ltp/*/*/*/*/*/*/*/*/.debug"
>> +FILES_${PN}-dbg +=3D "${libexecdir}/ltp/*/*/*/*/*/*/*/.debug"
>> +FILES_${PN}-dbg +=3D "${libexecdir}/ltp/*/*/*/*/*/*/.debug"
>> +FILES_${PN}-dbg +=3D "${libexecdir}/ltp/*/*/*/*/*/.debug"
>> =C2=A0FILES_${PN}-dbg +=3D "${libexecdir}/ltp/*/*/*/*/.debug"
>> =C2=A0FILES_${PN}-dbg +=3D "${libexecdir}/ltp/*/*/*/.debug"
>> =C2=A0FILES_${PN}-dbg +=3D "${libexecdir}/ltp/*/*/.debug"
>> =C2=A0FILES_${PN}-dbg +=3D "${libexecdir}/ltp/*/.debug"
>
> That's truely insane. I know there's currently no other way to do it like
> that, but I'm willing to offer a bounty of like100 USD for someone who
> implements the RFILES idea -- specifying FILES through regular expression=
s.

Could always implement ** globbing, assuming python's glob module
doesn't already support it, as an alternative.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


