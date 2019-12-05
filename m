Return-Path: <mike.looijmans@topicproducts.com>
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60057.outbound.protection.outlook.com [40.107.6.57])
	by mail.openembedded.org (Postfix) with ESMTP id 648577D708
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=AGoMJORpVa+lFdODnevgtUaSzmH6Ozzl9Igve3H/9Tw=;
	b=srmya8NWgpks1iihfyXFd0z8SIdiuFUsJvU3mSpnWtjCITwX63CwRpKLgHUAIBsP+zvUttolM5GqWecpDZhFsSuT/QpD/t7MRJNKMuc5f5m/Q2BQhA3aqbmT9XIq1jLezZ1o7pQ3q06PCgBCyA7byDDilzgSPMkVfVqnMDa1DA0=
Received: from AM5PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:206:1::29)
	by HE1PR0402MB2697.eurprd04.prod.outlook.com (2603:10a6:3:e1::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13;
	Thu, 5 Dec 2019 14:49:02 +0000
Received: from VE1EUR01FT056.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e01::200) by AM5PR04CA0016.outlook.office365.com
	(2603:10a6:206:1::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via
	Frontend Transport; Thu, 5 Dec 2019 14:49:01 +0000
Authentication-Results: spf=pass (sender IP is 52.166.56.231)
	smtp.mailfrom=topicproducts.com; lists.openembedded.org;
	dkim=pass (signature
	was verified) header.d=topicbv.onmicrosoft.com; lists.openembedded.org; 
	dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
	designates 52.166.56.231 as permitted sender)
	receiver=protection.outlook.com; client-ip=52.166.56.231;
	helo=westeu11-emailsignatures-cloud.codetwo.com;
Received: from westeu11-emailsignatures-cloud.codetwo.com (52.166.56.231) by
	VE1EUR01FT056.mail.protection.outlook.com (10.152.3.115) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2495.18 via Frontend Transport; Thu, 5 Dec 2019 14:49:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.52) by
	westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP
	Server (TLS12) via SMTP; Thu, 05 Dec 2019 14:48:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=UojOfGzkXgzSK1Hn495HKu8+/7CTUuJpZWxij1B62+4ZVoKHSjGLAM+dJKvIdYf2VjwEBbXLQDRGMarVtzGQfoi1e2BexmpbGv06pQ6JSIpqtXONrynDLsFOjcJ5nWkVzorPr7AwPi9o33rVZ7xvS/HTYdJOQbRMcMV6K+uDE2ii7P0BBF+jPgNXmnB/J9+F8hxg5CVGzdk0rSQhPDxD4RrscJmwrD8GWqG1jHjW7LLdDVj4PEyuhN67+8SXKhtBK3RZhH5RA+S6/WM+HKgRoTqMyrftm6cCJT4MwcPA/sHScVaCoMqfTHVsj3w311x/4CohXpNN92RzQviTvbWDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=AGoMJORpVa+lFdODnevgtUaSzmH6Ozzl9Igve3H/9Tw=;
	b=BAfTrMvgd0Q5C/vl98a4AIxEwPjb/Ye44GgYgU/a4Yv8qw5GfWlDlrBuTwT5H0NOP+nQSUNot6Z1dIRf664kz5mqZlXgc64u87823kyLtaMg4m90AUbP9swwVc45CipZxLqGz12V+8sp7hpN9kEF1VEHjYIB1Tt94E4BxuBicEdcrD1MYzVVdeZ2hvIJUYqPIzCMoghx9X3xwNeMxH1n7gMnFFRXR2IV7bcCzD3yhGk3x6fh04Lj8svYuoRukF72zZj2+TbTyDwSSXJDfvA5hX8fe6HLPjwrn2xIDTeMpqIhbcSG6Ub9m7tfQ3pkZmOiqeM4Wjs4UxfDFDJIMLtr6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=topicproducts.com;
	dmarc=pass action=none header.from=topic.nl; 
	dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=AGoMJORpVa+lFdODnevgtUaSzmH6Ozzl9Igve3H/9Tw=;
	b=srmya8NWgpks1iihfyXFd0z8SIdiuFUsJvU3mSpnWtjCITwX63CwRpKLgHUAIBsP+zvUttolM5GqWecpDZhFsSuT/QpD/t7MRJNKMuc5f5m/Q2BQhA3aqbmT9XIq1jLezZ1o7pQ3q06PCgBCyA7byDDilzgSPMkVfVqnMDa1DA0=
