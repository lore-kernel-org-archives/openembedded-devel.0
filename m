Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.61])
 by mx.groups.io with SMTP id smtpd.web12.13155.1600866734836291142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 06:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EWaQFHPu;
 spf=pass (domain: windriver.com, ip: 40.107.93.61, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/P+Xtf0UGmlR7T6p3PC0y4fps0tozHrFvzlTKAPPyerpMA5cTWvqJUuHiLL1h9aNeI74QWIGmjDdTj/z3CGmhHdkaGDocf6uNOZmYAKc6oPxjaZR5z+lD023pF3/e6jVvMxnQpKJbhn6E7gwSpE2QJGuTlVY3hbvQ4kq+JPcQyh5zxwA532sdIkGyzWHSzpii2HrETZw7PVk/HJr/L2kjCusxpDHyk8rHmoI8lSp0lIFTMGYlJ6WRan0V6ni0sT2A7/TMcXnUXj3KWszdA7199Z90YXEXy7feH+LuKFhpmymJB4k4Pvap495at7r1iicW7Hovwj+Bmx+ki9kEm/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35tTs7NztQycGGvLZDAe94UImXFmeUT21M86aXnCSO0=;
 b=hsGMPo5OuMiKgXvWPPJSAPvYdD0YZStnDMZ5cALjsem8rWTK2MHJnqKWoU643FI43t9yYPU1bDiO1IrmFnlGQDSp3PS8KKm8EVr3Hw2In3McpMBIZeJZiCjgnS7FaZ/pJMoSoIzzY4KljCaGxXmDCZBvDa20i14ZUSx8yKekEf+A2vRjhwOtnj8m6Z79wHbcJWmcrZOBV8oKryCybm31YPt6zC0lU18GyPPQGgyD4eP2k6u6wMWbbRsrdrcy4iwSQO6FeNZ3aRUBE2B+0QMKfKYcwr5myquM13IFLnUud9LMitwgqOeuLgWo7dfWKy0aQ1fbAa1LEdRGO442OjLzjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35tTs7NztQycGGvLZDAe94UImXFmeUT21M86aXnCSO0=;
 b=EWaQFHPu+znW79/RFJs2Nrnr7FSjlqqhqMnGpbbhKhKXlW5IIjAoUhc6J23DzDJxpmstTP9STgH54MnI9puuen7txxHFAy80TZfAkWnMvERYFGLvP7apzu3HX8Mv2UKZYtcGWCiVagdUU3FseGPi4GS8cLhq165Stl1RsslYF5c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Wed, 23 Sep
 2020 13:12:13 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Wed, 23 Sep 2020
 13:12:13 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-flask-uploads: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200921134405.676-1-leon.anavi@konsulko.com>
 <20200921134405.676-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e5b922ba-149d-26d0-8e05-7023faac700e@windriver.com>
Date: Wed, 23 Sep 2020 09:12:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200921134405.676-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.26 via Frontend Transport; Wed, 23 Sep 2020 13:12:12 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f0432e3-64f0-466c-2b35-08d85fc2496c
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4103F114462F0AFC280833339F380@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gkd0CHrZxfRyhBg+LFUU1R+pMcQwlMcQBEXqyuBDsUMHLxpFUxf9LUyqayWf/ywXdJgnHmwF8hzJC0yCwaz0VEX4LK43C7GItsq3t8dLzXprBBbWIqqi+QDQSFhJMCGRGE0spsvxgTdzxuqZDKziurn6DBFrD3uR9xYq9GPmkQhl6jirg6w8Wc26JAHoJ+Vh2PwjCvquB26ULHvQl4ikIC3aY2bYfqsgEANp3m5zzEaAPVs/gtdr/GnHbrsUCK3dBccDImLfB4wPdT/5iskeS/s5nAO+VYFOsnTvzs5BoQh7y/qBPsfAuW4fJG12kboC2KKP+F86EerI+kSkL+mfnHN/BsmpSgAhoaE1MvGM25EuYh9evRh/EF/tQV+ZXbpad7H4pqhnYHlMAiD+8azZRdXPea1P+qySQF71uBp5WLR8GM1jneE2ypN7f+UT2Lxn1mkyJx3YDajW3EbgV+FZAL1GUoOE3ZNFNNLS2mIquwE6ZF908W6a6JigfpPSte51
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(376002)(396003)(136003)(2906002)(33964004)(316002)(16576012)(5660300002)(36756003)(478600001)(52116002)(66946007)(66476007)(8676002)(66556008)(83380400001)(53546011)(966005)(956004)(31686004)(86362001)(2616005)(6666004)(6486002)(31696002)(8936002)(44832011)(166002)(186003)(16526019)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	zEdbGtTrGHzqAxBh6rY3F2eVdYVCR06kL47Z24nPzAhNugxYB9uQcQbju3+ggmYR1QG0dQmAZP0TgEpCyl9W1Zcubh3zRM7oHHkyEhb4I4q9uT7Ede38n0ZkC1/HTaXhui7z1SqBzDk070FYuNfdywNk9qpIR+DXyPU+OqnkT40DXhEFqOvtJ0IDfoFotYX95Ocuyoj4N71pDBILd6F2CsK9dNpjX4jmmZJXkaqTSHKg5vP/Mr3L4HGtcRv+e85GOQb6Kc1vcZhiZG3AXI5I7u1NgATjLN+29N7idKiA1HHdZNYIkhQ7IJDQuleURl+iN41SfCuU2JJrJ7T5l1v3CLWIbRv+OErLPxpOxY30BTku3LDJRNKizm1Av1+LHOauLZdR7CPx9NlNyKAczrrvkuY/aaIa6r5s0kwWrZMQNYiKFbyQ2tUXhl8IUTyh99OGatYgiAEZKOJFlcLJ0szKtMW5HxdljD6lFnAIubG02ZWfoCELvZ6qeHH7E+CpRaZfrtpO8ZGHx2u3peLtStkIwyKtmnYscL51wq3jXpXq2Tq/pxQuP97srv/S/PEpmzrb7LmAc7iqwDemOK9G2VOT+g90cTZhhkRFSHnDugdlZokc3QWivIMVLQfO0dzwMisK13RXCJur+eToeVLIufIP1w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0432e3-64f0-466c-2b35-08d85fc2496c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 13:12:13.6393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdObtApfKFkrTyDiE7pTb5AuJSbhe3RYi3O5FABRxy7W5WI1CuWntVbPWUY2k41K2zwmCyi+D7jFgNRxfvuDk2Owr3eKCz+xuvB5WKqQScc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------4CB630D35F2001E3C141F9F1"
Content-Language: en-US

--------------4CB630D35F2001E3C141F9F1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/21/20 9:44 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-flask-uploads.inc                | 12 ------------
>   .../python/python3-flask-uploads_0.2.1.bb          | 14 +++++++++++++-
>   2 files changed, 13 insertions(+), 13 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-flask-uploads.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-uploads.inc b/meta-python/recipes-devtools/python/python-flask-uploads.inc
> deleted file mode 100644
> index cd7ac1aeb6..0000000000
> --- a/meta-python/recipes-devtools/python/python-flask-uploads.inc
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -DESCRIPTION = "Flexible and efficient upload handling for Flask"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b712ac634b39469660c9bdfb8d03421c"
> -
> -SRC_URI[md5sum] = "e5eee34aa92b64a4d22847672b3858a1"
> -SRC_URI[sha256sum] = "53ecbd6033667d50ae02b63adebbaa33c7fc56c09e5293025810cf9d841ecb02"
> -
> -PYPI_PACKAGE = "Flask-Uploads"
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-flask \
> -    "
> diff --git a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
> index 758c2acf71..e8d5b5f2f2 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
> @@ -1,2 +1,14 @@
> +DESCRIPTION = "Flexible and efficient upload handling for Flask"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b712ac634b39469660c9bdfb8d03421c"
> +
> +SRC_URI[md5sum] = "e5eee34aa92b64a4d22847672b3858a1"
> +SRC_URI[sha256sum] = "53ecbd6033667d50ae02b63adebbaa33c7fc56c09e5293025810cf9d841ecb02"
> +
> +PYPI_PACKAGE = "Flask-Uploads"
> +
>   inherit pypi setuptools3
> -require python-flask-uploads.inc
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-flask \
> +    "
>
> 
>

--------------4CB630D35F2001E3C141F9F1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/21/20 9:44 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200921134405.676-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200921134405.676-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-flask-uploads.inc                | 12 ------------
 .../python/python3-flask-uploads_0.2.1.bb          | 14 +++++++++++++-
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-uploads.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-uploads.inc b/meta-python/recipes-devtools/python/python-flask-uploads.inc
deleted file mode 100644
index cd7ac1aeb6..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-uploads.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = &quot;Flexible and efficient upload handling for Flask&quot;
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=b712ac634b39469660c9bdfb8d03421c">&quot;file://PKG-INFO;md5=b712ac634b39469660c9bdfb8d03421c&quot;</a>
-
-SRC_URI[md5sum] = &quot;e5eee34aa92b64a4d22847672b3858a1&quot;
-SRC_URI[sha256sum] = &quot;53ecbd6033667d50ae02b63adebbaa33c7fc56c09e5293025810cf9d841ecb02&quot;
-
-PYPI_PACKAGE = &quot;Flask-Uploads&quot;
-
-RDEPENDS_${PN} += &quot;\
-    ${PYTHON_PN}-flask \
-    &quot;
diff --git a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
index 758c2acf71..e8d5b5f2f2 100644
--- a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
@@ -1,2 +1,14 @@
+DESCRIPTION = &quot;Flexible and efficient upload handling for Flask&quot;
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=b712ac634b39469660c9bdfb8d03421c">&quot;file://PKG-INFO;md5=b712ac634b39469660c9bdfb8d03421c&quot;</a>
+
+SRC_URI[md5sum] = &quot;e5eee34aa92b64a4d22847672b3858a1&quot;
+SRC_URI[sha256sum] = &quot;53ecbd6033667d50ae02b63adebbaa33c7fc56c09e5293025810cf9d841ecb02&quot;
+
+PYPI_PACKAGE = &quot;Flask-Uploads&quot;
+
 inherit pypi setuptools3
-require python-flask-uploads.inc
+
+RDEPENDS_${PN} += &quot;\
+    ${PYTHON_PN}-flask \
+    &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------4CB630D35F2001E3C141F9F1--
