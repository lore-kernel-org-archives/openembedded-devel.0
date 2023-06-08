Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D47AC7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 07:16:27 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.web10.3488.1686208578113375180
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 00:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=CT0pi2oP;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1932; q=dns/txt; s=iport;
  t=1686208578; x=1687418178;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yK+TKzU0UQmIWw2xxqBwYmyUWKpCkAisNEYj6FAvYxw=;
  b=CT0pi2oPFz0iOlPnh7IXrIiXVI6YpT7x6bOEyMkwOQCjzflrUmUqWFAf
   GTDgF+6g4HVcLqO7rlhkNglg8bRmvmlBK/p4RV5tMMfJj4sdB0pfhRxJ7
   9WmMHS+y9Fye5B7wPBKZSzRklSpnhtD0rQV4Z+ylGZvPpJrw43IXQJOXb
   U=;
X-IPAS-Result: =?us-ascii?q?A0AkAACJf4FkmJxdJa1aHQEBAQEJARIBBQUBQCWBFggBC?=
 =?us-ascii?q?wGBXFJzAlk8Gi2IHQOETl+IUgOLUZIagSUDVg8BAQENAQEuBw8EAQGFBgKFb?=
 =?us-ascii?q?AIlNAkOAQICAgEBAQEDAgMBAQEBAQEDAQEFAQEBAgEHBBQBAQEBAQEBAR4ZB?=
 =?us-ascii?q?Q4QJ4VoDYYEAQEBAQMBESgGAQEJAS0BCwQCAQgRBAEBHxAhBwodCAIEAQ0FC?=
 =?us-ascii?q?BqCXAGCKAMxAwGhIwGBPwKKJHiBNIEBgggBAQYEBWsfATEDmxENgkkJgUIBh?=
 =?us-ascii?q?1WFJxuESCcbQIFNgViCaD6CIEICA4FfhBKCLo4qhTOJUoEpb4EegSJ/AgkCE?=
 =?us-ascii?q?WeBCghgd3lAAg1VCwtjgR1SPYFGAgIRPBAFTXsdAwcEAoEFEC8HBDIJFQkGC?=
 =?us-ascii?q?RgwJwZTBy0kCRMVQgSDWQqBEEAVDhGCYjACBxY3A0QdQAMLcD01Bg4fBQQkS?=
 =?us-ascii?q?4FXMECBDQIiJJ4cgwiBDoFEQjkqlg+Lc6FPcAong2GLfI0agXmGJxeEAYFWi?=
 =?us-ascii?q?xSVPIMtmBUggi+OfpY/AgQCBAUCDgEBBoFjOoFbcBWDIglJGQ+OIBmDW4UUi?=
 =?us-ascii?q?mV1OwIHCwEBAwmLRgEB?=
IronPort-PHdr: A9a23:n5nGPBU5XAgX2JikITicRXU/PLvV8K0yAWYlg6HPw5pUeailupP6M
 1OaubNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QS47lf1OHmnSp9nYJHwnncw98J+D7AInX2t+81+Gu4ZrfSw5JnzG6J7h1K
 Ub+oQDYrMJDmYJ5Me5x0k7Qv3JScuJKxGVlbV6ShEP64cG9vdZvpi9RoPkmscVHVM3H
