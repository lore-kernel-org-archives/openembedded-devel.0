Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.48])
 by mx.groups.io with SMTP id smtpd.web10.12725.1598359312721286100
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KDPUhQQt;
 spf=pass (domain: windriver.com, ip: 40.107.223.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzNMw35tk9yov1KTC6QY9F5mfH8lLnxN1evQ4GNt/FI8B3Qe6/6UcZh4UJ9Pfk8h7AM7Eq5XN8ensDNr6E8PEBslc3H641hwXn4s2dZ/roEGOrTolreZtjcengUsJEDIW2aFVKAq6+x+VUPGzHRepJBnoNOz34mwe1V4YXqeBFkYynMiEnUxavwEoswVW8st+lJooKLjnJdf4XkYrH6NhDRj8snUB6u57U3ORXXNDN+soEP1uGuWTw5pj8g+nR/b21Oz3pUcX10180K9Bbk5SMUlHgs6PlY60elPI0+qal8k/u237WdrA7NARPuCxwQdLL6srzI4T9Jend00Nb7PGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hApfAMLh+XFGVR+960Y1KMBw6uP7GkZhoyWqC0sOEFA=;
 b=a77o1mC0xMziO7avi5dklz7UrHIO3i+h9xnPsE116QnqDSk1UU2ym8kjlnU5nCNmVrbHQ5LHOY8mDmT3KEj0ZKwLxcfFPwi7Vuvl/zRApmo7yApfwHJk20lFJcYCEn0V3jHOzxlRvKR1xPnGK17KjAFMNfZ+eHaW9IKivUfajKDkh8oLHYx9KxNiCoG9maA0SvnzDZxTm4e/BEBN0k8eklC2I5y+itFaHNMXRar1UtjpbsFHh9wfJgplYzhUQv+05cHXoLMy5M+US00Q0BTKk+JeOoE9C3XPzawn8gmktrzl0TGKQZyew3kLPDgAfUv4kVAD2oWnLzPYt11e5/MK3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hApfAMLh+XFGVR+960Y1KMBw6uP7GkZhoyWqC0sOEFA=;
 b=KDPUhQQtCF5pft6GZF1yavEFtvvrMv1v94hy9iwcLKdFlHKsaqhyJqGeGAx8rrG9KQTAbU/PcqSwXqs3fhZXUpv9FFsC19RG77hbg5V5DcamX5xD3frYbr7T1m7fi5aKKLyiF7sfw61O5/Lr//hbidmK+J4PNZi8Iubx3cKtHMw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 12:41:51 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:41:51 +0000
Subject: Re: [oe] [meta-python][PATCH 06/11] python3-custom-inherit: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200821234504.719-1-leon.anavi@konsulko.com>
 <20200821234504.719-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3130f4a4-1993-69e4-0b43-93b2146bae69@windriver.com>
Date: Tue, 25 Aug 2020 08:41:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200821234504.719-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTOPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 25 Aug 2020 12:41:51 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac36c98e-a70c-4e20-1eaf-08d848f43d8b
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB426070E2D0CD4732A7F6C4B99F570@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TmwfJnyusKP5GfXIC6jDpE34kTjwV54rqTHztf7a/fBtY+qkd7jRacm82CElmmVlfIH1+79gaCxdtiHGzYog9UwsIxqA1C0gDx72Dl2cx3BTz79e4VSUgx8t6bGBWkeQpiORsOxMIc+txMbuIEOT2Nsj4JNr3TXJ7nFLrpQxCgVBEUbu8pwL9ydRNKHokp681Pb7An0Pt2n5dRnMv1JfnTtBEoTsPMBGA+lboMUoh61mbPNdyn0sJsAMIcmxOULqK0L1wEWS2AC0Mgq+ofM21Kf8B+vAeiZoSniG/URf2qznC1lwXVGvm/PpsgNQ9ToTeK55HMEVm7weKKZqKZhkSOw2DgaftGz18+W4xM9ImuYizF3sZJSf0CJh2oUxUQ5ayG+r0CR6upF7CXG1RFgT50Jb8LKoRKir4RGvUbtjvfBgorAut/n/50m2/uVtTSuX0ZEHWsiyJYuoDgbjtVYnSw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(366004)(186003)(66556008)(66476007)(52116002)(66946007)(6486002)(966005)(8676002)(36756003)(33964004)(316002)(5660300002)(16576012)(31686004)(31696002)(26005)(86362001)(53546011)(2616005)(956004)(44832011)(166002)(478600001)(83380400001)(2906002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8BfHcdpPYz/dNrvItTnKWIZgz7bJFAPdCk6L39wRXQq6H2tbxytqs5DpiNfGuvQkh5cql5vtv/WTae8/aOdP8sVgwaenbIkIYLdqSh8kdh+DNiWup5XNzH8WKIGlRgJ4ElYrmz1xIhCeEjUOHAQCYuu9BdTjI5gnBJFjEuRVzIfswkKJDNz+dpm07Xi8UBL0XKeflhUZeGgkUhTwBQzIvWEiVq4BoHzGuV6URmlKB5tBoLSyM5t1y7e16EDbULd8wrJqFO+WJ7s9bLZtf+PGLEb5Uz/4e4HENfch+4S1UJ96VZjHeFJiBbvt35wt7Dpk8S7a+rC1RInomqtT/u/LOoZw/C/yuy7DAK8pdRtNiFm1nD4AWYy0r4OAydBHP3HjLJfZwR894dd6DLi2fJEOMxVJgR5qj5RYOfwF6FhhjoKgww12FloE/uA0xOkUg85t+kK3KqWIqCT7zMRD3KeYtnzxXRG/kiP+WFELjbLJwF6FEoizkXPhjA0GDUE9Tq42jYBKPFY/2gqpetV5aJjRYgKRNuEpie/mCWsln58ESYqBn1pRNexj2Usxv0bJGyEkKxbk98+CRs62SFkn1IjhuBYQBzDum6Tx8tKuIT+ZQmDUXQAyJ12AK+fGobMRxTxkFUjiyW9As2bmPBHV0zVMog==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac36c98e-a70c-4e20-1eaf-08d848f43d8b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:41:51.6451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +klr4W7ZIY+7tdq88o6eN4dabUqn+E9r+dArqb88e1oKMHOFNDm5lGAHklUF6iLRd/F4JF6/VN3q8QvLVTYjhXUHjJZwhME28RhwVeqmkik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------050EEC0E474BEEBDE27E7F28"
Content-Language: en-US

--------------050EEC0E474BEEBDE27E7F28
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/21/20 7:44 PM, Leon Anavi wrote:
> Add recipe for custom-inherit, a Python package that provides
> customized docstring inheritance schemes between derived classes
> and their parents. Changelog for release 2.3.0:
>
> - Add three new built-in styles, numpy_with_merge,
>    google_with_merge, and numpy_napoleon_with_merge, which permit
>    users to concatenate the respective sections of a parent's and
>    child's docstrings.
> - Also add is the ability to configure DocInheritMeta so that
>    special methods will have their docstrings inherited as well.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-custom-inherit_2.3.0.bb           | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
> new file mode 100644
> index 000000000..489e71984
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "A Python package that provides customized docstring inheritance schemes between derived classes and their parents."
> +HOMEPAGE = "https://github.com/rsokl/custom_inherit"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=adc1f231c76ee2f1f36025d56926ba2c"
> +
> +PYPI_PACKAGE = "custom_inherit"
> +PYPI_SRC_URI = "https://files.pythonhosted.org/packages/0e/82/c5bb7ec49a7892a2c583e1017597e3921c59171f10602086ca93c8a83baa/custom_inherit-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "adf2850dc0e488df959821a5d4c16cbd"
> +SRC_URI[sha256sum] = "1609d283c2cffce3a58baf7c0c22b655c55f85e1ec39c4717a4423d34610723a"
> +
> +inherit pypi setuptools3
>
> 

--------------050EEC0E474BEEBDE27E7F28
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/21/20 7:44 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200821234504.719-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add recipe for custom-inherit, a Python package that provides
customized docstring inheritance schemes between derived classes
and their parents. Changelog for release 2.3.0:

- Add three new built-in styles, numpy_with_merge,
  google_with_merge, and numpy_napoleon_with_merge, which permit
  users to concatenate the respective sections of a parent's and
  child's docstrings.
- Also add is the ability to configure DocInheritMeta so that
  special methods will have their docstrings inherited as well.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200821234504.719-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-custom-inherit_2.3.0.bb           | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
new file mode 100644
index 000000000..489e71984
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = &quot;A Python package that provides customized docstring inheritance schemes between derived classes and their parents.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/rsokl/custom_inherit">&quot;https://github.com/rsokl/custom_inherit&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=adc1f231c76ee2f1f36025d56926ba2c">&quot;file://PKG-INFO;beginline=8;endline=8;md5=adc1f231c76ee2f1f36025d56926ba2c&quot;</a>
+
+PYPI_PACKAGE = &quot;custom_inherit&quot;
+PYPI_SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/0e/82/c5bb7ec49a7892a2c583e1017597e3921c59171f10602086ca93c8a83baa/custom_inherit-${PV}.tar.gz">&quot;https://files.pythonhosted.org/packages/0e/82/c5bb7ec49a7892a2c583e1017597e3921c59171f10602086ca93c8a83baa/custom_inherit-${PV}.tar.gz&quot;</a>
+
+SRC_URI[md5sum] = &quot;adf2850dc0e488df959821a5d4c16cbd&quot;
+SRC_URI[sha256sum] = &quot;1609d283c2cffce3a58baf7c0c22b655c55f85e1ec39c4717a4423d34610723a&quot;
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------050EEC0E474BEEBDE27E7F28--
