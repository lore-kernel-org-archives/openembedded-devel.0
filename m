Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12325.1794411232020849960
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 07:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=zCSvbAxX;
 spf=pass (domain: topic.nl, ip: 40.107.159.90, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pek6d05lsnFGQ5fRKBWJJfjfFgGlTawHgpEJVQL3yXtXK5UhW6GP7ZnJ9s3EwgVte6moA+O/utMCAp9pAXoJMavdpp4R2IiC/HfFUakXB8apmOEiEpulDZCbSKvpI192x9CeNLSxIseIsd6JT3cXqL2Zk2C41yirCG34CG63noSd8h9qOlo/1Tx/lO+Pec1Z0RaocUssUyhfLjjJiMdEDqIVGUSJlmw1NG9wsBPm0IaXNUayObuYQfkM877Yy4Yr6dG41g2RhvwSyE3FXDNEP1BD3jpNKa31rHwbDtUEtzwHLUk1KzhSgXHs27SxP4zXIHRYmTW48TJRt01eHrC6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTKrb2oKtyafkj/S+8BO6GxCUMCJkMoeEW3aebsT4dY=;
 b=ybYDDgr8CNf/vXgCVyAXzVl/aayifWT+sO1OIoKVROGG8wzslVRifepLuO2CkBqy51xhmB20Wr0FqLCoNRi8m+wCe7fp59213F+cRGcMSJSODE9mFKOd8+scAx95a183JVr6GXXA9NO008/Uq2GxaY8gADoBNux034s6O56H462E3IjQbZSlnn7yADlE3Z1qfC0iKjbFEnYbXCH0zehla5zR9iLe7ZlJV4xi8eRujzSoOSY9Je5m4Mns5erw2WqdkcT+AZx169g02M7I+z1d+YH1yIzFzAS8Km5hRSn+er9PeYj3Kl7i08P5IOdoGxKHmHM1joxINwHH+wTvE1JcuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=topic.nl; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTKrb2oKtyafkj/S+8BO6GxCUMCJkMoeEW3aebsT4dY=;
 b=zCSvbAxXwhW/yv7XL7tQP8M7p79Z1h7/l2s61UnGl097K3rD5Lh0IBaT63fgMRV3sHGOcpy3oU5+XpAKLm8cVYX+Mg1i8p3dYXONqBUcBclNm5hGj6SA2VThCp0nD1tQnX1LwHN8vEeVVYBuQd03Fa5aWA12NJClF3bevZLZXdTEGoZmYV6mPZxm2damyipYZNUAglfG6Ad/KktqT6rDvp1SxP88yccgkajsHgvNhIIR6h4j9zd15VGSh4mx9z/BD2Ri4RgT/3+k7ZhYO2Mn8uDbD/vBPStc49AqSkwJ1m+ceUcCq6wk9J7yG/7iyIucGRgWgsqolyCQLiOYw6MvNw==
Received: from DU2PR04CA0276.eurprd04.prod.outlook.com (2603:10a6:10:28c::11)
 by CPHPR04MB194838.eurprd04.prod.outlook.com (2603:10a6:380:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 15:33:46 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::2e) by DU2PR04CA0276.outlook.office365.com
 (2603:10a6:10:28c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Wed,
 11 Nov 2026 15:33:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 15:33:46 +0000
Received: from DUZPR08CU001.outbound.protection.outlook.com (40.93.64.66) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 11 Nov 2026 15:33:45 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by PA4PR04MB7918.eurprd04.prod.outlook.com
 (2603:10a6:102:c7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:33:42 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%3]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 15:33:42 +0000
Content-Type: multipart/alternative;
	boundary="------------gZWmnSxiCxjEAwRQnaa0WGb0"
Message-ID: <4e85e314-552f-4963-a5c2-0dc79a0b8496@topic.nl>
Date: Wed, 11 Nov 2026 16:33:40 +0100
User-Agent: Mozilla Thunderbird
From: <mike.looijmans@topic.nl>
Subject: Re: [oe] [PATCH 0/4] Apply the mongodb patches from the scarthgap
 branch, which is ahead
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-devel@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.60c45970-bf59-4753-942e-e3561e9c5a75@emailsignatures365.codetwo.com>
 <20261109081800.69803-1-mike.looijmans@topic.nl>
 <CAMKF1soWj4FYR=Kq-mMRXjMnUzMkztdO9Epss9D61RWPE5nS0g@mail.gmail.com>
 <eedf7b3e-36c7-49b0-bea2-2abbe74026a7@topic.nl>
 <CAMKF1spaQc--uVEevw2S4vrKJd5wSMSSOYxzv5aOEsb+SqLqKQ@mail.gmail.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <CAMKF1spaQc--uVEevw2S4vrKJd5wSMSSOYxzv5aOEsb+SqLqKQ@mail.gmail.com>
X-ClientProxiedBy: AS4PR10CA0008.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::10) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
Return-Path: mike.looijmans@topic.nl
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR04MB12030:EE_|PA4PR04MB7918:EE_|DU2PEPF00028D08:EE_|CPHPR04MB194838:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f323101-6c5d-4784-2493-08df40092cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|4143699003|56012099006|261022105027099003|261026140227099003|261028144727099003|261022075727099003|261009223027099003|10067099003|22082099003|18002099003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info-Original: cUD1UCaEf9Q9u1qsB8V9sInkw83TEsoN4AIfqxSBnsXQ3rkZTbKp7TGyY6JniVEbGUkdg9gOjIGtcQwIwcWNbY4ZC8b9+gB8vTRyUeNJrUvbUITGxE5yqJU2bJ5VqxgmKjgHeVnIubKhBOnGaygFu2Ex+BBjOexbAY+xrf4iGpZ9aalupFcjJi9LkP+M8yPz2XlWLoJj87IKf4/nsrBdwFyn06Rgy5kfhUUfhFX2O1Rm08YkTGyk4zY28GlQttk4QwG5Zb1qdVeh2uOAVYTmyG9ToXB46vBOUuHdJV5+9vK0b7/qVFHNgJBY/Nzsvh+WdbENK0ux/SQkZ0atM4IMLizC57kUVl8Y2wLaTHhGCKsQdnjXlnkJpAFxjjRC/H0GdxyiSyLAdrsJEHeTTDrt3D4/kbtui7E0H6sScMPDm8vc86V67Ayn6mZ19/vBGqzmVBk2XHHeRFAmMbS2UQ9CaiXZMbXwTaXWC1M0FjWS4EgPYa14q5YplOkO688f9ZU7fI6P5sdQbIzSWjNrBhQ4Ilq3kAY7P5EeUB3HSkL55Xz1ZQKP0EDTWSqgVRXzxJ+ucc8Q0i/z0qeGhp/x9E97TmdvJ/GqNH1R8I7XH92XiEfSr+DIfGRjahBevlkdzAcqSGCrr0bTmK0cHaM72cSSSYw4OSqJnsdzVK0TAAgpdZY=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(4143699003)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(261022075727099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(13003099007)(8096899003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: UgH2d91X6mJC0YJ4IyeUpwHg9oY7mJX0Yqwx2/REGKNlR/ce1CIpqBIg/u/vfC28rF6jME4Uv+7ojmZu3MiH7ENiY8oiJUN5IQk6E1SBWzUZmeubyCg5LG5Ec6hwfce0ySZ+t9x6h4rkz8RluayNR8XmwvG3DQjnGNr5fWIv4KVOScBR+fsAvh5yRLhHXfjeZF7Ii0/3vtNzhL/bfC8zJwUpsBwgQ3AUQQ1NzVEri0sb6o6T371obdlXXwmgL77pMXWGxFygrsb3CmWU9S/1AgatLnpHlY7orkVATJZXEnRhQMatQnUJ+be/C2MQAzKLJx8JzKo744HfVRSmAiSHvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7918
X-CodeTwo-MessageID: 44e0a4f8-977a-456a-a91a-30f44f99036a.20261111153345@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0959398b-a0ac-457e-e3d9-08df40092a73
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|35042699022|14060799003|23010399003|82310400026|1800799024|376014|261028144727099003|261026140227099003|261022105027099003|261022075727099003|4143699003|56012099006|10067099003|22082099003|18002099003|261009223027099003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: qFkOIy3bez4L8u0RmZHEYVp8YX+y1g4kZPW4xQivZmNEnmGUFC6UlLrbRAjaJw+q5e+RIzszrvVO2gPmXT5ACDeUnV7Mk6hQWkqO71dlXUoi0PVZ55MUvfboBizfW8mQplV+GML0M2yDg/WRpcVoveMQQUIJAU3KpKHbfqW7T2ynaMrxS2GxU4cb+umI7VbHaq1cQ7LOdTbmZvtnYhe/FhVqAAZxGaiDUpKzSLpq3Wb9qxHSQ0AVgyUBUCa3LdlHNx1i36RuXrBfd/zds3KPHw4HEzZmD3YsLPhACCVA43eixEdsWXmWdOtyxyngT44rqNObXAdOmp9c0KcOILYx5E6aqeXd5a7tUeAhR/+GHNnBkjkvdNosQmPbloTGKpfRhEHjX1q0KHPJ+WvMjjsuy8zwwcV0jLfcNHUFcRpki+lPQrtzIrdK8J9WRgv4O1cteo4NQK4w3dSwm0lgRcay53CNQApFvetY0zBwXJxS2xnU5u3CZ7QLZvyy/T2uAJxL+eEUo4jBAOUdO0cpnG9hZIxT0REApzn2jzkDH1NSJJ/IZi//ci8AD6jhaR9i2uDGP1ww7CFlhizMsYBpylBDpdxXmSAxHO/4zEomszsPqbPX7oTDfX/IZRE4WdF+YJg7IX0AkRSrr4+NW8FOiGI0Gw==
X-Forefront-Antispam-Report: CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(14060799003)(23010399003)(82310400026)(1800799024)(376014)(261028144727099003)(261026140227099003)(261022105027099003)(261022075727099003)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003)(13003099007)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DlM+/YrtAHGO4k3CatW/Iwe1dQckpmR7zUR5/vwfdJdytuJBBGlR625UWDQTSyNkXwDINL38QCpEtLqLj9lajTMZXUIUglSCLqDSyKUny6FlsQj029Us3lXXMUloAvDJnD/+pSk6VZlnk6o55cLeEDNaecC1/bsaAFIqcjgMTne7cydED7xjeEdnUsouGXlUMfheo2pu3GHSxdy6uxOTXqam5Ji4+t3AIFXUbvPDpA/n2psWk613pkITCxRL4E9DLl69+mPqLPjGOsRCeKq2pqaRYEO3KwEANV5E1jPp6dhqCKIdj36TXT23WVG6OL7tnXzJ4MqcwBbCB+459caAW969bFy0KpavlzTXojnYXgEnSUYuneQ7AdKbcNhqxYpP9RC7GQ3jpXVlAUpZlHBz4EoBIHWirxewiB13TEiscKjmW18xbz4eW7eUPHhU/v3J
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:33:46.0534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f323101-6c5d-4784-2493-08df40092cd7
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPHPR04MB194838
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 15:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132131

--------------gZWmnSxiCxjEAwRQnaa0WGb0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10-11-2026 08:47, Khem Raj wrote:

On Mon, Nov 9, 2026 at 10:02=E2=80=AFPM Mike Looijmans via openembedded-dev=
el <mike.looijmans=3Dtopic.nl@lists.openembedded.org<mailto:topic.nl@lists.=
openembedded.org>> wrote:
I know, I also wrote in the description (second line) that it wouldn't
build.

But at least this brings it up to the "scarthgap" level. It's weird to
have to start several commits behind the previous LTS.

I have a workaround for  the pkg_resources error, but that's still not
enough...

I have sent a patch which addresses bunch of these issues.I wonder if we sh=
ould
upgrade mongo to latest release as well.

Thanks for that!

Applied them from master-next to wrynose, appears to fix all the build issu=
es. It'd be good to copy them into the wrynose branch, so that at least mon=
godb compiles again (like in scarthgap).

--
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl<mailto:mike.looijmans@topic.nl>
W: www.topic.nl<http://www.topic.nl>



--------------gZWmnSxiCxjEAwRQnaa0WGb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 10-11-2026 08:47, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spaQc--uVEevw2S4vrKJd5wSMSS=
OYxzv5aOEsb+SqLqKQ@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 9, 2026 at
            10:02=E2=80=AFPM Mike Looijmans via openembedded-devel
            &lt;mike.looijmans=3D<a href=3D"mailto:topic.nl@lists.openembed=
ded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">topic.nl@=
lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I
            know, I also wrote in the description (second line) that it
            wouldn't <br>
            build.<br>
            <br>
            But at least this brings it up to the &quot;scarthgap&quot; lev=
el.
            It's weird to <br>
            have to start several commits behind the previous LTS.<br>
            <br>
            I have a workaround for&nbsp; the pkg_resources error, but that=
's
            still not <br>
            enough...<br>
          </blockquote>
          <div><br>
          </div>
          <div>I have sent a patch which addresses&nbsp;bunch of these
            issues.I wonder if we should</div>
          <div>upgrade mongo to latest release as well.</div>
        </div>
      </div>
    </blockquote>
    <p>Thanks for that!</p>
    <p>Applied them from master-next to wrynose, appears to fix all the
      build issues. It'd be good to copy them into the wrynose branch,
      so that at least mongodb compiles again (like in scarthgap).</p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:mike.looijmans@topi=
c.nl">mike.looijmans@topic.nl</a>
W: <a class=3D"moz-txt-link-abbreviated" href=3D"http://www.topic.nl">www.t=
opic.nl</a>

</pre>
  </body>
</html>

--------------gZWmnSxiCxjEAwRQnaa0WGb0--
