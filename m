Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935B9C7EE2E
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 07:15:37 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web11.3468.1686208529017900302
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 00:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=fK4h75qp;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1876; q=dns/txt; s=iport;
  t=1686208529; x=1687418129;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lbfPVu8kmqI9h1eXvKaDC+RZ168pC4RFs/5eV/eha/w=;
  b=fK4h75qpNT+5IwvPYSp9Dv2VX8xPD28TWQWMDfSJzCKIRXs0LLyPOylq
   hKcGctwPSkpmab/sRF1dKp3G3oCXd7qeE9gotbXCuzsrUR6cm+afU1Gm7
   sCDRYdg6KFQTjC/O+Q+PuWlXLhMvh6xH5nJQqyaoJZS/uvQxxNQhlpCi6
   M=;
X-IPAS-Result: =?us-ascii?q?A0AkAACJf4FkmIMNJK1aHQEBAQEJARIBBQUBQCWBFggBC?=
 =?us-ascii?q?wGBXFJzAlk8Gi2IHQOETl+IUgOLUZIagSUDVg8BAQENAQEuBw8EAQGFBgKFb?=
 =?us-ascii?q?AIlNAkOAQICAgEBAQEDAgMBAQEBAQEDAQEFAQEBAgEHBBQBAQEBAQEBAR4ZB?=
 =?us-ascii?q?RAOJ4VoDYYEAQEBAQMBESgGAQEJAS0BCwQCAQgRBAEBHxAhBwodCAIEAQ0FC?=
 =?us-ascii?q?BqCXAGCKAMxAwGhIwGBPwKKJHiBNIEBgggBAQYEBWsfATEDmxENgkkJgUIBh?=
 =?us-ascii?q?1WFJxuESCcbQIFNgViCaD6CIEICA4FfhBKCLo4qhTOJUoEpb4EegSJ/AgkCE?=
 =?us-ascii?q?WeBCghgd3lAAg1VCwtjgR1SPYFGAgIRPBAFTXsdAwcEAoEFEC8HBDIJFQkGC?=
 =?us-ascii?q?RgwJwZTBy0kCRMVQgSDWQqBEEAVDhGCYjACBxY3A0QdQAMLcD01Bg4fBQQkS?=
 =?us-ascii?q?4FXMECBDQIiJJ4cgwiBDoFEQjkqlg+Lc6FPcAong2GLfI0agXmGJxeEAYFWi?=
 =?us-ascii?q?xSVPIMtmBUggi+OfpY/AgQCBAUCDgEBBoFjOoFbcBWDIglJGQ+OIBmDW4UUi?=
 =?us-ascii?q?mV1OwIHCwEBAwmLRgEB?=
IronPort-PHdr: A9a23:S3nQTxVswzkWO3qNFh6fpk8BdBvV8K0yAWYlg6HPw5pHdqClupP6M
 1OaubNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QS47lf1OHmnSp9nYJHwnncw98J+D7AInX2t+81+Gu4ZrfSw5JnzG6J7h1K
 Ub+oQDYrMJDmYJ5Me5x0k7Qv3JScuJKxGVlbV6ShEP64cG9vdZvpi9RoPkmscVHVM3H