Received: from AM7PR04MB6934.eurprd04.prod.outlook.com (10.141.173.142) by
	AM7PR04MB6824.eurprd04.prod.outlook.com (10.141.174.139) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2516.13; Thu, 5 Dec 2019 14:48:58 +0000
Received: from AM7PR04MB6934.eurprd04.prod.outlook.com
	([fe80::96:ed5f:d8d7:ded4]) by AM7PR04MB6934.eurprd04.prod.outlook.com
	([fe80::96:ed5f:d8d7:ded4%4]) with mapi id 15.20.2516.003;
	Thu, 5 Dec 2019 14:48:58 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [warrior] [meta-qt4] qt4-xqq fails to compile on arm64
Thread-Index: AQHVq3sfSL/p7UHnP0iO1yOOPgttSQ==
Date: Thu, 5 Dec 2019 14:48:58 +0000
Message-ID: <217e8ae0-85dc-030a-23b8-16fcd699eab6@topic.nl>
References: <20191119123755.2526-1-quentin.schulz@streamunlimited.com>
	<1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.1f62d4fc-3660-4f61-b518-4309c3d785b7@emailsignatures365.codetwo.com>
	<1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.5728a17c-b790-49b0-bf2c-61576ca07c85@emailsignatures365.codetwo.com>
In-Reply-To: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.5728a17c-b790-49b0-bf2c-61576ca07c85@emailsignatures365.codetwo.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
x-clientproxiedby: AM0PR05CA0091.eurprd05.prod.outlook.com
	(2603:10a6:208:136::31) To AM7PR04MB6934.eurprd04.prod.outlook.com
	(2603:10a6:20b:10a::14)
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=mike.looijmans@topicproducts.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.173.50.109]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2fa571b7-deb1-48ae-785e-08d77992446a
X-MS-TrafficTypeDiagnostic: AM7PR04MB6824:|HE1PR0402MB2697:
X-Microsoft-Antispam-PRVS: <HE1PR0402MB269798D56061073BF145BE76965C0@HE1PR0402MB2697.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 02426D11FE
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(199004)(189003)(15974865002)(508600001)(65956001)(25786009)(31696002)(186003)(6486002)(14454004)(102836004)(58126008)(42882007)(26005)(44832011)(36756003)(2616005)(5640700003)(11346002)(6506007)(5660300002)(66446008)(305945005)(14444005)(52116002)(76176011)(31686004)(2906002)(99286004)(71200400001)(6512007)(8936002)(71190400001)(6916009)(66556008)(64756008)(66476007)(66946007)(81166006)(81156014)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR04MB6824;
	H:AM7PR04MB6934.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: topicproducts.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: b5C9vn1gIY9DGhCQNS7cmX9WmCvlGVMkWgiHpP8ishVIGJ2m3sJ+pZXAKzU2y6ig2hcKH0UBNhObZYuGveU1mFjxney+Ck6NGCP903bgjOHjXLpZhF+Ol1k5LJ+PumiCBQ8MNMul/O7DZXZs/ItFFqkkczOgqKQZomMLtPmBkeuZwwyD/Ov0BWuBQTVUA5ij6E7oZ80rycQzhNxmGkwWhENkJ1A4WiDzBFYTXMN879E4AoFOA8hHicDjFcSg5NIGrwrl+AeNb9GLJ52biFEKHkixKMKG85pe4A48HMUy2k+X8bZ1xdjKrca1U2a+VB5UIbjWG0ERFOfceySzVV1BJS+ECO5HoqIU9OvBJoEcC0z7+64xg5DXwupL20qgOi8Ik+fqSre9TjlP+q/CZWYbmF1o3gKwfL+a7LKAGYybKDL4isv2TE/9dVxU6oo7q4Epev9kQC/mdrnBtj1p0QaUUGqrXxEOFVX1gFrMg/zcs9o=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6824
