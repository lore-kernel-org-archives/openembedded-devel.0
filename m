Received: from smtp-out03.msg.oleane.net ([62.161.7.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QFpic-0000oO-5B for openembedded-devel@lists.openembedded.org;
	Fri, 29 Apr 2011 17:34:58 +0200
Received: from smtp04.msg.oleane.net (smtp04.mail.priv [172.17.20.113]) 
	by smtp-out03.msg.oleane.net with ESMTP id p3TFBb5s018209
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2011 17:11:38 +0200
Received: from [192.168.1.148] (AMarseille-551-1-3-92.w80-9.abo.wanadoo.fr
	[80.9.74.92]) (authenticated)
	by smtp04.msg.oleane.net (MTA) with ESMTP id p3TEpYHL000565
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2011 16:51:35 +0200
X-Oleane-Rep: REPA
Message-ID: <4DBAD078.7020909@cioinfoindus.fr>
Date: Fri, 29 Apr 2011 16:51:36 +0200
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DB82E7C.9080206@cioinfoindus.fr>	<1303936802.4833.8.camel@mattotaupa>
	<4DB9283C.1030602@cioinfoindus.fr>
	<1304019015.3911.19.camel@mattotaupa>
In-Reply-To: <1304019015.3911.19.camel@mattotaupa>
X-Spam-Flag: NO
X-PMX-Spam: Probability=8%
X-PFSI-Info: PMX 5.5.9.395186, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2011.4.29.143915 (no antivirus check)
X-Orange-Auth: Y2I1NTMtM0BjaW9pbmZvaW4uZnIuZnRv
Subject: Re: [PATCH 1/2] mypaint: new recipe for version 0.9.1
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
X-List-Received-Date: Fri, 29 Apr 2011 15:34:58 -0000
X-Groupsio-MsgNum: 31524
Content-Type: multipart/mixed; boundary="------------040501040309000505090004"

--------------040501040309000505090004
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp-out03.msg.oleane.net id p3TFBb5s018209

Dear Paul,

Le 28/04/2011 21:30, Paul Menzel a =C3=A9crit :
> Dear Christian,
>
>
> Am Donnerstag, den 28.04.2011, 10:41 +0200 schrieb Christian Charreyre:

[...]

> I hope there will be a lot more. ;-)
>

Hope so also.

[...]
>>>> +SRC_URI =3D "http://download.gna.org/mypaint/${PN}-${PV}.tar.bz2 \
>>>> +    file://scons-adapt.patch \
>>>> +"
>>>> +
>>>> +inherit distutils scons
>>>> +
>>>> +do_compile() {
>>>> +    STAGING_INCDIR=3D${STAGING_INCDIR} \
>>>> +    STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>>>> +    BUILD_SYS=3D${BUILD_SYS} \
>>>> +    HOST_SYS=3D${HOST_SYS} \
>>>> +    PATH=3D${PATH} scons_do_compile
>>>> +}
>>> I do not know Scons, but it looks strange that the above is needed an=
d
>>> not done automatically.
>> Same reply as above, there are few recipes with scons, I've found this
>> tip in one recipe and applied it here to get the build completed.
> I understand. Did you try with the default `do_compile`? If it does not
> work leave it so it works.

Yes, with the default do_compile the compilation tells that these=20
variables are undefined and abort.
scons uses python, and the variables are not available in the python's=20
env. unless I redefines them here.

[...]

> Thank you for your response. I hope we will get your next patch
> iteration included.
>

I'll try to correct everything and post it again in v2.

> Thanks,
>
> Paul
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--------------040501040309000505090004
Content-Type: text/x-vcard; charset=utf-8;
 name="christian_charreyre.vcf"
Content-Disposition: attachment;
 filename="christian_charreyre.vcf"
Content-Transfer-Encoding: base64

YmVnaW46dmNhcmQNCmZuOkNocmlzdGlhbiAgQ2hhcnJleXJlDQpuOkNoYXJyZXlyZTtDaHJpc3Rp
YW4gDQpvcmc6Q0lPIEluZm9ybWF0aXF1ZSBJbmR1c3RyaWVsbGUNCmFkcjtkb206OzsxMSBBdmVu
dWUgTWFyaWdueTtNYXJzZWlsbGU7OzEzMDE0DQplbWFpbDtpbnRlcm5ldDpjaHJpc3RpYW4uY2hh
cnJleXJlQGNpb2luZm9pbmR1cy5mcg0KdGVsO3dvcms6MDQgOTUgMDUgMTkgNDENCnVybDpodHRw
Oi8vd3d3LmNpb2luZm9pbmR1cy5mcg0KdmVyc2lvbjoyLjENCmVuZDp2Y2FyZA0KDQo=

--------------040501040309000505090004--
