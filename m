Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.66])
 by mx.groups.io with SMTP id smtpd.web08.10416.1612879396654605780
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 06:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OZK9Si25;
 spf=pass (domain: windriver.com, ip: 40.107.243.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJUogqRwOnhkcgwvbI+2IvEREJ9YVgDtvp17jTfGa9fDE7Nt/UcIj1OT5McDNyiNC2oZR5ttd4FiIphXaMpQeazGsPwWkG2/B4BRPC8UD18O1pF0xoxV8AG2yh0ufqckeRiAMkP+zsm6OXIFEpEZrODAWF6xul9P8IFaRloBSKMPW9he0ReakORKrhj++NNdFqhZ4pPT/VAI9J0yLmHJxesg3WhmQDAkyJ9z1oTutNqLASxUNbEIs1FnBVHAYxM89179R6nywA8YWMSyKubErPxKVZi/7GqzaVEtbuoAgOtGcUvzAeJ56+RKi9rhtM443OIfdMVBzaXCLXUpaJoFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiRflIhCrCx30s9F7j00X5uMddP+q0OycfyOGEWbuWk=;
 b=WGexXLpeejODWbtgQN4XPMICQ4KLRVbFQu+QQpKmfxjfs/z8DV/k1F+WLo2EzjeA28mqNCP+NEzY+m+vyakvMzgDWL7cRIRn3gLU31ZO0CNDKO/JYrLlc0fg4KN+9LKm76LLEsb4KQ8VnK8m8mSG16my7BrB0uU2ARcGtqd7GewYD4qVpgVv90SkrYZMQwkZ9n6CxfAqFyf0Dk21q7dzJe+Fg2Qe50T+V9uPvMHYoW0RRVoTVTpUsQWQmfuYZdgNyGZUSYhG8UxUw9GxHAYn4Bx6KcmkGDwWLlTzAtXrz5FjtEwjsIB6s4F1lY5yWgKUPo5mewhW/mPgBVKCHWx6AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiRflIhCrCx30s9F7j00X5uMddP+q0OycfyOGEWbuWk=;
 b=OZK9Si25JqVh0/xpyCuOB/PqN7LvwFk9QmISMnOH4mQ+qImbPbjHGxvqllGmhX0DT+dnOwQeaJD/FXo9XmgrJicFXyk1xTIWCsQPUrPuWzeoZGMCnVLuyDspQxAmu4K4X8S8VTBNDFI0p0NCzzuy4aaktwzaBs9tGfKGiKmeV7M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 9 Feb
 2021 14:03:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 14:03:15 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-flask-socketio: update to 4.3.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210206230428.4106796-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4eaaadd5-f44a-d1c9-ef0d-6ec793d37ae5@windriver.com>
Date: Tue, 9 Feb 2021 09:03:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210206230428.4106796-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR16CA0030.namprd16.prod.outlook.com
 (2603:10b6:405:14::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR16CA0030.namprd16.prod.outlook.com (2603:10b6:405:14::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend Transport; Tue, 9 Feb 2021 14:03:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a44e5e8-410e-4861-295e-08d8cd0371f4
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5165:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB51657536BDE283E9D536D4FD9F8E9@SJ0PR11MB5165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2nd2PxlK/WmnhEl4OMZWSXaPtJSvAKjRxZe0W/RBsDXuWXicfsqFCb0EIhEhuKrQz6ZkwoLcNThcQqGtm0OQ77WPvl1IoPqCARMkFGtsM0nvcvDW4CbrvXBnMKcI4e80JMKv64IxVD42qWvAWV8bt1Evj4gvfS8FbrS/JHKa55L4TSoN5UB3LMy2Ge3ylOS0ONcMRFmNkOhwTMxyH/3BqOq65wDFN0hqlCtE09sCfTzuB7hdMiMna1RmiSurtMnzKV+2uQ+PkniPzwnL9DaT7H7hf4CaIIu9t58fDlCczwHfmptizf48A1dfd0VVE4btE3DulIU0Aj38+/YEvY6DVyjHM5qa2w8IkxMmieQeC4YrHTFaYjAsiOBh22AxWpvIkfckVy5/15+wu30BOWOx/Nd9EhAvUD8YQZzV2flD06qezIf3jIDK6mEyp4Fw3ER+O9k3vkt8bT/WPxlpNjTcPMSY3lO9U+FlFjKFelKb7PcfUJDw4gEl/t5q8Pvef8EPXXS/j3U+5MTiffa+fV1tPohPYaUd52lKxkutL7zaNpLODn6sFaibyUUIjzJTJQMuUTyWHQH24y+lGW/k57K8KPykBQzFCaqivUjFAlPSJJ3zhll5NEgPrHqhgmOKE0p6r11OXP1aqzo9b+SZvKGIqtlhnCHuxmcZCR3zDgHrtT6Zqp5NeDcWIiG0dGfoqoUN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39850400004)(376002)(346002)(36756003)(186003)(16526019)(31686004)(956004)(44832011)(166002)(86362001)(15650500001)(66556008)(66476007)(66946007)(2906002)(83380400001)(6486002)(316002)(5660300002)(16576012)(26005)(33964004)(966005)(2616005)(52116002)(8676002)(31696002)(478600001)(8936002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/nOuCJyvB0wEoZMfXFESrctnF0MVG1pREo5rbsFuwncfVApUP3Lr0IcBBQICS1G0UjUrYT1P8Oc+Lesdzc33H/hMDti2dm/9QuJgfgXBtgR/POCBp4OS1zR5Nqg+EMODD0sWtCJDTEJNgB9gyWpEBnDBqLGlh6OtuJ8/qT5cypkv7kT/klJCtpjFwQS2o8adchccOJKqjxUbpsA4/khBJM8V3y3hzDUOe3XSfPMtWf+2+sA7L1sey5EhDo/EChqA+agNI9rcak9w8XnqTKqmomqQrz1hgvt0hV1pd4wq/TDsFPUw/eoZml69oFXMH99PQT2hiQH13UlSesDkqX46AZlJJREuiww+lJwxfNqxsPKlv/NbbxGMbDFnX0dZrzRR+CNWfsyLSSTjdCZVcCigFh8CSv2Y1w8n/f2j5/LpR/ckXuH4qFJsQAPF/JERqB2A23b/3BPa5VAbj0XgR70MVsJ9+A8P/19HBCmwQ1UjNkEV+nSRS4cPaKmiGPR1zwNMx/e/1R1rERfS9MlbHElycJuXn6mzkPYxyEUtthqQpqjglkzGxwVKyNrcu8pcgoEPNqDYVwlMoT6LdDyltbn6LNFqm4nPiN1USKHDh0bbOdUcoFuGKA0tNKqTEnzdRsmBy+gDM1n+1ywbWNR/z3M+7unKP5YKsftcHEvNEVZ935Am7OCP0AyKZyX6G9jGYrbmxpmnRNH24l5ZXVFwD+IIhmw180RISsfz2XUTm1pU4Qzn4VCsSXP28lsV5zttVDQY
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a44e5e8-410e-4861-295e-08d8cd0371f4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 14:03:15.4837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wo+0rgujmOPiixXTwqQGVTakYRTsMQEYVmLp3f86sijiv3uH2xTw9qPyqtnm+SIxNIxSmWGwSSZWHNXUVq/dOxyVdDgCr1v9oKe8E75G1N8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
Content-Type: multipart/alternative;
 boundary="------------D6B4BDE72E5BA4C34B4FDAEB"
Content-Language: en-US

--------------D6B4BDE72E5BA4C34B4FDAEB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-06 6:04 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...flask-socketio_4.3.1.bb => python3-flask-socketio_5.0.1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-flask-socketio_4.3.1.bb => python3-flask-socketio_5.0.1.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.0.1.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.0.1.bb
> index b8631bf50..4c5d0a3fb 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.0.1.bb
> @@ -9,8 +9,7 @@ inherit pypi setuptools3
>
>   PYPI_PACKAGE = "Flask-SocketIO"
>
> -SRC_URI[md5sum] = "d7992b0b4aaf473b7eff21fc14e8d1b2"
> -SRC_URI[sha256sum] = "36c1d5765010d1f4e4f05b4cc9c20c289d9dc70698c88d1addd0afcfedc5b062"
> +SRC_URI[sha256sum] = "5c4319f5214ada20807857dc8fdf3dc7d2afe8d6dd38f5c516c72e2be47d2227"
>
>   RDEPENDS_${PN} += "\
>       ${PYTHON_PN}-flask \
> --
> 2.25.1
>
>
> 
>

--------------D6B4BDE72E5BA4C34B4FDAEB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-06 6:04 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210206230428.4106796-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210206230428.4106796-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...flask-socketio_4.3.1.bb =&gt; python3-flask-socketio_5.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_4.3.1.bb =&gt; python3-flask-socketio_5.0.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.0.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.0.1.bb
index b8631bf50..4c5d0a3fb 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.0.1.bb
@@ -9,8 +9,7 @@ inherit pypi setuptools3

 PYPI_PACKAGE = &quot;Flask-SocketIO&quot;

-SRC_URI[md5sum] = &quot;d7992b0b4aaf473b7eff21fc14e8d1b2&quot;
-SRC_URI[sha256sum] = &quot;36c1d5765010d1f4e4f05b4cc9c20c289d9dc70698c88d1addd0afcfedc5b062&quot;
+SRC_URI[sha256sum] = &quot;5c4319f5214ada20807857dc8fdf3dc7d2afe8d6dd38f5c516c72e2be47d2227&quot;

 RDEPENDS_${PN} += &quot;\
     ${PYTHON_PN}-flask \
--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------D6B4BDE72E5BA4C34B4FDAEB--