IronPort-Data: A9a23:S3JfjqJNhsxxIrAUFE+R1ZUlxSXFcZb7ZxGr2PjKsXjdYENShWBUy
 DNJXGqFOPbcNmT3KNonaoix8xgEu5eBn4BiHQYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcIZsCCW0Si6FatANl1EkvU2zbuS6ULas1hxZH1c+E39/0UI7wobVv6Yx6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eC/5UhN6/zEInqR5fOria4KcbhL
 wrL5OnREmo0ZH7BAPv9+lrwWhVirrI/oWFih1IOM5VOjCSuqQQw3qU7E8U6Kn5Olhizwc161
 Nltv5OvHFJB0q3kwIzxUjFCGC14eKZB4rKCfD60sNeYyAvNdH6EL/dGVR5te9ZHvLcsRzgTq
 5T0KxhVBvyHr/m9wLOnUO5grs8iN8LseogYvxmMyBmHXKt+HsqcGc0m4/dH1zoZhsNMPsr7T
 JQgchk0fCjYbDlmbwJ/5JUWxbf02SaXnydjgFWNqKw65mLewAB83P3hPcTYfvSORN5JhQCfv
 m/A8mHzDx0WOdDZziCKmk9AncfVli/9HYkVDrD9q7hhgUaYwSoYDxh+uUaHTeeRiEK9W/VgD
 Q8t4zcDl/Yv/1CnbtPyQEjtyJKbhSI0V91VGuw8zQiCzKvI/gqUblToqBYcNrTKU+drGVQXO
 k+1c8DBXmMw7eXEIZ6J3vLF8mPoYHl9wXoqPHdcFWM4D8/fTJbfZy8jo/55G6Kzy9byAzy1n
 naBrTM1gPMYistjO0SHEbLv3m/ESnvhF15dCuDrsoSNsloRiGmNPNPA1LQjxawcRLt1t3HY1
 JT+p+CQ7foVEbaGnzGXTeMGEdmBvqjVbmSC2wAzR8hwq1xBHkJPm6gOuFmSw280Yq45lcPBO
 yc/RCsIvsYIZSv2BUOJS9voWptCIVfc+STND6CIMYUmjmlZfw6c9yYmfl+Lw23oiyARfVIXZ
 /+mnTKXJS9CU8xPlWPuL89EiOND7n5lnwv7G8ukpylLJJLDPhZ5v59fbgvXBg34hYvZyDjoH
 yF3aJfSlU8BAbGuCsQVmKZKRW03wbEALcmeg+Rcd/WIJUxtH2RJNhMb6e9Jl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:HpCOB62ao3YclNKwQACafAqjBR1yeYIsimQD101hICG9Lfb4qy
 n+ppomPEHP5wr5AEtQ5+xoWJPrfZvdnaQFhrX5To3SLTUO31HYY72KjLGSjwEIfhefygcz79
 YaT0DxYueAd2SS4fyKhTVQVuxQv+Vvk5rYy9s2rU0dMD2CApsIh2wUe2XrcHGeBjM2eabRf6
 DsgPav0gDQAUj/Gf7Lf0XtMdKzw+EjkqiKXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3Q/MyYwrGG4y6Z81WWw4VdmdPnxNcGLteLkNIpJjLljRvtTJh9WoeFoCs+rIiUmRUXeZ
 j30lUd1vZImjfsl1KO0FzQMs7boXATAkrZuBqlaL3Y0JXErXwBepJ8bMliA2vkAgIbzaJBOe
 RwriOkX149N2KboMw7jOK4DC1Chw66p2EvnvUUiGEaWYwCaKVJpYha509NFowcdRiKo7zPPd
 MeRf003swmOW+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNBqVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaMqAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu7djDlhCy8rBrZbQQFm+oQoV4rmdSt0kc7jmZ8
 o=
X-Talos-CUID: =?us-ascii?q?9a23=3AP3lpvGlDknBLax+C4XLa2za3PSzXOX/Rz3f3HGn?=
 =?us-ascii?q?7MH90ZYfLVFSM9INunNU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3APgtZQw/JFefZtxSrQdnm706Qf9hj7o2uC0IurbA?=
 =?us-ascii?q?t5fCfFndgBy+SqB3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 08 Jun 2023 07:16:17 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 3587GFPK017259
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Jun 2023 07:16:16 GMT
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,226,1681171200"; 
   d="scan'208";a="2709279"
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 07:16:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPNUdHxEAecK0tx5Nu30VGRvG3SKXmjJEhQNiP+0VAis6IX13mTt9Wb4JmlZYjPFZ9lTrAnDv+U32TpouRbeMyOpWSfjb2ZaetycruUnoUZGG49wk1Y1/6r06aVla8ZoR3RkA1pX8WUSxXvwgN+lTc0Pa2JKFt3YSw1nNFRN/VIXPCn28GTKqU8L3gbB5bhpWhXKujgdKAy94YwXHwA2eaUGh+8BHFX4S94gPFcrwkzHLDbJPBwx6m4mAn4qLyD3dVuiVj9UZjtKvL5SN/1NdjMV4sAbrqMNeTj+UgZUSCkkQkh2gyu5ZucHe6BPelXHC70eujSF69bnNI7phdA0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5Oi8O0JFBjaNGpgzI24AXca7NXCrWnyVtO2aGYy+3s=;
 b=TQJ9NRDblVm+tiptknWRa8tAqx2r1zGzMSV5zifiqdSOukl9khiXbJ5awsCqL8UjKA5ktCZg6raa70WH9w/+/eedYJWB4Ssoe6dWhXTArlPbN2ub9/anJDyprcooD9Xf5hY9QcPDU0uKiTlwyP2OexBJqtveZYPt/eo1RnJtX8MY//Vd629HU38HNw4lXZ3kPbCUlMbUMGPzE78bgjBK6nEVtED53P1vdNJ2X/tegU8CUU0lAto2uPH4x4rM8Ggx8qmvnPz7flrZ0ctIat5V0Cq0jXuuENXFfqAecLT/G4ejwK6ZqRsESeTDI47Rpw41vQPA+FJymfuJQbt5/i8UJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5Oi8O0JFBjaNGpgzI24AXca7NXCrWnyVtO2aGYy+3s=;
 b=KcG10y6A0bJUv7hmXpNmwrJ1llW5Wb5+r9nRTZO97bEABHRqh2gTYV/a0BIpRSgj40J65+hT8zZEJArZ/MQP8M7mTde9gygNf66Pii6QwAsLgIwa4RFwYLbiqSba+zSKMyfFP4pMQncXCtWhiejNqVkGUsgOhtFXXx861m9s/+Q=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 07:16:12 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%5]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 07:16:12 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)"
	<schitrod@cisco.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>
