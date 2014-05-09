Return-Path: <donald.poole@swri.org>
Received: from esg260-1.itc.swri.edu (unknown [129.162.252.40])
	by mail.openembedded.org (Postfix) with ESMTP id 1190760703
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 May 2014 16:36:21 +0000 (UTC)
Received: from exchmail.swri.org (casht256-1.adm.swri.edu [129.162.243.120])
	by esg260-1.itc.swri.edu (8.14.5/8.14.5) with ESMTP id s49GaMYV027465
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 May 2014 11:36:22 -0500
Received: from MBX256-1.adm.swri.edu ([169.254.1.158]) by
	CASHT256-1.adm.swri.edu ([129.162.243.120]) with mapi id 14.03.0181.006;
	Fri, 9 May 2014 11:36:22 -0500
From: "Poole Jr, Donald R." <donald.poole@swri.org>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-qt5][PATCH] qmake5_base.bbclass: Add install
	support for native builds
Thread-Index: AQHPa4VNI6/ll+B0C0WPgOfMK7Tj95s4cpOA
Date: Fri, 9 May 2014 16:36:22 +0000
Message-ID: <CF926D2A.3263%donald.poole@swri.org>
References: <1399401265-29167-1-git-send-email-donald.poole@swri.org>
	<1399401265-29167-2-git-send-email-donald.poole@swri.org>
	<20140509125043.GT30955@jama>
In-Reply-To: <20140509125043.GT30955@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.4.1.140326
x-originating-ip: [66.69.58.30]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.11.96, 1.0.14,
	0.0.0000
	definitions=2014-05-09_07:2014-05-09, 2014-05-09,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=0
	kscore.is_bulkscore=4.71844785465692e-15 kscore.compositescore=1
	circleOfTrustscore=0 compositescore=0.997781753771917
	urlsuspect_oldscore=0.997781753771917 suspectscore=0
	recipient_domain_to_sender_totalscore=0 phishscore=0 bulkscore=0
	kscore.is_spamscore=0 recipient_to_sender_totalscore=0
	recipient_domain_to_sender_domain_totalscore=0
	rbsscore=0.997781753771917
	spamscore=0 recipient_to_sender_domain_totalscore=0 urlsuspectscore=0.9
	adultscore=0 classifier=spam adjust=-40 reason=mlx scancount=1
	engine=7.0.1-1402240000 definitions=main-1405090212
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
X-List-Received-Date: Fri, 09 May 2014 16:36:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5D3C3C3057DA3A4F94EE7CF28A6D2508@sw.pvt>
Content-Transfer-Encoding: quoted-printable

On 5/9/14, 7:50 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:


>On Tue, May 06, 2014 at 01:34:24PM -0500, Donald R. Poole, Jr. wrote:
>> From: "Donald R. Poole, Jr" <donald (dot) poole (at) swri (dot) org>
>>=20
>> Currently, if you are building native applications with Qt5, the
>>current qmake5_base_do_install() method assumes an install into the
>>image folder for the target. Since the native builds handle this a
>>little differently, this patch should account for the native install
>>scenario.
>
>Add SOB line.

I=B9m not familiar with the acronym SOB (I=B9m still learning about this
process). Is that State of Bitbake? If so, what does State of Bitbake mean?

