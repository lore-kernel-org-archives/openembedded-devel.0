Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.44])
 by mx.groups.io with SMTP id smtpd.web12.1217.1618850345559374939
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 09:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fDhb1Vyv;
 spf=pass (domain: windriver.com, ip: 40.107.102.44, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tz73m2PYmMp0i8Q5CW5KypPBDJgdzgf1cdaIAZr6WianyHfJn+E8c+iH4gMyekKEO3jM/gCJ4LeBXj111chvmr/aQANIYzCg/8xb2s9w2nNl11IJrtSUNwWaNicdB9Q14UkIZ0PS0Qm3Ylv10io/+IDXABY5VdPyWSnb1PpXH6bmxsrBHARfSPF6YSJFNARZyDCrjLkPMTSj7xRht8ttMoKcqdLdotsA1FzY3nBTESU/kHjXu1PVNvhjTX/yLnehXXCHECDg7g8ILqDLAjlNG7CLxCJGuWMbsW/zKDoqw1Ez0d6SRtBW2gWQTI9Oo9b3tKppdQ0muU/5WE3Ycv+vBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxFOs7vSv46eh7v/NXSXr51QfN8AwoIGDWMWUIwjNjU=;
 b=DXE1awlzp9CdJ6CZMA0JEFDwMNd+tRyVVq3pX499ZkBH5OrQUXnknyQzmmZJvGQLd6Qvr5kvU41m7ZcGe/JaQKbbz5WpJOxF7xM7gx1bZJ9UC60RBIBH1bvCA/iGcJBUgVAUp/Z5NlKaNXyVUo+wyd3XSz/0b+WH0rS6tUIPfyoB+0xmayAQjrYdXiq6QybNueKtH5MqnCaFOXZENjUNix2f5g7MKS5yfEFM78MUHqorAfqrf4lRN40RDGu9OShE1OYLlcid63ooyuwKMQP/WF60qIUaeRME9RUoyvlZgiqG2P0o2K9XE52/4RsNVwRgqKVRTn6qoz83NqhNYdXYJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxFOs7vSv46eh7v/NXSXr51QfN8AwoIGDWMWUIwjNjU=;
 b=fDhb1Vyv6iIQvsfLdqgJcjyZn+Z++aPdQVyNXK9qSNk2Xl+KshgczAPeipR/8kTBdlugG3N1HOAtNDF/lkqHNUt0hrrHJpLNr1mE24ulmKqdqv/tFNYAp1BMUKaauAS+vae4fPVdcCmU43e1PyUjVg0qBbxd0JaMpL53kJYO73M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB3086.namprd11.prod.outlook.com (2603:10b6:805:d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 16:39:03 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 16:39:03 +0000
Subject: Re: [oe] [meta-oe][PATCH] syslog-ng: Merge .bb and .inc
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 openembedded-devel@lists.openembedded.org
References: <20210419153642.8427-1-pkj@axis.com>
From: "Yi Fan Yu" <yifan.yu@windriver.com>
Message-ID: <d2192949-37d6-8781-ee06-8091394d5b2f@windriver.com>
Date: Mon, 19 Apr 2021 12:38:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210419153642.8427-1-pkj@axis.com>
X-Originating-IP: [135.0.247.71]
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.42] (135.0.247.71) by BY5PR17CA0072.namprd17.prod.outlook.com (2603:10b6:a03:167::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 16:39:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a71a31a9-75fa-4669-f713-08d90351a420
X-MS-TrafficTypeDiagnostic: SN6PR11MB3086:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3086C82B106652EF11A8652480499@SN6PR11MB3086.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EHNzpP58kCGUBQqWlj3N9Atd+KAX5s0QdKOvVpnXrXIdV9haPJJx3i0qyQv6YF1OjeHfBy3UQLO1ox22CjeXaDITPSaShlb9LbSQ+LpmAUkrHroFCr0dV+EyonexLPm6ju8tsRdewRbMNcubUQU9Dh9h15H4iVPzpEPE59uzByfXEtc4p53LUC/cuOAAR3SzNp53GQTYam7hEAnNPXAzmOHpdx4pwaxDKoU66HNoYdaFJhqDiuKufmLIVwQ2cJUV7TcXt4s6h8vLNMTDgtv2xAs2e1QY9ukoDOCa2uYg/seX6TXUHRvRfKzhRZte7tmOW0P1UKj2WLJSVrOm80cRA+hrqqPxl6au9LIwHg7J/gtetOCqp+4pGuJ46kMheM2HqRyWzea5OmZrwAp9U6htPetsIQFVNJJ99Yw2t/BNKkKCKs37p/bLH7X11PmF3obTwpOKt5i2VJ3048PliFPuIPhpS44XhNTQ4Sm4Eg/Z7dzNdpwNgB2uSggNYQYxmAKYofBHxhF6tVGiZuCF86d2LIT1s3I15ElKcQ3WSiYQ3ESFCNjrM/PhSBIQ5cll4RzyYZBmUb0T4XnJE80lKyu0LNwaWRcLU+Pz48MZBahj2QDU44pfSosZDCdcTWRnIPuwN+2q5I9RYNyCleW2Gu6wws6lXZWIGvfMIYqZOzBAlK9FC5iAlw3R1pqCQU++1qqk0AZivog7/HKTDozrN6cX9nBuVr972qRAYcSJAPVnsOwTFPpAaMJv1nX1q1uMoH3LQqVpilhBS/PVZ0Tsr5yc07RPrXOG90mktRg8Q77eIY2KNSmJs/0SQFj8zrowJt+9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39850400004)(366004)(376002)(316002)(83380400001)(53546011)(26005)(956004)(478600001)(8936002)(52116002)(66476007)(6486002)(66556008)(5660300002)(16576012)(36756003)(8676002)(31686004)(38350700002)(38100700002)(186003)(86362001)(16526019)(30864003)(6666004)(66946007)(31696002)(966005)(2616005)(2906002)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZkIvSXl5NVkxQWxrVmppTGFtQnYyK0VrQnFLaVIxT05IbnBCV3d1ZVVieXlv?=
 =?utf-8?B?cUF0a0FsRkZlVFhqYnFhNU5OWml6Z2pQRXU5NWU5dDVVLzlaY09hUnErOTJL?=
 =?utf-8?B?eFlqb3JNSUhqUEJWdUczUFdnM3Y4T21VRlgxQ0ZocG4yVUU1NUhCZnZpMkky?=
 =?utf-8?B?TUpBbmhIQ1pVWHJNbHVsZGtiV0dwR2MyVExhVTBuWGZ5WDR3aVhjVEg4NEVp?=
 =?utf-8?B?aWE0Zi9GWEk4UzI0UkZ3UG1hY2p5RmFzVEsvc2FKSE0xWGRRblBVOFV2anhD?=
 =?utf-8?B?eTcya001cTJiNlJzSUVpc1NjRzlyT29qRjRraVh0Y1djVWNJcmdTQ040LzZV?=
 =?utf-8?B?dzdnL04vUytmYnVkVGhsMTEyak9ieXZhQmVkTUdwRnZpdWtsTjFXeFRuRFF3?=
 =?utf-8?B?SUtCVmlVTVB0WXMybXc0MzFtVTFIVUc0YmhPeXRiTjl6S3lRUS9VWC9USGpF?=
 =?utf-8?B?cThsMzdOSE5SNnhVMC95WmNkUGpwbi9ka2FTdTYzVzZwUVBpZU1SSFhBUTR5?=
 =?utf-8?B?d2R6SndlcVBBN1p2MHhIbEpwYVdmbHJ4ZFhnbDFPc1Z4Q0xPdElGNVUrK3J3?=
 =?utf-8?B?TnlZcVp5UWxZb3V3d3hJbkxCOXhoekVobjNmenZIeG1OemU0MFdkWHRNckZ4?=
 =?utf-8?B?YkkrODU5alZ5TXNFWE1RQ3pxV1hLOFNoRWdvazcrMjdZWFRWc2dlU24wZUlh?=
 =?utf-8?B?MitNLzYrcWZBcmFjMElpQm45T1djMlQ5bHlXY3U5Q2FsWEN0M1laRll3VUZL?=
 =?utf-8?B?ZjJjWVcrWDQzaDQ2cjI2NnBycjFBRnVQY0ZNcVMxWFduZHZXYXVZOWZEaTNt?=
 =?utf-8?B?aVFaK1k3cnBhb2ZESGZHLzcrY3l5M0hNdUMzWWdaeTlwLzVjM09KaUZjZGc1?=
 =?utf-8?B?bUNvWnRGblZBYStKc3Y5MlAvMjJ2cE8wTzBDV0J4anI4S2xJUjBReGdlcVVN?=
 =?utf-8?B?aDBkckVhSEJWYjBLQ1pUU2ZzWi9ZT0EzQUR5cUtkdWVxZmdEcGNHS3V1RVEx?=
 =?utf-8?B?ODhVbkpkcXFLdkFjYWNyR0o0VWVhQ04xWWlMWFEydjFnL2QzazRQRmN3M2hO?=
 =?utf-8?B?bmhsWlM5VU5oUGtueGN1akRlU1FDUnlldnJQZ3h5bktHTVlqQk5GOTR5SXZt?=
 =?utf-8?B?SnFqQzRHbUwzNHpvMWc2NCtlMzd1aXcvd2Z5eU0vZEJFd2JLbEZiT2lRQysy?=
 =?utf-8?B?bFpQbXQ2SGx0N2c3OEowV0YvL2NHa1VRR00wZ3J6eXRsL29LOXVzWDlGcGVk?=
 =?utf-8?B?NitKWEgwWHNpb0VBN011WVlhdjVYdzRvV0I3R3FnVUhOeG5iSVJIMDVETzcy?=
 =?utf-8?B?d1Foa1RzQTRKbThWRG9QNm92bXVvRjcrNGJQQTNKdUtOMTAxaVNDYVJDWC9w?=
 =?utf-8?B?RE5EN2JWK1RjK2QwRHF3RVBwdGRWOHgrRERNNkQ2dVlHelMvWTRNUW5pUWlT?=
 =?utf-8?B?OTZkODBNTHh0VE9kMzdYdkZkWTRXOUF1QmxHOWJibFhQSXZhNHE0YlM5VEJ2?=
 =?utf-8?B?enVYZzdYOGZ0Q3hQajZPU1hCcFNKdWZ4c3JuT0FyMlNrOXJ3Wld0YlRYbWQ1?=
 =?utf-8?B?WlFIblNvMXN2RnI1aGtxZzFqNmw3bGM2L0hFRWczbUJGY0hMdkV4M1NIYVZq?=
 =?utf-8?B?UXl5QVR0U0FpRm5GUlU1c1ZXZ2RwakN5RHMrLzlGR1pCMCtBc0ZBU2dGU2JJ?=
 =?utf-8?B?ZmE2YmtTSlZjYzFrdzFQdTNuV2g3aEVhbHhwMTk3OHFQaFNadzUzQ09nTFBS?=
 =?utf-8?Q?sO1c9jZQ7jHpkuNWTIGMXaeOTeca0CvCkZ1tFZw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71a31a9-75fa-4669-f713-08d90351a420
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 16:39:03.2226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+Dvr0t31PC3F0nIfKGNYSXJZjjovY6An7O16h/mmpj/duGWu5FihjHDoyZBLVsmK2HBwJRDMh+M3gMsi0p4zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3086
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/19/21 11:36 AM, Peter Kjellerstedt wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> There is only one version of the recipe, and a number of URLs were
> unnecessarily duplicated in the .inc file and the .bb file.
> 
I think I introduced the duplication with devtool upgrade...
oops.

thanks for the patch.

> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>   .../recipes-support/syslog-ng/syslog-ng.inc   | 138 ------------------
>   .../syslog-ng/syslog-ng_3.31.2.bb             | 137 ++++++++++++++++-
>   2 files changed, 132 insertions(+), 143 deletions(-)
>   delete mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> 
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> deleted file mode 100644
> index 80c509973..000000000
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ /dev/null
> @@ -1,138 +0,0 @@
> -SUMMARY = "Alternative system logger daemon"
> -DESCRIPTION = "syslog-ng, as the name shows, is a syslogd replacement, \
> -but with new functionality for the new generation. The original syslogd \
> -allows messages only to be sorted based on priority/facility pairs; \
> -syslog-ng adds the possibility to filter based on message contents using \
> -regular expressions. The new configuration scheme is intuitive and powerful. \
> -Forwarding logs over TCP and remembering all forwarding hops makes it \
> -ideal for firewalled environments. \
> -"
> -HOMEPAGE = "http://www.balabit.com/network-security/syslog-ng/opensource-logging-system"
> -
> -LICENSE = "GPLv2 & LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=189c3826d32deaf83ad8d0d538a10023"
> -
> -# util-linux added to get libuuid
> -DEPENDS = "libpcre flex glib-2.0 openssl util-linux bison-native"
> -
> -# We expect the recipe to add anything specific for that version to these defaults.
> -#
> -SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
> -           file://syslog-ng.conf.systemd \
> -           file://syslog-ng.conf.sysvinit \
> -           file://initscript \
> -           file://volatiles.03_syslog-ng \
> -"
> -
> -UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
> -
> -inherit autotools gettext systemd pkgconfig update-rc.d multilib_header
> -
> -EXTRA_OECONF = " \
> -    --enable-dynamic-linking \
> -    --disable-sub-streams \
> -    --disable-pacct \
> -    --localstatedir=${localstatedir}/lib/${BPN} \
> -    --sysconfdir=${sysconfdir}/${BPN} \
> -    --with-module-dir=${libdir}/${BPN} \
> -    --with-sysroot=${STAGING_DIR_HOST} \
> -    --without-mongoc --disable-mongodb \
> -    --with-librabbitmq-client=no \
> -    --disable-python \
> -    --disable-java --disable-java-modules \
> -    --with-pidfile-dir=${localstatedir}/run/${BPN} \
> -"
> -
> -PACKAGECONFIG ??= " \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
> -"
> -PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
> -PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/,--disable-systemd --without-systemdsystemunitdir,systemd,"
> -PACKAGECONFIG[linux-caps] = "--enable-linux-caps,--disable-linux-caps,libcap,"
> -PACKAGECONFIG[dbi] = "--enable-sql,--disable-sql,libdbi,"
> -PACKAGECONFIG[spoof-source] = "--enable-spoof-source --with-libnet=${STAGING_BINDIR_CROSS},--disable-spoof-source,libnet,"
> -PACKAGECONFIG[http] = "--enable-http,--disable-http,curl,"
> -PACKAGECONFIG[smtp] = "--enable-smtp --with-libesmtp=${STAGING_LIBDIR},--disable-smtp,libesmtp,"
> -PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
> -PACKAGECONFIG[tcp-wrapper] = "--enable-tcp-wrapper,--disable-tcp-wrapper,tcp-wrappers,"
> -PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"
> -PACKAGECONFIG[native] = "--enable-native,--disable-native,,"
> -
> -do_configure_prepend() {
> -       olddir=$(pwd)
> -       cd ${AUTOTOOLS_SCRIPT_PATH}
> -
> -       ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} -I ${S}/m4 ${ACLOCALEXTRAPATH} || die "extra autoreconf execution failed."
> -
> -       cd $olddir
> -}
> -
> -do_install_append() {
> -    install -d ${D}${sysconfdir}/${BPN}
> -    install -d ${D}${sysconfdir}/init.d
> -    install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog
> -
> -    install -d ${D}${sysconfdir}/default/volatiles/
> -    install -m 644 ${WORKDIR}/volatiles.03_syslog-ng ${D}${sysconfdir}/default/volatiles/03_syslog-ng
> -    install -d ${D}${sysconfdir}/tmpfiles.d/
> -    install -m 644 ${WORKDIR}/syslog-ng-tmp.conf ${D}${sysconfdir}/tmpfiles.d/syslog-ng.conf
> -
> -    install -d ${D}${localstatedir}/lib/${BPN}
> -    # Remove /var/run as it is created on startup
> -    rm -rf ${D}${localstatedir}/run
> -
> -    # support for systemd
> -    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> -        install -m 644 ${WORKDIR}/syslog-ng.conf.systemd ${D}${sysconfdir}/${BPN}/${BPN}.conf
> -
> -        install -d ${D}${systemd_unitdir}/system/
> -        install -m 644 ${S}/contrib/systemd/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@.service
> -        install -m 644 ${S}/contrib/systemd/${BPN}@default ${D}${sysconfdir}/default/${BPN}@default
> -
> -        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
> -        sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
> -        sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
> -
> -        install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
> -        ln -sf ../${BPN}@.service ${D}${systemd_unitdir}/system/multi-user.target.wants/${BPN}@default.service
> -    else
> -        install -m 644 ${WORKDIR}/syslog-ng.conf.sysvinit ${D}${sysconfdir}/${BPN}/${BPN}.conf
> -    fi
> -
> -    oe_multilib_header syslog-ng/syslog-ng-config.h
> -}
> -
> -FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools ${systemd_unitdir}/system/multi-user.target.wants/*"
> -RDEPENDS_${PN} += "gawk ${@bb.utils.contains('PACKAGECONFIG','json','${PN}-jconf','',d)}"
> -
> -FILES_${PN}-jconf += " \
> -${datadir}/${BPN}/include/scl/cim \
> -${datadir}/${BPN}/include/scl/elasticsearch \
> -${datadir}/${BPN}/include/scl/ewmm \
> -${datadir}/${BPN}/include/scl/graylog2 \
> -${datadir}/${BPN}/include/scl/loggly \
> -${datadir}/${BPN}/include/scl/logmatic \
> -"
> -
> -# This overcomes the syslog-ng rdepends on syslog-ng-dev QA Error
> -PACKAGES =+ "${PN}-jconf ${PN}-libs ${PN}-libs-dev"
> -RPROVIDES_${PN}-dbg += "${PN}-libs-dbg"
> -FILES_${PN}-libs = "${libdir}/${BPN}/*.so ${libdir}/libsyslog-ng-*.so*"
> -FILES_${PN}-libs-dev = "${libdir}/${BPN}/lib*.la"
> -FILES_${PN}-staticdev += "${libdir}/${BPN}/libtest/*.a"
> -FILES_${PN} += "${systemd_unitdir}/system/*.service"
> -INSANE_SKIP_${PN}-libs = "dev-so"
> -RDEPENDS_${PN} += "${PN}-libs"
> -
> -CONFFILES_${PN} = "${sysconfdir}/${BPN}.conf ${sysconfdir}/scl.conf"
> -
> -RCONFLICTS_${PN} = "busybox-syslog sysklogd rsyslog"
> -RCONFLICTS_${PN}-libs = "busybox-syslog sysklogd rsyslog"
> -
> -RPROVIDES_${PN} += "${PN}-systemd"
> -RREPLACES_${PN} += "${PN}-systemd"
> -RCONFLICTS_${PN} += "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} = "${BPN}@.service"
> -
> -INITSCRIPT_NAME = "syslog"
> -INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 90 0 1 6 ."
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
> index 5d2b7f77e..ce1c41e35 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
> @@ -1,8 +1,21 @@
> -require syslog-ng.inc
> +SUMMARY = "Alternative system logger daemon"
> +DESCRIPTION = "syslog-ng, as the name shows, is a syslogd replacement, \
> +but with new functionality for the new generation. The original syslogd \
> +allows messages only to be sorted based on priority/facility pairs; \
> +syslog-ng adds the possibility to filter based on message contents using \
> +regular expressions. The new configuration scheme is intuitive and powerful. \
> +Forwarding logs over TCP and remembering all forwarding hops makes it \
> +ideal for firewalled environments. \
> +"
> +HOMEPAGE = "http://www.balabit.com/network-security/syslog-ng/opensource-logging-system"
> 
> -# We only want to add stuff we need to the defaults provided in syslog-ng.inc.
> -#
> -SRC_URI += "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
> +LICENSE = "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=189c3826d32deaf83ad8d0d538a10023"
> +
> +# util-linux added to get libuuid
> +DEPENDS = "libpcre flex glib-2.0 openssl util-linux bison-native"
> +
> +SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
>              file://syslog-ng.conf.systemd \
>              file://syslog-ng.conf.sysvinit \
>              file://initscript \
> @@ -11,6 +24,120 @@ SRC_URI += "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.t
>              file://syslog-ng.service-the-syslog-ng-service.patch \
>              file://0002-scl-fix-wrong-ownership-during-installation.patch \
>              file://0005-.py-s-python-python3-exclude-tests.patch \
> -           "
> +"
> +
>   SRC_URI[md5sum] = "69ef4dc5628d5e603e9e4a1b937592f8"
>   SRC_URI[sha256sum] = "2eeb8e0dbbcb556fdd4e50bc9f29bc8c66c9b153026f87caa7567bd3139c186a"
> +
> +UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
> +
> +inherit autotools gettext systemd pkgconfig update-rc.d multilib_header
> +
> +EXTRA_OECONF = " \
> +    --enable-dynamic-linking \
> +    --disable-sub-streams \
> +    --disable-pacct \
> +    --localstatedir=${localstatedir}/lib/${BPN} \
> +    --sysconfdir=${sysconfdir}/${BPN} \
> +    --with-module-dir=${libdir}/${BPN} \
> +    --with-sysroot=${STAGING_DIR_HOST} \
> +    --without-mongoc --disable-mongodb \
> +    --with-librabbitmq-client=no \
> +    --disable-python \
> +    --disable-java --disable-java-modules \
> +    --with-pidfile-dir=${localstatedir}/run/${BPN} \
> +"
> +
> +PACKAGECONFIG ??= " \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
> +"
> +PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
> +PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/,--disable-systemd --without-systemdsystemunitdir,systemd,"
> +PACKAGECONFIG[linux-caps] = "--enable-linux-caps,--disable-linux-caps,libcap,"
> +PACKAGECONFIG[dbi] = "--enable-sql,--disable-sql,libdbi,"
> +PACKAGECONFIG[spoof-source] = "--enable-spoof-source --with-libnet=${STAGING_BINDIR_CROSS},--disable-spoof-source,libnet,"
> +PACKAGECONFIG[http] = "--enable-http,--disable-http,curl,"
> +PACKAGECONFIG[smtp] = "--enable-smtp --with-libesmtp=${STAGING_LIBDIR},--disable-smtp,libesmtp,"
> +PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
> +PACKAGECONFIG[tcp-wrapper] = "--enable-tcp-wrapper,--disable-tcp-wrapper,tcp-wrappers,"
> +PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"
> +PACKAGECONFIG[native] = "--enable-native,--disable-native,,"
> +
> +do_configure_prepend() {
> +       olddir=$(pwd)
> +       cd ${AUTOTOOLS_SCRIPT_PATH}
> +
> +       ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} -I ${S}/m4 ${ACLOCALEXTRAPATH} || die "extra autoreconf execution failed."
> +
> +       cd $olddir
> +}
> +
> +do_install_append() {
> +    install -d ${D}${sysconfdir}/${BPN}
> +    install -d ${D}${sysconfdir}/init.d
> +    install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog
> +
> +    install -d ${D}${sysconfdir}/default/volatiles/
> +    install -m 644 ${WORKDIR}/volatiles.03_syslog-ng ${D}${sysconfdir}/default/volatiles/03_syslog-ng
> +    install -d ${D}${sysconfdir}/tmpfiles.d/
> +    install -m 644 ${WORKDIR}/syslog-ng-tmp.conf ${D}${sysconfdir}/tmpfiles.d/syslog-ng.conf
> +
> +    install -d ${D}${localstatedir}/lib/${BPN}
> +    # Remove /var/run as it is created on startup
> +    rm -rf ${D}${localstatedir}/run
> +
> +    # support for systemd
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        install -m 644 ${WORKDIR}/syslog-ng.conf.systemd ${D}${sysconfdir}/${BPN}/${BPN}.conf
> +
> +        install -d ${D}${systemd_unitdir}/system/
> +        install -m 644 ${S}/contrib/systemd/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@.service
> +        install -m 644 ${S}/contrib/systemd/${BPN}@default ${D}${sysconfdir}/default/${BPN}@default
> +
> +        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
> +        sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
> +        sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
> +
> +        install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
> +        ln -sf ../${BPN}@.service ${D}${systemd_unitdir}/system/multi-user.target.wants/${BPN}@default.service
> +    else
> +        install -m 644 ${WORKDIR}/syslog-ng.conf.sysvinit ${D}${sysconfdir}/${BPN}/${BPN}.conf
> +    fi
> +
> +    oe_multilib_header syslog-ng/syslog-ng-config.h
> +}
> +
> +FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools ${systemd_unitdir}/system/multi-user.target.wants/*"
> +RDEPENDS_${PN} += "gawk ${@bb.utils.contains('PACKAGECONFIG','json','${PN}-jconf','',d)}"
> +
> +FILES_${PN}-jconf += " \
> +${datadir}/${BPN}/include/scl/cim \
> +${datadir}/${BPN}/include/scl/elasticsearch \
> +${datadir}/${BPN}/include/scl/ewmm \
> +${datadir}/${BPN}/include/scl/graylog2 \
> +${datadir}/${BPN}/include/scl/loggly \
> +${datadir}/${BPN}/include/scl/logmatic \
> +"
> +
> +# This overcomes the syslog-ng rdepends on syslog-ng-dev QA Error
> +PACKAGES =+ "${PN}-jconf ${PN}-libs ${PN}-libs-dev"
> +RPROVIDES_${PN}-dbg += "${PN}-libs-dbg"
> +FILES_${PN}-libs = "${libdir}/${BPN}/*.so ${libdir}/libsyslog-ng-*.so*"
> +FILES_${PN}-libs-dev = "${libdir}/${BPN}/lib*.la"
> +FILES_${PN}-staticdev += "${libdir}/${BPN}/libtest/*.a"
> +FILES_${PN} += "${systemd_unitdir}/system/*.service"
> +INSANE_SKIP_${PN}-libs = "dev-so"
> +RDEPENDS_${PN} += "${PN}-libs"
> +
> +CONFFILES_${PN} = "${sysconfdir}/${BPN}.conf ${sysconfdir}/scl.conf"
> +
> +RCONFLICTS_${PN} = "busybox-syslog sysklogd rsyslog"
> +RCONFLICTS_${PN}-libs = "busybox-syslog sysklogd rsyslog"
> +
> +RPROVIDES_${PN} += "${PN}-systemd"
> +RREPLACES_${PN} += "${PN}-systemd"
> +RCONFLICTS_${PN} += "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} = "${BPN}@.service"
> +
> +INITSCRIPT_NAME = "syslog"
> +INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 90 0 1 6 ."
> 
> 
> 
> 
> 
