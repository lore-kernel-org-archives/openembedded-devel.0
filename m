Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.48])
 by mx.groups.io with SMTP id smtpd.web12.9854.1593090046459743333
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Sq/EJe12;
 spf=pass (domain: windriver.com, ip: 40.107.223.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YshivyAf44wTSxA6ZIrCtQ8riGNXrEUAL0N9x6+MJ6PzlpV3upa7h0klbAE9TCu1pCzc8eJ1PVqGt5Z0S8qrErh605bSWVCfuFwQ2MqzWx1aqKQcZ25/Kz3ZvrMxslKNVMSNtU3qVowYyzMmx1i3MDFD4TsuJI8ftjJuTpAx2UCj4mQA7Ia2nLIbGnFs6LiE8q/EICqa4Id8ehYyQug87WzELSyH2rvDWkKPKXYPCHykPokCO2VFHh76TLCxYU8nzf6epe4ez38/4ujhR1F8v+pOScujmUp8ZME0TE2sziavtHzBQEeGE++qGC3NZdXGV1JuHRIzSU+5hyZjj8eu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCo5wwNH8HnHhMbhjxX6Ez2/eQGT3RDn4xMapBXnbCI=;
 b=XzbklP/IEmjEiedunh2oxEEfzqiuSTxCn7xauX3zdmcwk05M2joH2U5kXdRIo13RcfcThYmFwOloD/kS4/UrAMQD++mB6PMrXfisS8oftt9tyvvFqD2NSuT1kz9F4sF8NbCs2qGvNxdb2G3DUeYYRrbu3fdxuHp2RRgumkrRVLvPovKdGbtuZh/ITc5JycO+Xs2T3SjN3rjRoYb5Oo/HO/EHSy2HgfeNygEEtiB9+Fu1qnjTc7tYnkEPgVwvB3Tp4OGAWyzg4Vuk1iH3hIPm48cWGlnB/OophANtm956fVcy5UVJm4PFYJzVDa9KiX1X4Bm0I0W5ubs8sDc4FLI+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCo5wwNH8HnHhMbhjxX6Ez2/eQGT3RDn4xMapBXnbCI=;
 b=Sq/EJe12i+AHgJmroX8PdCzRCxVV6nZNJFdguquLjvjzugS37N8LIX5Rx6gf+BJ6O0l99kCtdxr0AZoU4A9pL7puesAVMq1eGii25io4F9rj+jMw25e+4a2ubjhcHrfutUF32vAOHhsntHwqhu9KuO6ValoLPIyPbsbdeU8z0rk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Thu, 25 Jun
 2020 13:00:45 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 13:00:45 +0000
Subject: Re: [oe] [meta-python][PATCH 01/11] python3-sqlalchemy: Upgrade 1.3.12 -> 1.3.17
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <56f6c178-3d99-e332-e901-ae37ad53a704@windriver.com>
Date: Thu, 25 Jun 2020 09:00:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200623095136.24854-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::33) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 13:00:44 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5085ddf4-c1ee-4c83-da57-08d81907c5df
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3954F6C2035864480BB7FC079F920@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oxuM/IFXdcFyhtrCf99T0M2+aWd+MNPYNrIRilU0on9dXGHIePFSQvd9PH82bErYh2Bl/jj7dF1p+1xpqMjFq7NDFBSuvRamUr2dVm8yThW9I72A1pVIg4oLE+GCs7KY3so7kQ10aHiTLyPcDo9Hh9T2vXKltzACIebXSNuXFM9Q3YLim2orB/kRuvYJGukLzWdNuBpPOCRK/3pgsjF7UCR0bNw3DB9whvpecAAIKHvsjunkRvwffH+b7llbRbHPOTdR+TcpQrg0mmpJcN5GTI6j0146x8s3FQqZ/H4otbZCY+Zy0y0g9TNj/eyCsSduTKdd5ptg6n7pFd2pq1q9/SHJdYA7yBcNDC+iBX9lQQG/ivsliPLu0bJbb4feFTsrlfsgUGT33f65zhRoxsrjmz9mYAfTNwFu4PUjaUF/G9dkDdGmVmSn0jcX1AwRcC4mfx9I0HfhrKYy6GDNDuqyow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(39850400004)(366004)(396003)(346002)(52116002)(44832011)(83380400001)(86362001)(26005)(31696002)(186003)(36756003)(5660300002)(53546011)(8936002)(16526019)(966005)(16576012)(166002)(66946007)(66476007)(33964004)(66556008)(956004)(478600001)(2616005)(6486002)(316002)(8676002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	mOXk+H0kZSZbJHalLUBfamK4JBCYktMA+v3h6o+dx2wh6TAGuAzBLNSSXYRq9+6vhYIS47yft11q6A5lxNOmXdRdBK5nU8XZdSEMpeM0+cabjyHN7YumaJ2rMfe/sYiNoNvwO93/OSOgxWlpxGN1+0L7FzwQKqs/8h76Eo3zZECHqz6F4p6bUo5ozWr7sTCaYXQVllS98CFm7msgu4w4DhjUek9/s6RWLwU/uKZOHwJvPt6H0C77RDcUIDrGqEwzHfEpA0+1C/3+G8ktx1apKuAaU7LotS0g8YbmvD7Fei8aqMLG3ZdeCLTv6+yzdEQRUwUkoQUfec5XEsEp7ndTmqPH0sbZJnpsKod58F3IaYIz+xTZyuqJpd8sniZbIhMo+ae+vwtBzwDYeQhgnA95Alm9w+47SbJgsVLuR3+05L4GJfvu87rR3Oo9QIBggVJUmb530MMRHLDbXDoHg9DNXs4XZ7jgAItA7JXVOF64rhf7qaM8hb0VjVmZO1T8EpaH
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5085ddf4-c1ee-4c83-da57-08d81907c5df
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 13:00:45.1142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1yBYrm+1wUgkdxf7qezZsBqo3zBvK0HETD2YwsI/rLswpyLKDYbdQNhMNAfbGW/try/UFDG7M/wasYMavtgiwuhkJcUjb+u9vDM2Bz7Z7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------ACFAB5BC0E87898845A290EA"
Content-Language: en-US

--------------ACFAB5BC0E87898845A290EA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/23/20 5:51 AM, Leon Anavi wrote:
> Upgrade to release 1.3.17:
>
> - orm Bug fixes
> - orm Added an accessor ColumnProperty.Comparator.expressions
>    which provides access to the group of columns mapped under a
>    multi-column ColumnProperty attribute.
> - orm Introduce _orm.relationship.sync_backref flag in a
>    relationship to control if the synchronization events that
>    mutate the in-Python attributes are added. This supersedes the
>    previous change #5149, which warned that viewonly=True
>    relationship target of a back_populates or backref configuration
>    would be disallowed.
> - engine Bug fixes
> - schema Bug fixes
> - schema Add comment attribute to _schema.Column __repr__ method.
>
> The year in LICENSE has been updated so LIC_FILES_CHKSUM was
> changed.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-sqlalchemy_1.3.12.bb => python3-sqlalchemy_1.3.17.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.12.bb => python3-sqlalchemy_1.3.17.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb
> rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
> index e29b572cb..b9c58e5b6 100644
> --- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
>   application developers the full power and flexibility of SQL"
>   HOMEPAGE = "http://www.sqlalchemy.org/"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=2f5eb030c48975d5294baf0f5d01af1c"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2"
>   
> -SRC_URI[md5sum] = "02a46be841903b60c52a83342d3ced8e"
> -SRC_URI[sha256sum] = "bfb8f464a5000b567ac1d350b9090cf081180ec1ab4aa87e7bca12dab25320ec"
> +SRC_URI[md5sum] = "478214152b9293bf5652815d7312c890"
> +SRC_URI[sha256sum] = "156a27548ba4e1fed944ff9fcdc150633e61d350d673ae7baaf6c25c04ac1f71"
>   
>   PYPI_PACKAGE = "SQLAlchemy"
>   inherit pypi setuptools3
>
> 

--------------ACFAB5BC0E87898845A290EA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/23/20 5:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200623095136.24854-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.17:

- orm Bug fixes
- orm Added an accessor ColumnProperty.Comparator.expressions
  which provides access to the group of columns mapped under a
  multi-column ColumnProperty attribute.
- orm Introduce _orm.relationship.sync_backref flag in a
  relationship to control if the synchronization events that
  mutate the in-Python attributes are added. This supersedes the
  previous change #5149, which warned that viewonly=True
  relationship target of a back_populates or backref configuration
  would be disallowed.
- engine Bug fixes
- schema Bug fixes
- schema Add comment attribute to _schema.Column __repr__ method.

The year in LICENSE has been updated so LIC_FILES_CHKSUM was
changed.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200623095136.24854-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-sqlalchemy_1.3.12.bb =&gt; python3-sqlalchemy_1.3.17.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.12.bb =&gt; python3-sqlalchemy_1.3.17.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
index e29b572cb..b9c58e5b6 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
@@ -2,10 &#43;2,10 @@ DESCRIPTION = &quot;Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.sqlalchemy.org/">&quot;http://www.sqlalchemy.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=2f5eb030c48975d5294baf0f5d01af1c">&quot;file://LICENSE;md5=2f5eb030c48975d5294baf0f5d01af1c&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2">&quot;file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2&quot;</a>
 
-SRC_URI[md5sum] = &quot;02a46be841903b60c52a83342d3ced8e&quot;
-SRC_URI[sha256sum] = &quot;bfb8f464a5000b567ac1d350b9090cf081180ec1ab4aa87e7bca12dab25320ec&quot;
&#43;SRC_URI[md5sum] = &quot;478214152b9293bf5652815d7312c890&quot;
&#43;SRC_URI[sha256sum] = &quot;156a27548ba4e1fed944ff9fcdc150633e61d350d673ae7baaf6c25c04ac1f71&quot;
 
 PYPI_PACKAGE = &quot;SQLAlchemy&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------ACFAB5BC0E87898845A290EA--
