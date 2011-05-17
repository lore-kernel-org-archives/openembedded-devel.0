Received: from smtp-out05.msg.oleane.net ([62.161.7.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QMQqN-00012w-Dc for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 22:26:15 +0200
Received: from smtp04.msg.oleane.net (smtp04.mail.priv [172.17.20.113]) 
	by smtp-out05.msg.oleane.net with ESMTP id p4HKNNJH011199;
	Tue, 17 May 2011 22:23:23 +0200
Received: from [192.168.1.106] (AMarseille-551-1-47-29.w80-9.abo.wanadoo.fr
	[80.9.222.29]) (authenticated)
	by smtp04.msg.oleane.net (MTA) with ESMTP id p4HK33ZJ000583;
	Tue, 17 May 2011 22:03:03 +0200
X-Oleane-Rep: REPA
Message-ID: <4DD2D477.1060508@cioinfoindus.fr>
Date: Tue, 17 May 2011 22:03:03 +0200
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Paul Menzel <paulepanter@users.sourceforge.net>
References: <1304091838-23333-1-git-send-email-christian.charreyre@cioinfoindus.fr>	
	<1304091838-23333-3-git-send-email-christian.charreyre@cioinfoindus.fr>
	<1304670267.4041.14.camel@mattotaupa>
In-Reply-To: <1304670267.4041.14.camel@mattotaupa>
X-Spam-Flag: NO
X-PMX-Spam: Probability=8%
X-PFSI-Info: PMX 5.6.0.2009776, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2011.5.17.194519 (no antivirus check)
X-Orange-Auth: Y2I1NTMtM0BjaW9pbmZvaW4uZnIuZnRv
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] python-numpy: add missing release dependencies
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
X-List-Received-Date: Tue, 17 May 2011 20:26:15 -0000
X-Groupsio-MsgNum: 32156
Content-Type: multipart/mixed; boundary="------------050805020303030006060006"

--------------050805020303030006060006
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp-out05.msg.oleane.net id p4HKNNJH011199

Dear Paul,

sorry for late reply, I missed you last mail.

Without these dependencies, I got errors on the target when executing=20
mypaint, because python-numpy code calls
import from the distinct packages.

When I install python-numpy alone, there are errors. I'm not an expert=20
of python packages splits, that was the way I've
found to force installation of the necessary packages. Perhaps you right=20
to replace RDEPENDS by RRECOMMENDS.

Perhaps you can ask someone that does know how relationship between=20
python packages must be described in recipes.

Regards.

PS : you suggested in previous mail you will commit the last correction.=20
Can you commit the final version after deciding
between RDEPENDS and RRECOMENDS.

Thanks.

Le 06/05/2011 10:24, Paul Menzel a =C3=A9crit :
> Dear Christian,
>
>
> I just wanted to commit your patches, but looking at this patch again I
> have one more question. (I am sorry.)
>
> Am Freitag, den 29.04.2011, 17:43 +0200 schrieb C. Charreyre:
>> Signed-off-by: C. Charreyre<christian.charreyre@cioinfoindus.fr>
>> ---
>>   recipes/python/python-numpy_1.1.1.bb |    2 ++
>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/python/python-numpy_1.1.1.bb b/recipes/python/pyt=
hon-numpy_1.1.1.bb
>> index f5c23e0..9dda508 100644
>> --- a/recipes/python/python-numpy_1.1.1.bb
>> +++ b/recipes/python/python-numpy_1.1.1.bb
>> @@ -4,6 +4,8 @@ PRIORITY =3D "optional"
>>   LICENSE =3D "PSF"
>>   PR =3D "ml0"
>>
>> +RDEPENDS_${PN} =3D "python-compiler python-mmap python-pkgutil python=
-pydoc python-unittest"
>> +
> Why are those runtime dependencies needed. Does not `python-numpy` star=
t
> at all or are just some features of it not working? Depending on that i=
t
> should maybe be a `RRECOMMENDS_${PN}`? I am wondering why the original
> recipe author did not put them in.
>
>>   SRC_URI =3D "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
>>              file://unbreak-assumptions.diff \
>>   	   file://trycompile.diff \
>
> Thanks,
>
> Paul
>
>
> PS: Do you get the message delivered directly or just the digest? I am
> asking because the threading is broken. If you do get the messages,
> could you please use the reply to list option of Thunderbird. Then
> everything should be fine.
>
> PPS: I am putting you in CC, so that you maybe get my message earlier
> and we will be able to commit your patches before the weekend.


--------------050805020303030006060006
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

--------------050805020303030006060006--
