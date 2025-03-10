Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C69EC28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 10:56:16 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.34564.1741604170804473712
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 03:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iXWeDYkC;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso8525175e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 03:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741604169; x=1742208969; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXpGDSCffOq6sX8S5xCriyyo0V5FcQuNTkgpt71dV0o=;
        b=iXWeDYkCGGM6BEyWCo/L2xisu1Y3SSwO1qqJHC0i/I7CT+TCHWN16ILGqLe2oVKI7Z
         GPJdig2KCbUwIEscxyuXt3RdYh2toud1Pr83mcaPPX98jdrWQ0oQuCJ9SmxyeT+lbEMW
         4bKy7KlazbFNVGOtZ9mKMAANL4spi3oKTZ8zTveji8QwvTPYjiKIsC6vaAKU0vUJHjko
         8xwoMpDYqc3T1rlYsj2PrRtplwE8+mnjE5POLzy2LUDBQBkewsxbJhP7FvQaCu9e2z6D
         zZw4pTTImEIt2i+LhwUZhmVHs3R7ZyK2jchGqUDFxpqtcSy5U75aXOQtaten95ni+rN7
         px2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741604169; x=1742208969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lXpGDSCffOq6sX8S5xCriyyo0V5FcQuNTkgpt71dV0o=;
        b=mL+edOPRXZCgBqcL5GY/DObCvoN5Py5PfJnMzLG5/ky6O6LkXOy7R9JYBkSiwReGcc
         stzUQnRzvjCGjpE8Y+eC1DJBwVh05kAIbRrtAZYFHFCQTY5EOHXuMD6cCnP6BNEdHrwC
         9cH/JucHXM7s0sJdJJEtUZvedDUV3gwRcDzUF5lNm0laf1Xs7VAXTz/FD1et8+NrLecu
         M1v815kVYW/TYW3sBhUx8xBoZSYqqlj8Z/PruSadpBfHNG4Rs6Rd0nHUjS0WHoA6fPLS
         21rarg7j2H1in7HPwmbcrwvVIRPSE7eOjijGaPBqF8Ku1icWmHpLIowwPn+i+hhPW2TN
         7hSg==
X-Forwarded-Encrypted: i=1; AJvYcCUJPRWpCEo6GxN1T1UkrqBZlpzUazRcP2bjX0djodeGF7/XS5FN1r1rpj8iXut20qHeALtUt5R+UEB+g1McrWjyIxM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWF2zJtMxNeJu0JhlsT14l8iweQ1xZ+Zl7YWIvEjaaVC/XPzoI
	CUVmFXa9QbF3ZL27AtcBceLKBsVM4+dZXr4DYbCGRKFmPAQyDYbP
X-Gm-Gg: ASbGncsO3ehQX5ov+mBko66k5U445rrSNlE5cxQUnaHc6DCI+dsqgGiebzdY62nNwQN
	XFnqw8Gi3MKPdb9mkgvaxfJ5UpodV9kvKJM+vGPFWrOJyZWMpb5Crl7X81B2We32gXct0yX00VB
	t4aQT4/JP9/N69dxPZQC00+AXU06eJ9aRv0DkCLA7qUsbnQLwUj8YBRXr6EC7wJyMircfQuJcQW
	ci1A3VOwaY0ccrxSCw2YVxbjhrDE1vZ/FX8fFX718G4z/12uAHoSf8QK6LgU4sLVaFcu1X5/GyJ
	Mnj8HVd4CiNADERNYazIl5pU1Etdz8WfaYS89jD3tF5ihhiBVjrz
X-Google-Smtp-Source: AGHT+IGKjCsaa50dw+jTybEFOTCRrENOSySayhF/OMvUojrewwUfKqa9c+VFJDonc1f9EJzwauh9Dg==
X-Received: by 2002:a7b:cc88:0:b0:43c:f75a:eb38 with SMTP id 5b1f17b1804b1-43cf75aed80mr21035195e9.2.1741604167410;
        Mon, 10 Mar 2025 03:56:07 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01cd62sm14219144f8f.46.2025.03.10.03.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 03:56:06 -0700 (PDT)
