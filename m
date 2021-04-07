Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web12.7167.1617802326764197530
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 06:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=BaJMrVzC;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3562; q=dns/txt; s=iport;
  t=1617802326; x=1619011926;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=MxJOjH0P5/38mGfDkDwkp14xRaBXgMSqX+aFjJiLFgo=;
  b=BaJMrVzC4ooi2B5yhsb0Ao5CXmn7n9ypsN+UPHRZPMS/V2TWZbbGTkTb
   80ybek7nKxq0pgtpJPyiGsc6AlW8baoj6qSh+M+/cRRIYB/MGbyNCkyl6
   HJNZ56wSqZhgo6RDUbIsKAQuEbWfHLxaRLVDY5L75AvQUIIwv80B+vOrh
   o=;
X-IPAS-Result: =?us-ascii?q?A0BVBgCIs21g/51dJa1agQmBUoFTUQd3WjYxCogAA4U5i?=
 =?us-ascii?q?E8Dii6PDYEugSUDVAsBAQENAQEdDwYCBAEBgRYBgzkCgXcCJTQJDgIDAQEBA?=
 =?us-ascii?q?wIDAQEBAQEFAQEBAgEGBHEThVANhkQBAQEBAwE5BgEBDCwPAgEIEQQBAQEeE?=
 =?us-ascii?q?CEHCQEdCAIEARIIFQSCUYJVAy8BDp5NAoofdYE0gQGCBAEBBoEzAYNwDQuCE?=
 =?us-ascii?q?wmBOYJ2g3qGXSccgUlCgVaCXz6CHkIEAReBRgIFg0WCK4JLgQ8rIl4QCU4VB?=
 =?us-ascii?q?WS5f1sKIoJpiWOLeoFnhVuFC59mlRWLaoMWlCkCBAIEBQIOAQEGgVQ6gVlwF?=
 =?us-ascii?q?YMkCUcXAg6QaoElhRSFRXMLLQIGCgEBAwl8iwYBgQ4BAQ?=
IronPort-PHdr: A9a23:qYDQYx9XBe/DBP9uWNHoyV9lXQAupqn0MwgJ65Eul7NJdOG58o//O
 FDEjd1iiVbIWcPQ7PcXw+bVsqW1X2sG7N7BtX0Za5VDWlcDjtlehA0vBsOJSCiZZP7nZiA3B
 oJOAVli+XzoPk1cGcK4bFrX8TW+6DcIEUD5Mgx4bu3+Bo/ViZGx0Oa/s53eaglFnnyze7R3e
 R63tg7W8MIRhNgKFw==
