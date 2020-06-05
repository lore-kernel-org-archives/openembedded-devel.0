Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.44])
 by mx.groups.io with SMTP id smtpd.web12.144.1591377842575150605
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 10:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kbULQ7HD;
 spf=pass (domain: windriver.com, ip: 40.107.92.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsAMZjq3mmRUpfkyoEGACLrV9qacad6dmeh4X0KEUnnHmm5BAWaUa01ek4UF3OlllOtbQXwGEXoRA2DRc1eryUolLdmR8A09DIO5Rdt69v1N65bQgE9gEnkbzZnIP+YWlhgtsKRiDYxOauV323GrqcAqkeqAsrc40g+GLfhFXf8bvIZn2E8wAQLdrg2mDp2Gli5452L4hHOY5wEaSU56t0N40PYIg6Rrd580UjmZCgfqnMSKQciutGS5aknSJsjaGGpruAbgEr+nIU9rOKBwMmVSrqXu9GpMhqfLsM3xM5nwvOqta4jQM2LwozKCvZKV7zPf7jSBOJadNI4/wxJmYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePJ6olAl5/zvdJXkbAZbd9/a9YiuLWAyG7i/Q/xN/aM=;
 b=aapvUowXHQMR5oXWDHaDRvuTAeJQ3lxjzN6p+MFDKxqCgRGBx+/6U87TD15g3WJMKIXQY3b977M1Wm7IMyNJyVNqCiMvU5ahPYinNBFPqwmJccylX0/9+p0zFhROEaXz91tbQVHRcV+VsoRL2KO6ZTVn2M6jVL3ls7D3LiUx0Q9S4QRs7xLKv9+HLtwtDVJkndJVuHTQaap2hmtj7bzcMloTj+Ux4P56AuZwzgYtQayVeoWEufH/iDTyGRqb0+WAUrsGTBG0v26HexRIeKIlQGriufhy1YWzPe6Iijai2zuXG5kflKmnoD+8C+42dxM33s2znuQ+WVWJ5Sit9q/Mag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePJ6olAl5/zvdJXkbAZbd9/a9YiuLWAyG7i/Q/xN/aM=;
 b=kbULQ7HDmQ6MaAbQ4kwC84gxKF3Cp8FR0UWLon1YcHd07mjHnbH2q8DXoZk4QChGjdkLQR6ddpo3lCuUFhdArkWU1OSpGcixuuRloUtnp/ZEuQ6dKY3G58HNUDBZ2CiolReOcd+s4Y0v2hVQkwuc+jnc3r5ZlFiEizhglC1LbO8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1908.namprd11.prod.outlook.com (2603:10b6:404:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 17:23:59 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 17:23:59 +0000
Subject: Re: [oe] [meta-python][PATCH] python-pyaudio: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200603100836.18456-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0245e945-cde3-848d-7d24-7ceca02d563f@windriver.com>
Date: Fri, 5 Jun 2020 13:23:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200603100836.18456-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::43) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 17:23:59 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2b9914a-0d09-44da-bd85-08d809753be8
X-MS-TrafficTypeDiagnostic: BN6PR11MB1908:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1908F79D9706A0C9221471F39F860@BN6PR11MB1908.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rO79bXDjUg8bGLZACQAoTDta/uO4/ZMqME7POIu9xzTRAoYkCO7BFqQmsZdEbV/o4DyonJDTxL2UnaZd4xJYruh51oNa6aCMaBDe0PrYpCOuHDPOfMV8Fr+hribyeOyUM81oX61w3hG+SFwjTAcoRQXk4h1xnvgK9+qOxv6uR1sQ9qKZyl/GTurOh9ihbMv/cSjZdmr98fsxtNfd1ncCYtmawwZLwySfAHZsvIIVpCL5/8IE6kDksPXfwg3x9ZjzXivxo9SLuh/zZoQ57O3/4ieHth3bs4S4p8Wtk/N67AM8i8QbbeDqHUXhWzeN/n+k3IJejwwiwXH04QT3Zk8X3MYFJRUhODAufy7VKGH6GXWRg9EuqM8W1q60ekPhpBE2MYyoc8IqImpl7oaJ/kyOSKbiHg4ug1QjwuJO83TxenxfOo1bXZqdmudOUikdn0BdzG1oSZf1So74XZEqWW9tAA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(39850400004)(396003)(366004)(44832011)(8676002)(31686004)(53546011)(2616005)(66476007)(66556008)(186003)(16526019)(956004)(66946007)(2906002)(16576012)(26005)(36756003)(316002)(33964004)(31696002)(966005)(478600001)(8936002)(5660300002)(52116002)(166002)(6486002)(83380400001)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	dUJZBOJcMiTHSeSZCSujSrBErICquccM1W3gy6g16jIuZlR6QPGkTCKtKlR5At3v6xpgk+1lpE9MWY64zXpMhdkvtjSS7MDDqHkqINEQ4xCD42ZMYDXUNNUM1P02Xrg+wv3hwsoV9z94sru3BUVXW/5XFM9IjGNDyGL040xs72SNZFNDr6vJ+50ziOC2j5ABevfWWaiPV+jGCzgU9Joi/14SypH+rGIl2b79Sgxx6op/MCVNLnRz3O4UezsfqhInQLaCOGj6aAbdFffrj3hGHwtvTok/Dl8acKkB6f5OcedejGz9OwMVJABqG2klTiuonl3HU7qU1fywW7VY6mdMOqhx126j6AmHuW0C+KEK8GHB2FeyrwcwD1hLGdP8IRYrxtfGmV76pt/DWiiJ68ZwPQmvbN4MhlFeESfK/BZ3JNXwuiD6c4Q0/Pu0t+p6oUIhLzKNeSZzEk322dx9gdvVQmuLgDOzq977oHRWoIzc/dY=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b9914a-0d09-44da-bd85-08d809753be8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 17:23:59.6356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUCBVpQohRpzUJwv56xcmM64yakOeCts0+2xoMTVNxPFecQWvBwmjDcuGu9EqXnKhveNKPZzq4mOeMaY/ABYMLAmqa371mMMgE0aJcraDFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1908
Content-Type: multipart/alternative;
 boundary="------------3E23309249C01BC297BD74F0"
Content-Language: en-US

--------------3E23309249C01BC297BD74F0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/3/20 6:08 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-pyaudio.inc    | 13 -------------
>   .../python/python3-pyaudio_0.2.11.bb              | 15 ++++++++++++++-
>   2 files changed, 14 insertions(+), 14 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-pyaudio.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-pyaudio.inc b/meta-python/recipes-devtools/python/python-pyaudio.inc
> deleted file mode 100644
> index 0d3ddb1a5..000000000
> --- a/meta-python/recipes-devtools/python/python-pyaudio.inc
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -SUMMARY = "PyAudio provides Python bindings for PortAudio, the cross-platform audio I/O library"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://README;md5=288793c2b9b05bd67abbd2a8f5d144f7"
> -
> -PYPI_PACKAGE = "PyAudio"
> -
> -SRC_URI[md5sum] = "7e4c88139284033f67b4336c74eda3b8"
> -SRC_URI[sha256sum] = "93bfde30e0b64e63a46f2fd77e85c41fd51182a4a3413d9edfaf9ffaa26efb74"
> -
> -DEPENDS += "portaudio-v19"
> -
> -RDEPENDS_${PN} += "portaudio-v19"
> diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
> index abb01bf69..b2c890659 100644
> --- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
> @@ -1,2 +1,15 @@
> -require python-pyaudio.inc
> +SUMMARY = "PyAudio provides Python bindings for PortAudio, the cross-platform audio I/O library"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://README;md5=288793c2b9b05bd67abbd2a8f5d144f7"
> +
> +PYPI_PACKAGE = "PyAudio"
> +
> +SRC_URI[md5sum] = "7e4c88139284033f67b4336c74eda3b8"
> +SRC_URI[sha256sum] = "93bfde30e0b64e63a46f2fd77e85c41fd51182a4a3413d9edfaf9ffaa26efb74"
> +
>   inherit pypi setuptools3
> +
> +DEPENDS += "portaudio-v19"
> +
> +RDEPENDS_${PN} += "portaudio-v19"
>
> 

--------------3E23309249C01BC297BD74F0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/3/20 6:08 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200603100836.18456-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200603100836.18456-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-pyaudio.inc    | 13 -------------
 .../python/python3-pyaudio_0.2.11.bb              | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 14 insertions(&#43;), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyaudio.inc

diff --git a/meta-python/recipes-devtools/python/python-pyaudio.inc b/meta-python/recipes-devtools/python/python-pyaudio.inc
deleted file mode 100644
index 0d3ddb1a5..000000000
--- a/meta-python/recipes-devtools/python/python-pyaudio.inc
&#43;&#43;&#43; /dev/null
@@ -1,13 &#43;0,0 @@
-SUMMARY = &quot;PyAudio provides Python bindings for PortAudio, the cross-platform audio I/O library&quot;
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README;md5=288793c2b9b05bd67abbd2a8f5d144f7">&quot;file://README;md5=288793c2b9b05bd67abbd2a8f5d144f7&quot;</a>
-
-PYPI_PACKAGE = &quot;PyAudio&quot;
-
-SRC_URI[md5sum] = &quot;7e4c88139284033f67b4336c74eda3b8&quot;
-SRC_URI[sha256sum] = &quot;93bfde30e0b64e63a46f2fd77e85c41fd51182a4a3413d9edfaf9ffaa26efb74&quot;
-
-DEPENDS &#43;= &quot;portaudio-v19&quot;
-
-RDEPENDS_${PN} &#43;= &quot;portaudio-v19<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bbb/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bbindexabb01bf69..b2c890659100644---a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb@@-1,2&#43;1,15@@-requirepython-pyaudio.inc&#43;SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
index abb01bf69..b2c890659 100644
--- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
@@ -1,2 &#43;1,15 @@
-require python-pyaudio.inc
&#43;SUMMARY = &quot;</a>PyAudio provides Python bindings for PortAudio, the cross-platform audio I/O library&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README;md5=288793c2b9b05bd67abbd2a8f5d144f7">&quot;file://README;md5=288793c2b9b05bd67abbd2a8f5d144f7&quot;</a>
&#43;
&#43;PYPI_PACKAGE = &quot;PyAudio&quot;
&#43;
&#43;SRC_URI[md5sum] = &quot;7e4c88139284033f67b4336c74eda3b8&quot;
&#43;SRC_URI[sha256sum] = &quot;93bfde30e0b64e63a46f2fd77e85c41fd51182a4a3413d9edfaf9ffaa26efb74&quot;
&#43;
 inherit pypi setuptools3
&#43;
&#43;DEPENDS &#43;= &quot;portaudio-v19&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;portaudio-v19&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------3E23309249C01BC297BD74F0--