Message-ID: <e0a79027-7cec-4081-b061-f254e895e60b@gmail.com>
Date: Mon, 10 Mar 2025 11:56:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [kirkstone][meta-networking][PATCH] net-snmp: fix memory
 leak
To: piotr.l.lewicki@hitachienergy.com,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
 "akuster808@gmail.com" <akuster808@gmail.com>,
 "Jinfeng.Wang.CN@windriver.com" <Jinfeng.Wang.CN@windriver.com>
References: <1825C99274128577.23135@lists.openembedded.org>
 <388ca5e6-0384-42ca-9f1d-3ed83b2ec644@windriver.com>
 <AM6PR06MB4262D2FB372E059E4DBEBE48ABD62@AM6PR06MB4262.eurprd06.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <AM6PR06MB4262D2FB372E059E4DBEBE48ABD62@AM6PR06MB4262.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 10:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115829

That character change in the comment doesn't look material for the fix
to take effect, it could be even left out of the backport completely.

On 10.03.25 10:29, Piotr L Lewicki via lists.openembedded.org wrote:
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> on behalf of Wang, Jinfeng (CN) via lists.openembedded.org <Jinfeng.Wang.CN=windriver.com@lists.openembedded.org>
> Sent: Monday, March 10, 2025 08:01
> To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org>; akuster808@gmail.com <akuster808@gmail.com>
> Subject: Re: [oe] [kirkstone][meta-networking][PATCH] net-snmp: fix memory leak
>
> [You don't often get email from jinfeng.wang.cn=windriver.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Warning
>
> This email comes from outside of Hitachi Energy. Make sure you verify the sender before clicking any links or downloading/opening attachments.
> If this email looks suspicious, report it by clicking 'Report Phishing' button in Outlook.
> See the SecureWay group in Yammer for more security information.
>
> Sorry for interupt.
>
> Please revert my patch.
>
>
> After I rebase the latest codes from kirkstone. I found my patch had a
> bad character. This caused net-snmp do_patch failure.
>
> After some tries, I still failed to resolve this.
>
>
> The cherry-pick in my side picked copyright change. But after sending
> the patch via git send-mail, the character changed.
>
> Sorry again.
>
>
> Thanks.
>
> Jinfeng
>
>
> On 2/20/2025 10:27 AM, Wang, Jinfeng (CN) via lists.openembedded.org wrote:
>> From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>>
>> Backport patch [1] to fix memory leak by freeing tclist
>> [1] https://github.com/net-snmp/net-snmp/commit/4bd0d9a8a2860c2c46307aef5ee1ccc69f7e3b62
>>
>> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>> ---
>>   ...bs-fix-memory-leak-by-freeing-tclist.patch | 40 +++++++++++++++++++
>>   .../net-snmp/net-snmp_5.9.3.bb                |  1 +
>>   2 files changed, 41 insertions(+)
>>   create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch
>>
>> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch
>> new file mode 100644
>> index 0000000000..3632881501
>> --- /dev/null
>> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch
>> @@ -0,0 +1,40 @@
>> +From 4bd0d9a8a2860c2c46307aef5ee1ccc69f7e3b62 Mon Sep 17 00:00:00 2001
>> +From: JanSoundhouse <jan.sondhauss@wago.com>
>> +Date: Mon, 5 Sep 2022 11:25:58 +0200
>> +Subject: [PATCH] unload_all_mibs: fix memory leak by freeing tclist
>> +
>> +tclist is always allocated in netsnmp_init_mib_internals, when doing multiple init_snmp("")/snmp_shutdown("") this memory is never free'd.
>> +
>> +Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/4bd0d9a8a2860c2c46307aef5ee1ccc69f7e3b62]
>> +
>> +Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>> +---
>> + snmplib/parse.c | 5 +++--
>> + 1 file changed, 3 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/snmplib/parse.c b/snmplib/parse.c
>> +index b3e2f3ae5c..71bdf75ff8 100644
>> +--- a/snmplib/parse.c
>> ++++ b/snmplib/parse.c
>> +@@ -28,7 +28,7 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
>> + SOFTWARE.
>> + ******************************************************************/
>> + /*
>> +- * Copyright � 2003 Sun Microsystems, Inc. All rights reserved.
>> ++ * Copyright © 2003 Sun Microsystems, Inc. All rights reserved.
>> +  * Use is subject to license terms specified in the COPYING file
>> +  * distributed with the Net-SNMP package.
>> +  */
>> +@@ -4215,7 +4215,8 @@ unload_all_mibs(void)
>> +         if (ptc->description)
>> +             free(ptc->description);
>> +     }
>> +-    memset(tclist, 0, tc_alloc * sizeof(struct tc));
>> ++    SNMP_FREE(tclist);
>> ++    tc_alloc = 0;
>> +
>> +     memset(buckets, 0, sizeof(buckets));
>> +     memset(nbuckets, 0, sizeof(nbuckets));
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
>> index eb8e1599fb..88466c94b4 100644
>> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
>> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
>> @@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
>>              file://reproducibility-have-printcap.patch \
>>              file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
>>              file://CVE-2022-44792-CVE-2022-44793.patch \
>> +           file://0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch \
>>              "
>>   SRC_URI[sha256sum] = "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a"
>>
>>
>>
>>
> Hello,
> The 0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch file needs to be slightly adapted to be working.
> See my patch below:
>
> From 54ba004a7c12cddcbcb020878fb03bbf52db2855 Mon Sep 17 00:00:00 2001
> From: Piotr Lewicki <piotr.l.lewicki@hitachienergy.com>
> Date: Mon, 10 Mar 2025 10:18:27 +0100
> Subject: [meta-oe][kirkstone][PATCH] net-snmp: Adapt patch that fixes memory
>  leak
>
> In commit d0c2a3d383dac9fe7e85b7d87784b7f5b5c62c5e the patch that fixes
> a memory leak has been backported to kirkstone branch, but it was not
> adapted. This commit adapts the patch to apply properly on this branch.
>
> Signed-off-by: Piotr Lewicki <piotr.l.lewicki@hitachienergy.com>
> ---
>  ...all_mibs-fix-memory-leak-by-freeing-tclist.patch | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch
> index cc498c7fc9..39f8ba1d61 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch
> @@ -13,19 +13,10 @@ Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
>  diff --git a/snmplib/parse.c b/snmplib/parse.c
> -index b3e2f3ae5c..71bdf75ff8 100644
> +index 9406f4f..2f9a201 100644
>  --- a/snmplib/parse.c
>  +++ b/snmplib/parse.c
> -@@ -28,7 +28,7 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
> - SOFTWARE.
> - ******************************************************************/
> - /*
> -- * Copyright � 2003 Sun Microsystems, Inc. All rights reserved.
> -+ * Copyright © 2003 Sun Microsystems, Inc. All rights reserved.
> -  * Use is subject to license terms specified in the COPYING file
> -  * distributed with the Net-SNMP package.
> -  */
> -@@ -4215,7 +4215,8 @@ unload_all_mibs(void)
> +@@ -4225,7 +4225,8 @@ unload_all_mibs(void)
>           if (ptc->description)
>               free(ptc->description);
>       }
> --
> 2.34.1
>
>
>
> Hitachi Energy Services Sp. z o. o. z siedzibą w Warszawie, adres: Warszawa 04-713, ul. Żegańska 1, wpisana do Rejestru Przedsiębiorców Krajowego Rejestru Sądowego prowadzonego w Sądzie Rejonowym dla m. st. Warszawy, XIV Wydział Gospodarczy Krajowego Rejestru Sądowego pod nr KRS 0000787719, nr REGON: 383431370, nr NIP: 9522196923, nr BDO: 000147611, kapitał zakładowy 14 403 850,00 zł.
> ________________________________
> Hitachi Energy Services Sp. z o. o. with registered seat at 1 Żeganska Street, 04-713 Warsaw, Poland, registered in the Register of Entrepreneurs of the Polish Court Register maintained by the District Court for the Capital City of Warsaw, XIV Economic Department, under KRS No. 0000787719, REGON No. (statistical number): 383431370, NIP No. (taxpayer identification number) PL9522196923, BDO No. (WEEE registration number) 000147611, share capital: 14 403 850,00 PLN.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115826): https://lists.openembedded.org/g/openembedded-devel/message/115826
> Mute This Topic: https://lists.openembedded.org/mt/111282761/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

