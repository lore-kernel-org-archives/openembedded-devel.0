Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5347706C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 13:16:29 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t91DGTSx026090 for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Oct 2015 08:16:29 -0500
Received: from [10.113.0.102] ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015100108162920-888310 ;
	Thu, 1 Oct 2015 08:16:29 -0500 
To: openembedded-devel@lists.openembedded.org
References: <1443602914-22199-1-git-send-email-adrian.ratiu@ni.com>
	<1443611744-32468-1-git-send-email-adrian.ratiu@ni.com>
	<394DAAF7-103E-46D8-8495-F4209BE5857C@gmail.com>
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <560D322B.2030109@ni.com>
Date: Thu, 1 Oct 2015 16:16:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <394DAAF7-103E-46D8-8495-F4209BE5857C@gmail.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/01/2015 08:16:29 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/01/2015 08:16:29 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-10-01_04:, , signatures=0
Subject: Re: [meta-oe][PATCH V2] meta-oe: recipes-devtools: add libubox recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Oct 2015 13:16:32 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 30.09.2015 18:24, Khem Raj wrote:
>
>> On Sep 30, 2015, at 4:15 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wro=
te:
>>
>> libubox contains C utility functions used by OpenWrt projects
>>
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>> meta-oe/recipes-devtools/libubox/libubox=5Fgit.bb | 32 +++++++++++++++++=
++++++++
>> 1 file changed, 32 insertions(+)
>> create mode 100644 meta-oe/recipes-devtools/libubox/libubox=5Fgit.bb
>>
>> diff --git a/meta-oe/recipes-devtools/libubox/libubox=5Fgit.bb b/meta-oe=
/recipes-devtools/libubox/libubox=5Fgit.bb
>> new file mode 100644
>> index 0000000..4be3ac1
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/libubox/libubox=5Fgit.bb
>> @@ -0,0 +1,32 @@
>> +DESCRIPTION =3D "C utility functions for OpenWrt"
>> +SECTION =3D "libs"
>> +LICENSE =3D "libubox-custom-license=94
>
> where is the license file ?
>
>> +LIC=5FFILES=5FCHKSUM =3D "\
>> +    file://avl.c;endline=3D39;md5=3D00810155fed3d604816ec5814523d60a \
>> +    file://avl-cmp.c;endline=3D15;md5=3D1603e6094b432a5f3f320877a06f41b=
5 \
>> +    file://base64.c;endline=3D61;md5=3D51fdff010d45b0086ac0a6e035693dc0=
 \
>> +    file://blobmsg.c;endline=3D15;md5=3D7ed64c1570e8c9b46c4fc6fbd16c489=
e \
>> +    file://list.h;endline=3D28;md5=3D2d5f5475fbd0f08741354c5a99c2e983 \
>> +    file://md5.h;endline=3D39;md5=3D048bf9f68963c207a0c2b3a94c9d2aaa \
>> +    file://md5.c;endline=3D51;md5=3D0a448eea0bcbc89e3c7e6608f2d119a0 \
>> +    file://usock.h;endline=3D18;md5=3Df0dfdc8de858e66d66d74036611bba14 \
>> +"
>> +
>> +PACKAGES =3D "${PN} ${PN}-dbg ${PN}-dev ${PN}-staticdev=94
>
> why override default PACKAGES ?
>
>> +
>> +DEPENDS =3D "json-c"
>> +
>> +SRC=5FURI =3D "git://git.openwrt.org/project/libubox.git"
>> +
>> +SRCREV =3D "136a5196266d03d537f822c4e67d2fde2ed59505"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit cmake
>> +
>> +EXTRA=5FOECMAKE =3D "-DBUILD=5FEXAMPLES=3DOFF -DBUILD=5FLUA=3DOFF"
>> +
>> +FILES=5F${PN} +=3D "\
>> +    ${libdir}/libubox.so \
>> +    ${libdir}/libblobmsg=5Fjson.so \
>
> can they be versioned ?
>

Sorry I got carried into the packaging discussion and forgot to answer=20
this one. The answer is no. AFAIK this means that I have to tweak the=20
packaging to include them in FILES=5F${PN}.


