Return-Path: <krkapate@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28EDEB64DD
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 09:31:05 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.web10.7439.1687426263736039035
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jun 2023 02:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=FhGaw7fi;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: krkapate@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=6336; q=dns/txt; s=iport;
  t=1687426263; x=1688635863;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=WFcHx9O/JTX0f/fBmYtbxKA/ylZPqAk/hP5Cw82Ge1k=;
  b=FhGaw7fiw7RpO4zAswXBky0XvjLJI3jdiP7dcQDOAiiIFZatlYSWB0vx
   Rv9/GK65qxf5Ih3GnC+UL3+gZ/w1AI40FHMoz+Fg+i0LFqyba6YfyXb2I
   CUNY/0J31+mltsyvWOpjarGYt3KsNZRXWgxJ8vcaMBtMD+TmlcVjJ/W1x
   8=;
X-IPAS-Result: =?us-ascii?q?A0A7AQDdE5RkmIcNJK1agQklgSqBMDFScwJZKhJHiB0Dh?=
 =?us-ascii?q?S2IVZcjhk+BJQVUDwEBAQ0BATUPBAEBhQYChgYCJTQJDgECAgIBAQEBAwIDA?=
 =?us-ascii?q?QEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBAQEeGQUQDieFaAEMhgUCAQMSLgEBC?=
 =?us-ascii?q?QEuDwIBTjIlAgQbEweCXAGCFQ06AwGheQGBQAKKJXiBNIEBgggBAQYEBYEKA?=
 =?us-ascii?q?bFfCYFCh1oeXmKIKCcbQIFNgRVDgjeDUQKBYoQSgi6CF4wOhWUHiwBlgShvg?=
 =?us-ascii?q?R6BFQt6AgkCEWeBCAhggWkHQAINVAsLY4EcglICAhEkFhRTeBsDBwOBBRAvB?=
 =?us-ascii?q?wQyKAYJGC8lBlEHLSQJExVBBINYCoEMPxUOEQSCVis2PxtRgiwHNgNEHUADC?=
 =?us-ascii?q?3A9NRQfBQQjgiFqBIERAkWfeCyDHYEVMRtbIGIGgQOSQ440gXuhDwong2EFi?=
 =?us-ascii?q?lSBI5U6F6lYghOWByCiVIUcAgQCBAUCDgEBBoFjOoFbcBWDIglJGQ+OOYNbj?=
 =?us-ascii?q?3l1AjkCBwsBAQMJi0gBAQ?=
IronPort-PHdr: A9a23:4WGIXxFZhNbOMwSrwicQxZ1Gfu4Y04WdBeZdwpMjj7QLdbys4NG/e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HToeVNNFpPGbkbJ6ma38SZUHxz+MQRvIeGgGZTRhty+y+2a8JzIaAIOjz24Mvt+K
 RysplDJv9INyct6f78swwHApGdJfekeyWJzcFSUmRu9rsvl9594+CMWsPUkn/M=
