Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D93EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 10:48:30 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web11.15194.1686826103356131855
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 03:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=AZFJMCWe;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1572; q=dns/txt; s=iport;
  t=1686826103; x=1688035703;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RqBe/Vw7J57T8Yb9VGX2MbUn19bkU5LTsFGgejATL9g=;
  b=AZFJMCWejAQgqHqRhrZbgQru3kgdOHimYvW9YmfXZwrMhVHGKEgEoDj1
   ce679ASGd2awfV/1CwYBWCmIjRYkmGdUnyC1uJerbeFDcfteXEb4097y0
   7eOKEtY2x7DxYsC8pEr/kLtq1rfjRGQkPbXb5z0vYZxiVl43cqCBh2VGp
   k=;
X-IPAS-Result: =?us-ascii?q?A0AeAABk64pkmIYNJK1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEWBwEBCwGBXFJzAlkqEkeIHQOETl+IVQOdb4ElA1YPAQEBDQEBLg0JBAEBh?=
 =?us-ascii?q?EBGAoV7AiU0CQ4BAgICAQEBAQMCAwEBAQEBAQMBAQUBAQECAQcEFAEBAQEBA?=
 =?us-ascii?q?QEBHhkFEA4nhWgNhgQBAQEBAwERKAYBATcBCwQCAQgRBAEBHxAoCh0IAgQBD?=
 =?us-ascii?q?QUIGoJcAYJcAwEQogYBgUACiiV4gTSBAYIIAQEGBAWBSgJDnRcJgUIBhEyIS?=
 =?us-ascii?q?4RIJxtAgU2BFUOCaD6BBYFdAQEDgV+EEoIugheHRYRShnmJWoEob4EegSJ/A?=
 =?us-ascii?q?gkCEWeBCAhcgXBAAg1VCwtjgRxSPB6BKAICETwQBVJ5HQMHA4EFEC8HBDIJF?=
 =?us-ascii?q?gkGCRgvJQZRBy0kCRMVQQSDWAqBDD8VDhGCWiQCBzZBG1mBAjcDRB1AAwtwP?=
 =?us-ascii?q?TUGDh8FBGqBVzBAgQwCIiSfSQODEIEQLCB4AwR0N5JxCjCxDAong2GLfI0ai?=
 =?us-ascii?q?CAXhVekAAuYDCCNOpUghRQCBAIEBQIOAQEGgWM6gSocAwsHcBWDIglJGQ+OI?=
 =?us-ascii?q?BmDW4F/gxWKZXULMAIHCwEBAwmIcC2CKwEB?=
IronPort-PHdr: A9a23:pChWzhD/m5/d6tDkeP1GUyQVoBdPi9zP1kY9454jjfdJaqu8usikN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+iLzKlBbTf73fEaauXiu9XgXExT7OxByI7HuEY7Tk96w28i5+obYZENDgz/uKb93J
 Q+9+B3YrdJewZM3M7s40BLPvnpOdqxaxHg9I1WVkle06pK7/YVo9GJbvPdJyg==
