Return-Path: <mikko.gronoff@qt.io>
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50121.outbound.protection.outlook.com [40.107.5.121])
	by mail.openembedded.org (Postfix) with ESMTP id 78DD77FC09
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 07:14:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=OAEpbS5K8ao9OZwa8coFBkfiQ2zradiCECEoWdJeYuK53jnOEzPh1RITOteVIv1fKpZEtb6a9IctlbumYJopxz5ST0Sfgcv2DkfwSvzQUXRQRc9iRvGSoGBweCDs+xsXOtGtbf7i/ZpRgxk4c5zItfucx3DG+HaoC2wwXXK5n8OP6gj5EeH4W1biUHLk01xY0WY0XNiJ4+FLs2l+tkpOQDQOuLcdTnhA1jz5DnHZevEvchWjuiJ7rqIDxvdq8kcK4rmng8ULqnpwvO3l7hAlo404VAqk6EFV+XHGf5tBnB4IPnrB47zcjvs1+hBWWBT65pb8zvZMtKRSQHMU+VSFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=fEws3XgxkUl7T7uyxfeLvLqXr4pWzxorOMeEa12JeMA=;
	b=X0X6YGF5/8NIkyVS13xrWQHTlN2Qbe1hdEfpHWWwTng7kTfPNsu8ktOGXZe8nOt9qlR1p/T7SIYqRBLCBWG3/NPmthxQ9Ym0pvCMiOKOPIJnmtMA6lXAGZ/kgOaiTBinwQJpa1Gew+KPk3lZ3rxiQsFVUgJRv1hVLx7LocgFYjWXJ9ArAZBQ9ru3DQwfRNixSZP8803XKjqE6NnInfpZhvdYRmeXWtcIB9tSRNgYr+i8dVYSKEJ+zwWQZZ/QxFzFGEbyocmEGBOw5tecJJBvY8AiwY4fuqDRvPm28sYZEvC2co0wqzS9trL/n2nEzefEdxNOg4XoVAfrDt9j3YC99Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=qt.io; dmarc=pass action=none header.from=qt.io; dkim=pass
	header.d=qt.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qt.io; s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=fEws3XgxkUl7T7uyxfeLvLqXr4pWzxorOMeEa12JeMA=;
	b=XJsjTLxEkBwsLHZI4oEXqLK5ANCHI0/AlqIgOR7/vkGQrWdGwWRdkpWD132MDsmXs8HM4H2j9ryCARapV5b2hhDbEVoK3UWOHGWTR9vBkTPehPh2cS1lqhrP9wBVmCp71tAUmI8wxYYQBPQyqUXFO+lSHPzeDwwqFFGIHQgAmFQ=
