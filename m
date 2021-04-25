Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.57])
 by mx.groups.io with SMTP id smtpd.web11.8825.1619336865670536643
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Apr 2021 00:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FrV4hikc;
 spf=pass (domain: windriver.com, ip: 40.107.223.57, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXO6vtU+fcC6S92kosZ70c+X/ISzJbY4PyLxpkiOJfg+8y0q9WR44x04ktW9/3ybVbKecDuRx3zfwNNJIpnBGADLmwFm3vlQZujR67ZaV0Qox7p/+m6TINKbWj5kyIPyet2ZdDennGtHbRaytAoPaaLFFUaqHjyoP/cpSUFnB7zazYHb1K8QmvscavaQwh710gxLd93iBquq3p+Od1FEYOYyDFKQ9R8eOLuU+VihFXFxaot3ihtk+P+Y8nhE17v9y/xWXDjUHcyg1WXr4MKu0vKmlQvR1aCsTjG8FM8FH8eVkP5mKiJFSBH8woLD0kZst3Y0eF04SpwMnlnhnXsVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1rSVjxaz4Ulrg+ohLXe4FEjG1ppLlIe661GxJ//UpY=;
 b=CYUmKJlYMHTyUAqqYznHKL0Wgb9sjLTPrT4yU23PJNEbvSYlZgOWmiVSE8Gi7xM2hjetuarK8KRy5+n5xrIT+lALST+1yYuW1pStzPqkW6fIyhWNpcroeJRsr/4ECBUE9ZSgAQRySmwVxl8+B1fvZzNBwg7yH3ovbeex5vVSKOPHJPFSaZii6RSiLJP0/Uh7QHPHOEqF7AV9/B70YWfNbW7bs49qWD/A6LeMGAk8jeIVYTf3jH23SNZOxVyp9jHuZMwI5Vh5PgeMZdz5eKschX1zPG0RgZescbapz6Z2Bu9eH/6/lp8WcDk6OPUPjnAe/LHWvYno1M5R+pdJGPmhLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1rSVjxaz4Ulrg+ohLXe4FEjG1ppLlIe661GxJ//UpY=;
 b=FrV4hikc31WUTroNaMwZ272Ikzp7hwPkLx6ZaEpd97uYyRnFHWcVbLyONEdhg4VstBF5yN7RvVaSWSKeIN5LHZIYH2enlmC6uIQKlPyKxzrteN+zuePkJ6BtyfnLb5f9XmEirYdh6GhOnI2Tux/V3ybFFiJPAIEgImMbHenxOoQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1949.namprd11.prod.outlook.com (2603:10b6:300:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Sun, 25 Apr
 2021 07:47:43 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c129:2a53:5093:81e8]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c129:2a53:5093:81e8%3]) with mapi id 15.20.4065.025; Sun, 25 Apr 2021
 07:47:43 +0000
