Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.67])
 by mx.groups.io with SMTP id smtpd.web12.11137.1594690485951471472
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2020 18:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XdvRunW5;
 spf=pass (domain: windriver.com, ip: 40.107.70.67, mailfrom: wenlin.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gADp/VO+79cIiHxBwUBNQbKut9cSdEvU/7jAyAaFoIl7t/arEFkGJOtIz3URBfa79JT2NJadRDIC2d1cXxvHHqK9iymPiPHzLlppAzKnT6PTQ7X9TG8P/pUUjNkbgdca+Sqzcnh+Q7lxpNuk43Ii8nO67CiA5R5eddZWtb4jlRR/QPYBkorinY2fcaxIXj3PQ7zivshu+yfC/iLwT7YfJgt8Kl+8E+QDOesvtTU+dIefq3zEGBmQbA+xtGLg9PUq3+5GbK4D+DFUE/CMFPRd87wwjDnu+snQPdARvn7R7rOE8E7YOT1cUdxbEykCRAFoSg5w4Xw8tXm5tqLz5lJglQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwLeQmkl6dpEFQYh4fj5GKc2BJ83f/dJ7YHs2mWio24=;
 b=b/9feXlXqNfEGFqWw1IfmQgejaqM0C4WwSl4MI2BB1kFT4f7nhi/7i/y6Q4ROD3Ln+w+YhOANWppVgLCXFc03tsgfzcScnlZJGjF1uQnpNpuBsA/oe8+T57OuyMDJnkb0cIzYEg2+H4/V8qNPsixIJdqHor3nquKA1Bx6shK4Xlu9DbnykJs911tj4vnuQpF9KA6oGZftYhxfqGbfPXI74SUUb2eD4M4IKflGjY1/8Y4qkYIy+OYSLviRk7uDImEgmzMZSc2HdnMo9JE7d7tod0ZNDvHlSE8yoP9U3wFUboVPuOEIwMzxMDjE6HJo8Ntx7DEywuXFUTqBUgTBdJEQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwLeQmkl6dpEFQYh4fj5GKc2BJ83f/dJ7YHs2mWio24=;
 b=XdvRunW5cJavYWgyVwNeJ1vzIBC/ZWlZbaPERACDc2APR2ueh56yY2fH69UbNQiKSPRgOCNrcphESR21ImWnmLPRXD+TD5uFKfwY+X0nMl6CS3HyJOvhJEN9ekgVqWxhgB3gCpUMtd6ONV+8kCNFAOaTigo8GIVAZT9Kw972DSw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2658.namprd11.prod.outlook.com (2603:10b6:406:ae::16)
 by BN6PR1101MB2098.namprd11.prod.outlook.com (2603:10b6:405:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Tue, 14 Jul
 2020 01:34:42 +0000
Received: from BN7PR11MB2658.namprd11.prod.outlook.com
 ([fe80::8101:4c9c:62bb:9361]) by BN7PR11MB2658.namprd11.prod.outlook.com
 ([fe80::8101:4c9c:62bb:9361%3]) with mapi id 15.20.3174.026; Tue, 14 Jul 2020
 01:34:41 +0000
Subject: Re: [oe][meta-networking][PATCH] net-snmp: Fix CVE-2019-20892
From: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <162147D70B85F95E.13247@lists.openembedded.org>
Message-ID: <fb49ff38-f7bc-e963-2a84-88bd03b68444@windriver.com>
Date: Tue, 14 Jul 2020 09:37:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <162147D70B85F95E.13247@lists.openembedded.org>
X-ClientProxiedBy: HK2PR06CA0020.apcprd06.prod.outlook.com
 (2603:1096:202:2e::32) To BN7PR11MB2658.namprd11.prod.outlook.com
 (2603:10b6:406:ae::16)
Return-Path: wenlin.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.167] (60.247.85.82) by HK2PR06CA0020.apcprd06.prod.outlook.com (2603:1096:202:2e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Tue, 14 Jul 2020 01:34:40 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ec6d743-4c48-496a-ff0e-08d827961448
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2098:
X-Microsoft-Antispam-PRVS: 
	<BN6PR1101MB20984648E2F9573AC70E8F57E1610@BN6PR1101MB2098.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:23;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j2eFpKKCw/vDz1FcSqD6Jf9vaCWK9hF9VAgUn0/o9McHSAa4SoTh1jlG4RYEx75/o//kpSJQ5ExOoUpnHcP244dDXCCA2UmUdPmS35iqp3kG68UQW/1r31+VHhCcsufm/VBeYuek+9I9jgBch2fompl5RxjYphQJOIMWPLEOnUNrmi7nV/9+Yk0LedsHS2HUi3u8oI0dXm6zj7SuxHfXy5Q6qhkcIpo1Z/fnhVleUnASSOVMQgPOFcqVuYBLefjDW5sWMGg/XT1gloi8lev+8db2OFXX/fEJoyTeC4OwHqI/56KbCvkMz1mNJLsfxWF4v0r6ahuMjHmYUhsT9sjnnTSTlSV+bMGJlhtoL0E4+D4Lrov34ZTLsf2USm1DO7W/I5zU7CrUgQLJ8oj1zJjOdmfQMA2dHrHik0BTv5QuENgJipjOxOetIudB8UjnkHmA+YBY3sT6/ZcYarc98cwu9ZxGwj9+aZ+0Fz15iM82cvYI5JUuxIai0QnWmuFuVXpJfG2UYMLu91O2XJ5smeYwYg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(376002)(39850400004)(396003)(136003)(166002)(6486002)(6916009)(86362001)(26005)(52116002)(6706004)(36756003)(16526019)(66946007)(31696002)(186003)(83380400001)(66476007)(66556008)(33964004)(16576012)(316002)(2906002)(478600001)(8676002)(8936002)(966005)(2616005)(31686004)(956004)(5660300002)(44832011)(30864003)(6666004)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vwoVLcgN3X2vkqEOJyxfkKWSAxHfkEvMVde4FR9OmbtDsA2VlknFEAz/J/7IvPGXUVoblHVpBJx7EnwX0SrsdHeQM78Cs1KvgnIfd/yh/tvO0ZkgRZZte7aJdFigHZDWzsiTzHqI4HIgMPOO8rq4xRdaMTVR+2fb72//kWofLQMSDtSDjAUs1KxbfmDWzUXOMFB5piPoJJe2fRzg1kvRvmc37gGwBGWPn+5NBS1pg5PhjyVnqbPMBanh9ES7b8EwoOrUCUkRnKVMpgtoRppGt5v8Fr6GyZAo+HqSyxqbjFeQ6iGgDmmBaw4DDNleY2HIWb+eVUOtVWlAMn8z6DN4loLR95dRqlQDXnUmsKCoWc/qTVsnZorqSlgpxx2LACfco1gwN6M6i3c9+qlObt0Fi2c9GxX+EpKAK6u34QFfLG4AUzKtJ8xOFf7drdFWVaI8av/DfveL1jalEBWm/ZlulP7/v/TJzI7vmCMxKFnjlIw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec6d743-4c48-496a-ff0e-08d827961448
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2020 01:34:41.5868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmosBAbCEKUX5D2cSfT2Ob5Rq9SR8ew4LjYHUE1TrV5GPeB1gYPHeFRraU5S55eoKiJQNQkJeStV5rFmuaaDvqa6vPipf62w0y8zzeekdfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2098
Content-Type: multipart/alternative;
 boundary="------------1AD2DACF821F97F2A7262D4B"
Content-Language: en-US

--------------1AD2DACF821F97F2A7262D4B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2020/7/13 下午6:05, wenlin.kang@windriver.com wrote:

Sorry, I miss [zeus], this should be applied to [oe][zeus][meta-networking]

> Fix CVE-2019-20892
>
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> ---
>   ...oduce-a-reference-count-in-struct-us.patch | 166 ++++++++++++++++++
>   .../net-snmp/net-snmp_5.8.bb                  |   1 +
>   2 files changed, 167 insertions(+)
>   create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch
> new file mode 100644
> index 000000000..99f02adb7
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch
> @@ -0,0 +1,166 @@
> +From 76819d992fdd88e3beb08b79851c6c129da7bc7e Mon Sep 17 00:00:00 2001
> +From: Bart Van Assche <bvanassche@acm.org>
> +Date: Fri, 10 Jul 2020 10:48:41 +0800
> +Subject: [PATCH] libsnmp, USM: Introduce a reference count in struct
> + usmStateReference
> +
> +This patch fixes https://sourceforge.net/p/net-snmp/bugs/2956/.
> +
> +Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/5f881d3bf24599b90d67a45cae7a3eb099cd71c9]
> +CVE: CVE-2019-20892
> +
> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> +---
> + include/net-snmp/library/snmpusm.h |  1 +
> + snmplib/snmp_client.c              | 21 +++-------
> + snmplib/snmpusm.c                  | 65 +++++++++++++++++++++---------
> + 3 files changed, 51 insertions(+), 36 deletions(-)
> +
> +diff --git a/include/net-snmp/library/snmpusm.h b/include/net-snmp/library/snmpusm.h
> +index 3f60787..87b31f3 100644
> +--- a/include/net-snmp/library/snmpusm.h
> ++++ b/include/net-snmp/library/snmpusm.h
> +@@ -43,6 +43,7 @@ extern          "C" {
> +      * Structures.
> +      */
> +     struct usmStateReference {
> ++        int             refcnt;
> +         char           *usr_name;
> +         size_t          usr_name_length;
> +         u_char         *usr_engine_id;
> +diff --git a/snmplib/snmp_client.c b/snmplib/snmp_client.c
> +index 2a46351..b2ea891 100644
> +--- a/snmplib/snmp_client.c
> ++++ b/snmplib/snmp_client.c
> +@@ -402,27 +402,16 @@ _clone_pdu_header(netsnmp_pdu *pdu)
> +         return NULL;
> +     }
> +
> +-    if (pdu->securityStateRef &&
> +-        pdu->command == SNMP_MSG_TRAP2) {
> +-
> +-        ret = usm_clone_usmStateReference((struct usmStateReference *) pdu->securityStateRef,
> +-                (struct usmStateReference **) &newpdu->securityStateRef );
> +-
> +-        if (ret)
> +-        {
> ++    sptr = find_sec_mod(newpdu->securityModel);
> ++    if (sptr && sptr->pdu_clone) {
> ++        /* call security model if it needs to know about this */
> ++        ret = sptr->pdu_clone(pdu, newpdu);
> ++        if (ret) {
> +             snmp_free_pdu(newpdu);
> +             return NULL;
> +         }
> +     }
> +
> +-    if ((sptr = find_sec_mod(newpdu->securityModel)) != NULL &&
> +-        sptr->pdu_clone != NULL) {
> +-        /*
> +-         * call security model if it needs to know about this
> +-         */
> +-        (*sptr->pdu_clone) (pdu, newpdu);
> +-    }
> +-
> +     return newpdu;
> + }
> +
> +diff --git a/snmplib/snmpusm.c b/snmplib/snmpusm.c
> +index 3cfa126..4d8edad 100644
> +--- a/snmplib/snmpusm.c
> ++++ b/snmplib/snmpusm.c
> +@@ -285,39 +285,63 @@ free_enginetime_on_shutdown(int majorid, int minorid, void *serverarg,
> + struct usmStateReference *
> + usm_malloc_usmStateReference(void)
> + {
> +-    struct usmStateReference *retval = (struct usmStateReference *)
> +-        calloc(1, sizeof(struct usmStateReference));
> ++    struct usmStateReference *retval;
> ++
> ++    retval = calloc(1, sizeof(struct usmStateReference));
> ++    if (retval)
> ++        retval->refcnt = 1;
> +
> +     return retval;
> + }                               /* end usm_malloc_usmStateReference() */
> +
> ++static int
> ++usm_clone(netsnmp_pdu *pdu, netsnmp_pdu *new_pdu)
> ++{
> ++    struct usmStateReference *ref = pdu->securityStateRef;
> ++    struct usmStateReference **new_ref =
> ++        (struct usmStateReference **)&new_pdu->securityStateRef;
> ++    int ret = 0;
> ++
> ++    if (!ref)
> ++        return ret;
> ++
> ++    if (pdu->command == SNMP_MSG_TRAP2) {
> ++        netsnmp_assert(pdu->securityModel == SNMP_DEFAULT_SECMODEL);
> ++        ret = usm_clone_usmStateReference(ref, new_ref);
> ++    } else {
> ++        netsnmp_assert(ref == *new_ref);
> ++        ref->refcnt++;
> ++    }
> ++
> ++    return ret;
> ++}
> +
> + void
> + usm_free_usmStateReference(void *old)
> + {
> +-    struct usmStateReference *old_ref = (struct usmStateReference *) old;
> +-
> +-    if (old_ref) {
> ++    struct usmStateReference *ref = old;
> +
> +-        SNMP_FREE(old_ref->usr_name);
> +-        SNMP_FREE(old_ref->usr_engine_id);
> +-        SNMP_FREE(old_ref->usr_auth_protocol);
> +-        SNMP_FREE(old_ref->usr_priv_protocol);
> +-
> +-        if (old_ref->usr_auth_key) {
> +-            SNMP_ZERO(old_ref->usr_auth_key, old_ref->usr_auth_key_length);
> +-            SNMP_FREE(old_ref->usr_auth_key);
> +-        }
> +-        if (old_ref->usr_priv_key) {
> +-            SNMP_ZERO(old_ref->usr_priv_key, old_ref->usr_priv_key_length);
> +-            SNMP_FREE(old_ref->usr_priv_key);
> +-        }
> ++    if (!ref)
> ++        return;
> +
> +-        SNMP_ZERO(old_ref, sizeof(*old_ref));
> +-        SNMP_FREE(old_ref);
> ++    if (--ref->refcnt > 0)
> ++        return;
> +
> ++    SNMP_FREE(ref->usr_name);
> ++    SNMP_FREE(ref->usr_engine_id);
> ++    SNMP_FREE(ref->usr_auth_protocol);
> ++    SNMP_FREE(ref->usr_priv_protocol);
> ++
> ++    if (ref->usr_auth_key_length && ref->usr_auth_key) {
> ++        SNMP_ZERO(ref->usr_auth_key, ref->usr_auth_key_length);
> ++        SNMP_FREE(ref->usr_auth_key);
> ++    }
> ++    if (ref->usr_priv_key_length && ref->usr_priv_key) {
> ++        SNMP_ZERO(ref->usr_priv_key, ref->usr_priv_key_length);
> ++        SNMP_FREE(ref->usr_priv_key);
> +     }
> +
> ++    SNMP_FREE(ref);
> + }                               /* end usm_free_usmStateReference() */
> +
> + struct usmUser *
> +@@ -3345,6 +3369,7 @@ init_usm(void)
> +     def->encode_reverse = usm_secmod_rgenerate_out_msg;
> +     def->encode_forward = usm_secmod_generate_out_msg;
> +     def->decode = usm_secmod_process_in_msg;
> ++    def->pdu_clone = usm_clone;
> +     def->pdu_free_state_ref = usm_free_usmStateReference;
> +     def->session_setup = usm_session_init;
> +     def->handle_report = usm_handle_report;
> +--
> +2.18.1
> +
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
> index 192b6b506..c23dcd3cf 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
> @@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
>              file://reproducibility-have-printcap.patch \
>              file://reproducibility-accept-configure-options-from-env.patch \
>              file://0001-net-snmp-fix-compile-error-disable-des.patch \
> +           file://0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch \
>              "
>   SRC_URI[md5sum] = "63bfc65fbb86cdb616598df1aff6458a"
>   SRC_URI[sha256sum] = "b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf"
>
> 


-- 
Thanks,
Wenlin Kang


--------------1AD2DACF821F97F2A7262D4B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2020/7/13 下午6:05,
      <a class="moz-txt-link-abbreviated" href="mailto:wenlin.kang@windriver.com">wenlin.kang@windriver.com</a> wrote:</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Sorry, I miss [zeus], this should be
      applied to [oe][zeus][meta-networking]<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <blockquote type="cite" cite="mid:162147D70B85F95E.13247@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Fix CVE-2019-20892

Signed-off-by: Wenlin Kang <a class="moz-txt-link-rfc2396E" href="mailto:wenlin.kang@windriver.com">&lt;wenlin.kang@windriver.com&gt;</a>
---
 ...oduce-a-reference-count-in-struct-us.patch | 166 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 .../net-snmp/net-snmp_5.8.bb                  |   1 &#43;
 2 files changed, 167 insertions(&#43;)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch
new file mode 100644
index 000000000..99f02adb7
--- /dev/null
&#43;&#43;&#43; b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch
@@ -0,0 &#43;1,166 @@
&#43;From 76819d992fdd88e3beb08b79851c6c129da7bc7e Mon Sep 17 00:00:00 2001
&#43;From: Bart Van Assche <a class="moz-txt-link-rfc2396E" href="mailto:bvanassche@acm.org">&lt;bvanassche@acm.org&gt;</a>
&#43;Date: Fri, 10 Jul 2020 10:48:41 &#43;0800
&#43;Subject: [PATCH] libsnmp, USM: Introduce a reference count in struct
&#43; usmStateReference
&#43;
&#43;This patch fixes <a class="moz-txt-link-freetext" href="https://sourceforge.net/p/net-snmp/bugs/2956/">https://sourceforge.net/p/net-snmp/bugs/2956/</a>.
&#43;
&#43;Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/net-snmp/net-snmp/commit/5f881d3bf24599b90d67a45cae7a3eb099cd71c9">https://github.com/net-snmp/net-snmp/commit/5f881d3bf24599b90d67a45cae7a3eb099cd71c9</a>]
&#43;CVE: CVE-2019-20892
&#43;
&#43;Signed-off-by: Wenlin Kang <a class="moz-txt-link-rfc2396E" href="mailto:wenlin.kang@windriver.com">&lt;wenlin.kang@windriver.com&gt;</a>
&#43;---
&#43; include/net-snmp/library/snmpusm.h |  1 &#43;
&#43; snmplib/snmp_client.c              | 21 &#43;&#43;&#43;-------
&#43; snmplib/snmpusm.c                  | 65 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---------
&#43; 3 files changed, 51 insertions(&#43;), 36 deletions(-)
&#43;
&#43;diff --git a/include/net-snmp/library/snmpusm.h b/include/net-snmp/library/snmpusm.h
&#43;index 3f60787..87b31f3 100644
&#43;--- a/include/net-snmp/library/snmpusm.h
&#43;&#43;&#43;&#43; b/include/net-snmp/library/snmpusm.h
&#43;@@ -43,6 &#43;43,7 @@ extern          &quot;C&quot; {
&#43;      * Structures.
&#43;      */
&#43;     struct usmStateReference {
&#43;&#43;        int             refcnt;
&#43;         char           *usr_name;
&#43;         size_t          usr_name_length;
&#43;         u_char         *usr_engine_id;
&#43;diff --git a/snmplib/snmp_client.c b/snmplib/snmp_client.c
&#43;index 2a46351..b2ea891 100644
&#43;--- a/snmplib/snmp_client.c
&#43;&#43;&#43;&#43; b/snmplib/snmp_client.c
&#43;@@ -402,27 &#43;402,16 @@ _clone_pdu_header(netsnmp_pdu *pdu)
&#43;         return NULL;
&#43;     }
&#43; 
&#43;-    if (pdu-&gt;securityStateRef &amp;&amp;
&#43;-        pdu-&gt;command == SNMP_MSG_TRAP2) {
&#43;-
&#43;-        ret = usm_clone_usmStateReference((struct usmStateReference *) pdu-&gt;securityStateRef,
&#43;-                (struct usmStateReference **) &amp;newpdu-&gt;securityStateRef );
&#43;-
&#43;-        if (ret)
&#43;-        {
&#43;&#43;    sptr = find_sec_mod(newpdu-&gt;securityModel);
&#43;&#43;    if (sptr &amp;&amp; sptr-&gt;pdu_clone) {
&#43;&#43;        /* call security model if it needs to know about this */
&#43;&#43;        ret = sptr-&gt;pdu_clone(pdu, newpdu);
&#43;&#43;        if (ret) {
&#43;             snmp_free_pdu(newpdu);
&#43;             return NULL;
&#43;         }
&#43;     }
&#43; 
&#43;-    if ((sptr = find_sec_mod(newpdu-&gt;securityModel)) != NULL &amp;&amp;
&#43;-        sptr-&gt;pdu_clone != NULL) {
&#43;-        /*
&#43;-         * call security model if it needs to know about this 
&#43;-         */
&#43;-        (*sptr-&gt;pdu_clone) (pdu, newpdu);
&#43;-    }
&#43;-
&#43;     return newpdu;
&#43; }
&#43; 
&#43;diff --git a/snmplib/snmpusm.c b/snmplib/snmpusm.c
&#43;index 3cfa126..4d8edad 100644
&#43;--- a/snmplib/snmpusm.c
&#43;&#43;&#43;&#43; b/snmplib/snmpusm.c
&#43;@@ -285,39 &#43;285,63 @@ free_enginetime_on_shutdown(int majorid, int minorid, void *serverarg,
&#43; struct usmStateReference *
&#43; usm_malloc_usmStateReference(void)
&#43; {
&#43;-    struct usmStateReference *retval = (struct usmStateReference *)
&#43;-        calloc(1, sizeof(struct usmStateReference));
&#43;&#43;    struct usmStateReference *retval;
&#43;&#43;
&#43;&#43;    retval = calloc(1, sizeof(struct usmStateReference));
&#43;&#43;    if (retval)
&#43;&#43;        retval-&gt;refcnt = 1;
&#43; 
&#43;     return retval;
&#43; }                               /* end usm_malloc_usmStateReference() */
&#43; 
&#43;&#43;static int
&#43;&#43;usm_clone(netsnmp_pdu *pdu, netsnmp_pdu *new_pdu)
&#43;&#43;{
&#43;&#43;    struct usmStateReference *ref = pdu-&gt;securityStateRef;
&#43;&#43;    struct usmStateReference **new_ref =
&#43;&#43;        (struct usmStateReference **)&amp;new_pdu-&gt;securityStateRef;
&#43;&#43;    int ret = 0;
&#43;&#43;
&#43;&#43;    if (!ref)
&#43;&#43;        return ret;
&#43;&#43;
&#43;&#43;    if (pdu-&gt;command == SNMP_MSG_TRAP2) {
&#43;&#43;        netsnmp_assert(pdu-&gt;securityModel == SNMP_DEFAULT_SECMODEL);
&#43;&#43;        ret = usm_clone_usmStateReference(ref, new_ref);
&#43;&#43;    } else {
&#43;&#43;        netsnmp_assert(ref == *new_ref);
&#43;&#43;        ref-&gt;refcnt&#43;&#43;;
&#43;&#43;    }
&#43;&#43;
&#43;&#43;    return ret;
&#43;&#43;}
&#43; 
&#43; void
&#43; usm_free_usmStateReference(void *old)
&#43; {
&#43;-    struct usmStateReference *old_ref = (struct usmStateReference *) old;
&#43;-
&#43;-    if (old_ref) {
&#43;&#43;    struct usmStateReference *ref = old;
&#43; 
&#43;-        SNMP_FREE(old_ref-&gt;usr_name);
&#43;-        SNMP_FREE(old_ref-&gt;usr_engine_id);
&#43;-        SNMP_FREE(old_ref-&gt;usr_auth_protocol);
&#43;-        SNMP_FREE(old_ref-&gt;usr_priv_protocol);
&#43;-
&#43;-        if (old_ref-&gt;usr_auth_key) {
&#43;-            SNMP_ZERO(old_ref-&gt;usr_auth_key, old_ref-&gt;usr_auth_key_length);
&#43;-            SNMP_FREE(old_ref-&gt;usr_auth_key);
&#43;-        }
&#43;-        if (old_ref-&gt;usr_priv_key) {
&#43;-            SNMP_ZERO(old_ref-&gt;usr_priv_key, old_ref-&gt;usr_priv_key_length);
&#43;-            SNMP_FREE(old_ref-&gt;usr_priv_key);
&#43;-        }
&#43;&#43;    if (!ref)
&#43;&#43;        return;
&#43; 
&#43;-        SNMP_ZERO(old_ref, sizeof(*old_ref));
&#43;-        SNMP_FREE(old_ref);
&#43;&#43;    if (--ref-&gt;refcnt &gt; 0)
&#43;&#43;        return;
&#43; 
&#43;&#43;    SNMP_FREE(ref-&gt;usr_name);
&#43;&#43;    SNMP_FREE(ref-&gt;usr_engine_id);
&#43;&#43;    SNMP_FREE(ref-&gt;usr_auth_protocol);
&#43;&#43;    SNMP_FREE(ref-&gt;usr_priv_protocol);
&#43;&#43; 
&#43;&#43;    if (ref-&gt;usr_auth_key_length &amp;&amp; ref-&gt;usr_auth_key) {
&#43;&#43;        SNMP_ZERO(ref-&gt;usr_auth_key, ref-&gt;usr_auth_key_length);
&#43;&#43;        SNMP_FREE(ref-&gt;usr_auth_key);
&#43;&#43;    }
&#43;&#43;    if (ref-&gt;usr_priv_key_length &amp;&amp; ref-&gt;usr_priv_key) {
&#43;&#43;        SNMP_ZERO(ref-&gt;usr_priv_key, ref-&gt;usr_priv_key_length);
&#43;&#43;        SNMP_FREE(ref-&gt;usr_priv_key);
&#43;     }
&#43; 
&#43;&#43;    SNMP_FREE(ref);
&#43; }                               /* end usm_free_usmStateReference() */
&#43; 
&#43; struct usmUser *
&#43;@@ -3345,6 &#43;3369,7 @@ init_usm(void)
&#43;     def-&gt;encode_reverse = usm_secmod_rgenerate_out_msg;
&#43;     def-&gt;encode_forward = usm_secmod_generate_out_msg;
&#43;     def-&gt;decode = usm_secmod_process_in_msg;
&#43;&#43;    def-&gt;pdu_clone = usm_clone;
&#43;     def-&gt;pdu_free_state_ref = usm_free_usmStateReference;
&#43;     def-&gt;session_setup = usm_session_init;
&#43;     def-&gt;handle_report = usm_handle_report;
&#43;-- 
&#43;2.18.1
&#43;
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 192b6b506..c23dcd3cf 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
&#43;&#43;&#43; b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -27,6 &#43;27,7 @@ SRC_URI = &quot;${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            <a class="moz-txt-link-freetext" href="file://reproducibility-have-printcap.patch">file://reproducibility-have-printcap.patch</a> \
            <a class="moz-txt-link-freetext" href="file://reproducibility-accept-configure-options-from-env.patch">file://reproducibility-accept-configure-options-from-env.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-net-snmp-fix-compile-error-disable-des.patch">file://0001-net-snmp-fix-compile-error-disable-des.patch</a> \
&#43;           <a class="moz-txt-link-freetext" href="file://0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch">file://0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch</a> \
            &quot;
 SRC_URI[md5sum] = &quot;63bfc65fbb86cdb616598df1aff6458a&quot;
 SRC_URI[sha256sum] = &quot;b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Thanks,
Wenlin Kang</pre>
  </body>
</html>

--------------1AD2DACF821F97F2A7262D4B--
