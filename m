Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1Lr5Vc-0006dh-VA
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 09:18:13 +0200
Received: by an-out-0708.google.com with SMTP id d11so2488707and.30
	for <openembedded-devel@openembedded.org>;
	Tue, 07 Apr 2009 00:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=uMbP4bB8oie7XOIAF6zXXQ3FRHerHaUwCtQCxeu2XdE=;
	b=lrpv+wHh/HZEYr99V33+OYBJcBqVgsbDI+T50yzhEcxr5tN749sOBlJTJliYXii5m/
	cUuOAKDYO2apz2lxUjc2hT4oJPsqtingTyWAiH9+9e5hHRAOBT0rdbwHoh1TqAs/j2DA
	V3wKtufP5nrHIDPIrg19up7X3JScFDlCujAjA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=CL3enY0NfGrKrRR0DRWcvZiJFDI7/OkdqmsROlIdR6M3lEDWJx/jji5PVqrvWrnl4q
	06vZHB0UV1mgFwsFlzyba+30Uni6N4nb8VoBjs1Nb8vlnN/lKkZd1/CUNtK9So02E1BF
	kmPRsiHHb0OmofJXIjksDrxCrAy1AWY3G4MBU=
MIME-Version: 1.0
Received: by 10.100.227.18 with SMTP id z18mr7465395ang.49.1239088277362; Tue, 
	07 Apr 2009 00:11:17 -0700 (PDT)
In-Reply-To: <20090406235402.GA2195@smtp.west.cox.net>
References: <d2b9ea600904061614r2839effbla380925d536c3999@mail.gmail.com>
	<20090406235402.GA2195@smtp.west.cox.net>
Date: Tue, 7 Apr 2009 09:11:17 +0200
Message-ID: <d2b9ea600904070011m2233742by5b8af78fa8417261@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.240
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-SA-Exim-Scanned: No (on linuxtogo.org); SA Timed out after 240 secs
Cc: openembedded-devel@openembedded.org
Subject: Re: [STABLE][PATCH] mingw-binutils: update to 2.19.1
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
X-List-Received-Date: Tue, 07 Apr 2009 07:18:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2009 at 1:54 AM, Tom Rini <trini@kernel.crashing.org> wrote:
> On Tue, Apr 07, 2009 at 01:14:07AM +0200, Esben Haabendal wrote:
>
>> Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
>> ---
>> =A0.../mingw-binutils-canadian-cross_2.19.1.bb =A0 =A0 =A0 =A0| =A0 11 +=
++++++++++
>> =A0recipes/binutils/mingw-binutils_2.19.1.bb =A0 =A0 =A0 =A0 =A0| =A0 12=
 ++++++++++++
>> =A02 files changed, 23 insertions(+), 0 deletions(-)
>> =A0create mode 100644 recipes/binutils/mingw-binutils-canadian-cross_2.1=
9.1.bb
>> =A0create mode 100644 recipes/binutils/mingw-binutils_2.19.1.bb
>
> First, this isn't in .dev yet. =A0Second..

I know, it should apply there cleanly as well, but I need to test it...

>> diff --git a/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
>> b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
>> new file mode 100644
>> index 0000000..27e06c6
>> --- /dev/null
>> +++ b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
>> @@ -0,0 +1,11 @@
>> +require mingw-binutils_${PV}.bb
>> +require binutils-canadian-cross.inc
>> +
>> +DEFAULT_PREFERENCE_sdk-mingw32 =3D "1"
>> +DEFAULT_PREFERENCE_sdk-mingw64 =3D "1"
>
> That's meaningless atm. =A0Or at least it is for how I've been doing all
> of the build tests (SDK_OS=3Dmingw32), it would be just _mingw32 (does
> mingw64 work yet?). =A0Finally, do we really want to make this default
> when we're still building gcc-3.4.5? =A0I wouldn't think so, but I assume
> this means a gcc 4 actual release is soon.

The gcc 4 relase from MinGW project seem to have been in the same
state for quite a while.
I wonder when they will change it.

Any special reason why we don't want to use a newer binutils for gcc-3.4.5?

I don't remember seeing any problems with that, but maybe I have just
been lucky on that issue :-)

The reason I pulled in this release was actually that I had a failure
with ld from the old binutils when building mingw-runtime.
So unless something points against setting 2.19.1 as default, I think we sh=
ould.

> Oh, and you forgot to add in checksums :)

Ah, sorry.

/Esben


--=20
Esben Haabendal, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
WWW: http://www.doredevelopment.dk


