Return-Path: <donald.poole@swri.org>
Received: from esg260-1.itc.swri.edu (esg260-1.itc.swri.edu [129.162.252.40])
	by mail.openembedded.org (Postfix) with ESMTP id B314F605F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 18:44:35 +0000 (UTC)
Received: from exchmail.swri.org (casht256-1.adm.swri.edu [129.162.243.120])
	by esg260-1.itc.swri.edu (8.14.5/8.14.5) with ESMTP id s42Iialf012442
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 May 2014 13:44:36 -0500
Received: from MBX256-1.adm.swri.edu ([169.254.1.62]) by
	CASHT256-1.adm.swri.edu ([129.162.243.120]) with mapi id 14.03.0181.006;
	Fri, 2 May 2014 13:44:36 -0500
From: "Poole Jr, Donald R." <donald.poole@swri.org>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-qt5][PATCH] qmake5_base.bbclass: Add install
	support for native builds
Thread-Index: AQHPZYC8FzFD0TH0GEOtwtPcZg6Yrpstoh0A
Date: Fri, 2 May 2014 18:44:35 +0000
Message-ID: <CF89516F.2F68%donald.poole@swri.org>
References: <1398974461-3044-1-git-send-email-donald.poole@swri.org>
	<20140501210300.GU2486@jama>
In-Reply-To: <20140501210300.GU2486@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.4.1.140326
x-originating-ip: [129.162.230.100]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.11.96, 1.0.14,
	0.0.0000
	definitions=2014-05-02_06:2014-05-02, 2014-05-02,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=0
	kscore.is_bulkscore=4.91273688396632e-14 kscore.compositescore=1
	circleOfTrustscore=0 compositescore=0.997781753771917
	urlsuspect_oldscore=0.997781753771917 suspectscore=0
	recipient_domain_to_sender_totalscore=0 phishscore=0 bulkscore=0
	kscore.is_spamscore=0 recipient_to_sender_totalscore=0
	recipient_domain_to_sender_domain_totalscore=0
	rbsscore=0.997781753771917
	spamscore=0 recipient_to_sender_domain_totalscore=0 urlsuspectscore=0.9
	adultscore=0 classifier=spam adjust=-40 reason=mlx scancount=1
	engine=7.0.1-1402240000 definitions=main-1405020278
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: Add install support for native builds
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
X-List-Received-Date: Fri, 02 May 2014 18:44:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D9E0C989465A954AAB83F96E44925B6D@sw.pvt>
Content-Transfer-Encoding: quoted-printable

Martin, et. al,

What is the processes for patch submission review? Does the review team
review and test the patch and then report it=B9s acceptance?

Donald R. Poole, Jr.
Research Engineer
Voice: 210.522.3131 | Fax: 210.522.4931
Tactical Networks & Communications (tacticalnetworks.swri.org)
Southwest Research Institute (SwRI)


On 5/1/14, 4:03 PM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

>On Thu, May 01, 2014 at 03:01:01PM -0500, Donald R. Poole, Jr. wrote:
>> From: "Donald R. Poole, Jr" <donald (dot) poole (at) swri (dot) org>
>>=20
>> Currently, if you are building native applications with Qt5, the
>>current qmake5_base_do_install() method assumes an install into the
>>image folder for the target. Since the native builds handle this a
>>little differently, this patch should account for the native install
>>scenario.
>
>Can you explain a bit why you're building qt5 native application? Is it
>used to build some target packages?
>
>> ---
>>  classes/qmake5_base.bbclass |   37
>>++++++++++++++++++++++---------------
>>  1 file changed, 22 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
>> index 18fdb2a..df8a59a 100644
>> --- a/classes/qmake5_base.bbclass
>> +++ b/classes/qmake5_base.bbclass
>> @@ -163,23 +163,30 @@ qmake5_base_do_configure () {
>> =20
>>  qmake5_base_do_install() {
>>      # Fix install paths for all
>> -    find -name "Makefile*" | xargs sed -i
>>"s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
>> +    if [ "${BUILD_SYS}" =3D "${HOST_SYS}" ] ; then
>> +        find -name "Makefile*" | xargs sed -i
>>"s,(INSTALL_ROOT),(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
>> +    else
>> +        find -name "Makefile*" | xargs sed -i
>>"s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
>> +    fi
>> =20
>>      oe_runmake install INSTALL_ROOT=3D${D}
>> =20
>> -    # everything except HostData and HostBinaries is prefixed with
>>sysroot value,
>> -    # but we cannot remove sysroot override, because that's useful for
>>pkg-config etc
>> -    # In some cases like QtQmlDevTools in qtdeclarative, the sed above
>>does not work,
>> -    # fix them manually
>> -    if [ -d ${D}${STAGING_DIR_TARGET} ] && [ -n
>>"${STAGING_DIR_TARGET}" ] ; then
>> -        echo "Some files are installed in wrong directory
>>${D}${STAGING_DIR_TARGET}"
>> -        cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
>> -        rm -rf ${D}${STAGING_DIR_TARGET}
>> -        # remove empty dirs
>> -        TMP=3D`dirname ${D}/${STAGING_DIR_TARGET}`
>> -        while test ${TMP} !=3D ${D}; do
>> -            rmdir ${TMP}
>> -            TMP=3D`dirname ${TMP}`;
>> -        done
>> +    # Only do this for target builds. Native install work a little
>>differently
>> +    if [ "${BUILD_SYS}" !=3D "${HOST_SYS}" ] ; then
>> +        # everything except HostData and HostBinaries is prefixed with
>>sysroot value,
>> +        # but we cannot remove sysroot override, because that's useful
>>for pkg-config etc
>> +        # In some cases like QtQmlDevTools in qtdeclarative, the sed
>>above does not work,
>> +        # fix them manually
>> +        if [ -d ${D}${STAGING_DIR_TARGET} ] && [ -n
>>"${STAGING_DIR_TARGET}" ] ; then
>> +            echo "Some files are installed in wrong directory
>>${D}${STAGING_DIR_TARGET}"
>> +            cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
>> +            rm -rf ${D}${STAGING_DIR_TARGET}
>> +            # remove empty dirs
>> +            TMP=3D`dirname ${D}/${STAGING_DIR_TARGET}`
>> +            while test ${TMP} !=3D ${D}; do
>> +                rmdir ${TMP}
>> +                TMP=3D`dirname ${TMP}`;
>> +            done
>> +        fi
>>      fi
>>  }
>> --=20
>> 1.7.9.5
>>=20
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>--=20
>Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


