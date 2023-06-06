Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64779C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 13:48:21 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web11.387.1686059293548640561
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 06:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=EvUO3OXB;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=25108; q=dns/txt;
  s=iport; t=1686059294; x=1687268894;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=Pgn+xG+f5u/1Gz+JIlBJ8v5VZulslt8/7LsPqw7yZr8=;
  b=EvUO3OXBLYPnmgNHakkznq6RKElS4lDTb6+Bx7NJ1HoCwDD3LFFFgbqn
   OeZMJ29VTVJc5nDfGoxL0jRr+BsgTsOuKTE2iVLyriCUFkir4d6zKYuOQ
   9YuCpsWx8cmIu0wICqR8jmJLab0lql0DDjS1t1A+g/sEmxINb8L5zGdJM
   U=;
X-IPAS-Result: =?us-ascii?q?A0AwAABiOH9kmIwNJK1aHQEBAQEJARIBBQUBQCWBFggBC?=
 =?us-ascii?q?wGBKzFScwJZKhJHiB0DhE5fhi6CJAOdaYElA0kNDwEBAQ0BAS4BDAkEAQGEQ?=
 =?us-ascii?q?EYChWcCJTQJDgECAgIBAQEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBA?=
 =?us-ascii?q?QEeGQUOECeFaA2GBAEBAQEDAREVBhMBAQkBLg8CAQgRAwEBASEHBygKFAkIA?=
 =?us-ascii?q?gQBEggaglwBghVHAwEQBqEBAYE/AookeIEBM4EBgggBAQYEBYEKAT8CQ50XC?=
 =?us-ascii?q?YFCAYRMhGuDYIRIJxtAgU2BWHmBbz6BBYFRDAEBAgEXgUgMEg0Jg16CLo4th?=
 =?us-ascii?q?H2JRIEpb4EegSJ/AgkCEWeBCghggXRAAg1VCwtjgR5SPR6BKAICETwQBU57H?=
 =?us-ascii?q?wMHBAKBBRAvBwQyCRUJBgkYMCcGUwctJAkTFUIEg10KgRJCFQ4RgVYHNgNEH?=
 =?us-ascii?q?UADC3A9NQYOHwUEbIFXMECBEgJGnHoqA4IzT4EOARMYBRswgRAeFimSTyeOQ?=
 =?us-ascii?q?6MFCieDYYt7jRqIIBeFV6N9C5YegWogjTqEe5U2AgQCBAUCDgEBBoFjOoEqG?=
 =?us-ascii?q?wQLB3AVgyIJSRkPjiAMDQmDUoF/ZYIwimV1AgkwAgcLAQEDCYtGAQE?=
IronPort-PHdr: A9a23:iLTQihNQz/2+U1C7LZsl6nfLWUAX0o4cdiYc7p4hzrVWfbvmpNLpP
 VfU4rNmi1qaFYnY6vcRk+PNqOigQm0P55+drWoPOIJBTR4LiMga3kQgDceJBFe9LavCZC0hF
 8MEX1hgrDmgKUYAIM/lfBXJp2GqqzsbGxHxLw1wc//+Go/OlcO7/+uz4JbUJQ5PgWn1bbZ7N
 h7jtQzKrYFWmd57N68rwx3Vo31FM+hX3jZuIlSe3l7ws8yx55VktS9Xvpoc