IronPort-Data: A9a23:86Afpa1SrcikuRqsffbD5e1xkn2cJEfYwER7XKvMYLTBsI5bpzxVm
 jRNUW6CPfbbNDCgKI8lb9nl/B5SvpSGn9AxSQBv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZxyFDmFzvuUGuCJhWFm0q2VTabLBufBOyRgLSdpUy5JZShLw4bVuaY2x4Dha++xk
 Ymq+ZaHZgf1g2cc3l88sspvljs+5JwehxtA1rAOTagjlEPTkXATEKUeKcmZR5cvatAJdgISb
 7+rIICRpgs1zT90Yj+WuuqTnnkxf1LnFVPmZky69ESVqkMqSiQais7XPReHAKtdo23hc9tZk
 L2huXEsIOskFvWkpQgTb/VXOwxwZ4oZ/efkGF38r9CakxLvSF3O48w7WSnaPaVAkgp2KWhK8
 fpdIzcXY1Xawem327m8DOJrg6zPLuGyY9hZ4S8mlGqfVK1/KXzAa/2iCdtwxzwwh9xUGvr2b
 MsCYj0pZxPFC/FKEg5NUclkwLf33xETdRVA9WCc+6wW4FKC1SxbzuHdFfvzZd6FEJA9ckGw/
 zKaoDuR7gshHNuHxDyI93ihiuPCkWb3VZwfEJW89+V2mxuU3mEVBRgcWFe3rPX/jVSxM++zM
 GQd/i4o6KM17kHuF5/2XgazpziPuRt0t8ds//MSxQ/X7fXRuyWgIysaUjcdN/Udku0WfGl/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URT5y0dfO0foqiNYv7HeTJEPYgHnFYwzTfLp5jHhMXShn
 W3b/XBWa6A70JZj6kmtwbzQb9tATLDmRxQx7wPbNo5OxlwkPNL+D2BEBKSy0BqtBI+dSl/Et
 38elo3HqusPFpqK0ieKRY3h/Y1FBd7baFUwYnY2QPHNEghBHVb/J+i8Bxklei9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CKCKN4QUPMQpJV7blM2LWaJ29z61+KTLufxvU
 ap3je73ZZrnIf09lWHvF7t1PUEDn3lvmgs/uqwXPzz+gebBOxZ5uJ8OMUCFaagi/biYrQDOm
 +uzxOPUoyizpNbWO3GNmaZKdAhiBSFiVfje9ZcNHsbdeVUOJY3UI6KLqV/XU9Y7z/09eyah1
 izVZ3K0P3Kg2SWZc1vbNiALhXGGdc8XkE/X9BcEZD6A83Mieo2oqqwYcvMKkXMPqoSPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:NGt9VaBEy5tyYI/lHegDsceALOsnbusQ8zAXPh9KKCC9I/b3qy
 nxppsmPEfP+UgssREb8+xpOMG7MBThHO1OkPgs1NCZLUbbUQqTXc1fBO7ZowEIdBeOjdK0W8
 1bAtJD4bHLfD1HZIPBkXaF+rUbsZe6GcKT9JrjJh5WJGkAB9ACnmVE40SgYzFLrWJ9dPwE/e
 +nl7J6Tk2bCA0qh6qAdx04tu74yuHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX242oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF3nAjv0idprD
 D/mWZlAy1B0QKXQohzm2qq5+DU6kdq15Yl8y7AvZKsm72geNtwMbswuWsQSGqr16NnhqA87E
 qOtFjp7aa+ynj77X/AzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYdw99Q/Bmcka+d
 NVfYnhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zo93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkf8IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehTKYd0s8LAo23FUgMyJeFOwC1zwdLkHqbrUn8ki
