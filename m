Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lppzs-0006Wh-V4
	for openembedded-devel@openembedded.org; Fri, 03 Apr 2009 22:28:19 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1081476ywk.30
	for <openembedded-devel@openembedded.org>;
	Fri, 03 Apr 2009 13:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=beP2DYTvxWpW2rrkuTFDxBYcE/UmmAzUKbq/dMGC8vg=;
	b=TInqICf+lzvr2GXy6vOW/Qlg4yK2A0tp0PL3U2Z+sSKbxbwiBWEXSsfVKz/Fpj0E4Q
	ViVrVwErv4TKlfCwKYDPJx9/RuGWD5cT3gqwE3fuZrY1yv+PjCeu6iKzOYEO4lwUFOHz
	cNW9v5DHs2TQtGmK/YKFJ80BkCaKb/kng3OcI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=csittJNHW88R6fdPk2wSA7ZQfnoPaSneEx4EUXxcXQZsu8WTutcfupnPxFZAcmjeIg
	WanIGqtJ6DPqJMJbdf4zHlOqh0SHQ3maCE9wCW2iq0tjXWQtvwYnH/5bU+2S1CPdjKvW
	R/h6+vceUUYEuJJJlsYIyanojBlaxN7Jn+DBA=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.151.8 with SMTP id y8mr3478577and.106.1238790343549; Fri, 
	03 Apr 2009 13:25:43 -0700 (PDT)
In-Reply-To: <20090403191039.GB29161@gmail.com>
References: <20090403171052.GE30840@smtp.west.cox.net>
	<20090403191039.GB29161@gmail.com>
Date: Fri, 3 Apr 2009 17:25:43 -0300
X-Google-Sender-Auth: 6dee04dd06e50fdd
Message-ID: <be7a9f3d0904031325n19a9acddw11f710ef289a3b06@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.46.158
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [PATCH] wireless-tools: Fix libiw/ifrename packages, bump 	PR.
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
X-List-Received-Date: Fri, 03 Apr 2009 20:28:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Fri, Apr 3, 2009 at 4:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On (03/04/09 10:10), Tom Rini wrote:
>> I'm sending this for review since it actually puts ifrename into its own
>> package as was apparently intended, but not happening. =A0Giving people
>> the weekend + Monday to complain and Tuesday AM (US -0700) I'll push.
>>
>> =A0We weren't creating the above packages as we needed to use '=3D+' not
>> =A0'+=3D' here to take things from the default package. =A0For these
>> =A0additional packages, add files with '=3D' not '+=3D' and we only need=
 to add
>> =A0${sysconfdir}/network to the base package glob. =A0Also we need to ru=
n
>> =A0install-static to get libiw.a to be installed.
>>
>> ---
>> =A0recipes/wireless-tools/wireless-tools.inc =A0 | =A0 21 ++++++++++----=
-------
>> =A0recipes/wireless-tools/wireless-tools_29.bb | =A0 =A02 +-
>> =A02 files changed, 11 insertions(+), 12 deletions(-)
>>
>> diff --git a/recipes/wireless-tools/wireless-tools.inc b/recipes/wireles=
s-tools/wireless-tools.inc
>> index d2a7b89..f52c3f1 100644
>> --- a/recipes/wireless-tools/wireless-tools.inc
>> +++ b/recipes/wireless-tools/wireless-tools.inc
>> @@ -31,7 +31,7 @@ do_stage() {
>> =A0}
>>
>> =A0do_install() {
>> - =A0 =A0oe_runmake PREFIX=3D${D} install-iwmulticall install-dynamic in=
stall-man install-hdr
>> + =A0 =A0oe_runmake PREFIX=3D${D} install-iwmulticall install-dynamic in=
stall-static install-man install-hdr
>> =A0 =A0 =A0install -d ${D}${sbindir}
>> =A0 =A0 =A0install -m 0755 ifrename ${D}${sbindir}/ifrename
>> =A0 =A0 =A0install -d ${D}${sysconfdir}/network/if-pre-up.d
>> @@ -39,13 +39,12 @@ do_install() {
>> =A0 =A0 =A0install ${WORKDIR}/zzz-wireless.if-pre-up ${D}${sysconfdir}/n=
etwork/if-pre-up.d/zzz-wireless
>> =A0}
>>
>> -PACKAGES +=3D "libiw libiw-dev libiw-doc libiw-dbg ifrename ifrename-db=
g ifrename-doc"
>> -FILES_libiw +=3D "${libdir}/*.so.*"
>> -FILES_libiw-dbg +=3D "${libdir}/.debug/*.so.*"
>> -FILES_libiw-dev +=3D "${libdir}/*.a ${libdir}/*.so ${includedir}"
>> -FILES_libiw-doc +=3D "${mandir}/man7"
>> -FILES_ifrename +=3D "${sbindir}/ifrename"
>> -FILES_ifrename-dbg +=3D "${sbindir}/.debug/ifrename"
>> -FILES_ifrename-doc +=3D "${mandir}/man8/ifrename.8 ${mandir}/man5/iftab=
.5"
>> -FILES_${PN} +=3D "${bindir} ${sbindir}/iw* ${base_sbindir} ${base_bindi=
r} ${sysconfdir}/network"
>> -FILES_${PN}-doc +=3D "${mandir}/man8"
>> +PACKAGES =3D+ "libiw libiw-dev libiw-doc libiw-dbg ifrename ifrename-db=
g ifrename-doc"
>> +FILES_libiw =3D "${libdir}/*.so.*"
>> +FILES_libiw-dbg =3D "${libdir}/.debug/*.so.*"
>> +FILES_libiw-dev =3D "${libdir}/*.a ${libdir}/*.so ${includedir}"
>> +FILES_libiw-doc =3D "${mandir}/man7"
>> +FILES_ifrename =3D "${sbindir}/ifrename"
>> +FILES_ifrename-dbg =3D "${sbindir}/.debug/ifrename"
>> +FILES_ifrename-doc =3D "${mandir}/man8/ifrename.8 ${mandir}/man5/iftab.=
5"
>> +FILES_${PN} +=3D "${sysconfdir}/network"
>> diff --git a/recipes/wireless-tools/wireless-tools_29.bb b/recipes/wirel=
ess-tools/wireless-tools_29.bb
>> index 196a194..fb68127 100644
>> --- a/recipes/wireless-tools/wireless-tools_29.bb
>> +++ b/recipes/wireless-tools/wireless-tools_29.bb
>> @@ -1,3 +1,3 @@
>> =A0require wireless-tools.inc
>>
>> -PR =3D "r3"
>> +PR =3D "r4"
>
>
> Look ok to me.
>
>> --
>> 1.5.6.3
>>
>> --
>> Tom Rini
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