Received: from AM0PR02MB3748.eurprd02.prod.outlook.com (52.134.80.33) by
	AM0PR02MB4372.eurprd02.prod.outlook.com (20.178.18.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2516.17; Mon, 9 Dec 2019 07:14:13 +0000
Received: from AM0PR02MB3748.eurprd02.prod.outlook.com
	([fe80::c0e7:537b:3b49:278b]) by
	AM0PR02MB3748.eurprd02.prod.outlook.com
	([fe80::c0e7:537b:3b49:278b%6]) with mapi id 15.20.2516.018;
	Mon, 9 Dec 2019 07:14:13 +0000
From: Mikko Gronoff <mikko.gronoff@qt.io>
To: Jon Cormier <jcormier@criticallink.com>, Samuli Piippo
	<samuli.piippo@qt.io>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: meta-Qt5 5.9 branch regression, qtquick license error
Thread-Index: AQHVrFVO9GLLc4BgXE6zL6E0dSAN4aexZ9eA
Date: Mon, 9 Dec 2019 07:14:13 +0000
Message-ID: <d0309dd8-9b9d-a910-4422-f9e7a9258118@qt.io>
References: <CADL8D3ZY72ydX24sV=hh39fVCMK34cYfEii6qNqP+bCGO3bC3Q@mail.gmail.com>
In-Reply-To: <CADL8D3ZY72ydX24sV=hh39fVCMK34cYfEii6qNqP+bCGO3bC3Q@mail.gmail.com>
Accept-Language: fi-FI, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0186.eurprd05.prod.outlook.com
	(2603:10a6:3:f8::34) To AM0PR02MB3748.eurprd02.prod.outlook.com
	(2603:10a6:208:41::33)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=mikko.gronoff@qt.io; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [192.89.120.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dc58d57-5e0e-4b9c-d713-08d77c7764b7
x-ms-traffictypediagnostic: AM0PR02MB4372:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB4372B24D5039FE44880F970CE9580@AM0PR02MB4372.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(396003)(376002)(136003)(346002)(39840400004)(189003)(199004)(66946007)(66476007)(66446008)(2906002)(66556008)(64756008)(5660300002)(8936002)(81156014)(229853002)(86362001)(81166006)(26005)(8676002)(6486002)(102836004)(186003)(52116002)(76176011)(99286004)(71190400001)(71200400001)(36756003)(2616005)(6506007)(31686004)(6512007)(54896002)(110136005)(4744005)(478600001)(410100003)(31696002)(44832011)(316002)(966005)(54906003)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB4372;
	H:AM0PR02MB3748.eurprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dooHYg7VIaQOPkG4kMde4jQW58A2HM+W+qm+adrOY6HMCR49p3ADoty+CdNSuEIGJrWoRy930pq1g1rk7BunJ3nzLdgjibI2SxZpgKCCtEwjYvAVhMeYBfHRRmdbsHQIB6r6uMPAThWkclUpp2QIhWSjTPdg4jyaCXVUbI2mQXazwzgEBSUHFBo4lGJC68q8EgleS3zPsp5v4JCUR9IJfSMVeOaLVh+bU8fwJ8j8xzieeKEUk16Qq6R5wlWSiFtMqCtK+GmnfwZH2fPazyqAVkXQcYFLQ+V+8eON285QW4RtitBcwIY6h8DatS3BvcqLTZQvlgZdRWcYo+eDwWqz4YQ1b3iMwW+1KrSH9uKKXwEDpDSKDDi4iqdxR9MZyNUsuuF/A6FGqNodig2g3hF3LDVlT/jbSTm7XqfUGPj5iy6zkmeyxYStD8UIWXTa/rGLJd1R+rNiAn083IqVvewCtIlClRhG4KcxitO4dhUC42I=
MIME-Version: 1.0
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc58d57-5e0e-4b9c-d713-08d77c7764b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 07:14:13.0465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EBRt5eYY5o7iFWw5oD4XK1RQYoRii5EVwk4aAxt8+lAVDVxtFXBkt7km8cIMWd1DLnRys0Y2iOt5mZoVWdR4xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4372
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Mike Williamson <michael.williamson@criticallink.com>,
	Tim Iskander <iskander@criticallink.com>
Subject: Re: meta-Qt5 5.9 branch regression, qtquick license error
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
X-List-Received-Date: Mon, 09 Dec 2019 07:14:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCkFwb2xvZ2llcyBmb3IgbWVzc2luZyB1cCB0aGF0IHVwZGF0ZS4gUXRRdHVpY2sxIG1v
ZHVsZSB3YXMgbW9kaWZpZWQgYnkgbWlzdGFrZS4gSSBmaXhlZCB0aGUgcmVjaXBlIGJ5IHJldmVy
dGluZyB0aGUgU1JDUkVWIGJhY2sgdG8gY29ycmVjdCBvbmUuDQoNClJlZ2FyZHMsDQoNCk1pa2tv
DQoNCg0KT24gNi4xMi4yMDE5IDE4LjUwLCBKb24gQ29ybWllciB3cm90ZToNCmNvbW1pdCBodHRw
czovL2NvZGUucXQuaW8vY2dpdC95b2N0by9tZXRhLXF0NS5naXQvY29tbWl0Lz9oPTUuOSZpZD03
ODVjZTQxMWMyZTg5MjAyNzIzZmJlMWVjMzFhMDQ0M2EyMjZkMmFlDQoNClRoZSBhYm92ZSBjb21t
aXQgcmVzdWx0cyBpbiBzZXZlcmFsIHF0cXVpY2sxIGxpY2Vuc2UgZXJyb3JzLiAgRG9pbmcgYSBj
bGVhbiBidWlsZCBkaWRuJ3QgaGVscC4gIEJ1dCBzd2l0Y2hpbmcgYmFjayB0byB0YWcgdjUuOS44
IGZpeGVkIHRoZSBpc3N1ZS4gIFNlZSB0aGUgYXR0YWNoZWQgbG9nIGZvciBlcnJvciBtZXNzYWdl
cy4NCg0KWW9jdG8gYnVpbGQgYmFzZWQgb24gcG9reSByb2Nrby0xOC4wLjMgdGFnLg0KDQotLQ0K
Sm9uYXRoYW4gQ29ybWllcg0KU29mdHdhcmUgRW5naW5lZXINCg0KVm9pY2U6ICAzMTUuNDI1LjQw
NDUgeDIyMg0KDQpbaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2EvY3JpdGljYWxsaW5rLmNvbS91
Yz9pZD0xY05XcjBuRDhabWhvcHYtLTJxeVVTdnZkQTNMRFo0MG0mZXhwb3J0PWRvd25sb2FkXQ0K
DQpodHRwOi8vd3d3LkNyaXRpY2FsTGluay5jb208aHR0cDovL3d3dy5jcml0aWNhbGxpbmsuY29t
Lz4NCjY3MTIgQnJvb2tsYXduIFBhcmt3YXksIFN5cmFjdXNlLCBOWSAxMzIxMQ0KDQpbaHR0cHM6
Ly9kb2NzLmdvb2dsZS5jb20vdWM/ZXhwb3J0PWRvd25sb2FkJmlkPTBCMnZOU251LWFZdTZPRWhI
Ulc5QlVGVjVXbk0mcmV2aWQ9MEIydk5TbnUtYVl1NlJITlpVbmhOYkZwRVIxbDNlbU5RWTJWb2FI
QTBSRGR1ZFdsRlBRXTxodHRwczovL3d3dy5saW5rZWRpbi5jb20vY29tcGFueS9jcml0aWNhbC1s
aW5rLWxsYz4gIFtodHRwczovL2RvY3MuZ29vZ2xlLmNvbS91Yz9leHBvcnQ9ZG93bmxvYWQmaWQ9
MEIydk5TbnUtYVl1NmNVMXlXRVJyTFhFMFNuTSZyZXZpZD0wQjJ2TlNudS1hWXU2YjFZclpXMVNN
MGh1ZVZoVlMwcFBXbTFJT1hGU2MwSTNheTlqUFFdIDxodHRwczovL3R3aXR0ZXIuY29tL0NyaXRp
Y2FsX0xpbms+DQo=

