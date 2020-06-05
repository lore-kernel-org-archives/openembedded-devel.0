Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.60])
 by mx.groups.io with SMTP id smtpd.web10.1532.1591391784257055016
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 14:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=JOtRTPd/;
 spf=pass (domain: xevo.com, ip: 40.107.94.60, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvTgXTMZCRgXEqRriH3v+6kIyN+hFM/0IaA8AYxIZzLQp1TWkeoGH2fX1QrcQIrx/4A0okXzcPC+HF7LZMGmc+BtoXlM9qgO9rpvtzMSlyaI77wTvSWMUxKE0U6x+XFtjbYxgoSD/juYWVQ4lzfETxyEBnKYoZ423kv7w0tL1u21G4JuGiIDH1dqcvy6suSPgFg5kMykqPmTtn5jMDjqq/5ro8cdCU6Yi7kREDkdprbNOUKRsxhUeqUtZRMcqt1bWkRnO9011Pk5Y2UQ/G0gtQ8uRmCSJh1M5JZc6jxUkIT46hAcs3JgKNoqMM/sI7T8v4KJ0BD0U8gdDQRuSlRowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEAcP344iATWPif7w5qwolaUWObf5ZCU8WXQUhNv868=;
 b=W3D4SL+TJ+hhKT+yJTMWmVSFqLJYof3ZM/mcuJFfc3LMuSp3g4NjaWsMPH5fg+lMWfPUzpwgWVOEKUpkzvVYk0pw0kzLTzlA+5cvLPyxrta0xP1X3Mi9qkL1pjnLxo43WsWD9yhUH84/59jDS3n/OkRe5kfWj2+NnZDaA91+0WnGfNA4ER9NRha5icY8/C4KY3nTPKpNFz1VBbeK4AM3cw8GguimW1vrXMnQVzjV3ZtRsXtDf+N5lQ568dSoN+XETcxelypp0laWfWONNDlnH3Byb8EA8jVvvaXwF5N/hU3DaUS5oDmkF6uSFRFwsdXR2NFVWLuiDWdtp7yt9a5jQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEAcP344iATWPif7w5qwolaUWObf5ZCU8WXQUhNv868=;
 b=JOtRTPd/6BPddYxwJ0iWb2mbad4hIkEpIzXzLHAUlmJIYNiYUEluOnygamtBbINK9nRnAi/ZVDFGxxyJUuznLspYUvk8SVK4lHwD2kATf2LN+IAeQzI/Y034bbzJeOZp/Ym7C84CyNrpFyGob0BByHWdg/1Kw13cupBRDlJutfQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=xevo.com;
Received: from MWHPR18MB1183.namprd18.prod.outlook.com (2603:10b6:320:26::22)
 by MWHPR18MB1373.namprd18.prod.outlook.com (2603:10b6:300:d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 21:16:23 +0000
Received: from MWHPR18MB1183.namprd18.prod.outlook.com
 ([fe80::f183:20e6:b346:a1ca]) by MWHPR18MB1183.namprd18.prod.outlook.com
 ([fe80::f183:20e6:b346:a1ca%8]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 21:16:23 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-networking][PATCH 3/3] mosquitto: typo fix
Date: Fri,  5 Jun 2020 14:16:00 -0700
Message-ID: <20200605211600.575432-3-mkelly@xevo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605211600.575432-1-mkelly@xevo.com>
References: <20200605211600.575432-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR21CA0050.namprd21.prod.outlook.com
 (2603:10b6:300:db::12) To MWHPR18MB1183.namprd18.prod.outlook.com
 (2603:10b6:320:26::22)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.corp.xevo.com (50.35.86.191) by MWHPR21CA0050.namprd21.prod.outlook.com (2603:10b6:300:db::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.0 via Frontend Transport; Fri, 5 Jun 2020 21:16:22 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [50.35.86.191]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10a39a0b-be6d-4321-642b-08d80995b2ed
X-MS-TrafficTypeDiagnostic: MWHPR18MB1373:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR18MB1373BDF8A53D69BDFA5B073CAB860@MWHPR18MB1373.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hvJN6haZ+sV/MLT6XTxsxZosI1iK/kH9lsmJhrwkvqhO9/4LaIg4R9p1GAzIm8FbCWKLCkCBCYgFQXBEUNBHZzdtgWa6frmD6w6gQGdMcukRyzfeJJN0drnxnwYDElKD6AgORLEYcvyIJJ+AeeRXGANvp6jTAotTCVeiClWp/lR2XRBeztAHXhtgvIBq4GTJtIu4h+Ix47RwYMe9v7ev2twtrbCY+HZ4Qm5sMSgUkQ5QOtM6LAGQsnvvND/44x3TF2JtyVLwT8pOLrEi1WlqJLQ5uglDGpKtaZB73pbTpc2G2uDm8zpXYcdHp6UPR0PkV+7mvQsCca17CBzeKLPUAA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR18MB1183.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39840400004)(376002)(346002)(136003)(396003)(366004)(86362001)(6486002)(83380400001)(107886003)(52116002)(1076003)(6916009)(5660300002)(7696005)(36756003)(16526019)(2906002)(478600001)(26005)(4326008)(956004)(316002)(8676002)(6666004)(66476007)(66556008)(2616005)(66946007)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	RBLyNy7EnRcU9cPSVryjxeg34gQMA30gsLrDBu4znKEdV6QgZb3netZialpm51sJkdkr2OkoXmeVwNHQ8CCBihZvMaaYJ9kftemejPB7gem7rM9+ajT5uk/Tx5UHyQpQa9zXw7FDDM1tMFIPmaY2qPR1jZQxDFSaGs0JoXT4wiGQ8sub4So06IDuQtGnVuqrfX1U0W0Sx9rZu5n1eQ0urKmXrTiFV3BXeSAJ28W9s+xeLtN4Lk3eECQ3hNh0rixCmrLIdpP62NOQp7YFkx3gn9xqk4IECYlwG3gYPHugA81BMOog+kFX6fgFHnKYt3UvFHKhlZdvrf7wZuQuk4KbggrVUu/zid1rTExVSe699nh4vu54ypJMoPSPNWvdPxbeazAPvWt2dCQQRPF2TfafgYkMZYWzeROHrvOg4zcpXqd2DpzxEOVvQKVhJWGgVIecIuA/70AsTAy2cEflMqwvrkJHX4k/ut+drCVlNAu1ALg=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a39a0b-be6d-4321-642b-08d80995b2ed
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 21:16:23.2992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0qlYGzEnHVjCbkZdQTcn9JuHBw3M4fHB+Hhb4NdYY/BP8tsKG8MS3ORhd+jYgDb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR18MB1373
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The "ssl" PACKAGECONFIG setting contains WITH_EC_OFF instead of
WITH_EC=3DOFF, resulting in a build break when "ssl" is not set.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../recipes-connectivity/mosquitto/mosquitto_1.6.10.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.1=
0.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb
index 3961866da..9f6080336 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.10.bb
@@ -30,7 +30,7 @@ PACKAGECONFIG ??=3D "ssl dlt websockets \
                   "
=20
 PACKAGECONFIG[dns-srv] =3D "-DWITH_SRV=3DON,-DWITH_SRV=3DOFF,c-ares"
-PACKAGECONFIG[ssl] =3D "-DWITH_TLS=3DON -DWITH_TLS_PSK=3DON -DWITH_EC=3DON=
,-DWITH_TLS=3DOFF -DWITH_TLS_PSK=3DOFF -DWITH_EC_OFF,openssl"
+PACKAGECONFIG[ssl] =3D "-DWITH_TLS=3DON -DWITH_TLS_PSK=3DON -DWITH_EC=3DON=
,-DWITH_TLS=3DOFF -DWITH_TLS_PSK=3DOFF -DWITH_EC=3DOFF,openssl"
 PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3DOFF,syste=
md"
 PACKAGECONFIG[websockets] =3D "-DWITH_WEBSOCKETS=3DON,-DWITH_WEBSOCKETS=3D=
OFF,libwebsockets"
 PACKAGECONFIG[dlt] =3D "-DWITH_DLT=3DON,-DWITH_DLT=3DOFF,dlt-daemon"
--=20
2.26.2