IronPort-HdrOrdr: A9a23:WaRbz67GGcqdukb8sQPXwbGFI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexLh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdRHW3tV2kZ
 1te60WMrLNJHBxh8ri/U2cG9Ev3NGI/MmT9Jvj5l1qShxnbLwlyg9/BBqSHEEefng4ObMSEp
 2A6s1b4we6cXMMYcihQlUDVe7Pp9rE/aiWLyIuLRgh9QWIkHeU+Kf3eiLokSs2fhFu5fMZ8W
 bDmxHk/anLiZGG4zLVymO71eUvpPLP0d1Gbfb87/Q9CjKpsQqwYZQkZrvqhkFJnMiKyHIH1O
 bBuA0hOcMb0QKRQkiQrQH20wftlBYCgkWSsmOwunforcznSD9SMaMo7ug1Hmq7migdlepx36
 5R02WSu4A/N2K7oA3G+9PKWxt2/3DExkYKrO8Jg3RTFasYZbNBxLZvhX99LZYaECr2rL0gCe
 llZfusgsp+TFXyVQG8gkBfhPiXGlgjFBaPRUYP/uaP1SJNoXx/x0wEgOQCg3Yp7vsGOtl5zt
 WBFp4tuKBFT8cQY644LvwGW9GLBmvERg+JGH6OIG7gCLoMNxv22t3KyYRwwNvvVI0DzZM0lp
 iEekhfr3QOd0XnDtDL+5FX7BbXQiGYUS72ws9To7h104eMBobDAGmmchQDgsGgq/IQDonwQP
 CoIq9bBPflMC/gAoBM0wriW4RDKHUXXcEP0+xLH26mk4buEMnHp+bbePHcKP7GCjA/QF7yBX
 MFQXzyKax7nweWc069pCKUd2Lme0T58541OrPd5fIvxI8EMZAJtgAUjF++99yaMDEqiN1xQG
 JOZJfc1o+rr2i/+mjFq09zPABGM0pT6LL8F3VQpQELNEvwea0Zu8qWfH1T2HfvHG47c+rmVC
 pk43hn86O+KJKdgQo4Dci8D26ch3wP4G6RQ4wEga2F78f9cpY+BpIrMZYBTDnjJlhQo0JHuW
 1DYAgLSgvjDTvok7yil4FRLvrYbcNAjACiJtN0pXrTuV6Hn9wmQmIWUleVIJaqqDdrYwARp1
 Vqt4cDnbKLmF+UWBUCqdV9FGcJVUO6L/ZtCh+faIBdh7bxETsAPFuitHi9kBE8em3j6kMIoH
 fuRBfkIs3jMx56pm1S1Lrs/RdScGiQFngAN0xSgMlaCXnMvGp13KuwQpeLl0GValcE34gmQW
 v4SDMPPwJjwM223haJmDCEUW4r3IkqI/a1NsVST5jDnnyqM4GGjqcAArtd+4tkLsnntqsRXf
 uYYBL9FkKzN8o5nwiUrG0iIi96tT0tlu7pwgTs6AGDrTYCKOuXJFRtXLcAJd6Aq2DiWvaTyZ
 18ydY4p/G5PGm0atmIz8jsHnV+AwKWpW69VOczr59I+ao0qbtoBpHeFSLSy2sv5mRIEO7k0E
 cFBKhr6rHIPYFiO8QUZiJC51Is0NCCNlEivAD6CvI3FGtdwkPzLpeM+f7FuLAvCkqOqE/rNV
 6T/zZU8v3FUyGAvIRqQp4YMCBTcgwx+X5i9OSNe8nMEw2sbfhE50f/PXmncrNRIZL1VYk4v1
 J/+ZWPkOCWfSajh1yVsjt/P65U82GoBcm1GxmBHOZU89q8fVSA65HalfKbnXPyU3+8bU9dmI
 hOMUoXZc5HgiM5jII23jOpI5aH1H4Ngh9b+3V/ilXp2oK6+2/VEkFNLB3BjvxtLEtuG2nNid
 6A7POR23v86iVUwJXPFE9feddVBtgbJ7KHWxtGOIwXp76n/60mnyRFblMvFgcH+UPA498=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.82,203,1613433600"; 
   d="scan'208";a="676718119"
Received: from rcdn-core-6.cisco.com ([173.37.93.157])
  by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 07 Apr 2021 13:32:05 +0000