IronPort-Data: A9a23:VeYSaq/E2loCQeiLPHdgDrUDn36TJUtcMsCJ2f8bNWPcYEJGY0x3z
 zYYCD2HOvaMa2f9fNkkPIq1oEMEsMTWmNdqTgU5pCxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEjmE4E3F3oHJ9RGQ74nQLlbHILCCYngZqTNMEn970ko9w7Bh2OaEvPDga++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFJZH4rHpxdGlOjKmVi8kFWc
 M6YpF2x1juxEx7AkbpJmJ6jGqEBaua60QRjFhO6VoD66iWuqBDe3Y4BHfpGLl1auQmFuNpAl
 9RhucCbTVgQa/ikdOQ1C3G0Egl3OalAvbTAO3X67oqYzlbNdD3nxPAG4EMeZNJDvL0pRzgVs
 6VEcFjhbTjb7w6y6KmwSuhwnMMvBMLqJ4gY/HpnyFk1CN5/GM6bHfSXvIAwMDEYq858IKbxP
 OAgZCNUMgz/Oh1KCG0xF8dr9AuvriCvL2IHwL6PnoIw+2XVwQl73bThPdaQdtGUSMF9mkeDu
 nmA+Hz0BBwfPtGTxTeJtHW2iYfycTjTUYYWEviz8eRnxQLVzW0IAxpQXly+yRWktqKgc+h2K
 xZT4CcckaQV/n30T/XxAza8/0fR63bwROFsO+E97QiMzI/d7ACYGnUIQ1Z9hDoO6ZJeqdsCi
 wThoj/5OdB8mObPGS/Bqt94uRv3aHZIfD5aDcMRZVZdi+QPtr3fmf4mojxLP6evitTzFVkcK
 BjV8XBi3N3/YSP3vphXEHjOhzaq45POVANwuUPcX3mu6UVyY4vNi22UBbrzsK8owGWxFwbpU
 J04dy62t7Bm4Xalz3LlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hUJG65M
 R+I5F8AtPe/2UdGi4cpO+pd7Ox3ncDd+SjNDZg4k/IXOMEqLV/blM2QTRfJjzyFfLcQfVEXY
 MfHLpnE4YcyAqV8xz3+XPYGzbIu3UgDKZD7G/jGI+Cc+ePGPha9EO5dWHPXN7xRxP3f+m39r
 Y0AX/ZmPj0CCoUSlAGNr95KRb3LRFBmba3LRzt/L7/ZfFY6ST1/U5c8A9oJIuRYokicrc+Rl
 lmVUU5Dw125jnrCQThmoFg6AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:vsnG5KgU669balqCJ3xcHkU2KXBQX3N13DAbv31ZSRFFG/FwyP
 rOoB1L73HJYWgqN03IwerwR5VoIUm3yXcH2/huAV7CZnirhILMFuFfBOTZskXd86OVzJ8n6U
 4NSdkaNDS0NykHsS+Y2nj2Lz9D+qj8zEnAv463pBsdLnAJV0gj1XYFNu/xKDwQeOAyP+tBKH
 Pq3Lsgm9PPQwVyUi28PBQ4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1SsF
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RG4Fq/QpF491H2mxa1e
 UkkC1Qe/ibLEmhOV1dlCGdmTUIFgxerUMKh2Xo2EcL6vaJNQ7SQ/Ax9b6xNCGppXbJeLpHof
 l2N6XzjesOMfvN8R6NlOTgRlVkkFG5rmEllvNWh3tDUZEGYLsUtoAH+lhJea1wVx4SxbpXWd
 WGNvusrMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wua4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Frt2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLELQIwFllu9EU5HHNc7W2He4OSITeuOb0oAiPvE=
X-Talos-CUID: 9a23:Bz1vlG+nz1hgt9s5HPiVv3Q9GppiaHDv8Hv3KX7nCEplFJaRFmbFrQ==
X-Talos-MUID: 9a23:QPyGZwogyNbSdCbdGUoezxxsBvo4zP+EMU0UqssehJCEMB5KHSjI2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-7.cisco.com ([173.36.13.140])
  by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Jun 2023 13:48:13 +0000
Received: from alln-opgw-3.cisco.com (alln-opgw-3.cisco.com [173.37.147.251])
	by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 356Dm8TC024279
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 Jun 2023 13:48:11 GMT
Authentication-Results: alln-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,221,1681171200"; 
   d="scan'208,217";a="2575457"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
  by alln-opgw-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 13:48:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nM+R23QedH9RC97ZCcJTxOwnHTpL133BHl8s3YlDwk6DCVYZoZR0BcFqcqxBAT97FQNo4bS6hJXPbCook5OJP9jJKxrLfMiPTeeJVcPP1NjCMJXAS4GMxzVg49GnES6btzVBnzw3b7A7THBDLyixFvDyzhFRzwxv2IKeblZV8w2vdMXJl9PdpR5T5xXHRh715gTpYlrBH5r3WGn5B0anio7BkA2cjZ/Nhbx2l9r4uF186NKtUimRb0LdX2aDIn45UMqrZyzOJPql5sYZ7Q0a0hGCsk7HBYagXTgiPvIWVu5nuPZDo70f7mTATWE0odHqJKnMjvS6+srGUyblJsR3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGhDzeH7vADpc/uUMUDP3qCaJ4BoqDNKtslJi4CwVVw=;
 b=mLpHB/y2utByVj9ARZih19+l0uy74HwBMrg6KVaHusf5TS6vGKie7oHw9D8tgxjkxrqegJ74ARmCjhnd6e8LLbi6k9TXzGhG50EuBxRfQgcybrS3l7XO3NoLyoZW0K7wxZgdNY3/zo1AD8qP7//tiCgCYx0BxhTvpoPdum5MsUSMA6cEiINYEssFniHrGLUUtSTMCMV+9ECntieWQFr1T9gs7oOSKCD6YwsGkN3t9ctkvYjVABFiBeQ9Nu4iKj3+Ah0m86mTnK/r01v2Ch2//moHz3JQn2VBfvrn0FkRbD8dUyY2t48Fc3For4PInDGSabxJpsYrGNUpHgKIlDRJ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGhDzeH7vADpc/uUMUDP3qCaJ4BoqDNKtslJi4CwVVw=;
 b=IHQs05bVLCcM8w6AUJWFqTOlGfFxabtJbnEbVRC92qS/gOqeklgwVgDFMHdemGoQjlnyiEDpzISVo+H+osiP+Ke9615xTL59ftjKrD+3KOzbzmogLKXCClS6AtESWneVTxJYx70S2q55tG14zBfdoBflWioxwfzokwDhYsKJ8rA=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 13:48:06 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 13:48:06 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "Yogita.Urade@windriver.com" <Yogita.Urade@windriver.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix
 CVE-2022-42867