Subject: Re: [oe] [meta-oe][hardknott][PATCH 1/2] php: Upgrade to 7.4.16
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <1678669C913490A8.14065@lists.openembedded.org>
Message-ID: <67b43873-0bfb-b7ee-d8c9-509061869841@windriver.com>
Date: Sun, 25 Apr 2021 15:46:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1678669C913490A8.14065@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0047.apcprd04.prod.outlook.com
 (2603:1096:202:14::15) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.140] (60.247.85.82) by HK2PR04CA0047.apcprd04.prod.outlook.com (2603:1096:202:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend Transport; Sun, 25 Apr 2021 07:47:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad86b28a-5033-4ccc-e477-08d907be68e2
X-MS-TrafficTypeDiagnostic: MWHPR11MB1949:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1949BD3BB915DC3DB3062F3EF1439@MWHPR11MB1949.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nn2Bca/sATuZxOVujXyEhubLDi6O1ABXnzQnALC9t/zOxOVh85g+q6kNkyDjIQV9wjyQ7mz7s2NnhPRi51qbm19aRnthFahCMQhdlVsQo+KvZ2x3GOPSn94SHAVHS20HiGTlQGfvnNgwS9qHviIQnm27aELxC34UJTGyEJQbgrO87gWxhUlMLIEm80gdNpWFMtTYcSNKRvjhzyjlfYp177OMY+7FTtj++QKfPV770uXggS3ksEL8B57aGfaQ3O8PhpSneOf68dTt2XFA0GpKMPndmgWCpBmaIHRnBTeHYx832GraskIki8TDOBAmkSEYf8EXeULP1YjaPKzp7M5kNXPQdcfsK5UK+igsZSLNKGDR1EKDw7vmDPLyIzFAAtNb8Vj+ZCv/x+mHcI+DtYIzg5ojVjST4cWQUIZ/9JMfYudC5VdOkAilKHUt1hIdaMA898qAEvzNgyUIa+Oq/SyhxVeerp+y2S7yb1m2RYpnkO6KtC15wa1GNCqQfCOmIBQKGxH/TVq2YFLO7QTf8n/KgPYrNB/4xhBKpkNu8yifVuMGos8C+hhNuxgrQb8rTNFzr8kZQHHbzLzerq9lsGAilrTY4WE4OUk4Nl2F6BtyXpakGi85eMqp2ZhT0NwVKY/Tp1HRCNOsKbdINErCOOLcnrTUkBaXvF+09QXg7ccpAdnsxVpbNinsRqCDBR9KqW9lmZUm9IjTlh5hxeR7BXHgtg+sc+cow/bzLyfNPwLdld03z5Jv/zboB3ByMVKaz5+K+TZH1YjvmHaCZ5UlmAEevfz1c40NQXmOvaqSrZfVjczyEpepFtGt6Oljmsh7O85Q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39830400003)(396003)(346002)(376002)(52116002)(8936002)(8676002)(36756003)(38100700002)(31686004)(2906002)(53546011)(6706004)(6916009)(38350700002)(26005)(31696002)(66476007)(478600001)(66556008)(966005)(186003)(16526019)(5660300002)(16576012)(6486002)(316002)(66946007)(86362001)(956004)(2616005)(83380400001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cUU4c1ViWUkwSlB4Zmsxam5hQkk1TXFMaGQ4WUdKWUJueEgyR08wbitjUFZO?=
 =?utf-8?B?L2lVeFY1Z1JZcUhQOVJ3TnhWdWdpTjgxOGU5OWU4L3ptQ0htT05OZTFMU1pU?=
 =?utf-8?B?SzRlWEtQcFlDZWpMdU5weFZQeVd1L05oSFluOGVGQm5TWnY0Rks0bmt2S2wx?=
 =?utf-8?B?WTY1ZXNOdXByQkxqREM0N1orUFVnSkN1L3VyUWJyZHloNTlranR2VlRKSVpB?=
 =?utf-8?B?S3VRY0lhRlBId2x4RXkzR0MrMUVKcU5hOU5MOVhMalJxMDdDUVF4MS8vSVp3?=
 =?utf-8?B?TFM2ZVBnU3NHaUtPWWg3WVJrNU5ubWJ2U0FpV2lDWVRIUVBVeTBSNlh2TkxQ?=
 =?utf-8?B?bm42MW9maFlyNVA4OUhURDFlbVlkcFVPVFZXUWNBTUlyZ3lEV21uSm5ZZkVo?=
 =?utf-8?B?SjlNcFhIK20yT21UK3JuMThxOFp1S2RwMUdjZGxBd0RCOHpWekREUWZQMWdo?=
 =?utf-8?B?MEIzaXc1ak1YaVEwTzZ1K1pFeVVKWVdXcEdpVXNBUktrZmtaNTA5R0dVeFNR?=
 =?utf-8?B?eWRmS1VWSGUvTDhHa2tHWWs0cW1yVHBxUVFVWEFxb2Z5YkszblpNZDdrUXZD?=
 =?utf-8?B?SkFmTFUzaUxnazBTYVkwOTJ5d2E5UU1GQ2xmVXVWYWJxZi9GaXQ5c0JpR090?=
 =?utf-8?B?b0xKcUtYNWFtWXFtTSs4c21IaS80RGJkNjRHYWJFRitPWXByc0ZhdldRaDA5?=
 =?utf-8?B?eUZJMUFXNzdtd1RvWU9ES05lczltdzhReUZrUGJJQm4yS1Jpcm82L0xYT3Bx?=
 =?utf-8?B?NXpZckFCVnZDdWo0ZFZ6cWZNcWs1NUFHcTRlVVlIdUJ3VTFpN01ESTJpZG5I?=
 =?utf-8?B?MWFBQ3hKbVNia2c5RUhESjRCcCthdnF6TXZCZktQYTlYZVMvbFYyMFYyZUhr?=
 =?utf-8?B?ZWUvWmZ6cE4rZzNxL1JrWEFVSHAxVmtGVE5ibC9uTWVCeVdGejN1YmdXaEVX?=
 =?utf-8?B?UkdPSUpETHN3TmdnZ1MxQkNxb1J5TDlmcUxtMDFSN1BNRkJWT1Y4a2RPQ0ZO?=
 =?utf-8?B?b3pkRHMxRjNkUkFWY3dZZnhUSTRsZHhFczFkVGJwRHpMQkxsVFdtd3dOUlpr?=
 =?utf-8?B?akhHUHRWMld3NEVkNmJRMGhEMFY0UkEwUHZ6SjFjWVY0NjhyajFwdSs3SThI?=
 =?utf-8?B?bXBQbmlOaEtvWWxrSk85UFR1dXFFRm1QNTRtVmNnK2dzb0VHUG9aTnJVZlBv?=
 =?utf-8?B?M0NUSi9XVUk4V2M1TkJJTWw2S2tRQWthVzBNTFJMMExRR21NQlpVU1pxL0k1?=
 =?utf-8?B?cUJacW5leE9QeWZ6NWlYRGl2NTk2V2VycGFiMVpVd0lEK0Z1U1YxOURyeFJU?=
 =?utf-8?B?U0xHVUZUUzJEQVlvMVk4b0N0T3ZocXJSSnlvTElHNEwreEpNNFpOK1VQNTBa?=
 =?utf-8?B?T0dXS1F4bEoyRVovWDFxcmZFcE93NXdla0JmNkZ5TGdqV2dBamZFdzVUbmV4?=
 =?utf-8?B?dnBFVkNEUmwwbFpFMXUyMkJaTWs3Z3BGM3NPNktRY3I5UUxKdjVMQ3ZzejRa?=
 =?utf-8?B?ampkWVdBN3RycDk3aFp2bWxHbGQ4MkJtbVN6MUlaRXRiUXRwVm9RSElsa0U5?=
 =?utf-8?B?OVMwczlVZ21NblN0MXVEV3R5VXN5SzYwektObFZXNURkajdyRGMxbVB5L1VZ?=
 =?utf-8?B?ak9QR1pZZUpkTHh4V2NJbjJYSjRFMWEzZ0J6eGVLOHYyNjcrM09oR0FmKzRn?=
 =?utf-8?B?VUhFbVNWT3pXcEFMY29Cc2pvVTRoaWErSitNN1VlUTNKd0dObUVlL0JxVkg1?=
 =?utf-8?Q?vieOPHcQH4nyvfcCi3ymI5yTxCa0irGuSFRXg4R?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad86b28a-5033-4ccc-e477-08d907be68e2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2021 07:47:43.5781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4+2E1pojDgS9hCjlb1H+1kgVf3GhPlSkz0Kc056JjumEVmxGyyDaSUDpP45Tr/DArKbWGJRtpIXxovH414gMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1949
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

Thanks,

On 4/23/21 1:48 PM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> License-Update: License updated (year updated)
> 
> Fix some security issues such as CVE-2021-21702 and remove two
> cve patches which already included in the new version.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../php/php/CVE-2020-7069.patch               | 158 ------------------
>   .../php/php/CVE-2020-7070.patch               |  24 ---
>   .../php/{php_7.4.9.bb => php_7.4.16.bb}       |   7 +-
>   3 files changed, 2 insertions(+), 187 deletions(-)
>   delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
>   delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
>   rename meta-oe/recipes-devtools/php/{php_7.4.9.bb => php_7.4.16.bb} (97%)
> 
> diff --git a/meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch b/meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
> deleted file mode 100644
> index 0cf4d5ed6..000000000
> --- a/meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
> +++ /dev/null
> @@ -1,158 +0,0 @@
> -Subject: Fix bug #79601 (Wrong ciphertext/tag in AES-CCM encryption
> - for a 12 bytes IV)
> -
> ----
> - ext/openssl/openssl.c                      | 10 ++++-----
> - ext/openssl/tests/cipher_tests.inc         | 21 +++++++++++++++++
> - ext/openssl/tests/openssl_decrypt_ccm.phpt | 22 +++++++++++-------
> - ext/openssl/tests/openssl_encrypt_ccm.phpt | 26 ++++++++++++++--------
> - 4 files changed, 57 insertions(+), 22 deletions(-)
> -
> -diff --git a/ext/openssl/openssl.c b/ext/openssl/openssl.c
> -index 04cb9b0f..fdad2c3b 100644
> ---- a/ext/openssl/openssl.c
> -+++ b/ext/openssl/openssl.c
> -@@ -6521,11 +6521,6 @@ static int php_openssl_validate_iv(char **piv, size_t *piv_len, size_t iv_requir
> - {
> - 	char *iv_new;
> -
> --	/* Best case scenario, user behaved */
> --	if (*piv_len == iv_required_len) {
> --		return SUCCESS;
> --	}
> --
> - 	if (mode->is_aead) {
> - 		if (EVP_CIPHER_CTX_ctrl(cipher_ctx, mode->aead_ivlen_flag, *piv_len, NULL) != 1) {
> - 			php_error_docref(NULL, E_WARNING, "Setting of IV length for AEAD mode failed");
> -@@ -6534,6 +6529,11 @@ static int php_openssl_validate_iv(char **piv, size_t *piv_len, size_t iv_requir
> - 		return SUCCESS;
> - 	}
> -
> -+	/* Best case scenario, user behaved */
> -+	if (*piv_len == iv_required_len) {
> -+		return SUCCESS;
> -+	}
> -+
> - 	iv_new = ecalloc(1, iv_required_len + 1);
> -
> - 	if (*piv_len == 0) {
> -diff --git a/ext/openssl/tests/cipher_tests.inc b/ext/openssl/tests/cipher_tests.inc
> -index b1e46b41..779bfa85 100644
> ---- a/ext/openssl/tests/cipher_tests.inc
> -+++ b/ext/openssl/tests/cipher_tests.inc
> -@@ -1,5 +1,26 @@
> - <?php
> - $php_openssl_cipher_tests = array(
> -+    'aes-128-ccm' => array(
> -+        array(
> -+            'key' => '404142434445464748494a4b4c4d4e4f',
> -+            'iv'  => '1011121314151617',
> -+            'aad' => '000102030405060708090a0b0c0d0e0f',
> -+            'tag' => '1fc64fbfaccd',
> -+            'pt'  => '202122232425262728292a2b2c2d2e2f',
> -+            'ct'  => 'd2a1f0e051ea5f62081a7792073d593d',
> -+        ),
> -+        array(
> -+            'key' => '404142434445464748494a4b4c4d4e4f',
> -+            'iv'  => '101112131415161718191a1b',
> -+            'aad' => '000102030405060708090a0b0c0d0e0f' .
> -+                     '10111213',
> -+            'tag' => '484392fbc1b09951',
> -+            'pt'  => '202122232425262728292a2b2c2d2e2f' .
> -+                     '3031323334353637',
> -+            'ct'  => 'e3b201a9f5b71a7a9b1ceaeccd97e70b' .
> -+                     '6176aad9a4428aa5',
> -+        ),
> -+    ),
> -     'aes-256-ccm' => array(
> -         array(
> -             'key' => '1bde3251d41a8b5ea013c195ae128b21' .
> -diff --git a/ext/openssl/tests/openssl_decrypt_ccm.phpt b/ext/openssl/tests/openssl_decrypt_ccm.phpt
> -index a5f01b87..08ef5bb7 100644
> ---- a/ext/openssl/tests/openssl_decrypt_ccm.phpt
> -+++ b/ext/openssl/tests/openssl_decrypt_ccm.phpt
> -@@ -10,14 +10,16 @@ if (!in_array('aes-256-ccm', openssl_get_cipher_methods()))
> - --FILE--
> - <?php
> - require_once __DIR__ . "/cipher_tests.inc";
> --$method = 'aes-256-ccm';
> --$tests = openssl_get_cipher_tests($method);
> -+$methods = ['aes-128-ccm', 'aes-256-ccm'];
> -
> --foreach ($tests as $idx => $test) {
> --    echo "TEST $idx\n";
> --    $pt = openssl_decrypt($test['ct'], $method, $test['key'], OPENSSL_RAW_DATA,
> --        $test['iv'], $test['tag'], $test['aad']);
> --    var_dump($test['pt'] === $pt);
> -+foreach ($methods as $method) {
> -+    $tests = openssl_get_cipher_tests($method);
> -+    foreach ($tests as $idx => $test) {
> -+        echo "$method - TEST $idx\n";
> -+        $pt = openssl_decrypt($test['ct'], $method, $test['key'], OPENSSL_RAW_DATA,
> -+            $test['iv'], $test['tag'], $test['aad']);
> -+        var_dump($test['pt'] === $pt);
> -+    }
> - }
> -
> - // no IV
> -@@ -32,7 +34,11 @@ var_dump(openssl_decrypt($test['ct'], $method, $test['key'], OPENSSL_RAW_DATA,
> -
> - ?>
> - --EXPECTF--
> --TEST 0
> -+aes-128-ccm - TEST 0
> -+bool(true)
> -+aes-128-ccm - TEST 1
> -+bool(true)
> -+aes-256-ccm - TEST 0
> - bool(true)
> -
> - Warning: openssl_decrypt(): Setting of IV length for AEAD mode failed in %s on line %d
> -diff --git a/ext/openssl/tests/openssl_encrypt_ccm.phpt b/ext/openssl/tests/openssl_encrypt_ccm.phpt
> -index fb5dbbc8..8c4c41f8 100644
> ---- a/ext/openssl/tests/openssl_encrypt_ccm.phpt
> -+++ b/ext/openssl/tests/openssl_encrypt_ccm.phpt
> -@@ -10,15 +10,17 @@ if (!in_array('aes-256-ccm', openssl_get_cipher_methods()))
> - --FILE--
> - <?php
> - require_once __DIR__ . "/cipher_tests.inc";
> --$method = 'aes-256-ccm';
> --$tests = openssl_get_cipher_tests($method);
> -+$methods = ['aes-128-ccm', 'aes-256-ccm'];
> -
> --foreach ($tests as $idx => $test) {
> --    echo "TEST $idx\n";
> --    $ct = openssl_encrypt($test['pt'], $method, $test['key'], OPENSSL_RAW_DATA,
> --        $test['iv'], $tag, $test['aad'], strlen($test['tag']));
> --    var_dump($test['ct'] === $ct);
> --    var_dump($test['tag'] === $tag);
> -+foreach ($methods as $method) {
> -+    $tests = openssl_get_cipher_tests($method);
> -+    foreach ($tests as $idx => $test) {
> -+        echo "$method - TEST $idx\n";
> -+        $ct = openssl_encrypt($test['pt'], $method, $test['key'], OPENSSL_RAW_DATA,
> -+            $test['iv'], $tag, $test['aad'], strlen($test['tag']));
> -+        var_dump($test['ct'] === $ct);
> -+        var_dump($test['tag'] === $tag);
> -+    }
> - }
> -
> - // Empty IV error
> -@@ -32,7 +34,13 @@ var_dump(strlen($tag));
> - var_dump(openssl_encrypt('data', $method, 'password', 0, str_repeat('x', 16), $tag, '', 1024));
> - ?>
> - --EXPECTF--
> --TEST 0
> -+aes-128-ccm - TEST 0
> -+bool(true)
> -+bool(true)
> -+aes-128-ccm - TEST 1
> -+bool(true)
> -+bool(true)
> -+aes-256-ccm - TEST 0
> - bool(true)
> - bool(true)
> -
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch b/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
> deleted file mode 100644
> index e5b527f98..000000000
> --- a/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Subject: Patch fix-urldecode for HTTP related Bug #79699
> -
> ----
> - main/php_variables.c | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/main/php_variables.c b/main/php_variables.c
> -index 1a40c2a1..cbdc7cf1 100644
> ---- a/main/php_variables.c
> -+++ b/main/php_variables.c
> -@@ -514,7 +514,9 @@ SAPI_API SAPI_TREAT_DATA_FUNC(php_default_treat_data)
> - 		}
> -
> - 		val = estrndup(val, val_len);
> --		php_url_decode(var, strlen(var));
> -+		if (arg != PARSE_COOKIE) {
> -+			php_url_decode(var, strlen(var));
> -+		}
> - 		if (sapi_module.input_filter(arg, var, &val, val_len, &new_val_len)) {
> - 			php_register_variable_safe(var, val, new_val_len, &array);
> - 		}
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-devtools/php/php_7.4.16.bb
> similarity index 97%
> rename from meta-oe/recipes-devtools/php/php_7.4.9.bb
> rename to meta-oe/recipes-devtools/php/php_7.4.16.bb
> index e19d5dd21..821d9cd04 100644
> --- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
> +++ b/meta-oe/recipes-devtools/php/php_7.4.16.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.php.net"
>   SECTION = "console/network"
>   
>   LICENSE = "PHP-3.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=7e571b888d585b31f9ef5edcc647fa30"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=99532e0f6620bc9bca34f12fadaee33c"
>   
>   BBCLASSEXTEND = "native"
>   DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native"
> @@ -30,13 +30,10 @@ SRC_URI_append_class-target = " \
>               file://phar-makefile.patch \
>               file://0001-opcache-config.m4-enable-opcache.patch \
>               file://xfail_two_bug_tests.patch \
> -            file://CVE-2020-7070.patch \
> -            file://CVE-2020-7069.patch \
>             "
>   
>   S = "${WORKDIR}/php-${PV}"
> -SRC_URI[md5sum] = "e68a66c54b080d108831f6dc2e1e403d"
> -SRC_URI[sha256sum] = "2e270958a4216480da7886743438ccc92b6acf32ea96fefda88d07e0a5095deb"
> +SRC_URI[sha256sum] = "85710f007cfd0fae94e13a02a3a036f4e81ef43693260cae8a2e1ca93659ce3e"
>   
>   inherit autotools pkgconfig python3native gettext
>   
> 
> 
> 
> 
> 
