Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.59])
 by mx.groups.io with SMTP id smtpd.web12.44227.1597065128104897573
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 06:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PW4MIjeA;
 spf=pass (domain: windriver.com, ip: 40.107.237.59, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwZclSeZy8O2U3E8u62W8kY+XvUfatRF85j+Y3CuHASANspMYgiNe7I9GpR40G6jWmC17cSun5bC/pyAKE5GwRh3gjbonpAPMEYgKz27+n4GJ7wzBo5CNmXoC1zSEzDoUjxP8GYHtTVMj6g15gapcgvuW7lyfWQJW7GX/xp3y8gwhVgqsFE3G5QfLxvMm57Vxx+Nyh8LSog1YxZcvp05BgvbBVfwJBK8UgZePZwqSWGij2K3OxOmdBCa1Xg0Tgc5vzA+9hGzCaWMXLAhQi38KzICgLEgX5RoxtZ901eCgmwuIf/umKrgbb1HkmvA+Nlww+wlaPoB9y2lB9e+WQpyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdBeiLFpuzZXCMw0WKjGodRGobeWss4BR6IbhGoPCWw=;
 b=JWRsmXvDGkcQncxLEcwsG23juDnFMIRD7kcyFyh2bmPaeggiiuq2h9bcBVHe7a2CLh5FiFknrXoBzSOQuYc9LgcjwI7cDilMMlD717j19sNaBFIRthSZn+k6NeFVmItCp6xZEDwHjnuZZ0Z9JYMjoydW1aGoeqFjagQWTKH7SelmqodqhWWg6bB3SLS/fswKCMSiBXb2UZxw6i4HFUSsQOk6rpf9976IvI6iLyRJ5FlnsY2lbTwC6iHLSEzjxJlotm7CWKc6Fd8n1EAmzoz9sRIksMA6oFDfrZop2L7zUQb+8nKBVecTVdYyePsD0YBuRFr+Pti75qaV526K88CXkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdBeiLFpuzZXCMw0WKjGodRGobeWss4BR6IbhGoPCWw=;
 b=PW4MIjeAoxPBZAev7L4OX9Xm5xNvz4V6BQqZw8dHE0vhDWE1wwnTTLHN8q0g+/FlVgdd5p2rc/EpEjBJ2QV+oEPZYV/kW0dT4+LkHAmpAwcYCEdIL5WT/FcopEicgmlDEX7heKAxeplk4rlbTmllriV2mLEdozx4qd/xrB92Yww=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 13:12:06 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 13:12:06 +0000
Subject: Re: [oe] [meta-python][ 6/9] python3-pickleshare: add recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
 <20200808170407.2326879-6-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0af694bf-2e88-f1a8-a99d-fa29150d0d0e@windriver.com>
Date: Mon, 10 Aug 2020 09:12:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200808170407.2326879-6-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 13:12:05 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d8ac214-767b-4e47-ebc3-08d83d2efb19
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4226CB52B48B311A0DCC999C9F440@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	juF+7AhYGu8rMmJYcRE3XWCo7iNrUxVVXw9/zsDHIjmB6tt9J641NJUF3LVEvpwnpr2PCyrsMW7qzb3m8kSMCqMuGHJ5qEaWb5pETfugpa7rMwV0/X1KVz0kX4lygU23p3WC1MrDmagIXgsSHWvwO6472odhCJ4fa0tosC5vprGf/PUfnVrrPSbvgeg3q0ZiU+CkRzo8hHJsq3+UTXHS+tGPBPH50CRujZmaDtJOJ4BQ7Uj6/45iSXWcwp/52V2EuPYYxGQBtHEbG2Q5KdPA0vFO0Af4Pn7jj1s6Y7Qilo/0bUasZjhAAEX884tBN+Ps/YxA2ENNMOkseg2BbuODlMlB2jCtwY8omWZw/QBh/lpJYsh/L17LcrmetUJJZn0vb7phreJd3318LTLNL9ebFRGgJLaJ/JWGagBZs435BNxO3x7LKj9+DqmEUxq60s4ijIBWk3RET2XnaEdwjrB2KQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(366004)(376002)(39850400004)(26005)(186003)(16576012)(5660300002)(16526019)(316002)(86362001)(66476007)(966005)(8936002)(31696002)(52116002)(6486002)(33964004)(36756003)(8676002)(2906002)(53546011)(31686004)(66946007)(83380400001)(956004)(478600001)(4326008)(166002)(66556008)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5B+h6TNGhEVXcXA6OVLmxH8Nzz6K2IKHSytqTRPhEhjzuH77WfVbL9YaMOaWgqUKZ2qxdmhOGGlT1UbKG3TsKd0/jwXLiNBvECZvYziV8F7WV06fUL4UPPro2ispy2rOH5yVSbUepcpT2hDE6E4M2rfPcHnv74BfEGA0GXp1S5/OljQv7fzNnTtR95pc+EUeGvvd3b9I//MxGhdxYoXcyYTdI9CxsICnYhubgxxJJaSpUEfTlFMiky2Cv5S0P1lp2qidlaT1GMR8FaCRvcbvpUWbogj8ZpoJfzgXlCJ93hT+LmdPBBOaDSFSIAcitiUKm/PyWCHf6jMGDI8+b0yEMQjRgkqEctcOqh2pMs/VrKXqAvDws+BsYZZBmbhzGQ2lK6T4hp5Y1Y1BjKt2kJ50rgE9MRjLDJcHZJn6CHAg3kx7PAOAbIQswb6Vw0cURi7NTxmQs8tI40YAn4ANhyYuCxFu1iJVh+fLCFiy+X9vgkpjybWdOjYwNxHUO9I1xtGl6/KbpL/BB41r8liGccN6ObANZCJMLGo3of0kCd8CLrQ406ICOjwaH4OM+wKaWj4s+r7LexZh+Q+sdNfhXKq0zIhlBBX/NxzXiEUm3NKG4/LH6jL0XtmwMbmXSeQsw+QCw2Hor/xfbOD3AENukx01fA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8ac214-767b-4e47-ebc3-08d83d2efb19
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 13:12:06.6773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaUg76BZE9w7DGxFKFLHVDo2oo/Rj9AIqa9ePHtEIL+hoTVV7am86y472LQsFGlM8Wuvqe7ikkT9BVupl5HJOmm5sfelIoJQ2yCCOVNgItQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------B4385FF92AA811C2FE8A461E"
Content-Language: en-US

--------------B4385FF92AA811C2FE8A461E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/8/20 1:04 PM, Khem Raj wrote:
> From: Shlomi Vaknin <shlomi.39sd@gmail.com>
>
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-pickleshare_0.7.5.bb              | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb b/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
> new file mode 100644
> index 0000000000..9d67e4f338
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "Tiny 'shelve'-like database with concurrency support"
> +HOMEPAGE = "https://github.com/pickleshare/pickleshare"
> +AUTHOR = "Ville Vainio <vivainio@gmail.com>"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=905c08218089ffebea3a64c82fc4d7d0"
> +
> +PYPI_PACKAGE = "pickleshare"
> +
> +SRC_URI[md5sum] = "44ab782615894a812ab96669a122a634"
> +SRC_URI[sha256sum] = "87683d47965c1da65cdacaf31c8441d12b8044cdec9aca500cd78fc2c683afca"
> +
> +inherit setuptools3 pypi
>
> 

--------------B4385FF92AA811C2FE8A461E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/8/20 1:04 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200808170407.2326879-6-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>

Signed-off-by: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200808170407.2326879-6-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-pickleshare_0.7.5.bb              | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb b/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
new file mode 100644
index 0000000000..9d67e4f338
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
@@ -0,0 +1,12 @@
+SUMMARY = &quot;Tiny 'shelve'-like database with concurrency support&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pickleshare/pickleshare">&quot;https://github.com/pickleshare/pickleshare&quot;</a>
+AUTHOR = &quot;Ville Vainio <a class="moz-txt-link-rfc2396E" href="mailto:vivainio@gmail.com">&lt;vivainio@gmail.com&gt;</a>&quot;
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=905c08218089ffebea3a64c82fc4d7d0">&quot;file://LICENSE;md5=905c08218089ffebea3a64c82fc4d7d0&quot;</a>
+
+PYPI_PACKAGE = &quot;pickleshare&quot;
+
+SRC_URI[md5sum] = &quot;44ab782615894a812ab96669a122a634&quot;
+SRC_URI[sha256sum] = &quot;87683d47965c1da65cdacaf31c8441d12b8044cdec9aca500cd78fc2c683afca&quot;
+
+inherit setuptools3 pypi
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B4385FF92AA811C2FE8A461E--