X-Talos-CUID: 9a23:7HnkfGPl7MYdJu5DdSc90xERQuMcVz7D0H6MfGaDL0RJcejA
X-Talos-MUID: =?us-ascii?q?9a23=3AzuRBVw/nBZnel2rIHb5r+WSQf9810a3wDmEOq8Q?=
 =?us-ascii?q?fm+OabBxVGhGCjjviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-1.cisco.com ([173.36.13.131])
  by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 08 Jun 2023 07:15:19 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 3587FFGA031856
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Jun 2023 07:15:17 GMT
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,226,1681171200"; 
   d="scan'208";a="2735337"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
  by alln-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 07:15:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fV8i/m0yKmAe5CKdtqgSMcFyRqTkxxjjXcRhN/6b3W0RwxaYORLpmoudyYmiKTKat7j01PzPhZLho5GQAWZcLJ+0NEz/kXscqmZA11HzBG0iUlZSiR//GL6nEWtrYuAI66UY0TDd/xmkQrNzDXcbKwRBAYHoDwiJF3hB1aFmvVu2y54kOQQzHqjQiimEXN5trajZqh8Q7vPIWf5fcZo4A5tNdeLQNTRn39kKB4PdalXpRN2E1a0fn/qGKo5GNUZzNlDr+dY3ybihAAAsiMEcN4kOIahbPDPIZ865WfOwgoz/R5o1SKPtlohgEJ0E6vg62hjaGJKuoP5xzciIBvF1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4O/WIKOQ/w4haN0f3DNGGB+lT2iqLYRc+0Cs++1ISmU=;
 b=jHZ6gTOV/2jR5vR43sL6ipru2f3wr77k97Em+F/nBtb0xTu/aofGxazCPjofa7NselEJtE5GDvhxYrjlUUfqY38o1SBhZsEAW+Kc/jt322RmfSWG8hdhZroWUeG9GRrxFWhb82LlcAww3/zYYTOAjJ3NQjIZaEnpQClt5+4aZKSvl4guMQ1GLojtWVwfb5au/VDuGi31GpBSCNWdbu/5yGSr+80+mmfZGQ2ReZ7VNiLa0rDan/RWamLvQZG7CQbta3849vM5hxiATk4I2VvmQJ+Dh9CCDCFGsCr9ZB4TM3qZyWVNTGcZ85cduKopJTbkIR/O/T8I7PHAWGoafEvzZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O/WIKOQ/w4haN0f3DNGGB+lT2iqLYRc+0Cs++1ISmU=;
 b=fSPeibv8oiahzKqHl9T+w3GV1B6TQssHcePrvECLv6C6m5/yqrX/4KXmwXQq2B41DoEXrF8nSLFu/X5Pl7NtoX7MY0jrChq9yL94CQRG1wWki59Cel11wfsG6k6TMSuP9EqZJ2g2chtbP1KuOZH/bz47/s5vs52mVCX2ssynWcg=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 07:15:12 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%5]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 07:15:12 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)"
	<schitrod@cisco.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>
Subject: RE: [oe] [meta-oe][dunfell,PATCH] gnulib: Update recipe name to
 2018-12-18
Thread-Topic: [oe] [meta-oe][dunfell,PATCH] gnulib: Update recipe name to
 2018-12-18
Thread-Index: AQHZk3cadmd8+ZlW9Eis2CIu4cn1iq+AiUIA
Date: Thu, 8 Jun 2023 07:15:06 +0000
Deferred-Delivery: Thu, 8 Jun 2023 07:14:46 +0000
Message-ID: 
 <SJ0PR11MB6717E0E52ABBE4E73540D3E8DC50A@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <17641F78C7AFC3D4.21586@lists.openembedded.org>