IronPort-Data: A9a23:LHC2sKLNvK/S8QeiFE+RyJUlxSXFcZb7ZxGr2PjKsXjdYENS3mMHz
 DYeDzuOOKnfZWqneIh3aYu38k0O78LXx9ZnGVEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcIZsCCW0Si6FatANl1EkvU2zbuS6ULas1hxZH1c+E39/0E87wobVv6Yx6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eC/5UhN6/zEInqR5fOria4KcbhL
 wrL5OnREmo0ZH7BAPv9+lrwWhVirrI/oWFih1IOM5VOjCSuqQRiiaAWLvENan1Mkg6onPVO1
 dF3msO/HFJB0q3kwIzxUjFRFyV4eKZB4rKCeCL5us2IxEqAeHzpqxlsJBhpZstDpKAuWicXr
 qBwxDMlNnhvg8qty7K6VvNriuwoLdLgO8UUvXQIITTxUq17G8CSGfiiCdlw+ygBlNhSBdrkP
 vE0cidecjXrQRpmNQJCYH45tL742iagG9FCk3qSvacx7m3ZwQB93bSoPNfLd9iiQcROgl3eo
 XrL+Wn8CBwWONGTjz2f/RqRavTnlCf/XscZE6e1s6cwxlaS3WcUThYRUDNXvMVVlGbuANRyM
 UcF+RA1tJMT92mUU93HcEK39SvsUgEnZ/JcFOgz6Qeow6XS4hqECmVsctKnQIF73CPRbWF3v
 mJlj+8FFhQ06u3IFS71GqO86GLsZHlEdQfucAdZFWM4D8/fTJbfZ/4lZvlqCqq8iNGd9drYn
 G3S8HNWa1n+cac2O0iT9FTDhXenoYLEC1dvoA7WRWmiqAh+YeZJhrBEC3CFt56sz67AETFtW
 UTofeDFs4ji6rnWxESwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJZaJmG2P
 BSP51sJjHO2AJdMRfImC25WI5l7pZUM6fy+PhwpRoMUO8MoJFPvEN9GPBTNgggBb3TAYYlma
 cvELq5A/F4RCL9sy3KtVvwB3Lowrh3SNkuNLa0XOy+PiOLEDFbMEO9tGALXPogRsvjeyC2Lq
 Ik3Cid/40gFOAEISnOJodd7wJFjBSVTOK0aXOQNLbHbeVY6QDx8YxITqJt4E7FYc21uvr6g1
 lm2W1RTzxz0gnivFOlAQioLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:5reYQ6yz+UdPdYH1E1Y/KrPxg+skLtp133Aq2lEZdPULSK2lfp
 GV8sjziyWatN9IYgBfpTnhAsO9qXO1z+8T3WBjB8bSYOCAghrmEGgC1/qv/9SEIU3DH4FmpN
 xdmyYVMqyLMbEXt7ee3OD8Kade/DDlytHnuQ699QYRcegCUcgJhGsJaXf4LqQ1fng7OXNTLu
 v72iMznUvZRZ1hVLXDOpBqZZmmmzTMrv/bSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkiTij5/T882T+1v57Sv+/p5WkNzuxp9oH8qXkPUYLT3ql0KBeJlhYbufpzo4ydvfq2rC0e
 O84SvIDf4Dr085TVvF5icFHDOQlgrG3kWSjGNwR0GT+PARCghKU/apzrgpAicxo3BQz+2Ulp
 g7nl5wc/FsfEn9dOOX3amSazh60kWzunYsiugVkjhWVpYfcqZYqcgF8FpSC4poJlOw1GkLKp
 gmMCjn3ocfTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNxd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDhRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dvP22J6IJzYEUaICbRRFrEmpe4fdIi89vd/HmZw
 ==
X-Talos-CUID: 9a23:LxIccGHWmtq+DQn5qmI3r0g5AMs0cUfG1UzxIGqHFGJTZ+KaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A87KahQ3ED1zkCCeoG3jH3BtPTzUjxLufGlgRibk?=
 =?us-ascii?q?84vKpLjFBJRa2rjOeTdpy?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-12.cisco.com ([173.36.13.134])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 15 Jun 2023 10:48:22 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 35FAmMaH015058
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 10:48:22 GMT
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,244,1681171200"; 
   d="scan'208";a="3036797"