IronPort-Data: A9a23:Zlwc4KOLVNDhf2PvrR25l8FynXyQoLVcMsEvi/4bfWQNrUp00DEEn
 TZLUTrVP/vZMGHzKdgkPo+x/UNXvJWEm9BjSHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCcaphyFBcwnz/1WlTbhSEUOZqgGPykUIYoBggrHVU/EHl700o58wIEqtcAbeaRUlvlV
 eza+6UzCHf9s9KjGjtJg04rgEoHUMXa4Fv0jHRnDRx4lAO2e00uMX4qDfrZw00U7WVjNrXSq
 +7rlNlV945ClvsnIovNfr3TKiXmTlNOVOSDoiI+ZkSsvvRNjhFq1v4rEtsAUxZSzBipkIhxl
 4lskpPlHG/FPoWU8AgcexBcFyc7Nqpc9fqdZ3O+qseUiUbBdhMAwd03UxpwZtNeo70xWDoTn
 RAbAGhlghSrhPi1yaqyVuREjcU4J86tN4Qa0p1l5W6EXK9+G82SK0nMzdBK4WsOo9B+JOzfR
 JMJdhNJQFeQPyQabz/7D7pnzLv32RETaQZwr0qYo6cy6WXfwAF9lbTgLtfRUtiLXtlO2EGAq
 2TL+m70Dh0XOJqY0zXtz563rubLmSW+U4UIGfjisPVrm1aUgGcUDXX6SGdXv9GE0krmS/R+N
 3ZF/20Djadq9BP3b/7yCkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOoTiZmMcADDBnJJoLQHGx
 mNljPuyX2wy7OH9pWa1s+bK8GLjYUD5OEdfPUc5oR05D84PSW3Zpj3GVNJqFqLdYjbdRmyon
 2viQMTTe9wuYSMj3qG/+xXMhCih48KPRQ8u7QKRVWWghu+YWGJHT9H1gbQ4xa8fRGp8crVnl
 CRc8yR5xLtfZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggdBgybZxeIme4P
 Be7VeZtCHl7YSrCgUhfPdrZNijW5fOI+SnND6qNNYMePvCdiifepnwyDaJv44wduBF8zf5gU
 XtqWc2tFn0dQb921ya7Qvx17FPY7n5W+I8nfriil07P+ePHPBa9EO5VWHPQNbpRxP3f/23oH
 yN3apHiJ+N3CrOuO0E6MOc7cDg3EJTMLcqm9ZQIKLLdfVoO9aNII6a5/I7NsrdNxsx9vuzJ5
 Xq6HERfzTLCabfvcG1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:2tl8b6rJnpkuQ1k+Tk85yzsaV5uZL9V00zEX/kB9WHVpm5Oj9v
 xGzc506farslkssSkb6Ky90cm7K080hqQFnrX5XI3SETUO3VHJEGgM1/qb/9SNIVyaygcZ79
 YcT0EcMqy9MbEZt7eA3ODQKb9Jq7X3k9HLuQ6d9QYWcegAUdAG0+4NMHfjLqQAfnghOXNWLu
 v52iNAnVedUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLokCs2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlawkEyzzYJLiJaYfy/gzdk9vfrWrCV+
 O85yvICv4DqE85uFvF5icFlTOQlgrGoEWSt2NwyUGT0PARAghKRPaoQeliA0PkA41KhqAk7E
 pGsljpx6Z/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh5bD30XklZqvoJhiKobwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJhXcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3cE7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rep2G9D2MRGAtBjWu7RjDsJCy87BrZLQQF++dGw=
