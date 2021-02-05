Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.81])
 by mx.groups.io with SMTP id smtpd.web12.5277.1612511322028454359
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 23:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=NSGKnpBt;
 spf=pass (domain: skidata.com, ip: 40.107.5.81, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axoYyUxALt+22WHJ0e/qfuQza9janCCV1SBUr2bImEQOABSHcnZ9j5wPmJrPI8MEZTBn6g4PCXybJprcKLygtpRycmIwdmXCHH2gBEKIMSNpcuMfRz41CYsQxicaIkAY2G9nt5JyIb0zUkHe/y6vXPCxJRFHJMT87Rr1YrgI8k76KYwJtB6Rw8hK7ZhHHhWHcdc39rya36GgjCdKtpDilMLF/Hw8spnwyJu3tOhYMityrU8spJHndDz3xdQG3Em1CT1t2K0HvZQOggui6/K1XQb5UGh+McZeHjmur4UNhRzkTe61ecGxvF59maHes1kw7wQKI0agt31j4Yg2xR7oDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yaNUdET8JnciUL3Y563FpxzsZnGV85KrCoUbCvqxNY=;
 b=cwVwHbcVHc+/VRtt+3W8ZXIXni2B5PMQW/CxrylBZO5nmu8DMXcaTtk2ZRyiYqNXh85slL3ZcR1bw5z4wUn/1wd/vpW0JKwb/Z3cYAA66LPIPPgWDP/DX/NUnS7+2yjn6M28NLLEdXiOE4Xxf/Org0CftxaAJyxNtbGp7myYrMst7d49GkpllrHi+VaN7okKOCrIE4FhQ9SynR5GaOHaF5ayNAg9YbLWTXcH7CAi4IPSPYS8wHHV2cwwynH+iI/KoPa2wrTAUHRhsmVrvHvH5fjsltUBgNR4up5DdpYTzsqDWUkgvwgdON+mjDV53ZczGH4fInklJsneHtBHuUgK+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yaNUdET8JnciUL3Y563FpxzsZnGV85KrCoUbCvqxNY=;
 b=NSGKnpBtUhB3wDU7yqVHWDE1+0CSP1ODwARumxxPcEzoATK+iXRxC+Z2EE0W63QewMZN0TU54uIxcnJg53Qs0GnL6d3v7t8gqEN8CpWmD/RIjrBlehfP7jQEynZvF74wHeZG4ajieSh8lQtISym4+Cgdjap6XbairYanZwhd7zc=
Authentication-Results: taitradio.com; dkim=none (message not signed)
 header.d=none;taitradio.com; dmarc=none action=none header.from=skidata.com;
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19) by VI1PR01MB6496.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:155::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Fri, 5 Feb
 2021 07:48:39 +0000
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::5064:aac6:7226:7221]) by VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::5064:aac6:7226:7221%7]) with mapi id 15.20.3805.024; Fri, 5 Feb 2021
 07:48:37 +0000
Date: Fri, 5 Feb 2021 08:48:35 +0100
From: "Richard Leitner" <richard.leitner@skidata.com>
To: douglas.royds@taitradio.com
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-java][PATCH] classpath-native and friends: inherit native last
Message-ID: <YBz4U2+5CbOcUaWx@brokenbit>
References: <20210205035846.344799-1-douglas.royds@taitradio.com>
In-Reply-To: <20210205035846.344799-1-douglas.royds@taitradio.com>
X-Originating-IP: [83.215.125.121]
X-ClientProxiedBy: AM4PR0701CA0034.eurprd07.prod.outlook.com
 (2603:10a6:200:42::44) To VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19)
