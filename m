Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.80])
 by mx.groups.io with SMTP id smtpd.web11.52716.1598879522062730904
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 06:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fXPsGtL6;
 spf=pass (domain: windriver.com, ip: 40.107.243.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJA2ysr100OdMPImgvjx2oTmuGgweTgJDYCmKXTN96btotUZ4TNoCcqhQSrR9jDJfcgfH4GNJbhm8Y30wnNc3OXBAyYhoMeFCnNDOHEbEsHPuLhHMyCsPRcSN1PhU1Bn8iE5c0JCi69ecC58PO9sXZpxKDwopeVwBteNRIP8CD5mLqmOfzDC5/P+//Kv8dndFslpf1PIh7IwTyM0SclVxOAfupkOzlqm7lOm2HEwUfwOFq9HJ/ySRfx4XPC+o9KRNOVpliYsXnugq4RFc9GGebhAzzQe9t0f4fqJjwsuLrRvO/vbxDboPU8eb+n4G0UBbxj/JKe5hIjVJey3ZfOppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BifCi1ZzEW3dCSlhjg5rTnz1Yjn8v0JYe1bxOwM2uY=;
 b=h1zQfQEAk9jrxc6t+YkmeN27Jfh09dW9R18vftZTgqJw9rTqrmibU31es9cGxEPiA29XTDuhq0XiKJYYD3MIqVhf5NlGvEbdEPRtbKqmtwpn800Kz6DWfrQLPxSArDtz2o0oT+QhgoSeXWiEBQi1cWnTYxa7nbAoKFk8P2V8lusLO6BXg0BW7kRRCY4FytXtaCsrI8YKB+exvy8gT4eOqShjVN68baxNnI1860vM5u7jAgdTIKDm67d9c1/hArihfBGbTZJvlocgz651ux+bl+gnWExDlvOgUCrjyN/4fGftHfPF5IQRKcOB4kCZHe4RxiymaE+hJeA66ArN7KP+WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BifCi1ZzEW3dCSlhjg5rTnz1Yjn8v0JYe1bxOwM2uY=;
 b=fXPsGtL68103ORDugobw0PKfpTBrpjPgmooU4moGuIYtoJSdKQ3gXPHdi6z5QunHqM3XZWH4ziJfrAM62SD7tRDY5aP8nuw1+Xqn9ssGRyjt32bp3LNttdc+C21azK2NMWlPe4sS38u6BlnhWQ7Kbt3iJKzfVsNwgERiZ6fMtnA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Mon, 31 Aug
 2020 13:12:00 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 13:12:00 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-flask-migrate: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200827145504.29147-1-leon.anavi@konsulko.com>
 <20200827145504.29147-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b0d375ff-c77d-07aa-71ce-ac963052b17b@windriver.com>
Date: Mon, 31 Aug 2020 09:11:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200827145504.29147-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 31 Aug 2020 13:12:00 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7adc9854-8ada-48da-a6cb-08d84daf7234
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2807059BF759B13F84166D6C9F510@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O6FcRQJgBAnAlyxo8X50W2J+YaYHv+TTri5++2r17UaX62Q6c+/AvEDnwOqoJ5T0QDg821zdBCUuMSMXJW8+InhDGk+UenRDpcPqe3/t3wpAMinA7FfT6U/o1E8PTxb4Jpnd5G4z4w3lLvNm1MBkFgiefEs9dSOgua6bZDAdeMcoR5X2Vm9Xd2eHCpOQzx5CO/9h9uPXFjyE0Cz0ALGcK7DMPizbe5dZCxuclV1PXJ4IGHzo5s+cQQ/sgQs1hnFpuFX3/m1EmT6picc4sQQsmg//Bc38qbmYR6VUW59RNVr+1kH1ljrSBNvZaOf6ebzWw3V+bnhwlnctRbT6F5DU/10VznAYhdSfv4iK5NsRI/1U5SeBon7fPY3qgwyWZfgApgkjeKSs3eU60coqP56lVe/TVk9Meh/ZuUHJ2z/eaM/UKJ4R91VWmYRRKTLEmjEV76kRa4dU1HK1hLOnqwEv+g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39850400004)(376002)(346002)(316002)(2906002)(53546011)(33964004)(66556008)(166002)(478600001)(26005)(6666004)(186003)(6486002)(36756003)(956004)(83380400001)(8676002)(31696002)(8936002)(66476007)(966005)(31686004)(66946007)(86362001)(2616005)(5660300002)(52116002)(16576012)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/LBCOfnPSwDigz7GMzPEl/8xYr+Av8r5jVUFkupeXqDpT0yINhgB1lwCmqzlSSpxjxpGYQ2npikxvqeGs0mReUJj31nCBK4l9iwbXNXiOhe8FSsDtxdXNfZTqvEJ4w7P9XJMWxytcLToP6FC1NbJhKsmiHo2eX7MGCwUTDjEOpb1iWIIwNOPVW38hnDKQeULeidMctHJeR04YaVF1ab5/PbwJi1fCYe+CGRLia9XgL1rmwenuPtUj4NvJ1O8SrVIBJkHYSa8869N6b3LuLvrZP0zZT0KGSiE0/F/BFFoT/8BbAT8s2T+h50Wn5xo19ahpgb3o3QnpN782d4jC/E/nC83jZoJ9mDj6UyR9wWz3CaeZr0gSBFDcFHs+ArMEHhL2ZfTbADSx5E3StPpBB4o8blDN7KsfIJi9q7lPPGFrNd5QWIp9wPbni2qCO4SeLVHuY74GSKihWtJRTHBnelfxfxbWq4XnOH/aNIRff/zuDyT13AW7jKxpdmm/ADk43b7EonMUN9Cgoc8Y5nk1iyNnMtY7B1cbaFwRIMBPOtsmH8L432pkArCNgYXWaUfXNYDpuJ5UgTdV+Vzc5gCu8A9lioc46tXP0eAinkfZZ6ZonEZzL9AgQIY0e2pR7KFapA40aG8FcNDI4CNmflDtcJYUg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7adc9854-8ada-48da-a6cb-08d84daf7234
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 13:12:00.6702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/s6+GpavuAQuOVlWmRXcbH/FccY9f6QKqXjk2ymSLoA00udyBDUY+Zky8XiVBxn+W7Xk1XJiQwGWy3eHyqz7Stb/eremGXsTbUcnMURyik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------982070B0A6103B866C667911"
Content-Language: en-US

--------------982070B0A6103B866C667911
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/27/20 10:54 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-flask-migrate.inc              | 14 --------------
>   .../python/python3-flask-migrate_2.5.2.bb        | 16 +++++++++++++++-
>   2 files changed, 15 insertions(+), 15 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-flask-migrate.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-migrate.inc b/meta-python/recipes-devtools/python/python-flask-migrate.inc
> deleted file mode 100644
> index 5202f8be0..000000000
> --- a/meta-python/recipes-devtools/python/python-flask-migrate.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alembic"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
> -
> -SRC_URI[md5sum] = "bedeb0366740fda6912fea683be11968"
> -SRC_URI[sha256sum] = "a96ff1875a49a40bd3e8ac04fce73fdb0870b9211e6168608cbafa4eb839d502"
> -
> -PYPI_PACKAGE = "Flask-Migrate"
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-flask-sqlalchemy \
> -    ${PYTHON_PN}-alembic \
> -    ${PYTHON_PN}-flask \
> -    "
> diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
> index c98cbfddb..78ec665ef 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
> @@ -1,2 +1,16 @@
> +DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alembic"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
> +
> +SRC_URI[md5sum] = "bedeb0366740fda6912fea683be11968"
> +SRC_URI[sha256sum] = "a96ff1875a49a40bd3e8ac04fce73fdb0870b9211e6168608cbafa4eb839d502"
> +
> +PYPI_PACKAGE = "Flask-Migrate"
> +
>   inherit pypi setuptools3
> -require python-flask-migrate.inc
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-flask-sqlalchemy \
> +    ${PYTHON_PN}-alembic \
> +    ${PYTHON_PN}-flask \
> +    "
>
> 

--------------982070B0A6103B866C667911
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/27/20 10:54 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200827145504.29147-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200827145504.29147-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-flask-migrate.inc              | 14 --------------
 .../python/python3-flask-migrate_2.5.2.bb        | 16 +++++++++++++++-
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-migrate.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-migrate.inc b/meta-python/recipes-devtools/python/python-flask-migrate.inc
deleted file mode 100644
index 5202f8be0..000000000
--- a/meta-python/recipes-devtools/python/python-flask-migrate.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = &quot;SQLAlchemy database migrations for Flask applications using Alembic&quot;
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85">&quot;file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85&quot;</a>
-
-SRC_URI[md5sum] = &quot;bedeb0366740fda6912fea683be11968&quot;
-SRC_URI[sha256sum] = &quot;a96ff1875a49a40bd3e8ac04fce73fdb0870b9211e6168608cbafa4eb839d502&quot;
-
-PYPI_PACKAGE = &quot;Flask-Migrate&quot;
-
-RDEPENDS_${PN} += &quot;\
-    ${PYTHON_PN}-flask-sqlalchemy \
-    ${PYTHON_PN}-alembic \
-    ${PYTHON_PN}-flask \
-    &quot;
diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
index c98cbfddb..78ec665ef 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
@@ -1,2 +1,16 @@
+DESCRIPTION = &quot;SQLAlchemy database migrations for Flask applications using Alembic&quot;
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85">&quot;file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85&quot;</a>
+
+SRC_URI[md5sum] = &quot;bedeb0366740fda6912fea683be11968&quot;
+SRC_URI[sha256sum] = &quot;a96ff1875a49a40bd3e8ac04fce73fdb0870b9211e6168608cbafa4eb839d502&quot;
+
+PYPI_PACKAGE = &quot;Flask-Migrate&quot;
+
 inherit pypi setuptools3
-require python-flask-migrate.inc
+
+RDEPENDS_${PN} += &quot;\
+    ${PYTHON_PN}-flask-sqlalchemy \
+    ${PYTHON_PN}-alembic \
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

--------------982070B0A6103B866C667911--
