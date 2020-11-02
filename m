Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.73])
 by mx.groups.io with SMTP id smtpd.web09.32185.1604328167112969107
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2020 06:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DwGz8lyt;
 spf=pass (domain: windriver.com, ip: 40.107.243.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mD/vYwjRZau8pAavGkVxV8aODTdoqZwdg8J1HYs3rN8psDNh+r1Mp6W9JI6JCdUbfbu+Hx+z8OcE/KR4gRgmlwGhRv4/AuXl7nlBUnG5VkXTiEcg2c6o3An3QnUYuvQofG0Roe5M6xi11I9WKYnTq4ypU6e9QEnO5o1GJPwHG/+0WgXadTuq47n/6K5PvSA5C4qB5SVNfX60hCdlzfeqdadQs+nHA3meOHBda6NXDzcAGMOLQVd8eNl3sQnBnpYHtHY/xaSZ3WEpYnvacGzkL0SgA0CbdBIvc07/bjdUbFDjiPN0gdjrbcqijeqYvRgtfDf/+zKfZiiHGuZH8MPKbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDbAogpjxEIrcgBC0Ooh6RwLvfuM+ozc+M4Ysbh4n6w=;
 b=MHVriNelHN7oB91iAnNg3MXEiUYaviEqq9KadFS+JsTjpEwqthq/fw+tmgX8hcfWAwK2V2GzUzItMEhx6jqCsfiHQHMLfZ9cR7xfEGCMu6VRfcPjAB+0eE1g5ULcCVnLK+LIXKZvjJjXoCBLFP+Bk/zVxixMol6ZLPXwWEDxNc1JL+OnGWYWyX69brMAofnmI1ULZz4LPLz05IAeotCqEPRQjpUBLplTpCWCcoebVLjtaLK4OrEHUo7gBWPpmKSFBQ4cj63T/sG/72ftXJFcm6X9SuMK9Cp42gDYjcRCKqfTbasWJPYJYXoPynF0cC1j7CqYAfj1BEQNiuW90Ns6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDbAogpjxEIrcgBC0Ooh6RwLvfuM+ozc+M4Ysbh4n6w=;
 b=DwGz8lyt766xuu994SnzqSNhVNAs+a4OM420ZAq6hezdnBhx5nuFUVdaiNgMByXpeh5zmyS7wxrhRTAzv+wG1AeMMROcFYkqeNTq9gCMEDiZy04jYxx3y7RnrtDsBf+5y/m68KXZVdSFji69alVNJLrZgUUQvsfnMf5+RKUSRVg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3479.namprd11.prod.outlook.com (2603:10b6:a03:1e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 14:42:44 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 14:42:44 +0000
Subject: Re: [oe] [PATCH 3/4] python3-mprpc: remove the recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20201029100339.26698-1-alex.kanavin@gmail.com>
 <20201029100339.26698-3-alex.kanavin@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1f547536-bf62-f50b-d9c1-e42571579b32@windriver.com>
Date: Mon, 2 Nov 2020 09:42:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201029100339.26698-3-alex.kanavin@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY3PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:217::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY3PR04CA0027.namprd04.prod.outlook.com (2603:10b6:a03:217::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 14:42:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bd276fb-caa2-4209-bbba-08d87f3d8f09
X-MS-TrafficTypeDiagnostic: BYAPR11MB3479:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34793277D3AA11F36B9D44859F100@BYAPR11MB3479.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	56d5fsA50cNqOksKXy4AVZ7JTgcfw5S+Js46s3BjX33yZUI16dw2Eo8gaVUDuzkrsiwOSV4KVgKWu8vxNFAg1slVlLeMBBg2pzAZmGVE9GAMvX5qbFpfvN+omxZQv3fxlNj1JMkT0F9rEW6yPtObBb2VJCl/ud/XOl8VfFSeS+fnJc8KCjQTJZpAIUBfoJMUAQg71zkkLiFWo6qylZoHPKmui+VGIVaXHJq/Lgi9qPYlhOjPb9Rs2+LsBNzw1Q6rdOH33jqbD8GbUiZ5/Jfc3DdqkpU8JauEkgtTCRlB/Fav1gxVAYGIr+zQAWQh3Zx9nsbBPVnwdAOw7UjxLHvxOJ7Bx4I7zZu97gV7qfm/XSf4RorWCc6JO2hoYL/H/s4poCgqUq+fyaFCI14Y9AwqFb53BDjBcl+3fzniqJn0BMxjByL7CvHfDIxdzh5emCT4/oWO582J7XFruCCn2Mvyrw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39850400004)(16526019)(53546011)(33964004)(186003)(26005)(16576012)(478600001)(8936002)(966005)(52116002)(8676002)(316002)(44832011)(2616005)(956004)(31696002)(86362001)(66556008)(66946007)(36756003)(31686004)(66476007)(83380400001)(2906002)(166002)(6486002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	NDNDZbfJa4A9beB6mR6Rw+nRK0OEzTkBamIr/MZnO3+u3grb5t0iVwrJiiyr/3jugM1dQ21vPxg8zroqAlW3ELJ6gR6SR0DIyz/byc8dkl1pBTcuiZ62sgMBWNzWyL36VLWCPqQuiJ6rhTqiiKh1gR27yum3B8J77B6LFO9iDYezfNLlEp5V/3m+h3zQXLg+BZsK1JmlWY9PThuYu0pNWrsiLnaV/iN9tP1XL+smxBbWhOR5VCDgQ3/ZyLr7b5TGFxOPK3roUfPbnhmEBWUyjUSc4WwdKfWHILacWETE4gsIViPj4wkiYM/OOnLY4k/vEc9MbJ+2rU4WMg0QqOp4nz+TT24Ox0My07PbFpRB7KXx51SX9bfaIyNH3IxVMvYlZuA1VrMv2vuso7OxkViUht5qbeQOoY0dfZQOb8VD/8d8lCw4zsCk3fkS6PHIRigkZmRf5CG2Bdw+F6mSLI3SXnzYUtjP59SFAXwgTirhXGwYxdLhn4n1tF+F0BeSxyEbckyS0+w3O6APjMAev7OuKm2/J32zw/Hi68htaVzp56/9B+5BV7InbmrLbw0623zWqqZSDGeHB5ppaWvNZlx1vUvyq/PP1evs6lnD/Uu3dG/uqGXYwXvgX4e4jqEkCQGfBT9UON6BYOxnboY9f3ie3A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd276fb-caa2-4209-bbba-08d87f3d8f09
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 14:42:44.5355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EspiiX7FCkeyzjxBXoZquh9ZxS1EZNaX7ahjcywH6C7iPpdgFCfZHTMT2RIa5vLrWX/RLm/68VLry0L+/FqW/HV+4ajT/sImiCwaM/ES/B4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3479
Content-Type: multipart/alternative;
 boundary="------------7FBBAF081F3095E45035C506"
Content-Language: en-US

--------------7FBBAF081F3095E45035C506
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/29/20 6:03 AM, Alexander Kanavin wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> The project has been abandoned for a few years now, and
> no longer builds with python 3.9.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python-mprpc/python3-mprpc_0.1.17.bb            | 13 -------------
>   .../packagegroups/packagegroup-meta-python.bb       |  1 -
>   2 files changed, 14 deletions(-)
>   delete mode 100644 meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
>
> diff --git a/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb b/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
> deleted file mode 100644
> index 14eef9691..000000000
> --- a/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -SUMMARY = "A gevent based messagpack rpc library"
> -DESCRIPTION = "mprpc is a fast implementation of the messagepack rpc protocol for python. \
> -It is based on gevent for handling connections and enabling concurrent connections."
> -HOMEPAGE = "https://github.com/studio-ousia/mprpc"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
> -DEPENDS += "${PYTHON_PN}-gevent"
> -RDEPENDS_${PN} += "${PYTHON_PN}-gevent ${PYTHON_PN}-msgpack ${PYTHON_PN}-gsocketpool"
> -
> -SRC_URI[md5sum] = "8d97961051422f3de315613434982d3b"
> -SRC_URI[sha256sum] = "3589fd127482e291b1ec314d6f0e55cc13311c12932ace356d6178ea1ca28f6a"
> -
> -inherit pypi setuptools3
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 0f032e65e..6a3061986 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -444,7 +444,6 @@ RDEPENDS_packagegroup-meta-python3-connectivity = "\
>       python3-h2 \
>       python3-hpack \
>       python3-hyperframe \
> -    python3-mprpc \
>       python3-priority \
>       python3-pyconnman \
>       python3-pyro4 \
> --
> 2.29.0
>
>
> 
>

--------------7FBBAF081F3095E45035C506
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/29/20 6:03 AM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201029100339.26698-3-alex.kanavin@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

The project has been abandoned for a few years now, and
no longer builds with python 3.9.

Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201029100339.26698-3-alex.kanavin@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python-mprpc/python3-mprpc_0.1.17.bb            | 13 -------------
 .../packagegroups/packagegroup-meta-python.bb       |  1 -
 2 files changed, 14 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb

diff --git a/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb b/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
deleted file mode 100644
index 14eef9691..000000000
--- a/meta-python/recipes-connectivity/python-mprpc/python3-mprpc_0.1.17.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = &quot;A gevent based messagpack rpc library&quot;
-DESCRIPTION = &quot;mprpc is a fast implementation of the messagepack rpc protocol for python. \
-It is based on gevent for handling connections and enabling concurrent connections.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/studio-ousia/mprpc">&quot;https://github.com/studio-ousia/mprpc&quot;</a>
-LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4ba825394aec026b5f94edca44426859">&quot;file://LICENSE;md5=4ba825394aec026b5f94edca44426859&quot;</a>
-DEPENDS += &quot;${PYTHON_PN}-gevent&quot;
-RDEPENDS_${PN} += &quot;${PYTHON_PN}-gevent ${PYTHON_PN}-msgpack ${PYTHON_PN}-gsocketpool&quot;
-
-SRC_URI[md5sum] = &quot;8d97961051422f3de315613434982d3b&quot;
-SRC_URI[sha256sum] = &quot;3589fd127482e291b1ec314d6f0e55cc13311c12932ace356d6178ea1ca28f6a&quot;
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 0f032e65e..6a3061986 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -444,7 +444,6 @@ RDEPENDS_packagegroup-meta-python3-connectivity = &quot;\
     python3-h2 \
     python3-hpack \
     python3-hyperframe \
-    python3-mprpc \
     python3-priority \
     python3-pyconnman \
     python3-pyro4 \
--
2.29.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------7FBBAF081F3095E45035C506--