In-Reply-To: <17641F78C7AFC3D4.21586@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|CH0PR11MB5332:EE_
x-ms-office365-filtering-correlation-id: becde735-b973-40c0-7c30-08db67f0198c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vvtqDuYJm27cen9NSB+KZJh4zxTwe3FMQmNAJsT6ePYRMtxeISHdyonumoXZdfaxhHbIqbAgd1pBMbDfqh6GpZu5GOiooKcTRo791y0U28gyuc/ReQJ/sFBzy9+9pFgCF3piJ22MvAKqkmzO+yuJ6Xj958rTbGw9CdWBcGfGfUA6aNvfY3TZ8sz1ThfsNfDjSBqFswa5JrqR9BmmE2CpANNYNdTcXs2/SzFFco1eXJoV6xv9Yls7URcf6g3Pc6Xfh9rubccLWhnCb6UBI486ihkEslciv9UYV354tMXAJGL5B7N9i1nOscoVKVqz9kuy87pXF3NqC9767FSxZKXZbWDNRlhedVj2OP6Ev2aCvMPuW/yLXtneTPJCp11rdj5MQ/b46DWw60oCpn0YP73gvKrrzmYM436f4oNBe4sAx07JviaH/KVOU0Ot7Dk6xJdl4iM1Q78yv/yLCUWHAmOK8DXMY4bnFXIgm+a/UoYkvTAo5olCFTJCF4IUIWtd4XUkrOKzAQ8nxE4O+aIgnmzHo3FZPfrU/XELvTAPj932/n6I8aLm5sHaFw7Rd/aUIJ1lX+o6CoU6agUmEK65aPwwB0e3Z/Z5N9aceckgPKKMct1GwXm+6l6TYnF77ZJCaILA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199021)(66556008)(33656002)(38100700002)(122000001)(86362001)(38070700005)(15650500001)(4001150100001)(55016003)(71200400001)(6666004)(110136005)(7696005)(478600001)(2906002)(9686003)(6506007)(186003)(316002)(5660300002)(52536014)(66446008)(4326008)(64756008)(66476007)(41300700001)(83380400001)(76116006)(66946007)(26005)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?h/LyW0cf9m2At2oG1dNaZtkcKxBTLXVRiiW6JZ8hADSbFIwn1cX8Z1OAI4lB?=
 =?us-ascii?Q?eXaIOnTGdt+YZah6iGIFOMdKaPQA50bjcowt349YuNShvTBx3ojFX4rRKHkd?=
 =?us-ascii?Q?BQi8bNOLsXvg1wpRIYhurDEjsKGeZzBbRHC0SMYIEKP6/aidVVvY18ZsngRm?=
 =?us-ascii?Q?Bu9zVEDq5JMcn2f85aZ+AMCil37YFpKzU6yjiIKF9tbMoQ6CLBaaJ0eZnweE?=
 =?us-ascii?Q?cn+gn+QrkBRmXReBak2XZpEsBVprL8nIOZBF2vZp5GjT/h2q/RF/mq2ICF8i?=
 =?us-ascii?Q?4iRoUBFeO4Y2Oss/W0EV4amEIj9I6vNFTBb8me6d4thRbK0DGkeb9cR2GghK?=
 =?us-ascii?Q?BgMbHK+rT1btYYamdgBAiPKVChpToeT0G24fZQbIVx5uLJfVCTODV6li5S9a?=
 =?us-ascii?Q?UY0rY0rpAVcitT6VQ9H8tHxKiZgnG7GcEPxnuPTEIaEK8A3vujoOrlbr3p1D?=
 =?us-ascii?Q?2LusahU/WWg8L2XmhFYUe22CMdzO9p1gfq9NNn8RIjJDrQqyJw4zmINtgerA?=
 =?us-ascii?Q?Q/ckwu+vmSA3qPg2pE7m4papflIkLPzebQWntkcVeugq6jrUG5TpOqbyKNVX?=
 =?us-ascii?Q?9iwjfDth1q8c5ixOzSBs57t2ju8pDC9RdKrQI4QoI1WrURdh+QhtJRFVFu7G?=
 =?us-ascii?Q?zxsjRGXuOR2TtFLolqZAofWNALsLM7xCcmHTEckcJvz9iikE71G4OC8vT8iJ?=
 =?us-ascii?Q?ifTrrj07KuApt+Wb1op+1JAjYG8OuguYgGtjBamulmEe2F5lcnnUwEnoBoV1?=
 =?us-ascii?Q?TW5YC1dayXBiIKQbtyXXRzE34d1uhFtr5/JN1aeEWJK7402vshSL5KGOe2vv?=
 =?us-ascii?Q?+FpPBMbFNt0RSr1ejw1yrsdmsu43ElwWPANZEs4rEo5MTKIKJenyUetFBYXB?=
 =?us-ascii?Q?u6AmFDJ8CIevpNxycUVe4Oo/lrSIkGkLuYPcRi5DN8G6PwgB9DmoJ8QSR7Ne?=
 =?us-ascii?Q?/bfqltmhyXBLAD5dHs38ArPBKtMjQCeVEr9ssU07lNBhvvQzESUXGUQHrvcr?=
 =?us-ascii?Q?8jE/wXc5o09SjWkFw2Th0N0BWc8+CSgzvpP4OBC/0VC6/zUqTcWWi75+wSA1?=
 =?us-ascii?Q?yKaN676xmL+wLOdNXPVzAsl5uZKi8FLhD67jPN94LDq5j6+faRIE2NFV265i?=
 =?us-ascii?Q?T+r6O0XU4WQvZXeuhEV2316dbEdfAjZixtN+FYZixJUjsbgejUr3OyGR87qS?=
 =?us-ascii?Q?EnrD8cyHY14usXz/1zXG2YAiWt6wLIl3HbXbZGX9tm45Cw8G82XEWKOGwpxj?=
 =?us-ascii?Q?msOJ03AKfvC1f6WN3VJi7k7uN+IgItTflLhU2/rtel1l7GsWuVTaeKepFYDY?=
 =?us-ascii?Q?uC5z+2gfimfx7bn78ADIXLVYVCz/un58tro2/ax/CcyWTaoQKsSa0C8L1osm?=
 =?us-ascii?Q?K254k5h5oFclyOXfog4ZKPqZnxtQTRzpDW5PV0fHtsZxMQYjkVv6dpS5Jank?=
 =?us-ascii?Q?ieMrDekhVbI3sBRmjrqXKuo6sw3LqTzqyaIcgf7p60nq/w1UgWuJhGdXNb4B?=
 =?us-ascii?Q?1McdzpDcoSplOuRHCjEjMoE+2UcGYzpPd8yAnp7n/Es6kyiNr2J+RuEC3VZl?=
 =?us-ascii?Q?w7iGzZpzuDoMXKAno+nZzeo3BF8rD8WS2hHztgID?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: becde735-b973-40c0-7c30-08db67f0198c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 07:15:12.1208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Zt3X06gLSuzOyLDO+1XfXmAxN9eE0LPqbI2Uz9vs2Zy0mBr53yXEmITsGXz4STpxKj13sUUUqWHgS81y7J+PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5332
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: alln-core-1.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 07:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103182

