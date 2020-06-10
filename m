Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.42])
 by mx.groups.io with SMTP id smtpd.web10.12032.1591799360648814891
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gQDCv6Wp;
 spf=pass (domain: windriver.com, ip: 40.107.236.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chlIFOH/IMEBp8FfMlWdIvLUCuvNGytQazAd+kHsTfO20lB8EEtEIezULua0Cl0pOttFY2zUy1XNAxE3XrwVlpkmeYX97/XQhQC4d4IoqD6R3RYpvPoFVkzgot95+MPwZPUBZx2W9WBoNtNkfRQYr6drHnHWZ/3bQzWXUDQN4/Zr7ACXnnGDpfsHlCciU+vFQoU/1uxmiChXSk+HAiG0K79yWQy7tdNDMvgSopxLMsL9oudJ0ukUXEdS3MfiwWg/nW4dRpyQFR4CyzwNFYZOdLnBcLVrTe189i/yb5BkriS8hlL88uVjGleCqkgeAvbMJAgdrk+Y/FcZ3x4RSJTYIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8qx32RnESU9fCaNqB+VmnZ/oPWiceMEMtbJQPiFAYQ=;
 b=ZR4ZDjGjGSfPqc7oyOOfhlorRwSBYJc8HcpDQI6ty9ZiRqqOi0YLYyXSlEjvMS1RXKIwgXrVz6HZaUsRPL/jfG/iW45z9wX6X801FbARkrDkeglR3MB8rpLlYarSu3Q44qHjxbePvabhsqGnDgZT00drAZryy/mqiegFTnuq2TUkdimpoFAQAbUcFO7zrljRMyfDHI/LXakCwfAXPMOSc9Kmc53jbATlgAkgXnvfZjf05FcN9S5fupWgGcye4eSyS0ZwJBz3jOMUZmdRLfeb5oAJZzUMyIqGT2vlAtnmA3ruo9XsPWO9EZuJk9lf29Nqg9ALSqqQgU3VZ44vjVz2aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8qx32RnESU9fCaNqB+VmnZ/oPWiceMEMtbJQPiFAYQ=;
 b=gQDCv6Wp2UsDCQ7jUc6hbHf7J0zQ5vE707aUrdwHqIO830f65afKl+rts4hB8pi5Cc6ZBpysVtMxnFklqp+7XlODJgvW6apLEPZTBUhXaP0MMYqVoDc5eguqlshjJCSTPk7Q55SGCHTGzJhorw+wC0jsVOIRCdhOS3DYLCulo1Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4113.namprd11.prod.outlook.com (2603:10b6:405:77::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 14:29:18 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 14:29:18 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-lxml: Upgrade 4.5.0 -> 4.5.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200608121410.5814-1-leon.anavi@konsulko.com>
 <20200608121410.5814-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <23ab58ac-2c5e-2023-d114-9d64d2dd6ac5@windriver.com>
Date: Wed, 10 Jun 2020 10:29:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200608121410.5814-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::13) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 14:29:18 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39b4f94a-47c2-4d9a-db75-08d80d4aa8e9
X-MS-TrafficTypeDiagnostic: BN6PR11MB4113:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB411357192CDA8FFFAF963AB39F830@BN6PR11MB4113.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:22;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yBbxxj7hEEgmnhnq58UrR0DxRvwDtKmEtifUczPXKlUdjPuP32fMuDJ7RRIxK4gLIFpN16r0ecZ5ZMkk6VDE1rts78Q9BucOrkSr4Sr/52EgScXe0/CQnI+tZsFO8nuHxhorteIn0gJ59Tb7L1sA4HLxo4xA87yg2/MSI7V2TJFPXjLi530ct3RcGzRwhoRfONb8Pmkul1z00iIkkAVQ9yZJ8vTm1tQbN7KjrJLVdQoBrwu9HW8ZVPxYXx0vZ7D+PQxaBwV6xIWJ/rYZ8vNtNuATCyoSKbPLFi+BAh/Gi6j4lybSgCG9UkLQx+BqhW8qBqPSQ31JyerJK3VjmI/OLBdMTBT7vvU+pzaa+kEj7hdZ90fiGXhuYmMxEP8jhW+RB3HyTW88fYREqoeSWbVmd9PdI/A7maNElFPYi++jGyf0ZdQz4juhzv6RrZf44jrkQX9OKv0kfc470JK1DkLZfA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(396003)(39850400004)(366004)(478600001)(316002)(83380400001)(2906002)(966005)(16576012)(36756003)(33964004)(166002)(52116002)(5660300002)(66556008)(31696002)(2616005)(66476007)(186003)(8936002)(8676002)(26005)(44832011)(16526019)(66946007)(86362001)(6486002)(53546011)(956004)(30864003)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	wdQettp/gBfNtf0tuOTe5rqqjMXbg3Ead1NpVhFLD7LoC0eAntCEMxBdiXrg948RRrbsgDYigZjFMob2bvnYvxf/ddPiX9oQkmgNNHCwRBLwIt54FRYeuKQmw1bhUtfDhNkG58KOxsVpTaki5snm6clpIqOAnVnCyA+AnTmZPrCE2EkySZ5neJ5SQRAWpqQlskqZlg2sCOGwm8dnoNpHhCLZO+6vFrbSrGng/k8eX79RTn3Hn0m3CvBcvbN4fSsE9Z1sNFoCJBZCqqbSZzxwKkVQM3S1xeSvFSsIFNB8y2X+saEzE6JZBggIlBd95MJOAKLoDdwrARgbOBN/KOXep3x0Y7yaY0NNiG4UzvsSTth6Q/MQrmJ69PeX6P4/0iEiVykpJIgjelKk15HlXAytmG+lPxM0oO6PUdj3O0HGn61ijHfdqemw1UVmeSdkZqOHKgICiZNnLe0G0qC8UGoOtp9Rh4/lAsdBERM3Ai6SwGg=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b4f94a-47c2-4d9a-db75-08d80d4aa8e9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 14:29:18.7743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLswWqDF8iI98UEFxQrsbe2DTYq6WgX44CLedS3sA7YLjeMsMqq15fnqNMVrP3/9oVOW0+RNZLM9KY8QfboaG3R4HQL0ReDta5qR8Ie8FCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4113
Content-Type: multipart/alternative;
 boundary="------------20F438673AACE48C74FA01AA"
Content-Language: en-US

--------------20F438673AACE48C74FA01AA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/8/20 8:14 AM, Leon Anavi wrote:
> Upgrade to release 4.5.1 but keep setupinfo.py from 4.5.0
> because the new version doesn't support properly arguments
> --with-xslt-config and --with-xml2-config as well as retriving
> versions of dependencies.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../0001-setupinfo.py-Revert-changes.patch    | 237 ++++++++++++++++++
>   ...n3-lxml_4.5.0.bb => python3-lxml_4.5.1.bb} |   5 +-
>   2 files changed, 240 insertions(+), 2 deletions(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-Revert-changes.patch
>   rename meta-python/recipes-devtools/python/{python3-lxml_4.5.0.bb => python3-lxml_4.5.1.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-Revert-changes.patch b/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-Revert-changes.patch
> new file mode 100644
> index 000000000..d6e63712c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-Revert-changes.patch
> @@ -0,0 +1,237 @@
> +From 24d0c9885b7a259b61a28eb440d0c0585016d73b Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Mon, 8 Jun 2020 13:05:23 +0300
> +Subject: [PATCH] setupinfo.py: Revert changes
> +
> +Use setupinfo.py from release 4.5.0 to revert changes replacing
> +--with-xslt-config and --with-xml2-config with --xslt-config and
> +--xml2-config as well as to properly determine versions of
> +dependencies.
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + setupinfo.py | 155 +++++++++++++++++++++------------------------------
> + 1 file changed, 64 insertions(+), 91 deletions(-)
> +
> +diff --git a/setupinfo.py b/setupinfo.py
> +index cf195245..5a833d45 100644
> +--- a/setupinfo.py
> ++++ b/setupinfo.py
> +@@ -2,7 +2,6 @@ import sys
> + import io
> + import os
> + import os.path
> +-import subprocess
> + from distutils.core import Extension
> + from distutils.errors import CompileError, DistutilsOptionError
> + from distutils.command.build_ext import build_ext as _build_ext
> +@@ -110,7 +109,17 @@ def ext_modules(static_include_dirs, static_library_dirs,
> +         use_cython = False
> +         print("Building without Cython.")
> +
> +-    if not check_build_dependencies():
> ++    lib_versions = get_library_versions()
> ++    versions_ok = True
> ++    if lib_versions[0]:
> ++        print("Using build configuration of libxml2 %s and libxslt %s" %
> ++              lib_versions)
> ++        versions_ok = check_min_version(lib_versions[0], (2, 7, 0), 'libxml2')
> ++    else:
> ++        print("Using build configuration of libxslt %s" %
> ++              lib_versions[1])
> ++    versions_ok |= check_min_version(lib_versions[1], (1, 1, 23), 'libxslt')
> ++    if not versions_ok:
> +         raise RuntimeError("Dependency missing")
> +
> +     base_dir = get_base_dir()
> +@@ -351,118 +360,53 @@ def define_macros():
> +     macros.append(('CYTHON_CLINE_IN_TRACEBACK', '1' if OPTION_WITH_CLINES else '0'))
> +     return macros
> +
> ++_ERROR_PRINTED = False
> +
> + def run_command(cmd, *args):
> +     if not cmd:
> +         return ''
> +     if args:
> +         cmd = ' '.join((cmd,) + args)
> +-
> ++    import subprocess
> +     p = subprocess.Popen(cmd, shell=True,
> +                          stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> +     stdout_data, errors = p.communicate()
> +-
> +-    if errors:
> +-        return ''
> ++    global _ERROR_PRINTED
> ++    if errors and not _ERROR_PRINTED:
> ++        _ERROR_PRINTED = True
> ++        print("ERROR: %s" % errors)
> ++        print("** make sure the development packages of libxml2 and libxslt are installed **\n")
> +     return decode_input(stdout_data).strip()
> +
> +
> +-def check_min_version(version, min_version, libname):
> ++def check_min_version(version, min_version, error_name):
> +     if not version:
> +         # this is ok for targets like sdist etc.
> +         return True
> +-    lib_version = tuple(map(int, version.split('.')[:3]))
> +-    req_version = tuple(map(int, min_version.split('.')[:3]))
> +-    if lib_version < req_version:
> +-        print("Minimum required version of %s is %s. Your system has version %s." % (
> +-            libname, min_version, version))
> ++    version = tuple(map(int, version.split('.')[:3]))
> ++    min_version = tuple(min_version)
> ++    if version < min_version:
> ++        print("Minimum required version of %s is %s, found %s" % (
> ++            error_name, '.'.join(map(str, version)), '.'.join(map(str, min_version))))
> +         return False
> +     return True
> +
> +
> +-def get_library_version(prog, libname=None):
> +-    if libname:
> +-        return run_command(prog, '--modversion %s' % libname)
> +-    else:
> +-        return run_command(prog, '--version')
> +-
> ++def get_library_version(config_tool):
> ++    is_pkgconfig = "pkg-config" in config_tool
> ++    return run_command(config_tool,
> ++                       "--modversion" if is_pkgconfig else "--version")
> +
> +-PKG_CONFIG = None
> +-XML2_CONFIG = None
> +-XSLT_CONFIG = None
> +
> + def get_library_versions():
> +-    global XML2_CONFIG, XSLT_CONFIG
> +-
> +-    # Pre-built libraries
> +-    if XML2_CONFIG and XSLT_CONFIG:
> +-        xml2_version = get_library_version(XML2_CONFIG)
> +-        xslt_version = get_library_version(XSLT_CONFIG)
> +-        return xml2_version, xslt_version
> +-
> +-    # Path to xml2-config and xslt-config specified on the command line
> +-    if OPTION_WITH_XML2_CONFIG:
> +-        xml2_version = get_library_version(OPTION_WITH_XML2_CONFIG)
> +-        if xml2_version and OPTION_WITH_XSLT_CONFIG:
> +-            xslt_version = get_library_version(OPTION_WITH_XSLT_CONFIG)
> +-            if xslt_version:
> +-                XML2_CONFIG = OPTION_WITH_XML2_CONFIG
> +-                XSLT_CONFIG = OPTION_WITH_XSLT_CONFIG
> +-                return xml2_version, xslt_version
> +-
> +-    # Try pkg-config
> +-    global PKG_CONFIG
> +-    PKG_CONFIG = os.getenv('PKG_CONFIG', 'pkg-config')
> +-    xml2_version = get_library_version(PKG_CONFIG, 'libxml-2.0')
> +-    if xml2_version:
> +-        xslt_version = get_library_version(PKG_CONFIG, 'libxslt')
> +-        if xml2_version and xslt_version:
> +-            return xml2_version, xslt_version
> +-
> +-    # Try xml2-config and xslt-config
> +-    XML2_CONFIG = os.getenv('XML2_CONFIG', 'xml2-config')
> +-    xml2_version = get_library_version(XML2_CONFIG)
> +-    if xml2_version:
> +-        XSLT_CONFIG = os.getenv('XSLT_CONFIG', 'xslt-config')
> +-        xslt_version = get_library_version(XSLT_CONFIG)
> +-        if xml2_version and xslt_version:
> +-            return xml2_version, xslt_version
> +-
> +-    # One or both build dependencies not found. Fail on Linux platforms only.
> +-    if sys.platform.startswith('win'):
> +-        return '', ''
> +-    print("Error: Please make sure the libxml2 and libxslt development packages are installed.")
> +-    sys.exit(1)
> +-
> +-
> +-def check_build_dependencies():
> +-    xml2_version, xslt_version = get_library_versions()
> +-
> +-    xml2_ok = check_min_version(xml2_version, '2.7.0', 'libxml2')
> +-    xslt_ok = check_min_version(xslt_version, '1.1.23', 'libxslt')
> +-
> +-    if xml2_version and xslt_version:
> +-        print("Building against libxml2 %s and libxslt %s" % (xml2_version, xslt_version))
> +-    else:
> +-        print("Building against pre-built libxml2 andl libxslt libraries")
> +-
> +-    return (xml2_ok and xslt_ok)
> +-
> +-
> +-def get_flags(prog, option, libname=None):
> +-    if libname:
> +-        return run_command(prog, '--%s %s' % (option, libname))
> +-    else:
> +-        return run_command(prog, '--%s' % option)
> ++    xml2_version = get_library_version(find_xml2_config())
> ++    xslt_version = get_library_version(find_xslt_config())
> ++    return xml2_version, xslt_version
> +
> +
> + def flags(option):
> +-    if XML2_CONFIG:
> +-        xml2_flags = get_flags(XML2_CONFIG, option)
> +-        xslt_flags = get_flags(XSLT_CONFIG, option)
> +-    else:
> +-        xml2_flags = get_flags(PKG_CONFIG, option, 'libxml-2.0')
> +-        xslt_flags = get_flags(PKG_CONFIG, option, 'libxslt')
> ++    xml2_flags = run_command(find_xml2_config(), "--%s" % option)
> ++    xslt_flags = run_command(find_xslt_config(), "--%s" % option)
> +
> +     flag_list = xml2_flags.split()
> +     for flag in xslt_flags.split():
> +@@ -474,6 +418,37 @@ def flags(option):
> + def get_xcode_isysroot():
> +     return run_command('xcrun', '--show-sdk-path')
> +
> ++XSLT_CONFIG = None
> ++XML2_CONFIG = None
> ++
> ++def find_xml2_config():
> ++    global XML2_CONFIG
> ++    if XML2_CONFIG:
> ++        return XML2_CONFIG
> ++    option = '--with-xml2-config='
> ++    for arg in sys.argv:
> ++        if arg.startswith(option):
> ++            sys.argv.remove(arg)
> ++            XML2_CONFIG = arg[len(option):]
> ++            return XML2_CONFIG
> ++    else:
> ++        # default: do nothing, rely only on xslt-config
> ++        XML2_CONFIG = os.getenv('XML2_CONFIG', '')
> ++    return XML2_CONFIG
> ++
> ++def find_xslt_config():
> ++    global XSLT_CONFIG
> ++    if XSLT_CONFIG:
> ++        return XSLT_CONFIG
> ++    option = '--with-xslt-config='
> ++    for arg in sys.argv:
> ++        if arg.startswith(option):
> ++            sys.argv.remove(arg)
> ++            XSLT_CONFIG = arg[len(option):]
> ++            return XSLT_CONFIG
> ++    else:
> ++        XSLT_CONFIG = os.getenv('XSLT_CONFIG', 'xslt-config')
> ++    return XSLT_CONFIG
> +
> + ## Option handling:
> +
> +@@ -526,8 +501,6 @@ OPTION_AUTO_RPATH = has_option('auto-rpath')
> + OPTION_BUILD_LIBXML2XSLT = staticbuild or has_option('static-deps')
> + if OPTION_BUILD_LIBXML2XSLT:
> +     OPTION_STATIC = True
> +-OPTION_WITH_XML2_CONFIG = option_value('xml2-config')
> +-OPTION_WITH_XSLT_CONFIG = option_value('xslt-config')
> + OPTION_LIBXML2_VERSION = option_value('libxml2-version')
> + OPTION_LIBXSLT_VERSION = option_value('libxslt-version')
> + OPTION_LIBICONV_VERSION = option_value('libiconv-version')
> +--
> +2.17.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
> index e3cfa46d1..8ab657475 100644
> --- a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
> @@ -18,8 +18,9 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
>   
>   DEPENDS += "libxml2 libxslt"
>   
> -SRC_URI[md5sum] = "f088e452ed45b030b6f84269f1e84d11"
> -SRC_URI[sha256sum] = "8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60"
> +SRC_URI += "file://0001-setupinfo.py-Revert-changes.patch"
> +SRC_URI[md5sum] = "4d3cca9c0018dd98f39e0ac54fcc3d14"
> +SRC_URI[sha256sum] = "27ee0faf8077c7c1a589573b1450743011117f1aa1a91d5ae776bbc5ca6070f2"
>   
>   DISTUTILS_BUILD_ARGS += " \
>                        --with-xslt-config='pkg-config libxslt' \
>
> 

--------------20F438673AACE48C74FA01AA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/8/20 8:14 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200608121410.5814-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.5.1 but keep setupinfo.py from 4.5.0
because the new version doesn't support properly arguments
--with-xslt-config and --with-xml2-config as well as retriving
versions of dependencies.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200608121410.5814-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../0001-setupinfo.py-Revert-changes.patch    | 237 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 ...n3-lxml_4.5.0.bb =&gt; python3-lxml_4.5.1.bb} |   5 &#43;-
 2 files changed, 240 insertions(&#43;), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-Revert-changes.patch
 rename meta-python/recipes-devtools/python/{python3-lxml_4.5.0.bb =&gt; python3-lxml_4.5.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-Revert-changes.patch b/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-Revert-changes.patch
new file mode 100644
index 000000000..d6e63712c
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-Revert-changes.patch
@@ -0,0 &#43;1,237 @@
&#43;From 24d0c9885b7a259b61a28eb440d0c0585016d73b Mon Sep 17 00:00:00 2001
&#43;From: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
&#43;Date: Mon, 8 Jun 2020 13:05:23 &#43;0300
&#43;Subject: [PATCH] setupinfo.py: Revert changes
&#43;
&#43;Use setupinfo.py from release 4.5.0 to revert changes replacing
&#43;--with-xslt-config and --with-xml2-config with --xslt-config and
&#43;--xml2-config as well as to properly determine versions of
&#43;dependencies.
&#43;
&#43;Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
&#43;---
&#43; setupinfo.py | 155 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;------------------------------
&#43; 1 file changed, 64 insertions(&#43;), 91 deletions(-)
&#43;
&#43;diff --git a/setupinfo.py b/setupinfo.py
&#43;index cf195245..5a833d45 100644
&#43;--- a/setupinfo.py
&#43;&#43;&#43;&#43; b/setupinfo.py
&#43;@@ -2,7 &#43;2,6 @@ import sys
&#43; import io
&#43; import os
&#43; import os.path
&#43;-import subprocess
&#43; from distutils.core import Extension
&#43; from distutils.errors import CompileError, DistutilsOptionError
&#43; from distutils.command.build_ext import build_ext as _build_ext
&#43;@@ -110,7 &#43;109,17 @@ def ext_modules(static_include_dirs, static_library_dirs,
&#43;         use_cython = False
&#43;         print(&quot;Building without Cython.&quot;)
&#43; 
&#43;-    if not check_build_dependencies():
&#43;&#43;    lib_versions = get_library_versions()
&#43;&#43;    versions_ok = True
&#43;&#43;    if lib_versions[0]:
&#43;&#43;        print(&quot;Using build configuration of libxml2 %s and libxslt %s&quot; %
&#43;&#43;              lib_versions)
&#43;&#43;        versions_ok = check_min_version(lib_versions[0], (2, 7, 0), 'libxml2')
&#43;&#43;    else:
&#43;&#43;        print(&quot;Using build configuration of libxslt %s&quot; %
&#43;&#43;              lib_versions[1])
&#43;&#43;    versions_ok |= check_min_version(lib_versions[1], (1, 1, 23), 'libxslt')
&#43;&#43;    if not versions_ok:
&#43;         raise RuntimeError(&quot;Dependency missing&quot;)
&#43; 
&#43;     base_dir = get_base_dir()
&#43;@@ -351,118 &#43;360,53 @@ def define_macros():
&#43;     macros.append(('CYTHON_CLINE_IN_TRACEBACK', '1' if OPTION_WITH_CLINES else '0'))
&#43;     return macros
&#43; 
&#43;&#43;_ERROR_PRINTED = False
&#43; 
&#43; def run_command(cmd, *args):
&#43;     if not cmd:
&#43;         return ''
&#43;     if args:
&#43;         cmd = ' '.join((cmd,) &#43; args)
&#43;-
&#43;&#43;    import subprocess
&#43;     p = subprocess.Popen(cmd, shell=True,
&#43;                          stdout=subprocess.PIPE, stderr=subprocess.PIPE)
&#43;     stdout_data, errors = p.communicate()
&#43;-
&#43;-    if errors:
&#43;-        return ''
&#43;&#43;    global _ERROR_PRINTED
&#43;&#43;    if errors and not _ERROR_PRINTED:
&#43;&#43;        _ERROR_PRINTED = True
&#43;&#43;        print(&quot;ERROR: %s&quot; % errors)
&#43;&#43;        print(&quot;** make sure the development packages of libxml2 and libxslt are installed **\n&quot;)
&#43;     return decode_input(stdout_data).strip()
&#43; 
&#43; 
&#43;-def check_min_version(version, min_version, libname):
&#43;&#43;def check_min_version(version, min_version, error_name):
&#43;     if not version:
&#43;         # this is ok for targets like sdist etc.
&#43;         return True
&#43;-    lib_version = tuple(map(int, version.split('.')[:3]))
&#43;-    req_version = tuple(map(int, min_version.split('.')[:3]))
&#43;-    if lib_version &lt; req_version:
&#43;-        print(&quot;Minimum required version of %s is %s. Your system has version %s.&quot; % (
&#43;-            libname, min_version, version))
&#43;&#43;    version = tuple(map(int, version.split('.')[:3]))
&#43;&#43;    min_version = tuple(min_version)
&#43;&#43;    if version &lt; min_version:
&#43;&#43;        print(&quot;Minimum required version of %s is %s, found %s&quot; % (
&#43;&#43;            error_name, '.'.join(map(str, version)), '.'.join(map(str, min_version))))
&#43;         return False
&#43;     return True
&#43; 
&#43; 
&#43;-def get_library_version(prog, libname=None):
&#43;-    if libname:
&#43;-        return run_command(prog, '--modversion %s' % libname)
&#43;-    else:
&#43;-        return run_command(prog, '--version')
&#43;-
&#43;&#43;def get_library_version(config_tool):
&#43;&#43;    is_pkgconfig = &quot;pkg-config&quot; in config_tool
&#43;&#43;    return run_command(config_tool,
&#43;&#43;                       &quot;--modversion&quot; if is_pkgconfig else &quot;--version&quot;)
&#43; 
&#43;-PKG_CONFIG = None
&#43;-XML2_CONFIG = None
&#43;-XSLT_CONFIG = None
&#43; 
&#43; def get_library_versions():
&#43;-    global XML2_CONFIG, XSLT_CONFIG
&#43;-
&#43;-    # Pre-built libraries
&#43;-    if XML2_CONFIG and XSLT_CONFIG:
&#43;-        xml2_version = get_library_version(XML2_CONFIG)
&#43;-        xslt_version = get_library_version(XSLT_CONFIG)
&#43;-        return xml2_version, xslt_version
&#43;-
&#43;-    # Path to xml2-config and xslt-config specified on the command line
&#43;-    if OPTION_WITH_XML2_CONFIG:
&#43;-        xml2_version = get_library_version(OPTION_WITH_XML2_CONFIG)
&#43;-        if xml2_version and OPTION_WITH_XSLT_CONFIG:
&#43;-            xslt_version = get_library_version(OPTION_WITH_XSLT_CONFIG)
&#43;-            if xslt_version:
&#43;-                XML2_CONFIG = OPTION_WITH_XML2_CONFIG
&#43;-                XSLT_CONFIG = OPTION_WITH_XSLT_CONFIG
&#43;-                return xml2_version, xslt_version
&#43;-
&#43;-    # Try pkg-config
&#43;-    global PKG_CONFIG
&#43;-    PKG_CONFIG = os.getenv('PKG_CONFIG', 'pkg-config')
&#43;-    xml2_version = get_library_version(PKG_CONFIG, 'libxml-2.0')
&#43;-    if xml2_version:
&#43;-        xslt_version = get_library_version(PKG_CONFIG, 'libxslt')
&#43;-        if xml2_version and xslt_version:
&#43;-            return xml2_version, xslt_version
&#43;-
&#43;-    # Try xml2-config and xslt-config
&#43;-    XML2_CONFIG = os.getenv('XML2_CONFIG', 'xml2-config')
&#43;-    xml2_version = get_library_version(XML2_CONFIG)
&#43;-    if xml2_version:
&#43;-        XSLT_CONFIG = os.getenv('XSLT_CONFIG', 'xslt-config')
&#43;-        xslt_version = get_library_version(XSLT_CONFIG)
&#43;-        if xml2_version and xslt_version:
&#43;-            return xml2_version, xslt_version
&#43;-
&#43;-    # One or both build dependencies not found. Fail on Linux platforms only.
&#43;-    if sys.platform.startswith('win'):
&#43;-        return '', ''
&#43;-    print(&quot;Error: Please make sure the libxml2 and libxslt development packages are installed.&quot;)
&#43;-    sys.exit(1)
&#43;-
&#43;-
&#43;-def check_build_dependencies():
&#43;-    xml2_version, xslt_version = get_library_versions()
&#43;-
&#43;-    xml2_ok = check_min_version(xml2_version, '2.7.0', 'libxml2')
&#43;-    xslt_ok = check_min_version(xslt_version, '1.1.23', 'libxslt')
&#43;-
&#43;-    if xml2_version and xslt_version:
&#43;-        print(&quot;Building against libxml2 %s and libxslt %s&quot; % (xml2_version, xslt_version))
&#43;-    else:
&#43;-        print(&quot;Building against pre-built libxml2 andl libxslt libraries&quot;)
&#43;-
&#43;-    return (xml2_ok and xslt_ok)
&#43;-
&#43;-
&#43;-def get_flags(prog, option, libname=None):
&#43;-    if libname:
&#43;-        return run_command(prog, '--%s %s' % (option, libname))
&#43;-    else:
&#43;-        return run_command(prog, '--%s' % option)
&#43;&#43;    xml2_version = get_library_version(find_xml2_config())
&#43;&#43;    xslt_version = get_library_version(find_xslt_config())
&#43;&#43;    return xml2_version, xslt_version
&#43; 
&#43; 
&#43; def flags(option):
&#43;-    if XML2_CONFIG:
&#43;-        xml2_flags = get_flags(XML2_CONFIG, option)
&#43;-        xslt_flags = get_flags(XSLT_CONFIG, option)
&#43;-    else:
&#43;-        xml2_flags = get_flags(PKG_CONFIG, option, 'libxml-2.0')
&#43;-        xslt_flags = get_flags(PKG_CONFIG, option, 'libxslt')
&#43;&#43;    xml2_flags = run_command(find_xml2_config(), &quot;--%s&quot; % option)
&#43;&#43;    xslt_flags = run_command(find_xslt_config(), &quot;--%s&quot; % option)
&#43; 
&#43;     flag_list = xml2_flags.split()
&#43;     for flag in xslt_flags.split():
&#43;@@ -474,6 &#43;418,37 @@ def flags(option):
&#43; def get_xcode_isysroot():
&#43;     return run_command('xcrun', '--show-sdk-path')
&#43; 
&#43;&#43;XSLT_CONFIG = None
&#43;&#43;XML2_CONFIG = None
&#43;&#43;
&#43;&#43;def find_xml2_config():
&#43;&#43;    global XML2_CONFIG
&#43;&#43;    if XML2_CONFIG:
&#43;&#43;        return XML2_CONFIG
&#43;&#43;    option = '--with-xml2-config='
&#43;&#43;    for arg in sys.argv:
&#43;&#43;        if arg.startswith(option):
&#43;&#43;            sys.argv.remove(arg)
&#43;&#43;            XML2_CONFIG = arg[len(option):]
&#43;&#43;            return XML2_CONFIG
&#43;&#43;    else:
&#43;&#43;        # default: do nothing, rely only on xslt-config
&#43;&#43;        XML2_CONFIG = os.getenv('XML2_CONFIG', '')
&#43;&#43;    return XML2_CONFIG
&#43;&#43;
&#43;&#43;def find_xslt_config():
&#43;&#43;    global XSLT_CONFIG
&#43;&#43;    if XSLT_CONFIG:
&#43;&#43;        return XSLT_CONFIG
&#43;&#43;    option = '--with-xslt-config='
&#43;&#43;    for arg in sys.argv:
&#43;&#43;        if arg.startswith(option):
&#43;&#43;            sys.argv.remove(arg)
&#43;&#43;            XSLT_CONFIG = arg[len(option):]
&#43;&#43;            return XSLT_CONFIG
&#43;&#43;    else:
&#43;&#43;        XSLT_CONFIG = os.getenv('XSLT_CONFIG', 'xslt-config')
&#43;&#43;    return XSLT_CONFIG
&#43; 
&#43; ## Option handling:
&#43; 
&#43;@@ -526,8 &#43;501,6 @@ OPTION_AUTO_RPATH = has_option('auto-rpath')
&#43; OPTION_BUILD_LIBXML2XSLT = staticbuild or has_option('static-deps')
&#43; if OPTION_BUILD_LIBXML2XSLT:
&#43;     OPTION_STATIC = True
&#43;-OPTION_WITH_XML2_CONFIG = option_value('xml2-config')
&#43;-OPTION_WITH_XSLT_CONFIG = option_value('xslt-config')
&#43; OPTION_LIBXML2_VERSION = option_value('libxml2-version')
&#43; OPTION_LIBXSLT_VERSION = option_value('libxslt-version')
&#43; OPTION_LIBICONV_VERSION = option_value('libiconv-version')
&#43;-- 
&#43;2.17.1
&#43;
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
index e3cfa46d1..8ab657475 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
@@ -18,8 &#43;18,9 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403\DEPENDS&#43;=">&quot;file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS &#43;= &quot;</a>libxml2 libxslt&quot;
 
-SRC_URI[md5sum] = &quot;f088e452ed45b030b6f84269f1e84d11&quot;
-SRC_URI[sha256sum] = &quot;8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60&quot;
&#43;SRC_URI &#43;= <a class="moz-txt-link-rfc2396E" href="file://0001-setupinfo.py-Revert-changes.patch">&quot;file://0001-setupinfo.py-Revert-changes.patch&quot;</a>
&#43;SRC_URI[md5sum] = &quot;4d3cca9c0018dd98f39e0ac54fcc3d14&quot;
&#43;SRC_URI[sha256sum] = &quot;27ee0faf8077c7c1a589573b1450743011117f1aa1a91d5ae776bbc5ca6070f2&quot;
 
 DISTUTILS_BUILD_ARGS &#43;= &quot; \
                      --with-xslt-config='pkg-config libxslt' \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------20F438673AACE48C74FA01AA--
