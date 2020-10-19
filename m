Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.71])
 by mx.groups.io with SMTP id smtpd.web12.11908.1603110649753336061
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 05:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eEGCdhyt;
 spf=pass (domain: windriver.com, ip: 40.107.237.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jD73SiMo4pSFJGiWLQGJ3Sto1GDTEk+vdX4RL4KSSgdHBdk3Pt2PBS+GLgtTvrZYnTDZS3baqkV0QslB9AuccnhtENwDrbxAu3AwhoOGiZV4Ym2NG5h9nug6QiC3M0sOI1YLjd+I3XPktpXzs6SJaF7SUkcu8hAcTdJy2UYoctNRE0swoOdcdg5MPSYSPxDG4tD/9lxx14dei33De3CLf6DXmgZPW5tRss1pmSdY3Xm/u+4aP8G3j/D+8j274ivqoibG6jrPHpPgObZV9TsZhGxNZEFO3T+RbWw9KGqlRV5nOdy5cXsfQs2EqOCVX5dMCed97dbw9qr/iLr5pExwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysjOhy3hEWa3mqOfX07Ag5PDVZaDg2t2A3zhQLncX+0=;
 b=RDhzym1TUDnPnVFOwwQzVYEX94A5v2HV1FW5cwn1yJwgX0CK+UfwSyGygXeeP3sjYBgLwEKTfhDnRkPRP/R39zg9lFLyrK/rX/UrfHntKD+h1WOH+EAhmlW2q99GAN/GKF9Z2gYdLeniIoV5XOCVESCnXCDkL1cEG5pSKnXBx4wewDpKWH9SbGLL5ALxs5Z3mtZtHr1tC34X9jRQCq6E4TAA5g1xhXROZE/fFtXHtzQl4xIOzaaJzMBouxit8ZpEc7i7LJk9J8Wydcou23IBRH/P+zfwjnqygIiTM7/+UZzCc6SGkbX9w12RTqZOniPd/LjfYvJ1NqjWu1nDrfbt1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysjOhy3hEWa3mqOfX07Ag5PDVZaDg2t2A3zhQLncX+0=;
 b=eEGCdhytOS5AsCzGPGq8qDjdqS/0LK+3sDjQAaoYlgEvfrs8XDT9Vj6Wixzg7xJqOhDe05Se5RD59jVZK3IPC6SIMzbo2CRWJsDhT4HN1y5wFCz0+srDJvdBZV5nR/3r9bumCJXI0NUitTWAqQMsJH6GlsKpV61Y8LDO4O0aQeI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4323.namprd11.prod.outlook.com (2603:10b6:a03:1c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Mon, 19 Oct
 2020 12:30:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 12:30:48 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-graphviz: Upgrade 0.14.1 -> 0.14.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201014073256.9605-1-leon.anavi@konsulko.com>
 <20201014073256.9605-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <21edd5c3-276b-a118-fcf5-abe093eb6bbf@windriver.com>
Date: Mon, 19 Oct 2020 08:30:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201014073256.9605-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:a03:100::39) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR08CA0026.namprd08.prod.outlook.com (2603:10b6:a03:100::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Mon, 19 Oct 2020 12:30:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fe1068b-b0e5-46e5-6560-08d8742acee8
X-MS-TrafficTypeDiagnostic: BY5PR11MB4323:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4323FFDC6EBA904A78D6860F9F1E0@BY5PR11MB4323.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9/+AaNNmt+IEX1xV4AEXrVR5cOQAURT1WHPglz6hRtyyE31gEFg/GZSLMbuidzOJmZUE8VPHCLUOmbLzfKTG0PfJONkc0RzBHX/2FGgIJf5MyBOCW0EJEJBnBnSwu6W+WiKOuWHhoFyjTEG3CoXkCeRxosOlhnMqAnOY/I6c7RPifJrga1ULh+morl25Xh4JQmPk9Bd5DlsUjclmwwCc70N20SOjzN+TrHYgrRXTbmt3zd3QxbJ7qi/WqoQ4yK/8c9LHuz9LJeUaZxD6JfdD54xpJyorHURxb+ej9eUiZbR92LcHGWtle0cQTP1ayX3g0KcFUmHTj6CYLDAcqwsFAAtn5YewpDhDrurPTnZXiI5VL5BA9UISTJcov8CfwL7N5vKe5//7XEt0JSi38U3m9tVgYDOJacatXJEXmtED5zpYDrak8rpoRujw46fiuZpRIHhNf9wUOGwfVRqGurfUHQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39850400004)(366004)(376002)(33964004)(6486002)(316002)(66556008)(66476007)(2616005)(66946007)(86362001)(956004)(52116002)(8936002)(166002)(36756003)(2906002)(16576012)(53546011)(83380400001)(478600001)(186003)(31686004)(16526019)(966005)(44832011)(8676002)(31696002)(26005)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	WUm6W4tO3jLIeJ0aQlAncjFGzBdDAVoJFG7lmi3Oq/nUCY+0e+WJjmJjHYwtdpZnXBv2npY7krCWnH40W5wWMJBv/hMP1I1iX4vS+Ww04+UnoXWE6Vxzjy3gPSUUDgEuxysJBYmMTsplO24k0JLWgCwS0WCV1wv4ot9/NxDbJqtViZUEeNnIjLvX+qd7ss8VNTDgyangYV1nUAWeoQGwBy1XbzajfCDH4WyG3H+LRLxWPuvEXo+V9aMxxbsc0JNC+wUllvxv6iSzQEGen2HHDPp2GJtJUi4ZoinpJFRU716KdtMgw0jmV19H3oo7JdoKWqWCvdzP9qiytmbgZtqlC6VJUgoz3AxrUjfci0RXfqGHx171FCOS3OXVxtui8staT33P/t91N/AfzQwXks1NE4i2zhcwyvHncIFNmO5D4AgoREH3EeN2+H7QGt4CLqNI3Gk8SFNrVU1NoNEJ53y/auqtEcGCtL28oWddti1OxV1iziOlexM47anR55EOmpYGB5CAfOOAjJ1J5hil6Qphdm0ZLOpt+ebwb8tL4Ccpc3Vb4A6HIz0IxBOvj1LRpio3kPSYPRtQjh42yczaeU2TSZ/18M99MeYwU8iNKWSfkDW3N0PZ6DNbX9H0kNEXkKxtvSCZhnSq7jkjgXXaf6Yl6A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe1068b-b0e5-46e5-6560-08d8742acee8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 12:30:48.3699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nd5e/oqqunugI2vYfaaesX7DHaMK/BtU54oEgZgVpas+puPvMaY9vZkyiFLOfvQoX2hq1IWqYhlsA7N7gunX0TCT03DIx7z8QDoyXT0V9hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4323
Content-Type: multipart/alternative;
 boundary="------------5023666F4D342D6007D765DC"
Content-Language: en-US

--------------5023666F4D342D6007D765DC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/14/20 3:32 AM, Leon Anavi wrote:
> - Adapt graphviz.version() to support the Graphviz Release version
>    entry format introduced with 2.44.2 (version() is needed to run
>    the tests).
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-graphviz_0.14.1.bb => python3-graphviz_0.14.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-graphviz_0.14.1.bb => python3-graphviz_0.14.2.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
> rename to meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
> index f26a1efcec..0de4c8f407 100644
> --- a/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f7831c564aeff14e68aa4ff7a93dc89f"
>   
> -SRC_URI[md5sum] = "436cb0f41f6a949f916357ca037e205a"
> -SRC_URI[sha256sum] = "f5aad52a652c06825dcc5ee018d920fca26aef339386866094597fb3f2f222ce"
> +SRC_URI[md5sum] = "7123efabb68270f579525df74bf8b0c9"
> +SRC_URI[sha256sum] = "92b7637ece63c77e3d39221ae1f4df98e9256cb449e9860c598335b34496d195"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------5023666F4D342D6007D765DC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/14/20 3:32 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201014073256.9605-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Adapt graphviz.version() to support the Graphviz Release version
  entry format introduced with 2.44.2 (version() is needed to run
  the tests).

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201014073256.9605-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-graphviz_0.14.1.bb =&gt; python3-graphviz_0.14.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-graphviz_0.14.1.bb =&gt; python3-graphviz_0.14.2.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
rename to meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
index f26a1efcec..0de4c8f407 100644
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://graphviz.readthedocs.io/en/stable/">&quot;https://graphviz.readthedocs.io/en/stable/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=f7831c564aeff14e68aa4ff7a93dc89f">&quot;file://LICENSE.txt;md5=f7831c564aeff14e68aa4ff7a93dc89f&quot;</a>
 
-SRC_URI[md5sum] = &quot;436cb0f41f6a949f916357ca037e205a&quot;
-SRC_URI[sha256sum] = &quot;f5aad52a652c06825dcc5ee018d920fca26aef339386866094597fb3f2f222ce&quot;
+SRC_URI[md5sum] = &quot;7123efabb68270f579525df74bf8b0c9&quot;
+SRC_URI[sha256sum] = &quot;92b7637ece63c77e3d39221ae1f4df98e9256cb449e9860c598335b34496d195&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5023666F4D342D6007D765DC--