Subject: RE: [oe] [meta-oe][kirkstone,PATCH] gnulib: Update recipe name to
 2018-12-18
Thread-Topic: [oe] [meta-oe][kirkstone,PATCH] gnulib: Update recipe name to
 2018-12-18
Thread-Index: AQHZk3bsBfeF0JO4ckidkMbu0ZIJwa+AiidQ
Date: Thu, 8 Jun 2023 07:16:11 +0000
Deferred-Delivery: Thu, 8 Jun 2023 07:15:53 +0000
Message-ID: 
 <SJ0PR11MB671758B17CA6DCA7F00762DDDC50A@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <17641F6741B13B67.25298@lists.openembedded.org>
In-Reply-To: <17641F6741B13B67.25298@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|CH0PR11MB5332:EE_
x-ms-office365-filtering-correlation-id: e3b3224f-ebf8-4f21-b821-08db67f03d52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mFhnJSwXazyXhUtIUagMpaLhkyKP2ufmKvPwDoRnrdGWmdTBNc+obbXypD5OKZvL5hc04jlhCMuYQy5oWBWeBNdmAadNTu0sUHYE4tq4Y3ipm3F7NOG/yi8uQgEBpuis21cqZp8+UHo5+CiZDXXaP+qJlCNAyvzT3BjOuT3kfGfnCKb5fBxKU2OPzX6+cfjf1IdGa9gEu185TTuhwDJMOYfjLPLM5QBm7WCVbBglYoJgQ6mkAz303UMw77/g0Pg/vzdhfboDG4ffqd4Z9NGAQrJfab/0RtuW2uFUfKI93b33PFzNi9QQSM7v0gQsmhygV5urwXNsCP5IlOi18C+UKjedJqn8PrUS1wVTX3/kbizRwQ86xN19CkzK5yoNYTHWROIOhKl57NItMJY/QIfvUk10sk7uhdsyW2NYu465FLUIkjnT/qOYK42Oz/x5MWuNf+fKn+Sv2ludxh08aUsPmbgfug58CdzgLr6aiW/rFPwUyyJWMW37GqVMgruFo212bhxvXuOvv3LBdKmJt8kS54BnV7rXS6m9FZnKk56zX14Sbnrd9yN3VBmfSKfAzURsm2uRCPAhw8kAnwoVQovlBmWWbhNnxuJnLXgjwG1DZQuZlpikpluah0RfY7Fv58Gv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199021)(66556008)(33656002)(38100700002)(122000001)(86362001)(38070700005)(15650500001)(4001150100001)(55016003)(71200400001)(110136005)(7696005)(478600001)(2906002)(9686003)(6506007)(186003)(316002)(5660300002)(52536014)(66446008)(4326008)(64756008)(66476007)(41300700001)(83380400001)(76116006)(66946007)(26005)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?UQvv29GJiwifJ/lu0jAcPaO6vrflweX+P11E0xC4QENzqik2o3fEGEeR93TB?=
 =?us-ascii?Q?w3ISp/XJfUSw5rZb2RSCwKR3rf365EhGnGbvMLNi4vFQycRefVs2xz7rHvri?=
 =?us-ascii?Q?jEEu+Yl6TD4oBbje1XX9rrrCo8UfcA15r8+Hdb0jlH4SZVt+q9Jy4WLOwn8C?=
 =?us-ascii?Q?nd7IKowRq0is6TS/SM8CLf1ZQCN/HfB9dTfjspy+vIMqlOLKCYoNTAE8P0Cp?=
 =?us-ascii?Q?FUsK8DLpPR+GDuxykhIE0Rf8fwSVt2P31AmD/PHpX6jen/Zvp2hqwsQF5t+3?=
 =?us-ascii?Q?BS6UPfqfGduOf9xSRNNvhVLOCrVKBk2xsMsvVwxI8HgWJmYuli1dgbhSrRzC?=
 =?us-ascii?Q?yS75fXkrieayLAVpU+9TuXql5v2yOdFR3cmFEY3L/4Olh3gNLR8jOgyWxuXd?=
 =?us-ascii?Q?vhzL1yF0oimPXHtRFuBptECADd3Xv84Y+jQTT8jl2sqDjnbSiV5v3/EmESvD?=
 =?us-ascii?Q?hF4ov5ZT5O7VtbESEcCSIJU6Kjoxe6xIh4su9kCTXGShttaktPyxpuAxYhb/?=
 =?us-ascii?Q?ZeIIuV7d/oj0LHRdlIXNX+nxjBziJPjY10BCfUaDv8xvKmCUDSh26YsVS44Z?=
 =?us-ascii?Q?u5LISqrppdCuWF0xE6bj/gmzphcqdsu3GQDT6JGs3MBO4tYz+2fA76yd/Zb7?=
 =?us-ascii?Q?Bbbla8KdzqL8DEDZbpo+NknkfjkDOSkWGtmYxTRIKjhNfsQcAAR6QUs3mr8/?=
 =?us-ascii?Q?MNWOzg5PsrCH8AFa62pD4rCdefJaJl4soeyJJvvmq2HIXghwlGgbMCR0drpV?=
 =?us-ascii?Q?JfUJNCXl+jzQ1RIDPzbcNKTpKk2LohChaTjLeYWQWPkqDJ+E+Ouom1vM6Dp2?=
 =?us-ascii?Q?CCd6j++QuQP2Jn9asTaAtXKnfPngB60S6zhkaZ/WGZ4FX8KvB4KODfDoZF2d?=
 =?us-ascii?Q?jwAFnDF4bYsm7Jjs3QoVscayVDzEoAJ+bkIvhhp53vwwngmpWnrLfEE12QzV?=
 =?us-ascii?Q?kVCXCo9HgB59RJXy4IO/JET1Voo7Rvvn7SZkRbpsVtfaOCofGlHde1fF8gRc?=
 =?us-ascii?Q?YvoVUfkRX0jek6gjhYenFsChkDvM1Jvqo+WcnsrCQzmHfJeIbgoSgBpk3Mhu?=
 =?us-ascii?Q?VVZcNhYAU5ZoPOcnwuOAH0hcHx/18f5WNnNiyy+zZ0Fh5/Vnphate4dJx8fK?=
 =?us-ascii?Q?bfiXhjtHIeW/OaQWA/4Lqwx935lLE/YzdY3jz1/YMnTma7djLlKMNWh5KcwU?=
 =?us-ascii?Q?tXk02F364j+cZ5rfhIUMqMorJ4W14g1tqe+VONQKcwr+6HKszu7XKsXKm8sM?=
 =?us-ascii?Q?I6jjrjk7xMqtWhz1JYaFK2MAsuWg2PzYVO0nJm9RaFL4apI7BMrJn2BxzxHH?=
 =?us-ascii?Q?esIFKxA24BvmVbetiDtyRYXrHeF2wUprsj9seZkCByNN57yPELPpNJCcANv7?=
 =?us-ascii?Q?mkoN4cyqLW+MdIQyOgkHiaz1N4648x3DQ8Y/qJbJgZqGJJhqpzaWjTdRCLBa?=
 =?us-ascii?Q?TFiy+o6PzLkNZyPP53Z9rViP1Hduwa22Vb6EigIYdfYIJ32za2ATQgteC87M?=
 =?us-ascii?Q?jo4tKmvshcISfpsEB8CGtNNH2KLUWj0e49+FN1RFSoRNmq5ls4PWxJybIqYB?=
 =?us-ascii?Q?sBVcYFRospLHyKecPJf9xABymVfdl533gdTbSrvW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b3224f-ebf8-4f21-b821-08db67f03d52
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 07:16:12.1244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6T+JJmaEbeffUs33YwnNOA/vIm7wBMDDMXBH2SQDHxqbpfZWgvMWyVsvzJLhpiFp0WJ49JcOLbFanBh1gJwTPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5332
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 07:16:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103183

Hi Raj,

As per discussion and comment from Arman.
We need this changes on all the EM releases.

Patch is merged on master and mickledore branches.
I can't see any update on kirkstone branch for this patch.
Please review and provide your comment.

Thanks,
Sanjay

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Sanjaykumar kantibhai Chitroda -X (schitrod -=
 E-INFO CHIPS INC at Cisco) via lists.openembedded.org
Sent: Wednesday, May 31, 2023 9:48 AM
To: openembedded-devel@lists.openembedded.org
Cc: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco=
) <schitrod@cisco.com>; Khem Raj <raj.khem@gmail.com>
Subject: [oe] [meta-oe][kirkstone,PATCH] gnulib: Update recipe name to 2018=
-12-18

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