Received: from mail.cisco.com (xbe-aln-002.cisco.com [173.36.7.17])
	by rcdn-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id 137DW54B001597
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Wed, 7 Apr 2021 13:32:05 GMT
Received: from xfe-rcd-003.cisco.com (173.37.227.251) by xbe-aln-002.cisco.com
 (173.36.7.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Wed, 7 Apr 2021
 08:32:05 -0500
Received: from xfe-aln-005.cisco.com (173.37.135.125) by xfe-rcd-003.cisco.com
 (173.37.227.251) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Wed, 7 Apr 2021
 08:32:05 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-005.cisco.com (173.37.135.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3
 via Frontend Transport; Wed, 7 Apr 2021 08:32:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeZyyKrbe+DFNGF4UxzL1pTk5tQ1IhBWARuTHiVVi+kbefImVDxVEbbBUsyrGYnp7NTM1ma4kLq3BmosefAldaLV91ZYubSxqCk2vve6H/8b/OCGcDXDCyC2VWHyXwWv8IZ99eiKG0iDhv7AeNZQTbfToYnq9cGZHhevqjchAEvsR51kSTR2dqceaPN7JUHu3ASdpH6E+EAaqSVaqFtKZ4380xgYZ+2eppTHiB+Sp8zW1W0ldd/9VZQoEEKmui2aUaO8I5xt+dma1Nu1/wZlJma/FrO9ZFzIwK7M1/RJ2jM+FxWUUow2ZD3yWLKiUPW3sQ6HiIovWYnmefsRbJuZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8t+RgJBQSXQcrcVJBAJR0jnj4hnb1jxoijTVnzzrUM=;
 b=EcTqE9I7iJ78fUDOmLnPrRxyh+/GoEuqA6LKbO/LVEGqv8qHJGan+gh6WndkjdAyXppyivVnxLnp9vkL+N3DxxlURf5PxeRrJBlOucPxCOnoSkDD6Tf1zkMKUH2ZyBDG0Yi+CSHhOEKUwN69t36IKcTOfCbPrQPXXzuLtXFpcTk6GtlmxV/J7lvR5vzYrMbFVcRI9Bpm21l+o+Etrjvac5W3YQWsk6cl6//qLi9MxMIaKX+maCWeXpvVKc7t6pic1UIPXqT+MW6b10UjXH+SuU4m3XjJmzzIGbaGU+Iwf5RebTpnFz+1BYlo9xLQ2UJUD1T5sIrgznF7Gj/Whff6eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8t+RgJBQSXQcrcVJBAJR0jnj4hnb1jxoijTVnzzrUM=;
 b=gT/ysLyF4WNfB1ANPaP4NiHlQTac4jZlnFKFKjyCZO9wo0kIxKTUhRfYP2sVKnhUQb30GiVxCklN7FJrn02alsa6eBXT++50G5BP808rEeqoccPNC43z8rjpg4s0lda0xkf63xCFK8w7rYLAUl7N/8+syQ9IlN8HFjHeq84T0ck=
Received: from BY5PR11MB4024.namprd11.prod.outlook.com (2603:10b6:a03:192::24)
 by BYAPR11MB2870.namprd11.prod.outlook.com (2603:10b6:a02:cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 13:32:03 +0000
Received: from BY5PR11MB4024.namprd11.prod.outlook.com
 ([fe80::6505:b3:4118:8336]) by BY5PR11MB4024.namprd11.prod.outlook.com
 ([fe80::6505:b3:4118:8336%4]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 13:32:03 +0000
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: Khem Raj <raj.khem@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH v2] bpftool: remove recipe from blacklist
Thread-Topic: [oe] [meta-oe][PATCH v2] bpftool: remove recipe from blacklist
Thread-Index: AQHXIaJxQdV9dWQXrkquR7TmP7NvK6qpHlMH
Date: Wed, 7 Apr 2021 13:32:03 +0000
Message-ID: <BY5PR11MB4024ED277A4D898134E1544DD9759@BY5PR11MB4024.namprd11.prod.outlook.com>
References: <20210325161828.41393-1-dzagorui@cisco.com>,<7f3a1c21-5425-c29b-ebc3-5c6363905b3c@gmail.com>
In-Reply-To: <7f3a1c21-5425-c29b-ebc3-5c6363905b3c@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [173.38.209.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45c6e811-3c94-4c8b-a2b5-08d8f9c987f3
x-ms-traffictypediagnostic: BYAPR11MB2870:
x-microsoft-antispam-prvs: <BYAPR11MB287024D1C9BE24A9AE6CBD29D9759@BYAPR11MB2870.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XwQOKS0BOy9itFeU4SGDoHXmJqEh5WrIRV6uO4vUrMxiMhfSLmVdc390p90WA33lk6PqQvVcuGhV0mgVSrL7VpGcFHxe9+0BzWcdK+NPCnWd4Q86a45ZScVrAyBuYUc11YcCnGKAi7kabcN/eCLJa8kiUFF5EG33ulFnFAWqg1Zkj5Uw1+NlKx00Bplqy7B7euu/Kax05OOfp9L7TlNzVThV84hvLTO2ExVjWCS1NZQ+FuYu9gHOjEqiBCsFn8AhSOJ+6N+Df72erepBBBLoKiLtP69Bla5BZ4/EzvllaHo0Jv1P927YJC7mIdRVYw6COxYfmUQX7hP2K/77biW3qlhUTchuBaKZTBlVeqgW11nzo3XNc1O/zR1dbHW/9h1A8W/G364CCJoqw344YYi3Cupa8hSBKbP0RIlX46KCBlgaqGg1Yf9Mi3HlBF1A7ACZIaiXA1MLdK78brVazXYiYe2ZgY7h3nujiKRI/8JVsbotVEKmwAG+KPPdIj7aXJ5A6gnpU2kp0f25XRQ3sjAGUbIGhNJjrqFDrP86u25SIDhFCDqw7SlU4YGzqKMUOnRgMuECdjAmVU/8v7Yi7thYNWamrU/ngdofkZ9VYkFJa6PerfYxbD1+pOoVnvjBSb/dZYUxLEjLbWsvm/Udm6i6icfiRqB3Rf+aXWuBzGUvKNl9ZOuITEwF8Oa1OhfGhUKUUouwVOhuUc6hcajaVNGLdzd7soLQ/rNuQDnzS7SVGLc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4024.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(136003)(39860400002)(376002)(478600001)(966005)(9686003)(110136005)(64756008)(66946007)(66556008)(66446008)(6506007)(55016002)(26005)(66476007)(83380400001)(186003)(7696005)(71200400001)(91956017)(38100700001)(86362001)(8676002)(5660300002)(52536014)(316002)(76116006)(33656002)(8936002)(2906002)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?OmjxS/FsxxwBDUaZ+ATEP+uw0TPGmej5c/XHtG8hoKE9cCwEmgqk75SbkiRy?=
 =?us-ascii?Q?yZLZn/VF5kF1k9IjcccwpwEFi6ASsjE69bumWqcU4cjnXMa4jSpM6VPPlxTc?=
 =?us-ascii?Q?jQVrheJ4bTjRO9qrU88H1HxJsFLNr9pBGf35cDoG0eQKg2fmh5ML/oR4AE9+?=
 =?us-ascii?Q?M8AqA1KqC/ceWM2ZBYHeNUz2LE3e/YZiVgVUUgCORLKlwAa+X+MF1pklBpqE?=
 =?us-ascii?Q?+OPawRvSTD4tciL5Ab8sKMStgXoxdUGJkClPlT9Wm4lk4vK4fFpFYN2RIW/p?=
 =?us-ascii?Q?FUtSdZkq4JD6/rxXHxDoN6dqrC7XsZ/TCCPKogwDQ06qXwG+lAFmPVc0heO6?=
 =?us-ascii?Q?6Kw2hNDc3YTiz4Xrk2SIALqaHpT8mDOl62w+RvgYlx24DLXoo/3eAt3JnvHh?=
 =?us-ascii?Q?+y5Ufp1GBStYQ2Qfr23nHxK5l/lpmtBwA+liQF3+bRxWG1FNeGKmk9Wrax1e?=
 =?us-ascii?Q?QupGtLoakGqptuC+J7WxMaehkpKJtmnr2JFNnFRmF8S2k0PqMzUjwLay5P8W?=
 =?us-ascii?Q?WUyDSuvLDDSrtnT1EWkx/CWTeqMMsqzVoTkOdcK7MjmdMFrw1FECuBNgS/7y?=
 =?us-ascii?Q?De2YU7GCAgPE6SUwYt9qVigjYpAjcUwYyXta50XDGCniF/y4gGuaFOib0C1q?=
 =?us-ascii?Q?HE/YAcL2TyKeoDaqcENAE4CR/UknBocGcJpuSNHhoku4v/JHl6eVKnfMTeDL?=
 =?us-ascii?Q?WitW/J4bJKTKfh8ArIev4AHj6IVSuPwTub88Eqa+HG098+eelQ9QZ05P5G4U?=
 =?us-ascii?Q?2CwndRt7njVvAMt85P67tggDsy50ilF62Qx2b9Coxrf5sNZtOPLUaRcpuEp+?=
 =?us-ascii?Q?ImazdMSO3XaBwN7IOuZwd5GlRJeZrjRJGKWa93g6BVi7y7W26zLU9dNyAhNb?=
 =?us-ascii?Q?JfjyGBo2hei/9SZO22Znt+Qo4xdMd/zg4CIXe7IsUpyhxc4yKffEZ9x+GqAy?=
 =?us-ascii?Q?J/4pq4XbPtAv7+VUM5HrKQOQAch4Ytdr92GwuYCLv5WFoDqA3eqnPolKgnwq?=
 =?us-ascii?Q?Le5rj4kxeygfv8VpK3g1UMdCsQVLQKxIgN6+wwg0SmqcWEGU1irmuEvJz7wI?=
 =?us-ascii?Q?BLBqvILUaB0bBxqcycoqKqxaIxHE39WhTCzDd5ae8QExpeC+aw/hcr6oD9dy?=
 =?us-ascii?Q?6FPpCKHx1ywkMpuQDFECMX6JSkOD+AaxvLjLvo6S5hlzAz7/+zpliPcZOG8x?=
 =?us-ascii?Q?KVpB/AU9zwvBNz07nA82WrPH8w42e8clroNqLDrPpoRWRbac81kjKyJA/w8X?=
 =?us-ascii?Q?DEXVN8j6sIFh8c1jmklatD0Sc1pbJXoJ6nUoF09KsSN043UL81gQ/qVOqjCC?=
 =?us-ascii?Q?aR8=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c6e811-3c94-4c8b-a2b5-08d8f9c987f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 13:32:03.5190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U24T4Kkt6yMJ3wJvE4d4pcekM3Llov6cAWhwoBoQnXCSSABeMCY2pbPZMwx9BABc++Xob+x07UxnIKxxETfQUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2870
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.17, xbe-aln-002.cisco.com
X-Outbound-Node: rcdn-core-6.cisco.com
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've noticed that this patch
https://git.openembedded.org/meta-openembedded/commit/?h=3Dhardknott&id=3D=
2179569945f07a8ad54b9015dc5fad4300cdbde9
and another patch
bpftool: improve reproducibility https://git.openembedded.org/meta-openemb=
edded/commit/?id=3D120de5e02ae4d48bb75e910caa2b7f4ae4b3d025
have strange author field
author  INC@Cisco) <INC@Cisco)>
I'm wondered how is that happened.

________________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: 25 March 2021 20:12
To: Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at Cisco); openembedded-d=
evel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH v2] bpftool: remove recipe from blacklis=
t



