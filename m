Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id C11CF7706C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 13:10:39 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t91DAcNt019197 for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Oct 2015 08:10:38 -0500
Received: from [10.113.0.102] ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015100108103834-890101 ;
	Thu, 1 Oct 2015 08:10:38 -0500 
To: openembedded-devel@lists.openembedded.org
References: <1443602914-22199-1-git-send-email-adrian.ratiu@ni.com>
	<1443611744-32468-1-git-send-email-adrian.ratiu@ni.com>
	<394DAAF7-103E-46D8-8495-F4209BE5857C@gmail.com>
	<560CFA68.2030208@ni.com> <20151001112138.GA2403@jama>
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <560D30CD.7000404@ni.com>
Date: Thu, 1 Oct 2015 16:10:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20151001112138.GA2403@jama>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/01/2015 08:10:38 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/01/2015 08:10:38 AM
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
X-List-Received-Date: Thu, 01 Oct 2015 13:10:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01.10.2015 14:21, Martin Jansa wrote:
> On Thu, Oct 01, 2015 at 12:18:32PM +0300, Ioan-Adrian Ratiu wrote:
>> On 30.09.2015 18:24, Khem Raj wrote:
>>>
>>>> On Sep 30, 2015, at 4:15 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> w=
rote:
>>>>
>>>> libubox contains C utility functions used by OpenWrt projects
>>>>
>>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>>> ---
>>>> meta-oe/recipes-devtools/libubox/libubox=5Fgit.bb | 32 +++++++++++++++=
++++++++++
>>>> 1 file changed, 32 insertions(+)
>>>> create mode 100644 meta-oe/recipes-devtools/libubox/libubox=5Fgit.bb
>>>>
>>>> diff --git a/meta-oe/recipes-devtools/libubox/libubox=5Fgit.bb b/meta-=
oe/recipes-devtools/libubox/libubox=5Fgit.bb
>>>> new file mode 100644
>>>> index 0000000..4be3ac1
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-devtools/libubox/libubox=5Fgit.bb
>>>> @@ -0,0 +1,32 @@
>>>> +DESCRIPTION =3D "C utility functions for OpenWrt"
>>>> +SECTION =3D "libs"
>>>> +LICENSE =3D "libubox-custom-license=94
>>>
>>> where is the license file ?
>>>
>>
>> There is no global license file, only the license headers specified per
>> files, of which I tried to list all the unique ones in the
>> LIC=5FFILES=5FCHKSUM. I'm still at a loss what to put in the LICENSE
>> variable. Any suggestions?
>>
>>>> +LIC=5FFILES=5FCHKSUM =3D "\
>>>> +    file://avl.c;endline=3D39;md5=3D00810155fed3d604816ec5814523d60a \
>>>> +    file://avl-cmp.c;endline=3D15;md5=3D1603e6094b432a5f3f320877a06f4=
1b5 \
>>>> +    file://base64.c;endline=3D61;md5=3D51fdff010d45b0086ac0a6e035693d=
c0 \
>>>> +    file://blobmsg.c;endline=3D15;md5=3D7ed64c1570e8c9b46c4fc6fbd16c4=
89e \
>>>> +    file://list.h;endline=3D28;md5=3D2d5f5475fbd0f08741354c5a99c2e983=
 \
>>>> +    file://md5.h;endline=3D39;md5=3D048bf9f68963c207a0c2b3a94c9d2aaa \
>>>> +    file://md5.c;endline=3D51;md5=3D0a448eea0bcbc89e3c7e6608f2d119a0 \
>>>> +    file://usock.h;endline=3D18;md5=3Df0dfdc8de858e66d66d74036611bba1=
4 \
>>>> +"
>>>> +
>>>> +PACKAGES =3D "${PN} ${PN}-dbg ${PN}-dev ${PN}-staticdev=94
>>>
>>> why override default PACKAGES ?
>>>
>>
>> This is related with the issue below, please see my explanation there.
>>
>>>> +
>>>> +DEPENDS =3D "json-c"
>>>> +
>>>> +SRC=5FURI =3D "git://git.openwrt.org/project/libubox.git"
>>>> +
>>>> +SRCREV =3D "136a5196266d03d537f822c4e67d2fde2ed59505"
>>>> +
>>>> +S =3D "${WORKDIR}/git"
>>>> +
>>>> +inherit cmake
>>>> +
>>>> +EXTRA=5FOECMAKE =3D "-DBUILD=5FEXAMPLES=3DOFF -DBUILD=5FLUA=3DOFF"
>>>> +
>>>> +FILES=5F${PN} +=3D "\
>>>> +    ${libdir}/libubox.so \
>>>> +    ${libdir}/libblobmsg=5Fjson.so \
>>>
>>> can they be versioned ?
>>>
>>
>> My initial problem in patch v1 was that I was getting this dev-deps
>> error (I used INSANE=5FSKIP to suppress it):
>>
>> ERROR: QA Issue: libubox rdepends on libubox-dev [dev-deps]
>> ERROR: QA run found fatal errors. Please consider fixing them.
>> ERROR: Function failed: do=5Fpackage=5Fqa
>>
>> Martin J. told me to fix the issue properly for these recipes.
>>
>> Now, in v2, I've made it go away by reordering ${PN} in front of
>> ${PN}-dev in PACKAGES and explicitly adding these files to FILES=5F${PN}.
>> If I use the default PACKAGES variable, or do not add the libraries to
>> FILES=5F${PN}, that error reappears.
>>
>> I don't have a level of knowledge-depth of the OE packaging mechanism to
>> fully understand what is happening here and I couldn't find more info in
>> the docs... So any help on this is very much appreciated :)
>
> I'm surprised that there are still many people confused by this and that
> the docs aren't clear enough.
>
> I'm not tech. writer, but I would explain it like this:
>
> Packaging rules:
>
> 1) Each installed file (in ${D} directory), should be packaged in exactly
> one package. If it matches in multiple FILES=5F<pkg> patterns, then first
> package wins (see bellow), if it isn't matched in any FILES=5F<pkg>
> variable, then it's not packaged at all and QA warning
> installed-not-packaged is shown.
> 2) Files are "moved" to packages in order of PACKAGES variable, so if
> FILES=5F<pkg1> has more generic pattern than FILES=5F<pkg2> then pkg1 nee=
ds
> to be =5Fafter=5F pkg2 in PACKAGES variable or pkg1 will get all files and
> pkg2 none.
>
> To apply this on your problem, if you really want to move all .so files
> to PN (normally they are symlinks to versioned .so.X.Y.Z and really
> belong to PN-dev). Typical exception to this rule are some .so modules
> loaded by the application itself instead of normal shlib loader.
>
> You have 2 options (first one is better)
>
> 1) restrict FILES=5F${PN}-dev to prevent it from "eating" these .so. I
> prefer to set FILES=5FSOLIBSDEV instead of redefinition of whole
> FILES=5F${PN}-dev
>
> 2) change order of PACKAGES by re-defining it in the recipe - harder to
> introduce new global PACKAGES
>

Thank you very much for clarifying this. I will rewrite and resubmit.