Return-Path: richard.leitner@skidata.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brokenbit (83.215.125.121) by AM4PR0701CA0034.eurprd07.prod.outlook.com (2603:10a6:200:42::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Fri, 5 Feb 2021 07:48:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8d324c7-0d88-4ae8-3809-08d8c9aa7299
X-MS-TrafficTypeDiagnostic: VI1PR01MB6496:
X-Microsoft-Antispam-PRVS: 
	<VI1PR01MB64963BA1800A825A848B1A3CF0B29@VI1PR01MB6496.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uyCj2ZF/VngOs0n8rxpbW+LuDAYC4/m17TtnKoPekGS7N0jtxAo/gCd1CrUqcAOz/dQw/25OFSWy6voFzlOL8PL+UAMDXpuePLRCLYmzZxx/wJMQBMRnXAZWGq9BN+DOOs3a7RZQw96K4mbsXQJ16q69HtyDwn0N78uBmOWP56cPt6JunH6RgMv7HDY/rntxKNNML2F1JRxXrMfm896PaZGbr/XV35Z5OQNoUhhXg5cwyLwCUH2qBczlVAVXCjG+2Q2PzSoafZP7cbFMq2aHqMlAylae7/wWX9QC7FgZWY0VjbA50meL6rcZyIKKs0l8FdfAsaP4J71P5+Bssp2EcgEMIpPbzwRV1FcctWRcOYZ5QxWPEI/gRZKTDua0nFdwKB89idou2LgLZC/LIpCp+rsRxO98huBg0lBAYQ4T4YjMkO6I4BBWNtzT90F7sYIYoUq8UWsrfejpW601xt8h2Oxl15pipElrUn3tWV6cIqizPwzrs0A6trnobpvFzTSNWkXLijKLLjKsXm01ArMUsqnoFR0ONdN/c+WTrIQEuh+doaII58Td/MZ4sLx0/5n3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR01MB5007.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(136003)(376002)(366004)(346002)(39850400004)(396003)(66476007)(66556008)(6916009)(8676002)(4326008)(5660300002)(6496006)(9576002)(2906002)(66946007)(52116002)(44832011)(86362001)(186003)(9686003)(956004)(316002)(55016002)(33716001)(26005)(16526019)(83380400001)(8936002)(478600001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?qhEgZYuqXuyVamn4hzJCgFuorX+04c/i8nbUnMpApyS5CC5yVGjV7PQkIwrx?=
 =?us-ascii?Q?5qIEra3+B/5SzBZDWJey8E3bwP+hJcrUhCfSbvG8iLxk1F1lU+XkW+Uf6foU?=
 =?us-ascii?Q?M8IkQNRk060i3mM6iArbm0O8eClM8r9t39e9hOhf30xd4kzjrZ3SN04kqrAd?=
 =?us-ascii?Q?LuTUurK/tEIuhTnVkQpgkqSd3hO/N66Ku8fFl3n8oF6RKm5oUAXAR3E3Z5ah?=
 =?us-ascii?Q?zy5r5nMXKZJh0t4MPaDZQNvPSD7br2dOs/cTcxTPAgTFMHZuHEo18hhenuNE?=
 =?us-ascii?Q?5i8wQz3SgJzA0YG4Yb1syC+KKhDgBs+5CYDGwP/uZAWhJzh0eWlPJMCSwCLQ?=
 =?us-ascii?Q?g4eH8rRRKVTjw16vp85lSHnVmMtGAedECSbvtGRH5Zzdr7EnB9FOACD2W0Dw?=
 =?us-ascii?Q?8xoy1M/L2FBuZ4M20IztYkourkqglWeuwwdyp/ReR7ast0vvKcRtC+SM0FgK?=
 =?us-ascii?Q?/8uhNwPYyWXIOL8wf/MV/GhpNfhuhefXiT0jqK4dNFWxSFgNPwnObbZCdHgU?=
 =?us-ascii?Q?c3wCKp9x6Hk9afs+GgaS6y1aNnmF6wEs5TRt6JW1eZoWl+eOlH2EIor4bxBo?=
 =?us-ascii?Q?WNDIFLobXOOzXTdr1vJVtu3UdSrq4DqwjFh13/ZYxXnQVWlaJvsoslgngH4h?=
 =?us-ascii?Q?xbbe0rNHBq+Gd90fbu4fwpmynvtS8wp2etjN5LiQBUSXZJ3ygbT+ngKhnYOx?=
 =?us-ascii?Q?6i1t79775PgK/ZkBmVXnhbpjU+JVbCUUf+XjaSeu2u9Fz0kLe7gCZDORIqas?=
 =?us-ascii?Q?CFGZ7vcsL75WqlAQapi7zkxD91SroFXWFhrEPb6Es+CHp0XkxvLAdu2Vhpwe?=
 =?us-ascii?Q?XnHOkMQuXDl6JlKukzL+XeniqGYebuPjpp/4Gv/ws56LGolv4jAIDm8FzY7O?=
 =?us-ascii?Q?k8+TZA5Tfh25Hwgv0ZdLnB9dpTGoWRiMzA59bc8yuqLAZ/haEdDBairMNpP2?=
 =?us-ascii?Q?773E3GGsO0fP/xOLxKEYGs5q/cy5R7z/gcloGDwG9JbrIjczXks7bmmkovqp?=
 =?us-ascii?Q?zqZzNB6/KnMvuem7075c55E42fWAbXPN86lIuvynsQZs61l6vS26rXsbhbaf?=
 =?us-ascii?Q?P618lMnBiNTB/xMUSyk2HBHxXbCquxDj/N7NOs9L7T6Q4fCbTmxjrJEslv+s?=
 =?us-ascii?Q?G3WnVt7urh0R6WnEWCMKELuufP+s4HQadzYpTOJvE9ykldVeZiXHiI6GSP1A?=
 =?us-ascii?Q?QOy1EFI3ccyuelPPtnF5UsmRh/9KP6+A/jIGZT/aImHbt7m81NZVFeacgHQC?=
 =?us-ascii?Q?WlOZgTLqwfYRXk5D7WB34ZSjg7tGY/4ROdg8WPeSSHV+G9cpGPGS7Hekxm3Y?=
 =?us-ascii?Q?VFxX6OYHcbh/werEOhEE8sQR?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d324c7-0d88-4ae8-3809-08d8c9aa7299
X-MS-Exchange-CrossTenant-AuthSource: VI1PR01MB5007.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 07:48:37.8611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3d52ce8f-cef6-4b27-bace-cf9989cf3973
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9LNw/gB969k/g1zJBuJJheZlQ1QLZXTppGtBcwIZZxcxgJIuHNhJU6snH93KKffZOpBab3f1GkHjliXDpeyq7WmEEk8CyQVeUAnmce7apU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB6496
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Douglas,
thanks for you patch!

I will review/test it in the comming days and give feedback!

regards;rl

On Fri, Feb 05, 2021 at 04:58:46PM +1300, Douglas via lists.openembedded.org wrote:
> Fixes QA Issue: classpath-native: native/nativesdk class is not inherited last
> 
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  recipes-core/cacao/cacao-initial-native_0.98.bb  | 2 +-
>  recipes-core/classpath/classpath-native.inc      | 2 +-
>  recipes-core/ecj/libecj-bootstrap.inc            | 2 +-
>  recipes-core/icedtea/icedtea7-native.inc         | 3 ++-
>  recipes-core/jamvm/jamvm-initial-native_1.4.5.bb | 2 +-
>  recipes-core/openjdk/openjdk-8-native.inc        | 4 ++--
>  6 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb b/recipes-core/cacao/cacao-initial-native_0.98.bb
> index 8125e88..a43d3f4 100644
> --- a/recipes-core/cacao/cacao-initial-native_0.98.bb
> +++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
> @@ -6,7 +6,7 @@ SECTION  = "interpreters"
>  
>  PROVIDES = "virtual/java-initial-native"
>  
> -inherit native autotools-brokensep
> +inherit autotools-brokensep native
>  
>  DEPENDS = "zlib-native libtool-native fastjar-native classpath-initial-native jikes-initial-native"
>  
> diff --git a/recipes-core/classpath/classpath-native.inc b/recipes-core/classpath/classpath-native.inc
> index b1de458..c81e064 100644
> --- a/recipes-core/classpath/classpath-native.inc
> +++ b/recipes-core/classpath/classpath-native.inc
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
>  
>  DEPENDS = "fastjar-native zip-native"
>  
> -inherit autotools native gettext
> +inherit autotools gettext native
>  
>  SRC_URI = "${GNU_MIRROR}/classpath/classpath-${PV}.tar.gz"
>  
> diff --git a/recipes-core/ecj/libecj-bootstrap.inc b/recipes-core/ecj/libecj-bootstrap.inc
> index 04425f4..8f84fd0 100644
> --- a/recipes-core/ecj/libecj-bootstrap.inc
> +++ b/recipes-core/ecj/libecj-bootstrap.inc
> @@ -9,7 +9,7 @@ DEPENDS = "classpath-initial-native fastjar-native jikes-initial-native virtual/
>  
>  INC_PR = "r5"
>  
> -inherit native java
> +inherit java native
>  
>  S = "${WORKDIR}"
>  
> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
> index 5351fe1..f53715f 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -36,9 +36,10 @@ CFLAGS_append = " ${@oe.utils.conditional('HOST_COMPILER_MAJOR', '9', '-Wno-erro
>  # Explicitly pass -fcommon since GCC 10 defaults to -fno-common for C sources
>  CFLAGS_append = " -fcommon"
>  
> -inherit native java autotools pkgconfig
> +inherit java autotools pkgconfig
>  inherit openjdk-build-helper
>  inherit python3native
> +inherit native
>  
>  JAVA_HOME[unexport] = "1"
>  
> diff --git a/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb b/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
> index bf005db..1f5921f 100644
> --- a/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
> +++ b/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
> @@ -20,7 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz \
>  # This uses 32 bit arm, so force the instruction set to arm, not thumb
>  ARM_INSTRUCTION_SET = "arm"
>  
> -inherit native autotools pkgconfig
> +inherit autotools pkgconfig native
>  
>  # libdir must be modified so that jamvm-initial and -native
>  # do not interfere
> diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
> index 92d9473..3282257 100644
> --- a/recipes-core/openjdk/openjdk-8-native.inc
> +++ b/recipes-core/openjdk/openjdk-8-native.inc
> @@ -32,10 +32,10 @@ EXTRA_OECONF_append = "\
>  "
>  # --with-boot-jdk=${WORKDIR}/fake-jdk
>  
> -inherit native
> -
>  require openjdk-8-common.inc
>  
> +inherit native
> +
>  CFLAGS_append = " ${@jdk_cpp_options(d)}"
>  CPPFLAGS_append = "${@jdk_cpp_options(d)}"
>  CXXFLAGS_append = " ${@jdk_cpp_options(d)}"
> -- 
> 2.25.1
> 
