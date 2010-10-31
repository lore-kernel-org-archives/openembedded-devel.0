Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PCNpX-00046h-Bd
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Oct 2010 03:39:37 +0100
Received: by gxk26 with SMTP id 26so1273562gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Oct 2010 19:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=kNirzYTXNC9nuKfMKfvE6to6g9uHEFNI9mUC433Mlf8=;
	b=LjfmsAhojketVPlxS+CASBZemEkMwNwBvc4U99vE2vyMwvCI16AfrEKiKWfjZRDG9C
	pck3oQeOM9jmGsL9pW7L7Ms0QKGLtjqz+4K7+SxFkI2UDdhCARR3mQNnAma0z6BEFliL
	X/r3DIyMpi0FGhSHKWH0BEMb72sMwVseVbCGQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=bYiLwZ028f4yzFk/AnbtE7P2iMuFhzOg3XDO2b/WuA3DfaZHy1cmhY1bu2g0ENka5P
	okdbnR4u10cnXyT8N+4/vC8F0PVilZM47CMTwm6FjAb6U/c3UTGHFpzy5SPCZ3nwcxrr
	c8yqILB+JDgt9Xdf44ajHun/dnf6adtK7nJYc=
Received: by 10.91.11.30 with SMTP id o30mr6972238agi.94.1288492720679; Sat,
	30 Oct 2010 19:38:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.105.8 with HTTP; Sat, 30 Oct 2010 19:38:20 -0700 (PDT)
In-Reply-To: <20101030232227.GC6312@jama>
References: <1288395329-10474-1-git-send-email-eric@eukrea.com>
	<20101030232227.GC6312@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Oct 2010 19:38:20 -0700
Message-ID: <AANLkTinGsErqQL6PDe5Kj02SjbjynsOF4OL9FBHk54EU@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: curl-nativesdk as default libcurl provider?
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
X-List-Received-Date: Sun, 31 Oct 2010 02:39:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 30, 2010 at 4:22 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Hi,
>
> nativesdk support was added to curl with 7.21.1 version in
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D893ec9283c=
23b2aa7bbfd615cc5012ef68c9d1b0
>
> since then
> recipes/accelges/accelges_svn.bb
> was pulling
> virtual:nativesdk:curl_7.21.1.bb
> to task-shr-feed build
>
> it is because libcurl is in accelges's RDEPENDS (which is not really
> correct and I'll remove it)
> RDEPENDS_${PN} =3D "dbus dbus-glib libxrandr libnotify notification-daemo=
n libcurl gtk+"
>
> and libcurl in PACKAGES in curl-target.inc
> PACKAGES +=3D "${PN}-certs libcurl libcurl-dev libcurl-doc"
>
> but isn't it supposed to work better by default?
>
> If I remove it from RDEPENDS it works OK, because libcurl4 (I'm
> using debian naming) is picked right
>
> Version: 1:0.2+svnr206-r3.6
> Depends: update-rc.d, libdbus-glib-1-2, libdbus-1-3, libgobject-2.0-0,
> libgthread-2.0-0, libc6, libglib-2.0-0, bluez4, libglade-2.0-0, gtk+,
> libatk-1.0-0, libgio-2.0-0, pango, libstdc++6, libcairo2, libpixman-1-0,
> libpng12-0, libxrender1, libx11-6, libxcb1, libpthread-stubs0, libxau6,
> libxdmcp6, libfontconfig1, libfreetype6, libexpat1, libgmodule-2.0-0,
> libcurl4, libgnutls26, libz1, libgcrypt11, libgpg-error0
>
> for accelges fixed in:
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Def297b9feb=
d05766242d0b6cb5dae14024456d41
> but maybe other recipes have same problem..
>
> Whole curl package seems strage..

its using BBCLASSEXTEND to get sdk recipes may be thats the reason
I think we can disable nativesdk for now.

> ie sdk builddir doesn't start with curl-sdk- as normal for other sdk
> tmp/work/x86_64-armv7a-sdk-oe-linux-gnueabi/curl-7.21.1-r4.1/
>
> Regards,
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