X-Talos-CUID: 9a23:0qIrRG5NKJBBqSnsDdssyRYQQtADU2HnnXKXDm+3UWY2FJyyRgrF
X-Talos-MUID: 9a23:c092AQkvPs55GO1wnBfIdnptJvo03YG+OHkXkLZfq9atEwAza2uk2WE=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-2.cisco.com ([173.36.13.135])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 22 Jun 2023 09:31:02 +0000
Received: from alln-opgw-5.cisco.com (alln-opgw-5.cisco.com [173.37.147.253])
	by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 35M9V1aP014773
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 09:31:01 GMT
Authentication-Results: alln-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=krkapate@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,263,1681171200"; 
   d="scan'208,217";a="3324323"
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
  by alln-opgw-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 09:31:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC9SC+cTLv8Hu0f84GyE1v81DhdnG9SgBT1do/bu8e1lM9mD48PnMuKWhThG1+t7l4wth2vAjfyM8KarBF0+P9HoYPrKE5IRwFLjq5K6ktXg5B8555N3GrOvbEIvdrrc4sHa5V3dM6kAQNUUN0uaB6khJIAIZVHvyTiMBgAQmrbdB1oW12IGwdOOdQrOtLR506poRrvLcNOFq3eqbXN7TZQhWmt/J9qKXEOodyiEuRm9e/Gx7zUYwcYOCtZuXssKVbf5xFrNHv3uk6CSUdbqlJisRo2Q+nF1s5d8Rsu9HUiU7MY3B4m3Pp1/fyWIb0IwDNq5EBs1blnnwdx3UlyPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFcHx9O/JTX0f/fBmYtbxKA/ylZPqAk/hP5Cw82Ge1k=;
 b=Ww0ZY7oV0bjZmfe04APkgVKQRcBlcShrHlsrBBBZtu4n4GsO7J2lkogO8yI85I4MnZDpShGPfzMzII3CfSSemjghNQ5Ot+BjV8JJVFHLxrTHIoEAqZnHHdIxksSNgnKLWaTexjyjcIeeG/5BZ3uy8DpjYVLw0QDRpEIFqjHhlWSU4z/Iz77WHzmJm+7sJS23DHIRNzV1Tg6RBzPyMTAWFmAgnnt37mbkEy1jbPqm2+R74saA6usTH3vekRZ0ea1CT+6F2fnX/zVOh0FovTIy0eA3mFUEo7uqGD+hX0Vbiw9Ot5+Uj8dSOaKb2tBVKLO7Qq6k3ydxpO9cLGtiwXnByw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFcHx9O/JTX0f/fBmYtbxKA/ylZPqAk/hP5Cw82Ge1k=;
 b=ec7WtCxI9BepeceqMgRMnLN/Uh8gDFoW4OmcIR+6AVxQrcupSzzjyYRMqDDkEn/ctmc68GmX8TpA0KMBaGDBZmoVmdHcKnpq8kd6v/b+dsG47kcfn4aBXBJkFu0o5cdBQUQ2wA02Jl559YsXbaRfBuFYx0m4Qj+Or5BbfF34rBM=
Received: from BL1PR11MB5399.namprd11.prod.outlook.com (2603:10b6:208:318::12)
 by CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 09:30:59 +0000