Received: from mail-dm6nam04lp2041.outbound.protection.outlook.com (HELO NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
  by alln-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 10:48:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2qZCLUtVBfQwB4l+7G7gkvbdqg5zGdfbokbDylWMwVdLr7NEhDtK9+1j88BHf2LWr3mC4YqeSK5TVsPJs+lTD2qJSRUFjxKDePPjc7mmMZxR9nKxbR+Vsbb0V1RLc3YK1/dmSdTm5o7AEzUQVsD109g7SDbBtdTLREjvwEVl1oa5Ah6suC1K0w2+ruOAdDjbasLzHjcQk8Kk6u32sQM8xqkle15SihzXrSVcCyk6utXIEk5dZ8vcLzpgbxEiavmnkbnyPl8tXdkGcYfGl9HRiUrvcGYhnB6161JBfpXGvuEXnJOU8U6uCuZr3XLedpJV0AvxzZHmaalz8sfck6/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqBe/Vw7J57T8Yb9VGX2MbUn19bkU5LTsFGgejATL9g=;
 b=ODqLJ+9onKsdHx4zfnUY42cjfUKh08siA1r40gSoeqdAcho4zgQfmhEfUJiFwKqcnG6XdkloeJiwUWf7YFtqYL8LyH7oUFOSMgb6ldbcOarrX2N6DH9bW0/zB1IQSeVJUPBCd5jsc614oaRa1iUuD5zYWq/EaZ1651ape4SzCaI1AeBIXOzwfnH5H3i2spSXwbfvicedkq2QLEGlqWfExZkucKRQ4tPpK35dbpJDV3TSLhBOJ0373OHPuAkWOfaUTeR9Vhand2Hmj8gmxATmAjYiyJFazg8eC/SvSvHQRs02SmPquXqd8XNR1NKmiGTZ4QFaZh+BEcrHvPEXVBuKdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqBe/Vw7J57T8Yb9VGX2MbUn19bkU5LTsFGgejATL9g=;
 b=U1BMbbkDRcedSlLuyQkS/2+qSVJkPRu6ZWU3AkJg9+aCWmAgEKaf1gEoE9Z6MAjzttZM5NI1vySJw7DnT/ZbYQvyVcd4I31+k6yUAurn06zUo8jY+8We5feKFDrqDVp4iaf0McjirDJVOp0poQb0wpyZ2HWhySWuiIjIr53p0HY=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by CO1PR11MB4899.namprd11.prod.outlook.com (2603:10b6:303:6e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 10:48:07 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 10:48:06 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "archana.polampalli@windriver.com" <archana.polampalli@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Hari.GPillai@windriver.com" <Hari.GPillai@windriver.com>
Subject: RE: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix
 CVE-2022-41916
Thread-Topic: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix
 CVE-2022-41916
Thread-Index: AQHZn3E6IiIqjRah0EumUxSPsEbhJK+LrHFw
Date: Thu, 15 Jun 2023 10:47:52 +0000
Deferred-Delivery: Thu, 15 Jun 2023 10:47:14 +0000
Message-ID: 
 <SJ0PR11MB671749E856BD1A629D4E062CDC5BA@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230615100658.543762-1-archana.polampalli@windriver.com>
In-Reply-To: <20230615100658.543762-1-archana.polampalli@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|CO1PR11MB4899:EE_
x-ms-office365-filtering-correlation-id: 83abd48d-d2d3-4714-1119-08db6d8e00a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mOk+GnLLmzT3cZs8rzKfei2MTRTUFdKifmK3pLHr1UG1FybU8ZqczwHNwcBEqyj2jAzD1YSHlxLo1UTNoBt7JVyd0ku+QoG1xIfOo8O48Ht3PTsp5CZoa3Rw0CW9Ak7fSTGBO6rabfT+Ot3cWpvHatV3TBWrPZodDff9/mO/OC+e71kFpldrG4ypIti+vSq0Hh3TI+w4AxGyasvqGR5lRnA1p1XiZbAeyY7O7teyAfJ65GwXSdcZX6UqZUkUV/PCRnMg70+suPgkMnTtIu/neMh6OKRV07GXYm5rsTEQYVdDft6mZjMObkXM8PdbPZ+hGIg1b9kECvfYqhb9wEKOAvSw1sONntXZXJTa557QN9vUOuTBRbm2r3Tc+QANH181rfQdDs1pGOFRP3NiI5tOPiRYl7hHo6k6TU8uZJf1qamL5dF7lUARmdSeaPfXKu8WnYCE4mRjRmEcVDFcVck8Qs+ImTKTkZW1QC5VRIbMGDzzUqZllENxvjuNL4htsyfedjFkCKg/P/ldbY7ZGkPjmX0W+RI2znQrUOu7SDT/50n7y9NG3U/xNF1JefYQbz6vpA8dqJy6I8QfDnYg63/1wf4C6M9Zqn32IDcxI752xWU/1OaPNOhfRaY+Ftn28fQgq8JY41fbuFaYMvpo3tdK+g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199021)(478600001)(122000001)(7696005)(6666004)(71200400001)(38100700002)(55016003)(83380400001)(33656002)(186003)(53546011)(9686003)(26005)(6506007)(966005)(64756008)(66446008)(66476007)(66946007)(66556008)(76116006)(4326008)(38070700005)(316002)(52536014)(5660300002)(8676002)(2906002)(8936002)(41300700001)(86362001)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1Qs4dqxhpNhmPHXVoqciC9RlKtCazIJdZ8VuwlAUe17tLNtPZVzvWWCRy9CU?=
 =?us-ascii?Q?hlnpcqgXBVfTZKVKraUKQPaLyDPu/WXw7qMKNm4Yc9Mf4zEr5Qfpl0WMutey?=
 =?us-ascii?Q?OtnAtMXJQruazaUOyGiAyCrM2RAcVKqJ/hfpX1qcuFpRrDk80OGj390erlKu?=
 =?us-ascii?Q?SS5JL8GkDsBy8dhmTWvLetjx8ZRRZj1Ge8h1aKEKNNHQ+9i577Fz5YC4cdqR?=
 =?us-ascii?Q?Ug6IIGiDz3Y8WFljp+tRnbBCJyOHvke++25jRhngYYZF1x4JEg0m5LQ20t3l?=
 =?us-ascii?Q?U7JUKGsEb2JkRnKM2ObGC3EHRuOU1bbFOyVwU6PfZpEegDghc5x08/0PKfxt?=
 =?us-ascii?Q?0i0FLegfyzv7ICAeqjc80h/co6MDr5YDXdBlt9rz1ghdWtrdZjUHAAGWun0B?=
 =?us-ascii?Q?xnQx6kdO45QFYoZwa0kh9dqrbi5MhcHqESt+NmNwaPt5AajRjfjf/YXYc0sS?=
 =?us-ascii?Q?RjSO0RVPahXDcDvjkJPV56RWuQGB+9s4vgY0iNATWwVWg1I3g7RvhAqXUCaK?=
 =?us-ascii?Q?0PZPAssyQUC8W/uVFq0BaMu6GUdrirKeq4xUbwGyj7/r3hghni1QarDGehds?=
 =?us-ascii?Q?HUtlz59/skll7qDslflZgtUrtTqIunrurUGqxcpow1oQ0I1HOpMdRUI9TsqO?=
 =?us-ascii?Q?GqYAqpgQbMzJx4SUAEHY3AdcpZS/liwpBikQJjXh/fFKadi51nYl2mAClACF?=
 =?us-ascii?Q?ImlCnEVQxTKhmnSBwrrktN+p3SiNOZ4LTAk2D0aWk58nKjc0EAn4zJHDFEfq?=
 =?us-ascii?Q?i42hAKagIcRtm/+fQAJ8uiITqMlf9bQbu3KNaOPIw5D9utAcRd7CyRkMfaki?=
 =?us-ascii?Q?zjXub2MzAV75YsMf1lGI5exA9zm/fDYZktA5tw7dNMsSN8lls333tymK5ibZ?=
 =?us-ascii?Q?KPJ21uBcktf6zlZYU5UQOXifdaDHOGBySjdqcAWMl3PbspTfjwjo1g8xOedl?=
 =?us-ascii?Q?iiOi3OTTE83f8TR0B5m9JRWbzmGzJGd+sYKzXvmwMiwP9BkXI9CcMtvd6rDc?=
 =?us-ascii?Q?h1v9s/XmgDc4CTrdbXudGHkIwOfR3fL0mEgkP9weBzL8p7z71EoxM7/+3h9+?=
 =?us-ascii?Q?N6up9sbm316L9FOR0gaKSzvQ5l5nywEhxBF69qqMtvlX/aBIPus2Yyk4nV+5?=
 =?us-ascii?Q?Y41dZXVNvaDeyNQrux9cbSIRdgOt25bgrjdEnp5N2VkvypuZL53uyRF/V4bU?=
 =?us-ascii?Q?rZyW3EYzSky1hjMUaF2f2ibH+r2rTqp1SHRjfNWp7SrygJE1fkKa8csyDvx6?=
 =?us-ascii?Q?fpt2uza9FJgLbvWeAMf8OM2BSoVTTPlhui9vLXPUrtYFjtQIEiQw54qCkvk0?=
 =?us-ascii?Q?U7N6YVL8ajJ+2vSlT0DsDPgCqYusbsnG8xQrfXEzSmzxe6H/XYAMzVwlZVEj?=
 =?us-ascii?Q?tlsEom3wbcHX9i9h3v1AIkKDYij2xpccKJPJJGhSfUOyFjPlW/HWe2fq2bgz?=
 =?us-ascii?Q?TYWhD6T1OVkLQxs6APy01wxkjKrmrBo8oY3VS6mwXsiiyx4WKEaJlELhLzbm?=
 =?us-ascii?Q?23YQa+EM1FJNAWY/UEX1lzNSMzIQW5AhEOhsb5SIxN3nfJzNNyIuBhY5Xw8e?=
 =?us-ascii?Q?KD/oK/h9SDSZQ7Tqd3+vqq+X1XvDH1Tp1pSZD7NF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83abd48d-d2d3-4714-1119-08db6d8e00a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 10:48:06.5895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G0t/rUh0tF4T5JtZVHs7YcaUjKxlwpLlkjALZFHO10H/Bmfl6o8N278jFb08yRcE0HpKo3Yvh/KvPSOaPrGIig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4899
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: alln-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 10:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103297

Hi Hari,

Regarding format only nothing specific to review of fix,

I saw many developers has contributed to samba package fixes.
I would be great if we can keep common format inside .patch file as followi=
ng.

----------------------------------------------
CVE: CVE-2022-41916
Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/eb87af=
0c2d18]

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----------------------------------------------

Thanks,
Sanjay

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Polampalli, Archana via lists.openembedded.or=
g
Sent: Thursday, June 15, 2023 3:37 PM
To: openembedded-devel@lists.openembedded.org
Cc: Hari.GPillai@windriver.com
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-2022-41=
916

Heimdal is an implementation of ASN.1/DER, PKIX, and Kerberos.
Versions prior to 7.7.1 are vulnerable to a denial of service vulnerability=
 in Heimdal's PKI certificate validation library, affecting the KDC (via PK=
INIT) and kinit (via PKINIT), as well as any third-party applications using=
 Heimdal's libhx509. Users should upgrade to Heimdal 7.7.1 or 7.8. There ar=
e no known workarounds for this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-41916

Upstream patches:
https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c7daf483a47b03=
af80c2c

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---