Thread-Topic: [oe] [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix
 CVE-2022-42867
Thread-Index: AQHZmDamFij7Oqn3zECTMhTDi6OzrK99reOAgAAau3A=
Date: Tue, 6 Jun 2023 13:47:40 +0000
Deferred-Delivery: Tue, 6 Jun 2023 13:47:00 +0000
Message-ID: 
 <SJ0PR11MB67179F9E3E4E35904C1AD27DDC52A@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230606052015.314199-1-yogita.urade@windriver.com>
 <BL0PR11MB34105C7AAA71C1792213DDCE9F52A@BL0PR11MB3410.namprd11.prod.outlook.com>
In-Reply-To: 
 <BL0PR11MB34105C7AAA71C1792213DDCE9F52A@BL0PR11MB3410.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|CO1PR11MB4931:EE_
x-ms-office365-filtering-correlation-id: b466659a-cd89-4c55-bcd7-08db6694a7d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pMw11Xu0/+hw1P0OniEX8z0OMsaWC+PUb+6jWgvSOnQoVgdmXK1pRkr4BdXjXJQTYnKmRRoc+0w6gB34JFjw7bvHC4kGYU0n03dG8acEVMVQFhXnILFuwLoSP4ke9LBfw/7e0bsNpyvv3g+Z3VEcpUSRm7rCfpGRoAAdeX22cSgK8T3jOxIN/Z7lCplZWFDhyFJkX4DVkjdZ7OypQ9L0yz2oorA1v0aLJOEAkUYEJLr9b12cohoZWlXeQS/PeaZ18aDKcBdfrM2FTNELrJVFgndbK1ZZEpQpTJOyADfnw9OcHLvsJI2X66bZ9p3ofqnavfP0l6tBBLmJwPmmPl8SOHR0VMeirSRI+8nmGkNQNgNpkjLuBVA5NJlJYSt2VQjRB+NlHr1/9rcK03qBkANDl8GffvGAHJ9dHnerLG7rmf3/MblNjQPWq5AL3nOiUNw1OJVBBIZT/pcfcGHvP/J2QqC9kYDiWsI8aPLQqlpf2JVxAVuv0wEpGMExsdOJPZrZZ7PPghMuLwlCFpQdbGsMxvVQjVBCSXLuCMGVfD21QETAtXO1WJl2ivtqzTMZtAtk1/WndSKjPbZUm76LhuU3BthmRM9gA7crJjLVpUNuOMxs/8nKWtxkjQ6fiP5OE11ShKxS+kAFIFqAA8d9o87ZUQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199021)(9686003)(6506007)(53546011)(26005)(966005)(83380400001)(33656002)(122000001)(86362001)(166002)(38070700005)(38100700002)(186003)(55016003)(8676002)(41300700001)(110136005)(66446008)(66946007)(478600001)(66476007)(76116006)(9326002)(2906002)(316002)(64756008)(8936002)(52536014)(5660300002)(7696005)(71200400001)(66556008)(6666004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Jvf7TVsZCWqQYr88OIrjNc8hqSu3nST5lYdKcIubTLLZUvp+MAmYUbyL7pfR?=
 =?us-ascii?Q?yfw/XGuig0ZVZRdxFgEjwyBrdTTnrazdb4grzbBVUfspMywX4SLOnbZchz5a?=
 =?us-ascii?Q?zU4vsnIVP8aSkk/OzwXPaSkNxo686NdsvLaQnMekAzgvTRBb4PAezuDBE7AH?=
 =?us-ascii?Q?vJINCaEDs6Drl4C+jb2wN+hlSHpDOCP3lgXVR8tcIFH6FypVCjg8X/JzKlcz?=
 =?us-ascii?Q?YfFIcvWjs12Cq6ns+4O/meHN5IeEOnt61ml4ReYbNk4ZF6bkvFsB11u2OEDi?=
 =?us-ascii?Q?91OZhwX/Sh36v5zByTiqqZC2lxL03ObwN1x+dIh4rCJD72S1d7DdaF3I1pqc?=
 =?us-ascii?Q?cYY03HiKSn/zEbltMgTZC9W5LwYHSiEk6UnZtc04uJSJF6cUW9QXEyVAzuLP?=
 =?us-ascii?Q?MPe8TS6Q8PoQ11JGe4KIW9n/cmNjwBJZgtKnYzTJ5VNtfCKboMcK/v7H6wJ+?=
 =?us-ascii?Q?MRg8JWHuEIrMOCAM8+fCNz6+Jnv/Zi+UxemXMQCn8ab/kGG462+bEPw0cCmY?=
 =?us-ascii?Q?RkFZ0cfKh8JG/rI+ZBEr51NbNqVrFwPThlsCtcc/V7YUyl0WW+ihnKYxZby/?=
 =?us-ascii?Q?LnTeQN8/PGGkPcH8K0PLzatSidS5/SJlY7dluUJ6W0o15HMncowINFkqX1bs?=
 =?us-ascii?Q?bxXyfmjgYfGKgkTm2XncJwDjzQSn/Neh3SflU+Xu69RhphlNGyp5jZtFLKUq?=
 =?us-ascii?Q?Tq/HaQJqbSl6eEGqmYlEXwlXK+y8Y7a7bnncIKW6RlrGMrW9fEqT7Awe98o8?=
 =?us-ascii?Q?ovV7PlHHlybqwvgTIdPWkYiOVJyludgZcV4N4VgWTTgkmqWIh8pz1Waj+w0u?=
 =?us-ascii?Q?zmBlIkbo52zH59IJ/vLSiQ+j1wg0Hsp93+zUjRQtxlGJu8heX99bHMrnYBwi?=
 =?us-ascii?Q?2cmvDW271Q1AAFk7VHNDXOUk9QUgtqMYeCt60jNa9dnmM5hJXtpuayCWF8nY?=
 =?us-ascii?Q?OY6jOhaGLxZe+DJmTx+ZHE+sGmtExNh/n81OjkVWmkvWtvrT3V1rCL/8FUYx?=
 =?us-ascii?Q?o0DHMU6VkTFBq7TZEFukhgAB9vjZOsuIRqzSYz2Xh5MIuzeyknWUHl9nkEfz?=
 =?us-ascii?Q?ED4mRpkQu83EOkz9XR+C1sQYK+t2pmvHngXcdcLHSMJKSMNmf33dWViCyUe9?=
 =?us-ascii?Q?F3JCB4jF/Ta+qbD2xtZfj6dbW7Bzlf8GzRABupoRlPn/TUCJtY9iPZdJVr9A?=
 =?us-ascii?Q?XkioahzpUC1N3gyVsLB8iCQDbpSW3B/EE7cNT6jUzDR3glQQykryMP3RhNma?=
 =?us-ascii?Q?v/n97JRWIL7g8TbwdTr5GBbHYv0LMZEWH/+Uy/RP76Ij+C9ynqEU0bo+7oZs?=
 =?us-ascii?Q?9Xj8sY8PyDgq1BIMuyTUYFe4Qi9eqoakoLnPoMWmjm9wFpcWW5Yp1lLkbVpT?=
 =?us-ascii?Q?EDYIXqRBK58PhlW7T+IuKQ9OOwIjyHHuFCagK656jqeIrG2P5pYdHtl8qk7u?=
 =?us-ascii?Q?J4D3h8YuVhiLx9loo5APcMaP3xw0dS4hBc4ddtR+rmnKpT8/jqPN12jf6DGr?=
 =?us-ascii?Q?NvZ6SWX8ZZD7touZeXnAc5DWr0jeMXf0v3FJ3ufaHPlmHb3cnUkpJnFIQAOt?=
 =?us-ascii?Q?wWkbK0sQQkZx0NbG+kKqsbRIe5JOvK1r8FKb+JEK?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR11MB67179F9E3E4E35904C1AD27DDC52ASJ0PR11MB6717namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b466659a-cd89-4c55-bcd7-08db6694a7d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 13:48:05.9690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GU8q84r6lV3cIaW3ttLcYD/5aY0AkEOq3VeqxyiLv2bGvxcEvLjuTn0dkOadhjSZMEGWe+MeGEgAs8L792ZGUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
X-Outbound-SMTP-Client: 173.37.147.251, alln-opgw-3.cisco.com
X-Outbound-Node: alln-core-7.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 13:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103145

--_000_SJ0PR11MB67179F9E3E4E35904C1AD27DDC52ASJ0PR11MB6717namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Do we accept the CVE fixes which are not reported in our CVE metrics?
https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-status-kirkst=
one.txt

On which image we run cve_check task to generate CVE metrics? Any image whi=
ch run for all the packages available in SDK?

Thanks,
Sanjay


From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Urade, Yogita via lists.openembedded.org
Sent: Tuesday, June 6, 2023 5:35 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-4=
2867

By mistake, this patch sent to meta-oe.

Regards,
Yogita
________________________________
From: Urade, Yogita <Yogita.Urade@windriver.com<mailto:Yogita.Urade@windriv=
er.com>>
Sent: Tuesday, June 6, 2023 10:50 AM
To: openembedded-devel@lists.openembedded.org<mailto:openembedded-devel@lis=
ts.openembedded.org> <openembedded-devel@lists.openembedded.org<mailto:open=
embedded-devel@lists.openembedded.org>>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com<mailto:Hari.GPillai@windrive=
r.com>>; Urade, Yogita <Yogita.Urade@windriver.com<mailto:Yogita.Urade@wind=
river.com>>
Subject: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-42867

A use after free issue was addressed with improved memory management. This =
issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS 16.2 and =
iPadOS 16.2, watchOS 9.2. Processing maliciously crafted web content may le=
ad to arbitrary code execution.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-42867
https://support.apple.com/en-us/HT213537

Signed-off-by: Yogita Urade <yogita.urade@windriver.com<mailto:yogita.urade=
@windriver.com>>
---
 .../webkit/webkitgtk/CVE-2022-42867.patch     | 104 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch b/meta=
/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch
new file mode 100644
index 0000000000..c7d684097d
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch
@@ -0,0 +1,104 @@
+From 8747a631dff858a27ab1a75edb7f21658c2962e2 Mon Sep 17 00:00:00 2001
+From: Yogita Urade <yogita.urade@windriver.com<mailto:yogita.urade@windriv=
er.com>>
+Date: Fri, 2 Jun 2023 10:22:34 +0000
+Subject: [PATCH] RenderElement::updateFillImages should take pointer argum=
ents
+ like other similar functions https://bugs.webkit.org/show_bug.cgi?id=3D24=
7317
+ rdar://100273147
+
+Reviewed by Alan Baradlay.
+
+* Source/WebCore/rendering/RenderElement.cpp:
+(WebCore::RenderElement::updateFillImages):
+(WebCore::RenderElement::styleDidChange):
+* Source/WebCore/rendering/RenderElement.h:
+
+Canonical link: https://commits.webkit.org/256215@main
+
+CVE: CVE-2022-42867
+
+Upstream-Status: Backport
+[https://github.com/WebKit/WebKit/commit/091a04e55c801ac6ba13f4b328fbee2ee=
ce853fc]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com<mailto:yogita.urad=
e@windriver.com>>
+---
+ Source/WebCore/rendering/RenderElement.cpp | 27 ++++++++++++++--------
+ Source/WebCore/rendering/RenderElement.h   |  2 +-
+ 2 files changed, 19 insertions(+), 10 deletions(-)
+
+diff --git a/Source/WebCore/rendering/RenderElement.cpp b/Source/WebCore/r=
endering/RenderElement.cpp
+index da43bf3d..eb0a9b4c 100644
+--- a/Source/WebCore/rendering/RenderElement.cpp
++++ b/Source/WebCore/rendering/RenderElement.cpp
+@@ -358,7 +358,7 @@ inline bool RenderElement::shouldRepaintForStyleDiffer=
ence(StyleDifference diff)
+     return diff =3D=3D StyleDifference::Repaint || (diff =3D=3D StyleDiff=
erence::RepaintIfTextOrBorderOrOutline && hasImmediateNonWhitespaceTextChil=
dOrBorderOrOutline());
+ }
+
+-void RenderElement::updateFillImages(const FillLayer* oldLayers, const Fi=
llLayer& newLayers)
++void RenderElement::updateFillImages(const FillLayer* oldLayers, const Fi=
llLayer* newLayers)
+ {
+     auto fillImagesAreIdentical =3D [](const FillLayer* layer1, const Fil=
lLayer* layer2) -> bool {
+         if (layer1 =3D=3D layer2)
+@@ -379,7 +379,7 @@ void RenderElement::updateFillImages(const FillLayer* =
oldLayers, const FillLayer
+     };
+
+     auto isRegisteredWithNewFillImages =3D [&]() -> bool {
+-        for (auto* layer =3D &newLayers; layer; layer =3D layer->next()) =
{
++        for (auto* layer =3D newLayers; layer; layer =3D layer->next()) {
+             if (layer->image() && !layer->image()->hasClient(*this))
+                 return false;
+         }
+@@ -388,11 +388,11 @@ void RenderElement::updateFillImages(const FillLayer=
* oldLayers, const FillLayer
+
+     // If images have the same characteristics and this element is alread=
y registered as a
+     // client to the new images, there is nothing to do.
+-    if (fillImagesAreIdentical(oldLayers, &newLayers) && isRegisteredWith=
NewFillImages())
++    if (fillImagesAreIdentical(oldLayers, newLayers) && isRegisteredWithN=
ewFillImages())
+         return;
+
+     // Add before removing, to avoid removing all clients of an image tha=
t is in both sets.
+-    for (auto* layer =3D &newLayers; layer; layer =3D layer->next()) {
++    for (auto* layer =3D newLayers; layer; layer =3D layer->next()) {
+         if (layer->image())
+             layer->image()->addClient(*this);
+     }
+@@ -937,11 +937,20 @@ static inline bool areCursorsEqual(const RenderStyle=
* a, const RenderStyle* b)
+
+ void RenderElement::styleDidChange(StyleDifference diff, const RenderStyl=
e* oldStyle)
+ {
+-    updateFillImages(oldStyle ? &oldStyle->backgroundLayers() : nullptr, =
m_style.backgroundLayers());
+-    updateFillImages(oldStyle ? &oldStyle->maskLayers() : nullptr, m_styl=
e.maskLayers());
+-    updateImage(oldStyle ? oldStyle->borderImage().image() : nullptr, m_s=
tyle.borderImage().image());
+-    updateImage(oldStyle ? oldStyle->maskBoxImage().image() : nullptr, m_=
style.maskBoxImage().image());
+-    updateShapeImage(oldStyle ? oldStyle->shapeOutside() : nullptr, m_sty=
le.shapeOutside());
++    auto registerImages =3D [this](auto* style, auto* oldStyle) {
++        if (!style && !oldStyle)
++            return;
++        updateFillImages(oldStyle ? &oldStyle->backgroundLayers() : nullp=
tr, style ? &style->backgroundLayers() : nullptr);
++        updateFillImages(oldStyle ? &oldStyle->maskLayers() : nullptr, st=
yle ? &style->maskLayers() : nullptr);
++        updateImage(oldStyle ? oldStyle->borderImage().image() : nullptr,=
 style ? style->borderImage().image() : nullptr);
++        updateImage(oldStyle ? oldStyle->maskBoxImage().image() : nullptr=
, style ? style->maskBoxImage().image() : nullptr);
++        updateShapeImage(oldStyle ? oldStyle->shapeOutside() : nullptr, s=
tyle ? style->shapeOutside() : nullptr);
++    };
++
++    registerImages(&style(), oldStyle);
++
++    // Are there other pseudo-elements that need the resources to be regi=
stered?
++    registerImages(style().getCachedPseudoStyle(PseudoId::FirstLine), old=
Style ? oldStyle->getCachedPseudoStyle(PseudoId::FirstLine) : nullptr);
+
+     SVGRenderSupport::styleChanged(*this, oldStyle);
+
+diff --git a/Source/WebCore/rendering/RenderElement.h b/Source/WebCore/ren=
dering/RenderElement.h
+index f376cecb..d6ba2cdf 100644
+--- a/Source/WebCore/rendering/RenderElement.h
++++ b/Source/WebCore/rendering/RenderElement.h
+@@ -349,7 +349,7 @@ private:
+     bool shouldRepaintForStyleDifference(StyleDifference) const;
+     bool hasImmediateNonWhitespaceTextChildOrBorderOrOutline() const;
+
+-    void updateFillImages(const FillLayer*, const FillLayer&);
++    void updateFillImages(const FillLayer*, const FillLayer*);
+     void updateImage(StyleImage*, StyleImage*);
+     void updateShapeImage(const ShapeValue*, const ShapeValue*);
+
+--
+2.35.5
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.36.8.bb
index 1dac4f5677..0fce7d0d6e 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BP}.tar=
.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLA=
G.patch \
            file://CVE-2022-32888.patch \
            file://CVE-2022-32923.patch \
+           file://CVE-2022-42867.patch \
            "
 SRC_URI[sha256sum] =3D "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136ed=
bab2c133d00437"

--
2.40.0

--_000_SJ0PR11MB67179F9E3E4E35904C1AD27DDC52ASJ0PR11MB6717namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Hi Richar=
d,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Do we acc=
ept the CVE fixes which are not reported in our CVE metrics?<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><a href=
=3D"https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-status-ki=
rkstone.txt">https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-=
status-kirkstone.txt</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">On which =
image we run cve_check task to generate CVE metrics? Any image which run fo=
r all the packages available in SDK?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Thanks,<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Sanjay<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> openembedded-devel@lists.openembedded.org &lt;openembedded-deve=
l@lists.openembedded.org&gt;
<b>On Behalf Of </b>Urade, Yogita via lists.openembedded.org<br>
<b>Sent:</b> Tuesday, June 6, 2023 5:35 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org<br>
<b>Subject:</b> Re: [oe] [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE=
-2022-42867<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">By mist=
ake, this patch sent to meta-oe.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Regards=
,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Yogita&=
nbsp;<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Urade, Yogita &lt;<a href=3D"mailto:Yogita.Urade@wi=
ndriver.com">Yogita.Urade@windriver.com</a>&gt;<br>
<b>Sent:</b> Tuesday, June 6, 2023 10:50 AM<br>
<b>To:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org">ope=
nembedded-devel@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembedd=
ed-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org<=
/a>&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;<a href=3D"mailto:Hari.GPillai@windriver.com"=
>Hari.GPillai@windriver.com</a>&gt;; Urade, Yogita &lt;<a href=3D"mailto:Yo=
gita.Urade@windriver.com">Yogita.Urade@windriver.com</a>&gt;<br>
<b>Subject:</b> [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-428=
67</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">A use after free issu=
e was addressed with improved memory management. This issue is fixed in Saf=
ari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS 16.2 and iPadOS 16.2, watchOS =
9.2. Processing maliciously crafted
 web content may lead to arbitrary code execution.<br>
<br>
Reference:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-42867">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-42867</a><br>
<a href=3D"https://support.apple.com/en-us/HT213537">https://support.apple.=
com/en-us/HT213537</a><br>
<br>
Signed-off-by: Yogita Urade &lt;<a href=3D"mailto:yogita.urade@windriver.co=
m">yogita.urade@windriver.com</a>&gt;<br>
---<br>
&nbsp;.../webkit/webkitgtk/CVE-2022-42867.patch&nbsp;&nbsp;&nbsp;&nbsp; | 1=
04 ++++++++++++++++++<br>
&nbsp;meta/recipes-sato/webkit/webkitgtk_2.36.8.bb&nbsp; |&nbsp;&nbsp; 1 +<=
br>
&nbsp;2 files changed, 105 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.=
patch<br>
<br>
diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch b/meta=
/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch<br>
new file mode 100644<br>
index 0000000000..c7d684097d<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch<br>
@@ -0,0 +1,104 @@<br>
+From 8747a631dff858a27ab1a75edb7f21658c2962e2 Mon Sep 17 00:00:00 2001<br>
+From: Yogita Urade &lt;<a href=3D"mailto:yogita.urade@windriver.com">yogit=
a.urade@windriver.com</a>&gt;<br>
+Date: Fri, 2 Jun 2023 10:22:34 +0000<br>
+Subject: [PATCH] RenderElement::updateFillImages should take pointer argum=
ents<br>
+ like other similar functions <a href=3D"https://bugs.webkit.org/show_bug.=
cgi?id=3D247317">
https://bugs.webkit.org/show_bug.cgi?id=3D247317</a><br>
+ rdar://100273147<br>
+<br>
+Reviewed by Alan Baradlay.<br>
+<br>
+* Source/WebCore/rendering/RenderElement.cpp:<br>
+(WebCore::RenderElement::updateFillImages):<br>
+(WebCore::RenderElement::styleDidChange):<br>
+* Source/WebCore/rendering/RenderElement.h:<br>
+<br>
+Canonical link: <a href=3D"https://commits.webkit.org/256215@main">https:/=
/commits.webkit.org/256215@main</a><br>
+<br>
+CVE: CVE-2022-42867<br>
+<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://github.com/WebKit/WebKit/commit/091a04e55c801ac6ba13f4=
b328fbee2eece853fc">https://github.com/WebKit/WebKit/commit/091a04e55c801ac=
6ba13f4b328fbee2eece853fc</a>]<br>
+<br>
+Signed-off-by: Yogita Urade &lt;<a href=3D"mailto:yogita.urade@windriver.c=
om">yogita.urade@windriver.com</a>&gt;<br>
+---<br>
+ Source/WebCore/rendering/RenderElement.cpp | 27 ++++++++++++++--------<br=
>
+ Source/WebCore/rendering/RenderElement.h&nbsp;&nbsp; |&nbsp; 2 +-<br>
+ 2 files changed, 19 insertions(+), 10 deletions(-)<br>
+<br>
+diff --git a/Source/WebCore/rendering/RenderElement.cpp b/Source/WebCore/r=
endering/RenderElement.cpp<br>
+index da43bf3d..eb0a9b4c 100644<br>
+--- a/Source/WebCore/rendering/RenderElement.cpp<br>
++++ b/Source/WebCore/rendering/RenderElement.cpp<br>
+@@ -358,7 +358,7 @@ inline bool RenderElement::shouldRepaintForStyleDiffer=
ence(StyleDifference diff)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return diff =3D=3D StyleDifference::Repaint || (d=
iff =3D=3D StyleDifference::RepaintIfTextOrBorderOrOutline &amp;&amp; hasIm=
mediateNonWhitespaceTextChildOrBorderOrOutline());<br>
+ }<br>
+<br>
+-void RenderElement::updateFillImages(const FillLayer* oldLayers, const Fi=
llLayer&amp; newLayers)<br>
++void RenderElement::updateFillImages(const FillLayer* oldLayers, const Fi=
llLayer* newLayers)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; auto fillImagesAreIdentical =3D [](const FillLaye=
r* layer1, const FillLayer* layer2) -&gt; bool {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (layer1 =3D=3D layer2)=
<br>
+@@ -379,7 +379,7 @@ void RenderElement::updateFillImages(const FillLayer* =
oldLayers, const FillLayer<br>
+&nbsp;&nbsp;&nbsp;&nbsp; };<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; auto isRegisteredWithNewFillImages =3D [&amp;]() =
-&gt; bool {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (auto* layer =3D &amp;newL=
ayers; layer; layer =3D layer-&gt;next()) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (auto* layer =3D newLayers=
; layer; layer =3D layer-&gt;next()) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (layer-&gt;image() &amp;&amp; !layer-&gt;image()-&gt;hasClient(*this))<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; return false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+@@ -388,11 +388,11 @@ void RenderElement::updateFillImages(const FillLayer=
* oldLayers, const FillLayer<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; // If images have the same characteristics and th=
is element is already registered as a<br>
+&nbsp;&nbsp;&nbsp;&nbsp; // client to the new images, there is nothing to =
do.<br>
+-&nbsp;&nbsp;&nbsp; if (fillImagesAreIdentical(oldLayers, &amp;newLayers) =
&amp;&amp; isRegisteredWithNewFillImages())<br>
++&nbsp;&nbsp;&nbsp; if (fillImagesAreIdentical(oldLayers, newLayers) &amp;=
&amp; isRegisteredWithNewFillImages())<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; // Add before removing, to avoid removing all cli=
ents of an image that is in both sets.<br>
+-&nbsp;&nbsp;&nbsp; for (auto* layer =3D &amp;newLayers; layer; layer =3D =
layer-&gt;next()) {<br>
++&nbsp;&nbsp;&nbsp; for (auto* layer =3D newLayers; layer; layer =3D layer=
-&gt;next()) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (layer-&gt;image())<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l=
ayer-&gt;image()-&gt;addClient(*this);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+@@ -937,11 +937,20 @@ static inline bool areCursorsEqual(const RenderStyle=
* a, const RenderStyle* b)<br>
+<br>
+ void RenderElement::styleDidChange(StyleDifference diff, const RenderStyl=
e* oldStyle)<br>
+ {<br>
+-&nbsp;&nbsp;&nbsp; updateFillImages(oldStyle ? &amp;oldStyle-&gt;backgrou=
ndLayers() : nullptr, m_style.backgroundLayers());<br>
+-&nbsp;&nbsp;&nbsp; updateFillImages(oldStyle ? &amp;oldStyle-&gt;maskLaye=
rs() : nullptr, m_style.maskLayers());<br>
+-&nbsp;&nbsp;&nbsp; updateImage(oldStyle ? oldStyle-&gt;borderImage().imag=
e() : nullptr, m_style.borderImage().image());<br>
+-&nbsp;&nbsp;&nbsp; updateImage(oldStyle ? oldStyle-&gt;maskBoxImage().ima=
ge() : nullptr, m_style.maskBoxImage().image());<br>
+-&nbsp;&nbsp;&nbsp; updateShapeImage(oldStyle ? oldStyle-&gt;shapeOutside(=
) : nullptr, m_style.shapeOutside());<br>
++&nbsp;&nbsp;&nbsp; auto registerImages =3D [this](auto* style, auto* oldS=
tyle) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!style &amp;&amp; !oldStyl=
e)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return=
;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; updateFillImages(oldStyle ? &a=
mp;oldStyle-&gt;backgroundLayers() : nullptr, style ? &amp;style-&gt;backgr=
oundLayers() : nullptr);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; updateFillImages(oldStyle ? &a=
mp;oldStyle-&gt;maskLayers() : nullptr, style ? &amp;style-&gt;maskLayers()=
 : nullptr);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; updateImage(oldStyle ? oldStyl=
e-&gt;borderImage().image() : nullptr, style ? style-&gt;borderImage().imag=
e() : nullptr);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; updateImage(oldStyle ? oldStyl=
e-&gt;maskBoxImage().image() : nullptr, style ? style-&gt;maskBoxImage().im=
age() : nullptr);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; updateShapeImage(oldStyle ? ol=
dStyle-&gt;shapeOutside() : nullptr, style ? style-&gt;shapeOutside() : nul=
lptr);<br>
++&nbsp;&nbsp;&nbsp; };<br>
++<br>
++&nbsp;&nbsp;&nbsp; registerImages(&amp;style(), oldStyle);<br>
++<br>
++&nbsp;&nbsp;&nbsp; // Are there other pseudo-elements that need the resou=
rces to be registered?<br>
++&nbsp;&nbsp;&nbsp; registerImages(style().getCachedPseudoStyle(PseudoId::=
FirstLine), oldStyle ? oldStyle-&gt;getCachedPseudoStyle(PseudoId::FirstLin=
e) : nullptr);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; SVGRenderSupport::styleChanged(*this, oldStyle);<=
br>
+<br>
+diff --git a/Source/WebCore/rendering/RenderElement.h b/Source/WebCore/ren=
dering/RenderElement.h<br>
+index f376cecb..d6ba2cdf 100644<br>
+--- a/Source/WebCore/rendering/RenderElement.h<br>
++++ b/Source/WebCore/rendering/RenderElement.h<br>
+@@ -349,7 +349,7 @@ private:<br>
+&nbsp;&nbsp;&nbsp;&nbsp; bool shouldRepaintForStyleDifference(StyleDiffere=
nce) const;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; bool hasImmediateNonWhitespaceTextChildOrBorderOr=
Outline() const;<br>
+<br>
+-&nbsp;&nbsp;&nbsp; void updateFillImages(const FillLayer*, const FillLaye=
r&amp;);<br>
++&nbsp;&nbsp;&nbsp; void updateFillImages(const FillLayer*, const FillLaye=
r*);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; void updateImage(StyleImage*, StyleImage*);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; void updateShapeImage(const ShapeValue*, const Sh=
apeValue*);<br>
+<br>
+--<br>
+2.35.5<br>
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.36.8.bb<br>
index 1dac4f5677..0fce7d0d6e 100644<br>
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb<br>
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb<br>
@@ -17,6 +17,7 @@ SRC_URI =3D &quot;https://www.webkitgtk.org/releases/${BP=
}.tar.xz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch"=
>
file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-32888.patch">file://CVE-2022-32888.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-32923.patch">file://CVE-2022-32923.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-42867.patch">file://CVE-2022-42867.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[sha256sum] =3D &quot;0ad9fb6bf28308fe3889faf184bd179d13ac1b46=
835d2136edbab2c133d00437&quot;<br>
&nbsp;<br>
-- <br>
2.40.0<o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_SJ0PR11MB67179F9E3E4E35904C1AD27DDC52ASJ0PR11MB6717namp_--

