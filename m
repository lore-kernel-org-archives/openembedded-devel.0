Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.65])
 by mx.groups.io with SMTP id smtpd.web11.5574.1599332590294767497
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 12:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JQww3fqT;
 spf=pass (domain: windriver.com, ip: 40.107.102.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNg8zxi8dYBNbH0hFBocohGrl2kVOFBszxxDsYUBdYsUCvlFlrpipTAsI1anx5pQLyGhbnpiV82DeQn2bVNZKgv/90hTbNgDVDFLjaHfhiSx4GDT+jnk2fh1YQSXl+4xhe4JWWZuaV4EZgcX+Trb6pl+QN8WCrZiMguJKFLOc9CuBDCROZBuU/pLXkFN3rlrYKwe0fMRjShVS1QdL2VhImXSyisNYBmD7ujGX/SUG0w7rv+SGpxeq3Q3ImcZIJIwC4zaKPN3a169kBQ5KyQO0CJ4YGsSf/pAaizpauegICUbg1uICVWEVatrKR1ObDuE/JAf8OPAr4lP9KOI/1/wpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/jk0PmE3bSPnuAdasA0EgC122pmRVbe6dup/ozj56s=;
 b=DNeDyPvckmDx+Jfa/tTSjX4I8HYXLhkNx3w3XiJiJUQbNhXn4pMQUlhS9wau/l4tuRhpIohFvUEuLqjJKoVd3R4MzxuiYYVqbCYCTyPv0rQiYO+XbMziRrYCpwlPTpgU7qxYa3RDYKhupzmv5N8MjjxXm/z53G7Fmt0TIjWxH/VqjDR5h5TAWnkkUQrwB+ooUJX7Cs/GWH8wDsHOFSZmy4AzsbBt5F9ti3ErxS6s49wtQnBd/jW1Sls7m3L724j1WCdq4VYgyDtNn2CgI1eau8H8Hc790LRk6Nj9I4cZGJq+5ryN0hHJzAYVjMr6zrre4Q3TYBlwbc2CaDOYObP9pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/jk0PmE3bSPnuAdasA0EgC122pmRVbe6dup/ozj56s=;
 b=JQww3fqTM0WzE4MrlWG9pv5sOkMbSx7d7XIv9ByHgyzidBcqXNo7ePhK5wxPNZ+hj01GJOAVzKtdTwwgYPVDn/d7WT5T69o6iMIll93KzNBRjmqlMC8iFxzX/cZAUlqpA1xa5eUMhxT1moA8mWqoH79+OniduV3AHxeyMGW1Y48=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Sat, 5 Sep
 2020 19:03:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Sat, 5 Sep 2020
 19:03:07 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-systemd: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200902112808.18547-1-leon.anavi@konsulko.com>
 <20200902112808.18547-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f733accd-7a3f-fea3-118a-37aa6a9e444a@windriver.com>
Date: Sat, 5 Sep 2020 15:03:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200902112808.18547-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 19:03:06 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc857800-ddda-42d0-9081-08d851ce52ef
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29520ED11A713662A54A07799F2A0@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:221;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VVYAf2gnfnewOyVLihy6mXtPpF/l4VK/QIZ85fk+BUBUWzeFQmA2sEVDF1/isb9Swdb0T943p/1avuSroWuzUCfoOxPzrhl2Fc31ttKzDmgkQMuNG0hdglWtaUpLF6wBYX5hioUzrOpV1/GD0OSnmooDdL4uykjudSQWkG4Ph/U0tbkRQ7rn9ClitVyuR65W3LEZQ8FnSy07/bdBz6jC+GAJFXqIP6kc9UIgEL/j9A0j8LG/ugRz22v1yicEYeUpU7FiRV70Ta02IZmHIA5YTehHQXwFyGSjyGncDNEErK9M/v2x27Zg5n6RXXHhVghBOmShI8EBdAQKFWLN4HETfaBtjwr4NhqMSh2TVDcvxlKNTN1U3T7u5kx6Um+ZvuDYBAB4Re8jPtGQd/RaEzlS3Ga7QVpj+OnByZnUL0D5bljSA0EtKqPL66yM6sIbgGz1UacdCWaJ5wlkBuQUZW3pPg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(53546011)(66556008)(66946007)(8936002)(16526019)(26005)(186003)(166002)(8676002)(16576012)(83380400001)(316002)(31686004)(36756003)(86362001)(33964004)(31696002)(2616005)(5660300002)(2906002)(966005)(66476007)(44832011)(52116002)(478600001)(956004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	YnDcJUJmJc8kOx7gXWopaUVzxpMKRYH3jHWiBe16kbuPG5E83/2s6CjY0lvZQPZZ6l4cYP+s0jClS8ebL0WNv99D2vTiu07zt3qp+WWnLAHKTGZ5g8zG0/Y7ja6zMTTWBRX4ZxaHMoyxgc1FwqThygESJLD7pzKgD7YVpAfw2xPKlyZ7PZjj6Z3kGTDtkuucwAWo1wIxY3IUQ1eUXt10NBpl2CKlNJ64EvtpRkgJhvZreI+KCWnuphvVsHtz+AO4HWCtN9v73xtYPjDJr478jatw3jEbPDprd2A5OADBycjQGb4abWOuTTtO0ljUITV1l4IQ8EEv6+mHlXu7z6gnNp8r5wO2Sg5EcsMgwjjtPyqLBkZZNsSqO8AgBRdWs+VFe85mR5QCEZ9NxJ6lX/s4A9xVyuu12swZXJ8wBB0p8KjS6fFcOBdu5fEyHOA/0Smf7xjZv3NRhktt8EpQNp/fxBPXxGRIZpVtrMuaaQVPPbSNRRoTTC3ZRoGwiIZKT9q7wExteN8VVFiBkpf8+MKPp1iyM3x4WaSvEyOnKWqeYLEE0q7syQYVGu9yk+p/L/p0JxVX92Luc9wOnCid3N6kPAHIS4EVHuV7KFAoHPWZemJue16HnZZtYLs4axbhC+TBWBJ4CSVP4D07A64OQySM9A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc857800-ddda-42d0-9081-08d851ce52ef
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 19:03:07.3747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzEVLBLg9/IiGsoJUj7iaT8EB5crRh8awjXR8o9FF7IxMbuLI2Y6LTiPxv6FZ5AcNudp8i8b5eMIOavS81h5PTfLWCaxW3T7BJOXnt2rJHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------808D9BBE4EAAF305F15D8C8D"
Content-Language: en-US

--------------808D9BBE4EAAF305F15D8C8D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/20 7:28 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-systemd.inc                 | 20 ----------------
>   .../python/python3-systemd_234.bb             | 23 ++++++++++++++++---
>   2 files changed, 20 insertions(+), 23 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-systemd.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-systemd.inc b/meta-python/recipes-devtools/python/python-systemd.inc
> deleted file mode 100644
> index b14f82501..000000000
> --- a/meta-python/recipes-devtools/python/python-systemd.inc
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -SUMMARY = "Python interface for libsystemd"
> -HOMEPAGE = "https://github.com/systemd/python-systemd"
> -LICENSE = "LGPLv2.1+"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
> -
> -PYPI_PACKAGE = "systemd-python"
> -DEPENDS += "systemd (<=234)"
> -RDEPENDS_${PN} += "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging"
> -REQUIRED_DISTRO_FEATURES = "systemd"
> -inherit pypi features_check
> -
> -SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
> -SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
> -
> -# allow for common patches for python- and python3-systemd
> -FILESEXTRAPATHS_prepend := "${THISDIR}/python-systemd:"
> -
> -SRC_URI += "file://endian.patch"
> -
> -SRC_URI_append_libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
> diff --git a/meta-python/recipes-devtools/python/python3-systemd_234.bb b/meta-python/recipes-devtools/python/python3-systemd_234.bb
> index 78ec43156..6914cf920 100644
> --- a/meta-python/recipes-devtools/python/python3-systemd_234.bb
> +++ b/meta-python/recipes-devtools/python/python3-systemd_234.bb
> @@ -1,3 +1,20 @@
> -require python-systemd.inc
> -RDEPENDS_${PN} += "python3-syslog"
> -inherit setuptools3
> +SUMMARY = "Python interface for libsystemd"
> +HOMEPAGE = "https://github.com/systemd/python-systemd"
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
> +
> +PYPI_PACKAGE = "systemd-python"
> +DEPENDS += "systemd (<=234)"
> +RDEPENDS_${PN} += "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging python3-syslog"
> +REQUIRED_DISTRO_FEATURES = "systemd"
> +inherit pypi features_check setuptools3
> +
> +SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
> +SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
> +
> +# allow for common patches for python- and python3-systemd
> +FILESEXTRAPATHS_prepend := "${THISDIR}/python-systemd:"
> +
> +SRC_URI += "file://endian.patch"
> +
> +SRC_URI_append_libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
>
> 

--------------808D9BBE4EAAF305F15D8C8D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/20 7:28 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200902112808.18547-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200902112808.18547-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-systemd.inc                 | 20 ----------------
 .../python/python3-systemd_234.bb             | 23 ++++++++++++++++---
 2 files changed, 20 insertions(+), 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-systemd.inc

diff --git a/meta-python/recipes-devtools/python/python-systemd.inc b/meta-python/recipes-devtools/python/python-systemd.inc
deleted file mode 100644
index b14f82501..000000000
--- a/meta-python/recipes-devtools/python/python-systemd.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = &quot;Python interface for libsystemd&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/systemd/python-systemd">&quot;https://github.com/systemd/python-systemd&quot;</a>
-LICENSE = &quot;LGPLv2.1+&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c">&quot;file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c&quot;</a>
-
-PYPI_PACKAGE = &quot;systemd-python&quot;
-DEPENDS += &quot;systemd (&lt;=234)&quot;
-RDEPENDS_${PN} += &quot;systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging&quot;
-REQUIRED_DISTRO_FEATURES = &quot;systemd&quot;
-inherit pypi features_check
-
-SRC_URI[md5sum] = &quot;5071ea5bcb976186e92a3f5e75df221d&quot;
-SRC_URI[sha256sum] = &quot;fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7&quot;
-
-# allow for common patches for python- and python3-systemd
-FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-systemd:&quot;
-
-SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://endian.patch">&quot;file://endian.patch&quot;</a>
-
-SRC_URI_append_libc-musl = <a class="moz-txt-link-rfc2396E" href="file://0001-Provide-implementation-of-strndupa-for-musl.patch">&quot; file://0001-Provide-implementation-of-strndupa-for-musl.patch&quot;</a>
diff --git a/meta-python/recipes-devtools/python/python3-systemd_234.bb b/meta-python/recipes-devtools/python/python3-systemd_234.bb
index 78ec43156..6914cf920 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_234.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_234.bb
@@ -1,3 +1,20 @@
-require python-systemd.inc
-RDEPENDS_${PN} += &quot;python3-syslog&quot;
-inherit setuptools3
+SUMMARY = &quot;Python interface for libsystemd&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/systemd/python-systemd">&quot;https://github.com/systemd/python-systemd&quot;</a>
+LICENSE = &quot;LGPLv2.1+&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c">&quot;file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c&quot;</a>
+
+PYPI_PACKAGE = &quot;systemd-python&quot;
+DEPENDS += &quot;systemd (&lt;=234)&quot;
+RDEPENDS_${PN} += &quot;systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging python3-syslog&quot;
+REQUIRED_DISTRO_FEATURES = &quot;systemd&quot;
+inherit pypi features_check setuptools3
+
+SRC_URI[md5sum] = &quot;5071ea5bcb976186e92a3f5e75df221d&quot;
+SRC_URI[sha256sum] = &quot;fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7&quot;
+
+# allow for common patches for python- and python3-systemd
+FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-systemd:&quot;
+
+SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://endian.patch">&quot;file://endian.patch&quot;</a>
+
+SRC_URI_append_libc-musl = <a class="moz-txt-link-rfc2396E" href="file://0001-Provide-implementation-of-strndupa-for-musl.patch">&quot; file://0001-Provide-implementation-of-strndupa-for-musl.patch&quot;</a>
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------808D9BBE4EAAF305F15D8C8D--