On 3/25/21 9:18 AM, Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)
via lists.openembedded.org wrote:
> Have not seen build issues for 5.4 and 5.10
> x86-64 kernels so allow to build it
>
> Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
> ---
>   meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ++--
>   meta-oe/recipes-kernel/bpftool/bpftool.bb                  | 1 -
>   2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb =
b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index c717d45e5..6f7e6fc74 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -608,12 +608,12 @@ RDEPENDS_packagegroup-meta-oe-kernel =3D"\
>       trace-cmd \
>   "
>   RDEPENDS_packagegroup-meta-oe-kernel_append_x86 =3D " intel-speed-sele=
ct ipmiutil pm-graph turbostat"
> -RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 =3D " intel-speed-se=
lect ipmiutil kpatch pm-graph turbostat"
> +RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 =3D " intel-speed-se=
lect ipmiutil kpatch pm-graph turbostat bpftool"
>   RDEPENDS_packagegroup-meta-oe-kernel_append_poerpc64 =3D " libpfm4"
>
>   # Kernel-selftest does not build with 5.8 and its exluded from build t=
oo so until its fixed remove it
>   RDEPENDS_packagegroup-meta-oe-kernel_remove =3D "kernel-selftest"
> -RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl =3D "crash intel-=
speed-select kernel-selftest minicoredumper turbostat"
> +RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl =3D "bpftool cras=
h intel-speed-select kernel-selftest minicoredumper turbostat"
>
>   RDEPENDS_packagegroup-meta-oe-kernel_remove_mipsarch =3D "makedumpfile=
"
>   RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 =3D "crash"
> diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes=
-kernel/bpftool/bpftool.bb
> index 1758430bc..e58bdd493 100644
> --- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
> +++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> @@ -32,4 +32,3 @@ python do_package_prepend() {
>   }
>
>   B =3D "${WORKDIR}/${BPN}-${PV}"
> -PNBLACKLIST[bpftool] ?=3D "Needs forward porting to kernel 5.2+"
>

you need to set proper COMPATIBLE_HOST here too.

>
>
>=20
>
