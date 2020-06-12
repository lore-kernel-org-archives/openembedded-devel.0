Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.53])
 by mx.groups.io with SMTP id smtpd.web10.22681.1591976330249526074
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 08:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=T2jDoHpc;
 spf=pass (domain: windriver.com, ip: 40.107.75.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqFDKZK1XKf3Ytn7qaRyaGf3YQPvT62LDDWr5IRT2MbAVsPmGBs7tKi5/faS87gIGUb4XkdTNtMSWID3BD3MKBgyvRdyeS0gj73QS02Icb3TDDsT+5r2pYCdZHRB2q1P3Ics3wrVzEgeD8ROZtMOJR9DRY+GlGF/S0WDWunZ/7iyVNzDW6qY6CCkuCns+8/uxlTPNDXr6fQ09foZ+u11GRs7/cX0a7MPbvNFoOYO9hTsN7nMpz1I4obtBAtWIV9lbKhz//+McInu2s/S6FuxlFxzj2u+v62CdXTQwxKz8frbsNuXbZa0L3aOGTo8M27PT3GdhpGkikDKOAs4KYirAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Md2nw76ToB/4bsY5qsJxSMWWV/GaHr2bUDk8iDTS6I4=;
 b=Q4R+/0kL9Q5gP1ytTMCk1dKuXIR+g+ymLdDjB32+xUBcUQZwL3T0U1uD8vfuJLrNpKEMjHGnUKdFJ291cmlVsomCAybdwX+k0Nl6isPNkb/X5Z+2WjExoGF1tbFvnG0v2YCwTGrgGvmqlVOmfFswuLtMM3gML3lDwCCBX7P7SvPMV56o7orG2e+6XOcyT9x+q8+oRgtPHoXqrT2zHUxYcgmHRrSCj/mhmXIQ6swYUpP/waz2wJavUfvOzJQjTDeLnUz8LKdgQHnx7whFHBtBbQJlxITo0aI5OwsRf0N4CiK0w6UXGJy+TA+frnFOLFlfMl7FYlgflvfItaemc8QMeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Md2nw76ToB/4bsY5qsJxSMWWV/GaHr2bUDk8iDTS6I4=;
 b=T2jDoHpcNqUAjOTRC5MWh/ZIBkVtpwKjS/VC12JpjDW2yNm3LdaPWd2qS1+CltaGasckZCsJqmRKuGFdCWP6FKfXe7rfaYP1/IEqHSzoAgbidGe1mliaAQVMkDlMBTX7Hi2/gM0nuDP2qhr5k9zyHYetoLe+bT9A0LjY+1Grc2A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3746.namprd11.prod.outlook.com (2603:10b6:408:8c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 15:38:48 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 15:38:48 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-twisted: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200612144201.4536-1-leon.anavi@konsulko.com>
 <20200612144201.4536-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cfd84f29-f497-0c87-ad45-5f805cb005d8@windriver.com>
Date: Fri, 12 Jun 2020 11:38:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200612144201.4536-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Fri, 12 Jun 2020 15:38:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dbefb57-3f24-4a55-5b7d-08d80ee6b2b8
X-MS-TrafficTypeDiagnostic: BN8PR11MB3746:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB37463BEE4736997EB243967B9F810@BN8PR11MB3746.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r0kOEDLdY3nli7gxM771KZvFZGPixNYhbOvT8rJmO2hM9jBJNRaEP5zDOZ3QMlM9iks2uEge4/yiHzF8bwB/fEGyDFjh+cQt+yePWDn3iz7khNN55brJQw/hJuiDeFNTirtZShn6/rsFWoflPfKNA3M5bT8hOF1VavICyF8gcufu4MZZldiOJ8+TWTb8k8GJ5GILTMx2JHuflDyMHCij1UsSwr3uWX7biQe3OWE+u3JDHr1l72e0nTfFKR/3QVZNr65GTJ0+jm4x57ySTlpG7YXRg426csN86fKnqLPmZowKy3hyv2KGBnhXDmKNu9llbFwURYwMoR7GVouE7M2NMBFfv9tuj5qqhC2SvTvHSeOvXp+cjbwnF98aDiHFp0Dp12idFTVAl2DbN8LvQW6n9Tfli2zQ8c9fNw0Q9uDd4bC5rFrem9ltK5G5x9a3rqNnXzD5UPH1ZCrbApU6jO+Vlg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(136003)(396003)(376002)(346002)(366004)(66946007)(36756003)(66574014)(31696002)(66556008)(44832011)(2616005)(83380400001)(166002)(316002)(2906002)(86362001)(26005)(16576012)(5660300002)(52116002)(33964004)(186003)(16526019)(956004)(66476007)(53546011)(8936002)(966005)(30864003)(31686004)(6486002)(8676002)(478600001)(43740500002)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qCi2vbAouHnYwD1bZDt/LRe7xVekSijWf/mIvrdMDD/Xwb6IeWhHIKpVeX8SSQY65Mcu3pnv3aN4gm0RKu2G+MYhDqScrBbt4M9sO03Yngrd+BIZU0EKyZ4O/eVGpH99dwMtgzdN2189MxHNRfO04It1t9y9qsFQbOJome+jQxrXQfH5f90szMydwHtKQfQJfRH2zTKcrQC3gGx9rs63gVnODQgMFaRiOEca9P4bCkm/PdKwYZGCjPEQ0xjCjaLDXT/zb43qREwk9UKqexGt8I6N9jfz/TWgOZgBOQs/I0wjDBd5H/dMdg+miV1X6CSZ7WC1okdxSj87e3uw3n8nUMxyq0Bb3K7ERAPkshRWv00qDoxGoVFLshvZlWVo3cGYfmV9pBm1XvCNPMgSqRHZHoT5nStU7s7edEhTMGrpIQP/4ti73z12jtcUjEkDF22zhjq8TK+eAlihvIQH4EsGnT1tW4UYmoVsq29rzIucrKN1sxky8A00NRvt8iue3uQz
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dbefb57-3f24-4a55-5b7d-08d80ee6b2b8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 15:38:47.9277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YubAaqTqgBd89BP3hwW0HbKohmO10pqhS0HxOvMTkjvsq/RWv6a/gbcQDbKLKwwo580vgoCVrj0fp3Nw+BpfixK2DMnv/APvqaqHfx45EQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3746
Content-Type: multipart/alternative;
 boundary="------------E9CF058A03A83A90DAC11E2F"
Content-Language: en-US

--------------E9CF058A03A83A90DAC11E2F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/12/20 10:42 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-twisted.inc                 | 266 ------------------
>   ...r-import-in-test_runner-to-be-from-t.patch |   0
>   .../python/python3-twisted_19.10.0.bb         | 264 ++++++++++++++++-
>   3 files changed, 263 insertions(+), 267 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-twisted.inc
>   rename meta-python/recipes-devtools/python/{python-twisted => python3-twisted}/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
> deleted file mode 100644
> index 7537bafd3..000000000
> --- a/meta-python/recipes-devtools/python/python-twisted.inc
> +++ /dev/null
> @@ -1,266 +0,0 @@
> -DESCRIPTION = "Twisted is an event-driven networking framework written in Python and licensed under the LGPL. \
> -Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets, a large number of protocols                   \
> -(including HTTP, NNTP, IMAP, SSH, IRC, FTP, and others), and much more."
> -HOMEPAGE = "http://www.twistedmatrix.com"
> -
> -#twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1743f12d8b8f5aec625c0569a058f0a6"
> -
> -# allow for common patches for python- and python3-twisted
> -FILESEXTRAPATHS_prepend := "${THISDIR}/python-twisted:"
> -
> -SRC_URI += "file://0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch"
> -
> -SRC_URI[sha256sum] = "7394ba7f272ae722a74f3d969dcf599bc4ef093bc392038748a490f1724a515d"
> -SRC_URI[md5sum] = "f2d70f7a66ecdf54152310164cceadfe"
> -
> -PYPI_PACKAGE = "Twisted"
> -PYPI_PACKAGE_EXT = "tar.bz2"
> -
> -do_install_append() {
> -    # remove some useless files before packaging
> -    find ${D} \( -name "*.bat" -o -name "*.c" -o -name "*.h" \) -exec rm -f {} \;
> -}
> -
> -PACKAGES += "\
> -    ${PN}-zsh \
> -    ${PN}-test \
> -    ${PN}-protocols \
> -    ${PN}-conch \
> -    ${PN}-mail \
> -    ${PN}-names \
> -    ${PN}-news \
> -    ${PN}-runner \
> -    ${PN}-web \
> -    ${PN}-words \
> -    ${PN}-flow \
> -    ${PN}-pair \
> -    ${PN}-core \
> -"
> -
> -PACKAGES =+ "\
> -    ${PN}-bin \
> -"
> -
> -DEPENDS += " \
> -    ${PYTHON_PN}-incremental-native \
> -"
> -
> -RDEPENDS_${PN} = "\
> -    ${PN}-bin \
> -    ${PN}-core \
> -    ${PN}-conch \
> -    ${PN}-mail \
> -    ${PN}-names \
> -    ${PN}-pair \
> -    ${PN}-protocols \
> -    ${PN}-runner \
> -    ${PN}-web \
> -    ${PN}-words \
> -    ${PN}-zsh \
> -"
> -
> -RDEPENDS_${PN}-core = "${PYTHON_PN}-appdirs \
> -                       ${PYTHON_PN}-automat \
> -                       ${PYTHON_PN}-constantly \
> -                       ${PYTHON_PN}-core \
> -                       ${PYTHON_PN}-debugger \
> -                       ${PYTHON_PN}-hyperlink \
> -                       ${PYTHON_PN}-incremental \
> -                       ${PYTHON_PN}-pyhamcrest \
> -                       ${PYTHON_PN}-pyserial \
> -                       ${PYTHON_PN}-unixadmin \
> -                       ${PYTHON_PN}-zopeinterface \
> -"
> -RDEPENDS_${PN}-test = "${PN}"
> -RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols ${PYTHON_PN}-bcrypt ${PYTHON_PN}-cryptography ${PYTHON_PN}-pyasn1 ${PYTHON_PN}-pickle"
> -RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
> -RDEPENDS_${PN}-names = "${PN}-core"
> -RDEPENDS_${PN}-news = "${PN}-core ${PN}-protocols"
> -RDEPENDS_${PN}-runner = "${PN}-core ${PN}-protocols"
> -RDEPENDS_${PN}-web += "${PN}-core ${PN}-protocols"
> -RDEPENDS_${PN}-words += "${PN}-core"
> -RDEPENDS_${PN}-flow += "${PN}-core"
> -RDEPENDS_${PN}-pair += "${PN}-core"
> -RDEPENDS_${PN}-dbg = "${PN}"
> -
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN} = ""
> -
> -FILES_${PN}-test = " \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/test \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/haproxy/test/ \
> -"
> -
> -FILES_${PN}-protocols = " \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/haproxy \
> -"
> -
> -FILES_${PN}-zsh = " \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/twisted-completion.zsh \
> -"
> -
> -FILES_${PN}-conch = " \
> -    ${bindir}/ckeygen \
> -    ${bindir}/tkconch \
> -    ${bindir}/conch \
> -    ${bindir}/conchftp \
> -    ${bindir}/cftp \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_conch.py* \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/conch  \
> -"
> -
> -FILES_${PN}-core = " \
> -${bindir}/manhole \
> -${bindir}/mktap \
> -${bindir}/twistd \
> -${bindir}/tap2deb \
> -${bindir}/tap2rpm \
> -${bindir}/tapconvert \
> -${bindir}/tkmktap \
> -${bindir}/trial \
> -${bindir}/easy_install* \
> -${bindir}/pyhtmlizer \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.so \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__init__.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/notestplugin.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/testplugin.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_ftp.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_inet.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_manhole.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_portforward.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_socks.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_telnet.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_trial.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/dropin.cache \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/application \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/cred \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/enterprise \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/internet \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/persisted \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols\
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python\
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/timeoutqueue.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/filepath.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dxprofile.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/plugin.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/htmlizer.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__init__.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dispatch.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/hook.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadpool.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/otp.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/usage.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/roots.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/versions.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/urlpath.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/util.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/components.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/logfile.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/runtime.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/reflect.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/context.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadable.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/rebuild.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/failure.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/lockfile.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/formmethod.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/finalize.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/win32.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dist.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/shortcut.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zipstream.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/release.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/syslog.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/log.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/compat.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/procutils.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/text.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_twisted_zsh_stub \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/scripts/ \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/ \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/tap/ \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/trial/ \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/__init__.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/_version.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/copyright.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/im.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/*.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/topfiles \
> -${libdir}/${PYTHON_DIR}/site-packages/Twisted*egg-info \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/logger/ \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/_threads/ \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/positioning/ \
> -"
> -
> -FILES_${PN}-mail = " \
> -${bindir}/mailmail \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_mail.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/mail \
> -"
> -
> -FILES_${PN}-names = " \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_names.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/names \
> -"
> -
> -FILES_${PN}-news = " \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_news.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/news \
> -"
> -
> -FILES_${PN}-runner = " \
> -${libdir}/site-packages/twisted/runner/portmap.so \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/runner\
> -"
> -
> -FILES_${PN}-web = " \
> -${bindir}/websetroot \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_web.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/web\
> -"
> -
> -FILES_${PN}-words = " \
> -${bindir}/im \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_words.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/words\
> -"
> -
> -FILES_${PN}-flow = " \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_flow.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/flow \"
> -
> -FILES_${PN}-pair = " \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_pair.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/pair \
> -"
> -
> -FILES_${PN}-dbg += " \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/*/.debug \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/.debug \
> -"
> -
> -FILES_${PN}-doc += " \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_pydoctortemplates/ \
> -"
> -
> -RDEPENDS_${PN}-src = "${PN}"
> -FILES_${PN}-src = " \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*.py \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/*.py \
> -"
> -
> diff --git a/meta-python/recipes-devtools/python/python-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch b/meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
> rename to meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
> diff --git a/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb b/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
> index c12d1cc04..f2fcd30b7 100644
> --- a/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
> @@ -1,5 +1,267 @@
> +DESCRIPTION = "Twisted is an event-driven networking framework written in Python and licensed under the LGPL. \
> +Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets, a large number of protocols                   \
> +(including HTTP, NNTP, IMAP, SSH, IRC, FTP, and others), and much more."
> +HOMEPAGE = "http://www.twistedmatrix.com"
> +
> +#twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1743f12d8b8f5aec625c0569a058f0a6"
> +
> +SRC_URI += "file://0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch"
> +
> +SRC_URI[sha256sum] = "7394ba7f272ae722a74f3d969dcf599bc4ef093bc392038748a490f1724a515d"
> +SRC_URI[md5sum] = "f2d70f7a66ecdf54152310164cceadfe"
> +
> +PYPI_PACKAGE = "Twisted"
> +PYPI_PACKAGE_EXT = "tar.bz2"
> +
>   inherit pypi setuptools3
> -require python-twisted.inc
> +
> +do_install_append() {
> +    # remove some useless files before packaging
> +    find ${D} \( -name "*.bat" -o -name "*.c" -o -name "*.h" \) -exec rm -f {} \;
> +}
> +
> +PACKAGES += "\
> +    ${PN}-zsh \
> +    ${PN}-test \
> +    ${PN}-protocols \
> +    ${PN}-conch \
> +    ${PN}-mail \
> +    ${PN}-names \
> +    ${PN}-news \
> +    ${PN}-runner \
> +    ${PN}-web \
> +    ${PN}-words \
> +    ${PN}-flow \
> +    ${PN}-pair \
> +    ${PN}-core \
> +"
> +
> +PACKAGES =+ "\
> +    ${PN}-bin \
> +"
> +
> +DEPENDS += " \
> +    ${PYTHON_PN}-incremental-native \
> +"
> +
> +RDEPENDS_${PN} = "\
> +    ${PN}-bin \
> +    ${PN}-core \
> +    ${PN}-conch \
> +    ${PN}-mail \
> +    ${PN}-names \
> +    ${PN}-pair \
> +    ${PN}-protocols \
> +    ${PN}-runner \
> +    ${PN}-web \
> +    ${PN}-words \
> +    ${PN}-zsh \
> +"
> +
> +RDEPENDS_${PN}-core = "${PYTHON_PN}-appdirs \
> +                       ${PYTHON_PN}-automat \
> +                       ${PYTHON_PN}-constantly \
> +                       ${PYTHON_PN}-core \
> +                       ${PYTHON_PN}-debugger \
> +                       ${PYTHON_PN}-hyperlink \
> +                       ${PYTHON_PN}-incremental \
> +                       ${PYTHON_PN}-pyhamcrest \
> +                       ${PYTHON_PN}-pyserial \
> +                       ${PYTHON_PN}-unixadmin \
> +                       ${PYTHON_PN}-zopeinterface \
> +"
> +RDEPENDS_${PN}-test = "${PN}"
> +RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols ${PYTHON_PN}-bcrypt ${PYTHON_PN}-cryptography ${PYTHON_PN}-pyasn1 ${PYTHON_PN}-pickle"
> +RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
> +RDEPENDS_${PN}-names = "${PN}-core"
> +RDEPENDS_${PN}-news = "${PN}-core ${PN}-protocols"
> +RDEPENDS_${PN}-runner = "${PN}-core ${PN}-protocols"
> +RDEPENDS_${PN}-web += "${PN}-core ${PN}-protocols"
> +RDEPENDS_${PN}-words += "${PN}-core"
> +RDEPENDS_${PN}-flow += "${PN}-core"
> +RDEPENDS_${PN}-pair += "${PN}-core"
> +RDEPENDS_${PN}-dbg = "${PN}"
> +
> +ALLOW_EMPTY_${PN} = "1"
> +FILES_${PN} = ""
> +
> +FILES_${PN}-test = " \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/test \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/haproxy/test/ \
> +"
> +
> +FILES_${PN}-protocols = " \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/haproxy \
> +"
> +
> +FILES_${PN}-zsh = " \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/twisted-completion.zsh \
> +"
> +
> +FILES_${PN}-conch = " \
> +    ${bindir}/ckeygen \
> +    ${bindir}/tkconch \
> +    ${bindir}/conch \
> +    ${bindir}/conchftp \
> +    ${bindir}/cftp \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_conch.py* \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/conch  \
> +"
> +
> +FILES_${PN}-core = " \
> +${bindir}/manhole \
> +${bindir}/mktap \
> +${bindir}/twistd \
> +${bindir}/tap2deb \
> +${bindir}/tap2rpm \
> +${bindir}/tapconvert \
> +${bindir}/tkmktap \
> +${bindir}/trial \
> +${bindir}/easy_install* \
> +${bindir}/pyhtmlizer \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.so \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__init__.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/notestplugin.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/testplugin.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_ftp.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_inet.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_manhole.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_portforward.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_socks.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_telnet.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_trial.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/dropin.cache \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/application \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/cred \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/enterprise \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/internet \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/persisted \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols\
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python\
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/timeoutqueue.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/filepath.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dxprofile.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/plugin.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/htmlizer.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__init__.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dispatch.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/hook.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadpool.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/otp.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/usage.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/roots.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/versions.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/urlpath.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/util.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/components.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/logfile.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/runtime.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/reflect.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/context.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadable.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/rebuild.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/failure.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/lockfile.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/formmethod.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/finalize.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/win32.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dist.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/shortcut.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zipstream.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/release.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/syslog.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/log.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/compat.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/procutils.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/text.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_twisted_zsh_stub \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/scripts/ \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/ \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/tap/ \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/trial/ \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/__init__.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/_version.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/copyright.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/im.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/*.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/topfiles \
> +${libdir}/${PYTHON_DIR}/site-packages/Twisted*egg-info \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/logger/ \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/_threads/ \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/positioning/ \
> +"
> +
> +FILES_${PN}-mail = " \
> +${bindir}/mailmail \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_mail.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/mail \
> +"
> +
> +FILES_${PN}-names = " \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_names.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/names \
> +"
> +
> +FILES_${PN}-news = " \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_news.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/news \
> +"
> +
> +FILES_${PN}-runner = " \
> +${libdir}/site-packages/twisted/runner/portmap.so \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/runner\
> +"
> +
> +FILES_${PN}-web = " \
> +${bindir}/websetroot \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_web.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/web\
> +"
> +
> +FILES_${PN}-words = " \
> +${bindir}/im \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_words.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/words\
> +"
> +
> +FILES_${PN}-flow = " \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_flow.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/flow \"
> +
> +FILES_${PN}-pair = " \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_pair.py* \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/pair \
> +"
> +
> +FILES_${PN}-dbg += " \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/*/.debug \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/.debug \
> +"
> +
> +FILES_${PN}-doc += " \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_pydoctortemplates/ \
> +"
> +
> +RDEPENDS_${PN}-src = "${PN}"
> +FILES_${PN}-src = " \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*.py \
> +    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/*.py \
> +"
>   
>   FILES_${PN}-core_append = " \
>     ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \
>
> 

--------------E9CF058A03A83A90DAC11E2F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/12/20 10:42 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200612144201.4536-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200612144201.4536-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-twisted.inc                 | 266 ------------------
 ...r-import-in-test_runner-to-be-from-t.patch |   0
 .../python/python3-twisted_19.10.0.bb         | 264 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 3 files changed, 263 insertions(&#43;), 267 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-twisted.inc
 rename meta-python/recipes-devtools/python/{python-twisted =&gt; python3-twisted}/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch (100%)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
deleted file mode 100644
index 7537bafd3..000000000
--- a/meta-python/recipes-devtools/python/python-twisted.inc
&#43;&#43;&#43; /dev/null
@@ -1,266 &#43;0,0 @@
-DESCRIPTION = &quot;Twisted is an event-driven networking framework written in Python and licensed under the LGPL. \
-Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets, a large number of protocols                   \
-(including HTTP, NNTP, IMAP, SSH, IRC, FTP, and others), and much more.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.twistedmatrix.com">&quot;http://www.twistedmatrix.com&quot;</a>
-
-#twisted/topfiles/<a class="moz-txt-link-freetext" href="NEWS:655">NEWS:655</a>: - Relicensed: Now under the MIT license, rather than LGPL.
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1743f12d8b8f5aec625c0569a058f0a6">&quot;file://LICENSE;md5=1743f12d8b8f5aec625c0569a058f0a6&quot;</a>
-
-# allow for common patches for python- and python3-twisted
-FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-twisted:&quot;
-
-SRC_URI &#43;= <a class="moz-txt-link-rfc2396E" href="file://0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch">&quot;file://0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch&quot;</a>
-
-SRC_URI[sha256sum] = &quot;7394ba7f272ae722a74f3d969dcf599bc4ef093bc392038748a490f1724a515d&quot;
-SRC_URI[md5sum] = &quot;f2d70f7a66ecdf54152310164cceadfe&quot;
-
-PYPI_PACKAGE = &quot;Twisted&quot;
-PYPI_PACKAGE_EXT = &quot;tar.bz2&quot;
-
-do_install_append() {
-    # remove some useless files before packaging
-    find ${D} \( -name &quot;*.bat&quot; -o -name &quot;*.c&quot; -o -name &quot;*.h&quot; \) -exec rm -f {} \;
-}
-
-PACKAGES &#43;= &quot;\
-    ${PN}-zsh \
-    ${PN}-test \
-    ${PN}-protocols \
-    ${PN}-conch \
-    ${PN}-mail \
-    ${PN}-names \
-    ${PN}-news \
-    ${PN}-runner \
-    ${PN}-web \
-    ${PN}-words \
-    ${PN}-flow \
-    ${PN}-pair \
-    ${PN}-core \
-&quot;
-
-PACKAGES =&#43; &quot;\
-    ${PN}-bin \
-&quot;
-
-DEPENDS &#43;= &quot; \
-    ${PYTHON_PN}-incremental-native \
-&quot;
-
-RDEPENDS_${PN} = &quot;\
-    ${PN}-bin \
-    ${PN}-core \
-    ${PN}-conch \
-    ${PN}-mail \
-    ${PN}-names \
-    ${PN}-pair \
-    ${PN}-protocols \
-    ${PN}-runner \
-    ${PN}-web \
-    ${PN}-words \
-    ${PN}-zsh \
-&quot;
-
-RDEPENDS_${PN}-core = &quot;${PYTHON_PN}-appdirs \
-                       ${PYTHON_PN}-automat \
-                       ${PYTHON_PN}-constantly \
-                       ${PYTHON_PN}-core \ 
-                       ${PYTHON_PN}-debugger \
-                       ${PYTHON_PN}-hyperlink \
-                       ${PYTHON_PN}-incremental \
-                       ${PYTHON_PN}-pyhamcrest \
-                       ${PYTHON_PN}-pyserial \
-                       ${PYTHON_PN}-unixadmin \
-                       ${PYTHON_PN}-zopeinterface \
-&quot;
-RDEPENDS_${PN}-test = &quot;${PN}&quot;
-RDEPENDS_${PN}-conch = &quot;${PN}-core ${PN}-protocols ${PYTHON_PN}-bcrypt ${PYTHON_PN}-cryptography ${PYTHON_PN}-pyasn1 ${PYTHON_PN}-pickle&quot;
-RDEPENDS_${PN}-mail = &quot;${PN}-core ${PN}-protocols&quot;
-RDEPENDS_${PN}-names = &quot;${PN}-core&quot;
-RDEPENDS_${PN}-news = &quot;${PN}-core ${PN}-protocols&quot;
-RDEPENDS_${PN}-runner = &quot;${PN}-core ${PN}-protocols&quot;
-RDEPENDS_${PN}-web &#43;= &quot;${PN}-core ${PN}-protocols&quot;
-RDEPENDS_${PN}-words &#43;= &quot;${PN}-core&quot;
-RDEPENDS_${PN}-flow &#43;= &quot;${PN}-core&quot;
-RDEPENDS_${PN}-pair &#43;= &quot;${PN}-core&quot;
-RDEPENDS_${PN}-dbg = &quot;${PN}&quot;
-
-ALLOW_EMPTY_${PN} = &quot;1&quot;
-FILES_${PN} = &quot;&quot;
-
-FILES_${PN}-test = &quot; \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/test \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/haproxy/test/ \
-&quot;
-
-FILES_${PN}-protocols = &quot; \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/haproxy \
-&quot;
-
-FILES_${PN}-zsh = &quot; \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/twisted-completion.zsh \
-&quot;
-
-FILES_${PN}-conch = &quot; \
-    ${bindir}/ckeygen \
-    ${bindir}/tkconch \
-    ${bindir}/conch \
-    ${bindir}/conchftp \
-    ${bindir}/cftp \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_conch.py* \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/conch  \
-&quot;
-
-FILES_${PN}-core = &quot; \
-${bindir}/manhole \
-${bindir}/mktap \
-${bindir}/twistd \
-${bindir}/tap2deb \
-${bindir}/tap2rpm \
-${bindir}/tapconvert \
-${bindir}/tkmktap \
-${bindir}/trial \
-${bindir}/easy_install* \
-${bindir}/pyhtmlizer \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.so \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__init__.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/notestplugin.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/testplugin.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_ftp.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_inet.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_manhole.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_portforward.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_socks.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_telnet.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_trial.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/dropin.cache \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/application \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/cred \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/enterprise \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/internet \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/persisted \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols\
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python\
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/timeoutqueue.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/filepath.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dxprofile.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/plugin.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/htmlizer.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__init__.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dispatch.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/hook.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadpool.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/otp.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/usage.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/roots.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/versions.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/urlpath.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/util.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/components.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/logfile.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/runtime.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/reflect.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/context.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadable.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/rebuild.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/failure.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/lockfile.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/formmethod.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/finalize.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/win32.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dist.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/shortcut.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zipstream.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/release.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/syslog.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/log.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/compat.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/procutils.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/text.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_twisted_zsh_stub \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/scripts/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/tap/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/trial/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/__init__.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/_version.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/copyright.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/im.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/*.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/topfiles \
-${libdir}/${PYTHON_DIR}/site-packages/Twisted*egg-info \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/logger/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/_threads/ \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/positioning/ \
-&quot;
-
-FILES_${PN}-mail = &quot; \
-${bindir}/mailmail \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_mail.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/mail \
-&quot;
-
-FILES_${PN}-names = &quot; \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_names.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/names \
-&quot;
-
-FILES_${PN}-news = &quot; \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_news.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/news \
-&quot;
-
-FILES_${PN}-runner = &quot; \
-${libdir}/site-packages/twisted/runner/portmap.so \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/runner\
-&quot;
-
-FILES_${PN}-web = &quot; \
-${bindir}/websetroot \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_web.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/web\
-&quot;
-
-FILES_${PN}-words = &quot; \
-${bindir}/im \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_words.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/words\
-&quot;
-
-FILES_${PN}-flow = &quot; \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_flow.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/flow \&quot;
-
-FILES_${PN}-pair = &quot; \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_pair.py* \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/pair \
-&quot;
-
-FILES_${PN}-dbg &#43;= &quot; \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/*/.debug \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/.debug \
-&quot;
-
-FILES_${PN}-doc &#43;= &quot; \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_pydoctortemplates/ \
-&quot;
-
-RDEPENDS_${PN}-src = &quot;${PN}&quot;
-FILES_${PN}-src = &quot; \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*.py \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/*.py \
-&quot;
-
diff --git a/meta-python/recipes-devtools/python/python-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch b/meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
rename to meta-python/recipes-devtools/python/python3-twisted/0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch
diff --git a/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb b/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
index c12d1cc04..f2fcd30b7 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
@@ -1,5 &#43;1,267 @@
&#43;DESCRIPTION = &quot;Twisted is an event-driven networking framework written in Python and licensed under the LGPL. \
&#43;Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets, a large number of protocols                   \
&#43;(including HTTP, NNTP, IMAP, SSH, IRC, FTP, and others), and much more.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.twistedmatrix.com">&quot;http://www.twistedmatrix.com&quot;</a>
&#43;
&#43;#twisted/topfiles/<a class="moz-txt-link-freetext" href="NEWS:655">NEWS:655</a>: - Relicensed: Now under the MIT license, rather than LGPL.
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1743f12d8b8f5aec625c0569a058f0a6">&quot;file://LICENSE;md5=1743f12d8b8f5aec625c0569a058f0a6&quot;</a>
&#43;
&#43;SRC_URI &#43;= <a class="moz-txt-link-rfc2396E" href="file://0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch">&quot;file://0001-fix-MemoryReactor-import-in-test_runner-to-be-from-t.patch&quot;</a>
&#43;
&#43;SRC_URI[sha256sum] = &quot;7394ba7f272ae722a74f3d969dcf599bc4ef093bc392038748a490f1724a515d&quot;
&#43;SRC_URI[md5sum] = &quot;f2d70f7a66ecdf54152310164cceadfe&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;Twisted&quot;
&#43;PYPI_PACKAGE_EXT = &quot;tar.bz2&quot;
&#43;
 inherit pypi setuptools3
-require python-twisted.inc
&#43;
&#43;do_install_append() {
&#43;    # remove some useless files before packaging
&#43;    find ${D} \( -name &quot;*.bat&quot; -o -name &quot;*.c&quot; -o -name &quot;*.h&quot; \) -exec rm -f {} \;
&#43;}
&#43;
&#43;PACKAGES &#43;= &quot;\
&#43;    ${PN}-zsh \
&#43;    ${PN}-test \
&#43;    ${PN}-protocols \
&#43;    ${PN}-conch \
&#43;    ${PN}-mail \
&#43;    ${PN}-names \
&#43;    ${PN}-news \
&#43;    ${PN}-runner \
&#43;    ${PN}-web \
&#43;    ${PN}-words \
&#43;    ${PN}-flow \
&#43;    ${PN}-pair \
&#43;    ${PN}-core \
&#43;&quot;
&#43;
&#43;PACKAGES =&#43; &quot;\
&#43;    ${PN}-bin \
&#43;&quot;
&#43;
&#43;DEPENDS &#43;= &quot; \
&#43;    ${PYTHON_PN}-incremental-native \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN} = &quot;\
&#43;    ${PN}-bin \
&#43;    ${PN}-core \
&#43;    ${PN}-conch \
&#43;    ${PN}-mail \
&#43;    ${PN}-names \
&#43;    ${PN}-pair \
&#43;    ${PN}-protocols \
&#43;    ${PN}-runner \
&#43;    ${PN}-web \
&#43;    ${PN}-words \
&#43;    ${PN}-zsh \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-core = &quot;${PYTHON_PN}-appdirs \
&#43;                       ${PYTHON_PN}-automat \
&#43;                       ${PYTHON_PN}-constantly \
&#43;                       ${PYTHON_PN}-core \
&#43;                       ${PYTHON_PN}-debugger \
&#43;                       ${PYTHON_PN}-hyperlink \
&#43;                       ${PYTHON_PN}-incremental \
&#43;                       ${PYTHON_PN}-pyhamcrest \
&#43;                       ${PYTHON_PN}-pyserial \
&#43;                       ${PYTHON_PN}-unixadmin \
&#43;                       ${PYTHON_PN}-zopeinterface \
&#43;&quot;
&#43;RDEPENDS_${PN}-test = &quot;${PN}&quot;
&#43;RDEPENDS_${PN}-conch = &quot;${PN}-core ${PN}-protocols ${PYTHON_PN}-bcrypt ${PYTHON_PN}-cryptography ${PYTHON_PN}-pyasn1 ${PYTHON_PN}-pickle&quot;
&#43;RDEPENDS_${PN}-mail = &quot;${PN}-core ${PN}-protocols&quot;
&#43;RDEPENDS_${PN}-names = &quot;${PN}-core&quot;
&#43;RDEPENDS_${PN}-news = &quot;${PN}-core ${PN}-protocols&quot;
&#43;RDEPENDS_${PN}-runner = &quot;${PN}-core ${PN}-protocols&quot;
&#43;RDEPENDS_${PN}-web &#43;= &quot;${PN}-core ${PN}-protocols&quot;
&#43;RDEPENDS_${PN}-words &#43;= &quot;${PN}-core&quot;
&#43;RDEPENDS_${PN}-flow &#43;= &quot;${PN}-core&quot;
&#43;RDEPENDS_${PN}-pair &#43;= &quot;${PN}-core&quot;
&#43;RDEPENDS_${PN}-dbg = &quot;${PN}&quot;
&#43;
&#43;ALLOW_EMPTY_${PN} = &quot;1&quot;
&#43;FILES_${PN} = &quot;&quot;
&#43;
&#43;FILES_${PN}-test = &quot; \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/test \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/haproxy/test/ \
&#43;&quot;
&#43;
&#43;FILES_${PN}-protocols = &quot; \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/haproxy \
&#43;&quot;
&#43;
&#43;FILES_${PN}-zsh = &quot; \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/twisted-completion.zsh \
&#43;&quot;
&#43;
&#43;FILES_${PN}-conch = &quot; \
&#43;    ${bindir}/ckeygen \
&#43;    ${bindir}/tkconch \
&#43;    ${bindir}/conch \
&#43;    ${bindir}/conchftp \
&#43;    ${bindir}/cftp \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_conch.py* \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/conch  \
&#43;&quot;
&#43;
&#43;FILES_${PN}-core = &quot; \
&#43;${bindir}/manhole \
&#43;${bindir}/mktap \
&#43;${bindir}/twistd \
&#43;${bindir}/tap2deb \
&#43;${bindir}/tap2rpm \
&#43;${bindir}/tapconvert \
&#43;${bindir}/tkmktap \
&#43;${bindir}/trial \
&#43;${bindir}/easy_install* \
&#43;${bindir}/pyhtmlizer \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.so \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__init__.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/notestplugin.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/testplugin.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_ftp.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_inet.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_manhole.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_portforward.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_socks.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_telnet.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_trial.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/dropin.cache \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/application \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/cred \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/enterprise \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/internet \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/persisted \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols\
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python\
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/timeoutqueue.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/filepath.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dxprofile.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/plugin.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/htmlizer.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__init__.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dispatch.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/hook.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadpool.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/otp.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/usage.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/roots.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/versions.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/urlpath.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/util.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/components.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/logfile.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/runtime.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/reflect.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/context.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadable.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/rebuild.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/failure.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/lockfile.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/formmethod.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/finalize.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/win32.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dist.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/shortcut.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zipstream.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/release.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/syslog.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/log.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/compat.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/procutils.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/text.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_twisted_zsh_stub \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/scripts/ \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/ \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/tap/ \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/trial/ \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/__init__.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/_version.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/copyright.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/im.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/*.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/topfiles \
&#43;${libdir}/${PYTHON_DIR}/site-packages/Twisted*egg-info \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/logger/ \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/_threads/ \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/positioning/ \
&#43;&quot;
&#43;
&#43;FILES_${PN}-mail = &quot; \
&#43;${bindir}/mailmail \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_mail.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/mail \
&#43;&quot;
&#43;
&#43;FILES_${PN}-names = &quot; \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_names.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/names \
&#43;&quot;
&#43;
&#43;FILES_${PN}-news = &quot; \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_news.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/news \
&#43;&quot;
&#43;
&#43;FILES_${PN}-runner = &quot; \
&#43;${libdir}/site-packages/twisted/runner/portmap.so \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/runner\
&#43;&quot;
&#43;
&#43;FILES_${PN}-web = &quot; \
&#43;${bindir}/websetroot \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_web.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/web\
&#43;&quot;
&#43;
&#43;FILES_${PN}-words = &quot; \
&#43;${bindir}/im \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_words.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/words\
&#43;&quot;
&#43;
&#43;FILES_${PN}-flow = &quot; \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_flow.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/flow \&quot;
&#43;
&#43;FILES_${PN}-pair = &quot; \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_pair.py* \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/pair \
&#43;&quot;
&#43;
&#43;FILES_${PN}-dbg &#43;= &quot; \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/*/.debug \
&#43;${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/.debug \
&#43;&quot;
&#43;
&#43;FILES_${PN}-doc &#43;= &quot; \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_pydoctortemplates/ \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-src = &quot;${PN}&quot;
&#43;FILES_${PN}-src = &quot; \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*.py \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/*.py \
&#43;&quot;
 
 FILES_${PN}-core_append = &quot; \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E9CF058A03A83A90DAC11E2F--