Received: from BL1PR11MB5399.namprd11.prod.outlook.com
 ([fe80::5d2a:bca8:b83:597a]) by BL1PR11MB5399.namprd11.prod.outlook.com
 ([fe80::5d2a:bca8:b83:597a%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 09:30:59 +0000
From: "Krupal Ka Patel -X (krkapate - E-INFO CHIPS INC at Cisco)"
	<krkapate@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Multiple providers are available for runtime libltdl (libtool,
 libtool-native)
Thread-Topic: Multiple providers are available for runtime libltdl (libtool,
 libtool-native)
Thread-Index: AQHZpObVvpR86lAiz0evk36F2k4EgK+Wjm+z
Date: Thu, 22 Jun 2023 09:30:59 +0000
Message-ID: 
 <BL1PR11MB5399A434D9A3B13D1A802A4BD322A@BL1PR11MB5399.namprd11.prod.outlook.com>
References: 
 <BL1PR11MB539919006E25CD8243EDE31FD322A@BL1PR11MB5399.namprd11.prod.outlook.com>
In-Reply-To: 
 <BL1PR11MB539919006E25CD8243EDE31FD322A@BL1PR11MB5399.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5399:EE_|CO6PR11MB5586:EE_
x-ms-office365-filtering-correlation-id: 1cdb0809-9232-4aa4-7f23-08db7303634c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4mNV0kpKN7ZtmYWfbkUhyg+n+uJRis6ieO3EtBjNb68DqtPQS9FExagaw9mLgQsaao0/df++OQvb2PCobbmtTXYAnqJaAmKlc7EBXSZOhRBWkxCHDgkL8uk6LGGjlWC2VHCPVtqSruXUMLFC4TCAuXPjwHnys8MaLVh4RukE7XIX8ofQbnQGgoxJPIpV+R/VUxusGmvs8v2r9guOr7D1078NkI5pKGn5oQ0txNI+n1htbDZ1FpxF/GTFb8pGoTG0/zXZfTKW6O0FFXY3VfY73/LjE5U4on3g1aJZOLuB8bZxOn0In9bzCMHoLCNo42PmWb0or/6LlcLoNGMif/5VbhOvI2pQJIw/d5iXgZYJVZtvgYGVua4Mx2iA76SR28O7BSX+0L8xdugG+8dV9xG7Gp2RLhKGMFP9RlOIbLUVCCDghMMHt2rX5GmDeZ3SlAuWY1+HZOYhTtfOgdjVjWOjzYiZzgdP8pFSzFA+8XqgcyOxQQHyixv9H9ZCJ0/OhYDreb4/YXj/LVLO+0OVaDPnRMs1xjhtEOaKuKPRBBbjavW31VE1cQzzRiyDmqZW1cbf8C5qHjCdpM5PPpJtnBCTJXPZQh9BGWgDOsQwn2HSxBIufKvg/oUaRhOYl5ogubU8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199021)(8936002)(38100700002)(2940100002)(2906002)(38070700005)(122000001)(66946007)(55016003)(66556008)(66476007)(6916009)(66446008)(64756008)(76116006)(91956017)(86362001)(33656002)(83380400001)(316002)(8676002)(41300700001)(71200400001)(5660300002)(186003)(4744005)(52536014)(55236004)(19627405001)(9686003)(26005)(7696005)(478600001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?NrKQiATVvegVrkIQBOyWoe9eo1Kspeb8PnbpNA+EaEmcQW5f6RC1TKz28L?=
 =?iso-8859-1?Q?rB3MSoq2bj3RgjPIDIdhzWt1W2rNJqIfuMcL4UmIPSZCEJR1y2m6U+wbzZ?=
 =?iso-8859-1?Q?T7ek3NCyKVRBnomura+2oD9rrxiOKujvkpanHcvViYmZl3sUFsL3P+5BUb?=
 =?iso-8859-1?Q?p/msspUmNUYO19OKdlX16UI0v/i3DHGmZIJC5n8asx2NbsGG2EJ5rCkWaZ?=
 =?iso-8859-1?Q?alcwj8jp3aZdSWcfNJPkYQ8NOFQSmVQbkhlNt4gTWHqNT5IOVW7zoCv2Yn?=
 =?iso-8859-1?Q?n5FsnHv5B9eiIJ9QhnagOy99N62S4HoU+indm2FXpLwjdkCN9Cc0A/DOcB?=
 =?iso-8859-1?Q?OeXS/4DxtBCI94tqQBddor2TqYrmXzoPUHPh1sI9nqa3QXUly3ZOU2sQEM?=
 =?iso-8859-1?Q?ulNUdCZJpkYEINiEQ7IUYF2FLlenLMcQgxN0ZvfhWAC6z/Qo4qV0cL0wDt?=
 =?iso-8859-1?Q?S6K17LqsGWlQNWNfb+Cc5779EwsfEN543n/I0d3vAt6jodrlbMUoLAd2zF?=
 =?iso-8859-1?Q?2y98GVuqvHOrWhGjzd2tjpbVM2HFmWM7WTlPIkRpkAgV7FJ4+9P7JNXOKQ?=
 =?iso-8859-1?Q?E0dZ6RIRVfFs+CK1pK77J5REHD92hb+kMb7J1pWNMQbdPhHocGqS3FIlhX?=
 =?iso-8859-1?Q?kNO6AKY91C5IKTNXXEu5Voa6OO2ST0urtj3axruIMQ+cxKcaVlpFJEsqR8?=
 =?iso-8859-1?Q?8eRo9lSTJQfJy5d+HnfyBD0Zu7w6E9QTcPultv7Awi3X9SX6M6G4uvOI2Z?=
 =?iso-8859-1?Q?5Q2XdNyn4WA4Vo+7gIlalh8apoapbI1dkR1tw22zeQom0YKcJjZOrjvM8x?=
 =?iso-8859-1?Q?9PNeo7jaan9BEAySbCQ8cJWwfymyo7hPCN+FI8FH+yE3wvTYhWrAUjKAnj?=
 =?iso-8859-1?Q?kxGbVGklqL5+HB4SICHkfoO1Pyyw1Lthqaybw1yfuBe0a6YTmITI5dmtC4?=
 =?iso-8859-1?Q?KIcoIzNQWiU8Pv5qWuECJRK285JXHIkGRSNtWC/ywzAOewAFrCU0TFKQHr?=
 =?iso-8859-1?Q?sOkytwTfKec3N2IZkJaQN0sq00nuerjFCSl94ndoHUIV2Fd7n6EiXiePBS?=
 =?iso-8859-1?Q?hd2mcvL7sXK+WJwnspDt3BvUy4y1ubt2lN5MkYOqxXvSC/aaH0TC2ZcyW/?=
 =?iso-8859-1?Q?tlnePOy2fItqsDmjHf3eHzwxsS7f0+Hk7rY3jWIVL6Y/5ZNm954lfaH2wE?=
 =?iso-8859-1?Q?MFAUwdwSU6hLOLjXG2PJSD0EUrw7urkInQDXRk/+0Jqg7sV2ruz55Qsw6N?=
 =?iso-8859-1?Q?bOucJpYH+POTbDwFditteIgDly2wFA6skA3KaxAtY8lOtNx7+6UrwwDo5Q?=
 =?iso-8859-1?Q?W5ACQT3i4hyaP8wkY9Dsb7VnsXpYktETz01WDLWfdMy6Wue81ZaCSGCVu+?=
 =?iso-8859-1?Q?HZDpB/hv9ZeEzUFJhBdtD0sLzJs97WoJDlNdiodYWyW86Mh8nIeMjo31h+?=
 =?iso-8859-1?Q?wv+t1cvL03Bk4bLgtwHYAocJmSt2IJkK5k4grCcYI9sDYAq5T16giJpz8/?=
 =?iso-8859-1?Q?Wxy04atFwy82dMot9ZaCtk/asbX8blkLmYGJjXaLu2PualZjaV4IvumKIB?=
 =?iso-8859-1?Q?DbUTvfw2mNXQ0m1pXbBnJ+W00Tt/IVqVExNYVvMqWdfJzNZN9aYKNWMUGJ?=
 =?iso-8859-1?Q?hhB3t2zIUm37Y=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BL1PR11MB5399A434D9A3B13D1A802A4BD322ABL1PR11MB5399namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdb0809-9232-4aa4-7f23-08db7303634c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 09:30:59.0545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mu0YErOhDIBwQS1IvhW5Wgo1iKT9sJq2HJHfdEPTy39w2UsKKs0BE3BXQp9AD4qGbSSG0DNeQOZw0Ivhn6WtbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5586
X-Outbound-SMTP-Client: 173.37.147.253, alln-opgw-5.cisco.com
X-Outbound-Node: alln-core-2.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 09:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103483

--_000_BL1PR11MB5399A434D9A3B13D1A802A4BD322ABL1PR11MB5399namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

While compiling an image (i.e. core-image-minimal), I see the following war=
nings.
NOTE: Multiple providers are available for runtime libltdl (libtool, libtoo=
l-native)
Consider defining a PREFERRED_RPROVIDER entry to match libltdl

The following are my observations/findings:
- The package "libltdl" is defined in "libtool-2.4.7.inc" file.
- The "libtool-2.4.7.inc" file is in require in "libtool_2.4.7.bb" and "lib=
tool-native_2.4.7.bb"
- Hence, the above warnings appeared.

Can anyone explain how to remove these warnings or what was the case which =
require this?

As a workaround, I can add the run-time preferred provider as below.
PREFERRED_RPROVIDER_libltdl =3D "libtool"
However, a proper solution is necessary.


Appreciating any responses/insights (for this issue).


Thanks & Regards,

Krupal



--_000_BL1PR11MB5399A434D9A3B13D1A802A4BD322ABL1PR11MB5399namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);">Hello,</span><br>
</div>
<div dir=3D"ltr">
<div class=3D"x_elementToProof x_ContentPasted0 elementToProof" style=3D"fo=
nt-family: Calibri, Arial, Helvetica, sans-serif; font-size: 11pt; color: r=
gb(0, 0, 0);">
<div><br class=3D"x_ContentPasted0">
</div>
<div><span class=3D"x_ContentPasted0" style=3D"margin: 0px; background-colo=
r: rgb(255, 255, 255);"><span class=3D"x_ContentPasted2" style=3D"font-size=
:11pt; margin:0px">While compiling an image (i.e. core-image-minimal), I se=
e the following warnings.
</span></span><br class=3D"x_Apple-interchange-newline x_ContentPasted2">
</div>
<div><i style=3D"font-family:inherit; font-size:inherit; font-variant-ligat=
ures:inherit; font-variant-caps:inherit; font-weight:inherit">NOTE: Multipl=
e providers are available for runtime libltdl (libtool, libtool-native)</i>=
<br>
</div>
<div class=3D"x_ContentPasted0"><i>Consider defining a PREFERRED_RPROVIDER =
entry to match libltdl</i></div>
<div class=3D"x_ContentPasted0"><br>
</div>
<div class=3D"x_ContentPasted0">The following are my observations/findings:=
<br>
</div>
<div class=3D"x_ContentPasted0"><span style=3D"font-family: Calibri, Arial,=
 Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">- The packag=
e &quot;libltdl&quot; is defined in &quot;libtool-2.4.7.inc&quot; file.</sp=
an></div>
<div class=3D"x_ContentPasted0"><span style=3D"font-family: Calibri, Arial,=
 Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">- The &quot;=
libtool-2.4.7.inc&quot; file is in require in &quot;libtool_2.4.7.bb&quot; =
and &quot;libtool-native_2.4.7.bb&quot;</span></div>
<div class=3D"x_ContentPasted0"><span style=3D"font-family: Calibri, Arial,=
 Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">- Hence, the=
 above warnings appeared.
</span></div>
<div><br class=3D"x_ContentPasted0">
</div>
<div class=3D"x_ContentPasted0"><span style=3D"font-family: Calibri, Arial,=
 Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">Can anyone e=
xplain how to remove these warnings or what was the case which require this=
?</span></div>
<div><br class=3D"x_ContentPasted0">
</div>
<div class=3D"x_ContentPasted0 x_elementToProof"><span style=3D"font-family=
: Calibri, Arial, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, =
0);">As a workaround, I can add the run-time preferred provider as below.</=
span></div>
</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family: Cali=
bri, Arial, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);">PREFERRED_RPROVIDER_libltdl =3D &quot;libtoo=
l&quot;</span><br>
</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family: Cali=
bri, Arial, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
However, a proper solution is necessary.</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family: Cali=
bri, Arial, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family: Cali=
bri, Arial, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<span><span class=3D"x_ui-provider x_gm x_b x_c x_d x_e x_f x_g x_h x_i x_j=
 x_k x_l x_m x_n x_o x_p x_q x_r x_s x_t x_u x_v x_w x_x x_y x_z x_ab x_ac =
x_ae x_af x_ag x_ah x_ai x_aj x_ak" dir=3D"ltr"><span><span style=3D"font-s=
ize:14px">
<p class=3D"x_ContentPasted1" style=3D"margin-top: 0px; margin-bottom: 0px;=
margin:0px">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);">Appreciating any responses/insights (for thi=
s issue).</span><br>
</p>
<p class=3D"x_ContentPasted1" style=3D"margin-top: 0px; margin-bottom: 0px;=
margin:0px">
<br>
</p>
<p class=3D"x_ContentPasted1" style=3D"margin-top: 0px; margin-bottom: 0px;=
margin:0px">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);">Thanks &amp; Regards,</span></p>
<p class=3D"x_ContentPasted1 elementToProof" style=3D"margin-top: 0px; marg=
in-bottom: 0px;margin:0px">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 11pt; color: rgb(0, 0, 0);">Krupal</span></p>
</span></span></span></span><br>
</div>
<div class=3D"x_elementToProof x_ContentPasted0" style=3D"font-family: Cali=
bri, Arial, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
</div>
</body>
</html>

--_000_BL1PR11MB5399A434D9A3B13D1A802A4BD322ABL1PR11MB5399namp_--