Hi Raj,

As per discussion and comment from Arman.
We need this changes on all the EM releases.

I can't see any update on dunfell branch for this patch.
Please review and provide your comment.

Thanks,
Sanjay

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Sanjaykumar kantibhai Chitroda -X (schitrod -=
 E-INFO CHIPS INC at Cisco) via lists.openembedded.org
Sent: Wednesday, May 31, 2023 9:49 AM
To: openembedded-devel@lists.openembedded.org
Cc: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco=
) <schitrod@cisco.com>; Khem Raj <raj.khem@gmail.com>
Subject: [oe] [meta-oe][dunfell,PATCH] gnulib: Update recipe name to 2018-1=
2-18

As per gnulib_2018-03-07 recipe information, SRCREV =3D "0d6e3307bbdb8df4d5=
6043d5f373eeeffe4cbef3"
This revision was committed on "2018-12-18".

There is a discrepancy between SRCREV and the recipe version.
Which reports "CVE-2018-17942" as unpatched.

To report "CVE-2018-17942" as patched,
We need to align a recipe name with SRCREV commit date.

Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com> (cherry picked from commit 9ed=
be7033cc41f4a49f74717cd3146b52588ce22)
Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 .../gnulib/{gnulib_2018-03-07.03.bb =3D> gnulib_2018-12-18.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)  rename meta-oe/recipes-su=
pport/gnulib/{gnulib_2018-03-07.03.bb =3D> gnulib_2018-12-18.bb} (100%)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb b/meta-=
oe/recipes-support/gnulib/gnulib_2018-12-18.bb
similarity index 100%
rename from meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb
rename to meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
--
2.35.6