X-CodeTwo-MessageID: 5b416965-177f-4a3d-afb8-836ebd550a22.20191205144859@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR01FT056.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:52.166.56.231; IPV:NLI; CTRY:NL; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39840400004)(376002)(136003)(396003)(346002)(199004)(189003)(6506007)(11346002)(356004)(5640700003)(508600001)(14454004)(44832011)(26005)(14444005)(36756003)(70206006)(336012)(70586007)(102836004)(42882007)(5660300002)(186003)(2616005)(8936002)(246002)(8676002)(316002)(76176011)(2906002)(99286004)(305945005)(50466002)(6512007)(23676004)(6486002)(7636002)(31686004)(65956001)(7596002)(6916009)(25786009)(31696002)(15974865002)(58126008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0402MB2697;
	H:westeu11-emailsignatures-cloud.codetwo.com; FPR:; SPF:Pass;
	LANG:en; PTR:westeu11-emailsignatures-cloud.codetwo.com; A:1;
	MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 587794e3-aa27-403e-44e8-08d779924264
X-Forefront-PRVS: 02426D11FE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UZYs0MpLL21ThEn3CCVPlKipE1LXvsFWCfXIxNrdMSsYvbJvCPLVnbbj79w88z1ZFoYTpOdmUM0SCPLNAwGzSvMSGPMU0GA5B702i2XPsuMekO2NND5AggGX4G+6+Co3SID73YERCO3lXFytnltFH+3NvyzKTWlIls7y2gza43FEfBrGPBe03tNldSpXLlKp+dE6rCkI+ak7Ku845Rrpjng7ZBfXk6lIZ4pCIVkF15VVkDM3yn8TcZaR896aZs9mytBrAcACQgN6eU9sr3Oku+y+tncK/q0MiJJv1opeoABmlCpxQ/+qLLFXV4xSDRZlCu1AftXGUyNxu4xAthpybg7RhxecgunCFE36EypKPcql73jRHS+hJtgfnLoy2Uyy+qs4NPzV425kL2p5dXSwOUKckSrkErAo4AEN/Ge3Lx1CSHRj/F21gspVM8z+qXLOfgvQqcUMeZ8gPkl4zHps34H+RPAwYfIPYWzgxY3uMb4=
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 14:49:01.5598 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa571b7-deb1-48ae-785e-08d77992446a
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;
	Ip=[52.166.56.231];
	Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2697
Subject: [warrior] [meta-qt4] qt4-xqq fails to compile on arm64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Dec 2019 14:49:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <444587EF3D6D1945993678BC7D38B10A@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

QXBwYXJlbnRseSB0aGVyZSdzIHNvbWUgY3Jvc3MtY29tcGlsZXIgYmFkbmVzcyBpbiB0aGUgUXQ0
LXgxMSBzdHVmZiwgc2luY2UgaXQgDQphdHRlbXB0cyB0byB1c2Ugc29tZXRoaW5nIGZyb20gL3Vz
ci9pbmNsdWRlLg0KDQpBbSBJIHRoZSBvbmx5IG9uZSBzZWVpbmcgdGhpcywgb3IgaXMgdGhlcmUg
YSBrbm93biB3b3JrYXJvdW5kPw0KDQoNClRoZSBlcnJvciBsb29rcyBsaWtlIHRoaXM6DQoNCg0K
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIA0KL2hvbWUvbWlrZS9wcm9qZWN0cy9teS1kZXNrdG9wL2J1
aWxkL3RtcC1nbGliYy93b3JrL2FhcmNoNjQtb2UtbGludXgvcXQ0LXgxMS1mcmVlLzQuOC43LXIw
L3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL3N0ZGxpYi5oOjU1LA0KICAgICAgICAgICAgICAg
ICAgIGZyb20gDQovaG9tZS9taWtlL3Byb2plY3RzL215LWRlc2t0b3AvYnVpbGQvdG1wLWdsaWJj
L3dvcmsvYWFyY2g2NC1vZS1saW51eC9xdDQteDExLWZyZWUvNC44LjctcjAvcmVjaXBlLXN5c3Jv
b3QvdXNyL2luY2x1ZGUvYysrLzguMy4wL2NzdGRsaWI6NzUsDQogICAgICAgICAgICAgICAgICAg
ZnJvbSANCi9ob21lL21pa2UvcHJvamVjdHMvbXktZGVza3RvcC9idWlsZC90bXAtZ2xpYmMvd29y
ay9hYXJjaDY0LW9lLWxpbnV4L3F0NC14MTEtZnJlZS80LjguNy1yMC9yZWNpcGUtc3lzcm9vdC91
c3IvaW5jbHVkZS9jKysvOC4zLjAvYml0cy9zdGxfYWxnby5oOjU5LA0KICAgICAgICAgICAgICAg
ICAgIGZyb20gDQovaG9tZS9taWtlL3Byb2plY3RzL215LWRlc2t0b3AvYnVpbGQvdG1wLWdsaWJj
L3dvcmsvYWFyY2g2NC1vZS1saW51eC9xdDQteDExLWZyZWUvNC44LjctcjAvcmVjaXBlLXN5c3Jv
b3QvdXNyL2luY2x1ZGUvYysrLzguMy4wL2FsZ29yaXRobTo2MiwNCiAgICAgICAgICAgICAgICAg
ICBmcm9tIA0KLi4vLi4vLi4vaW5jbHVkZS9RdENvcmUvLi4vLi4vc3JjL2NvcmVsaWIvZ2xvYmFs
L3FnbG9iYWwuaDo2OCwNCiAgICAgICAgICAgICAgICAgICBmcm9tIC4uLy4uLy4uL2luY2x1ZGUv
UXRDb3JlL3FnbG9iYWwuaDoxLA0KICAgICAgICAgICAgICAgICAgIGZyb20gDQouLi8uLi8uLi9p
bmNsdWRlL1F0Q29yZS8uLi8uLi9zcmMvY29yZWxpYi9nbG9iYWwvcW5hbWVzcGFjZS5oOjQ1LA0K
ICAgICAgICAgICAgICAgICAgIGZyb20gLi4vLi4vLi4vaW5jbHVkZS9RdENvcmUvcW5hbWVzcGFj
ZS5oOjEsDQogICAgICAgICAgICAgICAgICAgZnJvbSANCi4uLy4uLy4uL2luY2x1ZGUvUXRDb3Jl
Ly4uLy4uL3NyYy9jb3JlbGliL2tlcm5lbC9xb2JqZWN0ZGVmcy5oOjQ1LA0KICAgICAgICAgICAg
ICAgICAgIGZyb20gLi4vLi4vLi4vaW5jbHVkZS9RdENvcmUvcW9iamVjdGRlZnMuaDoxLA0KICAg
ICAgICAgICAgICAgICAgIGZyb20gDQouLi8uLi8uLi9pbmNsdWRlL1F0R3VpLy4uLy4uL3NyYy9n
dWkva2VybmVsL3F3aW5kb3dkZWZzLmg6NDUsDQogICAgICAgICAgICAgICAgICAgZnJvbSAuLi8u
Li8uLi9pbmNsdWRlL1F0R3VpL3F3aW5kb3dkZWZzLmg6MSwNCiAgICAgICAgICAgICAgICAgICBm
cm9tIC4uLy4uLy4uL2luY2x1ZGUvUXRHdWkvLi4vLi4vc3JjL2d1aS9rZXJuZWwvcXdpZGdldC5o
OjQ2LA0KICAgICAgICAgICAgICAgICAgIGZyb20gLi4vLi4vLi4vaW5jbHVkZS9RdEd1aS9xd2lk
Z2V0Lmg6MSwNCiAgICAgICAgICAgICAgICAgICBmcm9tIC4uLy4uLy4uL2luY2x1ZGUvUXRHdWkv
UVdpZGdldDoxLA0KICAgICAgICAgICAgICAgICAgIGZyb20gdGVzdHdpZGdldC5oOjQ0LA0KICAg
ICAgICAgICAgICAgICAgIGZyb20gbWFpbi5jcHA6NDE6DQovdXNyL2luY2x1ZGUvYml0cy9mbG9h
dG4uaDo4Nzo5OiBlcnJvcjogJ19fZmxvYXQxMjgnIGRvZXMgbm90IG5hbWUgYSB0eXBlOyBkaWQg
DQp5b3UgbWVhbiAnX19jZmxvYXQxMjgnPw0KICAgdHlwZWRlZiBfX2Zsb2F0MTI4IF9GbG9hdDEy
ODsNCiAgICAgICAgICAgXn5+fn5+fn5+fg0KICAgICAgICAgICBfX2NmbG9hdDEyOA0KDQpNZXQg
dnJpZW5kZWxpamtlIGdyb2V0IC8ga2luZCByZWdhcmRzLA0KDQpNaWtlIExvb2lqbWFucw0KU3lz
dGVtIEV4cGVydA0KDQoNClRPUElDIEVtYmVkZGVkIFByb2R1Y3RzIEIuVi4NCk1hdGVyaWFhbHdl
ZyA0LCA1NjgxIFJKIEJlc3QNClBvc3RidXMgNDQwLCA1NjgwIEFLIEJlc3QNClRoZSBOZXRoZXJs
YW5kcw0KDQpUOiArMzEgKDApIDQ5OSAzMyA2OSA2OQ0KRTogbWlrZS5sb29pam1hbnNAdG9waWNw
cm9kdWN0cy5jb20NClc6IHd3dy50b3BpY3Byb2R1Y3RzLmNvbQ0KDQpQbGVhc2UgY29uc2lkZXIg
dGhlIGVudmlyb25tZW50IGJlZm9yZSBwcmludGluZyB0aGlzIGUtbWFpbA0K