>
>> ---
>>  classes/qmake5.bbclass      |    8 ++++++--
>>  classes/qmake5_base.bbclass |   46
>>+++++++++++++++++++++----------------------
>>  2 files changed, 29 insertions(+), 25 deletions(-)
>>=20
>> diff --git a/classes/qmake5.bbclass b/classes/qmake5.bbclass
>> index e1dda0d..01454f3 100644
>> --- a/classes/qmake5.bbclass
>> +++ b/classes/qmake5.bbclass
>> @@ -19,6 +19,10 @@ do_configure() {
>>      qmake5_base_do_configure
>>  }
>> =20
>> -do_install() {
>> -    qmake5_base_do_install
>> +do_install_class-target() {
>> +    qmake5_base_do_install_target
>> +}
>> +
>> +do_install_class-native() {
>> +    qmake5_base_do_install_native
>>  }
>> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
>> index df8a59a..5a380d0 100644
>> --- a/classes/qmake5_base.bbclass
>> +++ b/classes/qmake5_base.bbclass
>> @@ -161,32 +161,32 @@ qmake5_base_do_configure () {
>>      ${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT}
>>-r $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die
>>"Error calling $CMD"
>>  }
>> =20
>> -qmake5_base_do_install() {
>> +qmake5_base_do_install_target() {
>>      # Fix install paths for all
>> -    if [ "${BUILD_SYS}" =3D "${HOST_SYS}" ] ; then
>> -        find -name "Makefile*" | xargs sed -i
>>"s,(INSTALL_ROOT),(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
>> -    else
>> -        find -name "Makefile*" | xargs sed -i
>>"s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
>> -    fi
>> +    find -name "Makefile*" | xargs sed -i
>>"s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
>
>This looks like incremental patch from your v1, please rebase and send
>v3.

Will do.

>
>> =20
>>      oe_runmake install INSTALL_ROOT=3D${D}
>> =20
>> -    # Only do this for target builds. Native install work a little
>>differently
>> -    if [ "${BUILD_SYS}" !=3D "${HOST_SYS}" ] ; then
>> -        # everything except HostData and HostBinaries is prefixed with
>>sysroot value,
>> -        # but we cannot remove sysroot override, because that's useful
>>for pkg-config etc
>> -        # In some cases like QtQmlDevTools in qtdeclarative, the sed
>>above does not work,
>> -        # fix them manually
>> -        if [ -d ${D}${STAGING_DIR_TARGET} ] && [ -n
>>"${STAGING_DIR_TARGET}" ] ; then
>> -            echo "Some files are installed in wrong directory
>>${D}${STAGING_DIR_TARGET}"
>> -            cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
>> -            rm -rf ${D}${STAGING_DIR_TARGET}
>> -            # remove empty dirs
>> -            TMP=3D`dirname ${D}/${STAGING_DIR_TARGET}`
>> -            while test ${TMP} !=3D ${D}; do
>> -                rmdir ${TMP}
>> -                TMP=3D`dirname ${TMP}`;
>> -            done
>> -        fi
>> +    # everything except HostData and HostBinaries is prefixed with
>>sysroot value,
>> +    # but we cannot remove sysroot override, because that's useful for
>>pkg-config etc
>> +    # In some cases like QtQmlDevTools in qtdeclarative, the sed above
>>does not work,
>> +    # fix them manually
>> +    if [ -d ${D}${STAGING_DIR_TARGET} ] ; then
>> +        echo "Some files are installed in wrong directory
>>${D}${STAGING_DIR_TARGET}"
>> +        cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
>> +        rm -rf ${D}${STAGING_DIR_TARGET}
>> +        # remove empty dirs
>> +        TMP=3D`dirname ${D}/${STAGING_DIR_TARGET}`
>> +        while test ${TMP} !=3D ${D}; do
>> +            rmdir ${TMP}
>> +            TMP=3D`dirname ${TMP}`;
>> +        done
>>      fi
>>  }
>> +
>> +qmake5_base_do_install_native() {
>
>Why don't you use
>
>qmake5_base_do_install_class-native() {
>
>here and leave qmake5.bbclass and qmake5_base_do_install as it is?

The reason I didn=B9t use qmake5_base_do_install_class-native() is because
the system couldn=B9t find the native/target overrides in the
qmake5_base.bbclass. So, I put them in the qmake5.bbclass.

>
>> +    # Fix install paths for all
>> +    find -name "Makefile*" | xargs sed -i
>>"s,(INSTALL_ROOT),(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
>> +
>> +    oe_runmake install INSTALL_ROOT=3D${D}
>> +}
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

Donald R. Poole, Jr.
Research Engineer
Voice: 210.522.3131 | Fax: 210.522.4931
Tactical Networks & Communications (tacticalnetworks.swri.org)
Southwest Research Institute (SwRI)


