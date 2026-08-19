Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7DCC5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:38:01 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.929.1787117875305041081
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hjifllhS;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=44655; q=dns/txt;
  s=iport01; t=1787117875; x=1788327475;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=mu5fPjMUbTlxd6f7ChOoIAEYVmnTHbXG7MsmBgNy1PQ=;
  b=hjifllhS6Oq5o3WyIjtJW6yWp/KjVlNS3eixy0vtvZLUq5vtdgmH+9v6
   KepiwEVGZwz1L2xvkMIC8sstnavu0EnvLbUDLfNTiMQ2IkVQ834xqWByj
   eJDN5puJIVmqXv7Fyxh2WYGlgAjd5JF9F1Y7lqYIKV0o0XI1+9SY9eSVS
   Fwm5jDaWeoLlhkHF3IFSwZzb1kSdkovmLdQNrxYflWtfYmDarI4JIC6MR
   qVIfEcJLuzEjW+77TXQX6XH3mYA5mKQ7HoQWG7vHdyFqytwAnLeUUJ704
   g7CidisEca51alC7AyC16ou50BdbAUL+sz9Gsan2ajtj+o6gn0Nax21YW
   w==;
X-CSE-ConnectionGUID: 5IROx/hxR1KRKY3RQmKrcQ==
X-CSE-MsgGUID: KRtQlMKDSIWqdS5ifQLh8g==
X-IPAS-Result: =?us-ascii?q?A0BwAgCVP4Vq/40QJK1agS6BK4E9MVMWcgKBIUmEV4NMA?=
 =?us-ascii?q?4Urgm6GCwOBE4gAlQiBeAYPAQEBDgEuARUNBAEBhD9GAo1rAiY0CQ4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPAQyGWgEBAQEDAQMWBgQDJ?=
 =?us-ascii?q?AEtEAIBBgIRAwEBASEBCgMnAggdCAIEDgUIgnuCHRZBAwECDqgEkQQCihxuD?=
 =?us-ascii?q?X4zgQGDKAE/AkPcAAELFAGBOIU/gwMbAQEqSWyCXYEjGAGEfCcbG4FygRVCe?=
 =?us-ascii?q?YE4OD6BBYFcAoE3ASoFGR6DHjmCMASCInoSG4E/gQcmgVSOZFJyIgMmMywBV?=
 =?us-ascii?q?RMXCwcFgSNDAyovLSNLBS0dgSMhHRcXHlgbBgUSICpBRCMDPjiBCEECgXU/I?=
 =?us-ascii?q?xk2eoEJXoErKmEBAhAXRi4VggoCgnOBKF4CAUlFEQoLC209NxQZAwSBNQWNX?=
 =?us-ascii?q?QdbIIJHgQ4BKgFPLIEZGByTI49Po3cKKIN2jCGNPogyF4QEjRSZVAuYfSONZ?=
 =?us-ascii?q?5VgIIUOAgQCBAUCEAEBBoFoPIFZcBWDIglKGQ+OKhmDYMwZeQIJMgEBBwIHD?=
 =?us-ascii?q?gMLgWiQAAEngVYBAQ?=
IronPort-PHdr: A9a23:hPuAABWqmBT0Gh0D1jMbMRHt+8jV8K3PAWYlg6HPw5pHdqClupP6M
 1OauLNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:I0WS+a28BcRP72g8hfbD5Yhwkn2cJEfYwER7XKvMYLTBsI5bpzwHm
 msbXG6HaKuOMzP2L91yO43k9ktXucXSy9FjHAA/3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4EjxYtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24tYzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGUWAMGp1f+vZNWEJ01
 s1DEgkITQqIvrfjqF67YrEEasULJc3vOsYb/3pn1zycVapgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME2ojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZgOKyYYOPJI3ULSlTtmWiu
 lvC2kfVOTAlLdCklDuLy1as1uCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7FQGMFVTVGLtchsafaWAAX6
 7NApPuwbRRHu7yOQnXb/bCRxQ5e8wBPRYPeTUfolTc43uQ=
IronPort-HdrOrdr: A9a23:68adqaAfvKgDTeTlHeissseALOsnbusQ8zAXPh9KOH9om52j9/
 xGws576fatskduZJhBo7y90KnpewK7yXcH2/hhAV7CZniohILGFvAZ0WKP+UyFJ8S6zJ8j6U
 4CSdkxNDSTNykGsS+S2mDReLhQoqjjzEnrv5aj854Hd3ASV0gU1XYDNu/tKDwPeOApP+tfKL
 OsouB8i36Lf3MRYs6nBn8DcdTiirTw/q7OUFotPTJizBOBow+JxdfBfiSw71MzQjlPybAt/S
 z/lRDl5qKsive/yhXN/W7e5ZZblbLau5p+7cq35fQ9G3HJsEKFdY5hU7qNsHQeu+e08msnl9
 HKvlMJI9lzw2m5RBD3nTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxri7VY6tt0U6t
 MI44vZjesTMfrzplW72zH6bWAtqqNymwt6rQcntQ0abWLZUs4IkWVQxjIPLH5KJlOL1GluKp
 gcMCib3ocXTXqqK1bEo2Jo3NugGl43HhuAXww+n/b96UkNoJi8pHFomPD2WRw7hc8Ao5Uo3Z
 W3Do140L5JVcMYdqR7GaMIRta2EHXERVbWPHuVOkmPLtBMB5vhke++3FwO3pDgRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOthTAWn+0UzjhwtxXo8ERgMyxeJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR/vuN3HnF4pF1xD3H5NSNX4dWssIvctTYSPCnuvbbonx8uDLevfaI7TgVT4iR2PkG3
 MGGCP+Ic1Rh3rbE0MQQCKhLU8FVnaPiq6YSpKqitT74LJ9QrFxjg==
X-Talos-CUID: 9a23:1jqNi2/87dWQWIBvv1+VvxM1IOc1NX3N9i7zGWyJUlxQTZ6PQmbFrQ==
X-Talos-MUID: 9a23:p0bzPwabAfYi7+BTlAXwvTVHF+tTwpu3BHtQkJs/n8nUOnkl
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 05:37:54 +0000
Received: from alln-opgw-5.cisco.com (alln-opgw-5.cisco.com [173.37.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 00A8418000193
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:54 +0000 (GMT)
X-CSE-ConnectionGUID: utrbYd2aTFecSMNyE7J+xA==
X-CSE-MsgGUID: /m70dc6dQ4ir8PRXsk7xBA==
Authentication-Results: alln-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208,217";a="63300503"
Received: from mail-centralusazon11011069.outbound.protection.outlook.com (HELO DM5PR21CU001.outbound.protection.outlook.com) ([52.101.62.69])
  by alln-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 05:37:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGlLXVD0/YtBpmYXnoRJV5ERyH6djfUdSpXcDkn7Kga60eQDKDXvO6uDGAit97+lUeYbsS/6dLoPdImzsl74jDWWJPgtDe/P0LxsaKVZ5g4KbBHCE4EPg7vzFm5ZNcDDrlR71/zQDQ60JKvjklRIcyCvR0+TkSrm3fA0KUgANqfJnuIK7UR0Ivvp+SdMiRg5Mj9wIWvn7PWJAEQGB4r596uPlSZPWH8FKi3eLakE8hoC9heBLCqrHPAKqLn9B7fo+1g+0QgHaj3HmUhybo3ApRaUPpeR2FK3pIWVTUuAIZ1XNy+eg4PmstOeewyKi4pgUnn3zY+HUKF6qacPus9Hsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mu5fPjMUbTlxd6f7ChOoIAEYVmnTHbXG7MsmBgNy1PQ=;
 b=c7D3Vd9ziUwnUjhZwBSgRy/SxIEmNEaivHwRJ1rnHwIrgqnzYZvLdanyfA3P5CE3thl31AWk83cJpUC0HmM1+3KQFDqy4mQ+TLnbwD67FYBXvR8t5VC+TCQVRInCcpSrhaPxd+eAwGbdewlj7wnYe00gzmDi7tBSD5SJzcXvWZaUf5vdAs1PTDs2+StMRiNUDstr+Og5d0dj/WdwLVmnLnOa216D4LdK4MqoO8f1vIwWuFU6KO+o0mnZBN7Klyd6O+fXGYTc+2jcXEzT4JsIgwuLQ3AWYMEo7oTG02FM1OM7Pbpn0gwbfTYI/+69tmYKCQCrJBIy8Tjx8v/ybdSTEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DS0PR11MB7262.namprd11.prod.outlook.com (2603:10b6:8:13c::5) by
 SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.8; Wed, 19 Aug 2026 05:37:50 +0000
Received: from DS0PR11MB7262.namprd11.prod.outlook.com
 ([fe80::fd6:93:e5e2:7f18]) by DS0PR11MB7262.namprd11.prod.outlook.com
 ([fe80::fd6:93:e5e2:7f18%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 05:37:50 +0000
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<dkelaiya@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [oe][meta-python][wrynose][PATCH 07/10] python3-aiohttp: fix
 CVE-2026-54277
Thread-Topic: [oe][meta-python][wrynose][PATCH 07/10] python3-aiohttp: fix
 CVE-2026-54277
Thread-Index: AQHdLz2U3Kg4Zox8KkioSz/ZXa4oMbak2EQy
Date: Wed, 19 Aug 2026 05:37:50 +0000
Message-ID: 
 <DS0PR11MB72628C0FBE37B5EBB656FEAAD6A52@DS0PR11MB7262.namprd11.prod.outlook.com>
References: <20260818181528.3405276-1-dkelaiya@cisco.com>
 <20260818181528.3405276-8-dkelaiya@cisco.com>
In-Reply-To: <20260818181528.3405276-8-dkelaiya@cisco.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7262:EE_|SJ0PR11MB5920:EE_
x-ms-office365-filtering-correlation-id: 93185643-3605-4f0a-ad02-08defdb4022a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|13003099007|38070700021|6133799003|4143699003|56012099006|10067099003|11063799006|8096899003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 Y0koPpojrDUsYn69BO3thqSE/2g+MQobIegnAiRT6TSM4456Gc2Fd0/C9yDkSvS/qExs9T4sp89pFzFNyp72TpnkBmeBGlGwM7UpPpgZZf6lwxz048ZXzQEVCSoTuR3JtlH+aukYwszMX7F3UhjWs3EgX1favK9pWsrU1nx4N3EveuXXSfEASIwhngqRCS/Slykg6idoXcGth8nBV57EmKNZIe/sQwg2LgHO1BiLBrY6I8VmWOw4kStnA2h7QQ9M5ljnwRSFffYQToXIF+869AVDicm7iz8xRoNbRnhJpWYcBSrFc8kwULk6dd86e1UqYme41pftyl4sm+eEuAR/ZnzpS8/F4cEURT/aPf5y3SQNKnFXQlrbXDz3HVuQljFnondGdXtR9YWNqH5IxMYwkvz4qYhIEDfTrrxJHWN8Sn+5c0xD40qhc/QqsTkVsFmNHtYPlD0UiOSQUwdRKHLKn4DjbzMwjeNE9S59h1yoF42XMoQbd2ovfgRJyrZW4/bkYw2E0O2lnWTY3+QHmJ2bRzJ6KVh9vFBn9N3kXE8CF62OC4Zt3/x2Z3Vy/9QlpNTQil4Tnqz8In0jbAbYaU3bMG3N/fZ2gx4f96962PWDfTwxNUmO+aPm850LYTXdZ79KMgAf3JSFBYfsCgikPOZOaUFGk3wHbtw9/f+3mnjB4/62WZFtMvd0FfCHrvMPNJ2l
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7262.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(13003099007)(38070700021)(6133799003)(4143699003)(56012099006)(10067099003)(11063799006)(8096899003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1251?Q?wUT5T3SU4yUvgyDwB2TZsUujdjouE6xtY5iyK5kBXld+onpb6Vld/ZNr?=
 =?windows-1251?Q?jkKZAYlJCCFrwi6rvzAMhbuOaTRILl/XMRF+fr+4pR5Hsia3YTiqZZyf?=
 =?windows-1251?Q?JJsXbxxJXSuRkXlPmVKzbEs+3zPRrKs2GLKwoONJsFdTLYIfjdtvp/KZ?=
 =?windows-1251?Q?ieD+Z7wEoxozbRRn9JURC2yRImDbJlr9fvVYetd+Hu4GnZDVfHu2poi9?=
 =?windows-1251?Q?8lHaror+7vp4rm7bTf61wrMNabyebCZQhO3oVjCoAa57tk4JgvKopvGS?=
 =?windows-1251?Q?9gaYhyejwhpdLIzMylqvKclEgCqFQFX1Mh2Lir8F/k8rFOJkFtZ1RfXq?=
 =?windows-1251?Q?/YbU6BFSL0iXkaIx2VXZgXWUqkC4xsIE9noQWwW9FHOV+Tz8nswknv1P?=
 =?windows-1251?Q?TRuKfp7EDvbiDYt3eTbydgJodUAmJ+n554OYzeS2JrWtN8/PWXjpNe25?=
 =?windows-1251?Q?uwNL5GS17HTHZDoQdI6Mhumhsc0vnnCVtS5WBUIggUtEBNwunqsBPRDN?=
 =?windows-1251?Q?fEp1VUrS3tqa4giTLi5fdif1/tezkoDulnr2H0ketg6en35gzJeKwnGH?=
 =?windows-1251?Q?aTsvrDvk7KogGVwp2om2b2Vuz7S+x7Ko2ksD1n5BZ87pmCLoJE7Yb2tw?=
 =?windows-1251?Q?NG3756aR+Q7J6Gbjxi6rBtCrU0lbSwF0j5pCx5L2apeq2TMtso7Tpwol?=
 =?windows-1251?Q?bzKX7YKkxGPTvDxCT95guoigRuqKo3GuzfcDNNhholbDnlD+GnJbRzZA?=
 =?windows-1251?Q?UQF+1xvoq7HnBVpbQBnzVAdjejPM3VggBo6sljBAx9Hy3R+BQbsLw6nt?=
 =?windows-1251?Q?0V+IKccxz/5hz23yatdF7aHtaRzm0IxKxN/ckC1lESziWhVssgHV7p/H?=
 =?windows-1251?Q?1HT/V2tYtSluV9OkIQImlaRpv+V49r9MlLDAFNmneNhTUl4Ex4LEKA4p?=
 =?windows-1251?Q?S3dV/gduYTN/RYA9KpTh1wjalWzMq4YzfxGODarQcmnmn+R6nI8PQ4OB?=
 =?windows-1251?Q?UjXFg/s+B671jE2/zXx2vrtuyte1pnodEZee7GJjU3Pe1b5sZVOTQKRR?=
 =?windows-1251?Q?NQMUBIGapEWgke7MGvC8KjpiN2RhhyyRel1kWRwvHag9Ly9cKQGlaov/?=
 =?windows-1251?Q?Zum9Ey1UuwemNir0WZIbVmCMCGxoGs2sBCQVNEI2HqxzqG5jZjrrNW3k?=
 =?windows-1251?Q?o1zQopgg0kGkU63Vpdua2aB2CFcdPfClV4KrwzOUkCbkrrCk5qk8ipio?=
 =?windows-1251?Q?VaysR6AoyVmy22r99lPf/QNuepK+x7gXbERdphFBpKty62h/1qm86h2g?=
 =?windows-1251?Q?R623W+9sLsm/lvyzPMW0qv4kV56u3T3gzEz9lFLTHh0G+P8EDAGM8I4G?=
 =?windows-1251?Q?sRlfE2gY7y6xdxCoBL7/p/dBLu3+zh6nGBGAJ33V0QoRVA4ZKscSvKGF?=
 =?windows-1251?Q?7SwdAeFrz5SET0QrQUw/f1/1j9SMPvgNEwUARzTtV86j7OEdCkb4DvMn?=
 =?windows-1251?Q?EsiQxx/GCLnISujPlrGcBuyuOdFEas8gwrbvjOCdEOGYygV3chDvu4Vk?=
 =?windows-1251?Q?GyoWOf4DlkVCDg2zSVmJSiMVXYVpyMW2KAhM6Pl7yXdN8bjHuiAnMzuj?=
 =?windows-1251?Q?rI/8rc2oMP5fi32G+N8YteRDJoqGrlf69+LQkohBai665MXS3PrK+ZoL?=
 =?windows-1251?Q?lvachodQXxeTZBajqojmjbO1Mw0U3npsj27k4tX05xft1NfXAlUPcA2j?=
 =?windows-1251?Q?Zq86h7SlWnlXHTW9MlVj38pGOxyi/l/3dKCNc7AWp9swIVjHdXq2W8Re?=
 =?windows-1251?Q?uXMt7hw9q/u9YgtjkoL+Q8ZGgnX0Wa/lygXx/Yp8rEL28Yv1?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB72628C0FBE37B5EBB656FEAAD6A52DS0PR11MB7262namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	ZxlReCI37dxKGWasqNHdDxMJvX/CgkUPS+d9BBikBIvn9GOTmAPWEt60Vb18EP1BmBUKMOzTKrmf718HbWflBvw8Xn/L7nXvnu/Oqvhw62zuSMtaBmsNN5dnq+dyKqdBDPA5WFPxhoZFncSODKG7WpxMyMCf2b8rGYwdDqgmeH869H2YFtPj0/lp9ytKUzJCLcb9rMKk61XOENTgkU4ztJCwyt3mmZrdXFc394PMwDcjLpDuj6r45YD6HBFlq0hTdOgZaimswK/IJURJRmdWytVkGloHOYM8Tn6YP/fP3E6yaCbKd8gBiyO8e7rNE1sf1HMitniLNH/X05W21kL5pw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7262.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93185643-3605-4f0a-ad02-08defdb4022a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 05:37:50.4901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rO6tWR3y3dU1x+0HIOLaocn/Fsx1VjxAijt/WKKETSYZOfiwC2119c6IQztv81ZqwxsLT57xO85tva80TGqfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5920
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-5.cisco.com [173.37.147.253];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.253, alln-opgw-5.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129270

--_000_DS0PR11MB72628C0FBE37B5EBB656FEAAD6A52DS0PR11MB7262namp_
Content-Type: text/plain; charset="windows-1251"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Please disregard the =93Changes in v2=94 section below, it was included ina=
dvertently. The patch itself remains unchanged and should still be reviewed=
 as submitted. Apologies for the confusion.

Regards,
Darsh Kelaiya
________________________________
From: Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco) <d=
kelaiya@cisco.com>
Sent: Tuesday, August 18, 2026 23:45
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>; Darsh=
 Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco) <dkelaiya@cis=
co.com>
Subject: [oe][meta-python][wrynose][PATCH 07/10] python3-aiohttp: fix CVE-2=
026-54277

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1].

[1] https://github.com/aio-libs/aiohttp/commit/5ab61bb4cd88f19b712f12c7c929=
5fe262bf804d
[2] https://github.com/advisories/GHSA-63hw-fmq6-xxg2

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
Changes in v2
- Added the corresponding generated aiohttp/_http_parser.c changes.
- Updated cb_on_url() and cb_on_status() in the generated C parser to
  enforce max_line_size against the accumulated parser buffer.
- Ensured the security fix is included when Wrynose builds the
  generated C parser without regenerating it from the patched .pyx.
- Documented the Wrynose-specific backport changes in the patch
  metadata.
---
 .../python3-aiohttp/CVE-2026-54277.patch      | 249 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 250 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE=
-2026-54277.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-5=
4277.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-5=
4277.patch
new file mode 100644
index 0000000000..db50155d33
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.pa=
tch
@@ -0,0 +1,249 @@
+From f61e8949f10a0e77ceba28a6639627e6e57bf167 Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Sun, 7 Jun 2026 00:33:03 -0500
+Subject: [PATCH] [PR #12826/36df6c13 backport][3.14] Enforce max_line_size=
 on
+ fragmented request target and reason in C parser (#12837)
+
+CVE: CVE-2026-54277
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/5ab6=
1bb4cd88f19b712f12c7c9295fe262bf804d]
+
+Backport Changes:
+- Added aiohttp/_http_parser.c because Wrynose builds the
+  pre-generated C parser without running Cython.
+- Updated cb_on_url() and cb_on_status() to enforce max_line_size
+  against the accumulated parser buffer.
+
+(cherry picked from commit 5ab61bb4cd88f19b712f12c7c9295fe262bf804d)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12826.bugfix.rst  |  1 +
+ aiohttp/_http_parser.c    | 36 ++++++++++++++++++------------------
+ aiohttp/_http_parser.pyx  |  4 ++--
+ tests/test_http_parser.py | 22 ++++++++++++++++++++++
+ 4 files changed, 43 insertions(+), 20 deletions(-)
+ create mode 100644 CHANGES/12826.bugfix.rst
+
+diff --git a/CHANGES/12826.bugfix.rst b/CHANGES/12826.bugfix.rst
+new file mode 100644
+index 000000000..7e095615d
+--- /dev/null
++++ b/CHANGES/12826.bugfix.rst
+@@ -0,0 +1 @@
++Fixed the C HTTP parser not enforcing ``max_line_size`` on a request targ=
et or response reason phrase that is split across multiple reads; each frag=
ment was checked on its own, so an accumulated line could exceed the limit =
without raising ``LineTooLong``. The accumulated length is now checked, mat=
ching the pure-Python parser -- by :user:`bdraco`.
+diff --git a/aiohttp/_http_parser.c b/aiohttp/_http_parser.c
+index 911c9aa65..14c5b3350 100644
+--- a/aiohttp/_http_parser.c
++++ b/aiohttp/_http_parser.c
+@@ -14760,7 +14760,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_u=
rl(llhttp_t *__pyx_v_parser, c
+  *                    const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser =3D <HttpParser>parser.data             #=
 <<<<<<<<<<<<<<
+  *     try:
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+ */
+   __pyx_t_1 =3D ((PyObject *)__pyx_v_parser->data);
+   __Pyx_INCREF(__pyx_t_1);
+@@ -14771,7 +14771,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_u=
rl(llhttp_t *__pyx_v_parser, c
+  *                    const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser =3D <HttpParser>parser.data
+  *     try:             # <<<<<<<<<<<<<<
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             status =3D pyparser._buf + at[:length]
+ */
+   {
+@@ -14786,16 +14786,16 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on=
_url(llhttp_t *__pyx_v_parser, c
+       /* "aiohttp/_http_parser.pyx":721
+  *     cdef HttpParser pyparser =3D <HttpParser>parser.data
+  *     try:
+- *         if length > pyparser._max_line_size:             # <<<<<<<<<<<=
<<<
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:     =
        # <<<<<<<<<<<<<<
+  *             status =3D pyparser._buf + at[:length]
+  *             raise LineTooLong(status[:100] + b"...", pyparser._max_lin=
e_size)
+ */
+-      __pyx_t_5 =3D (__pyx_v_length > __pyx_v_pyparser->_max_line_size);
++      __pyx_t_5 =3D ((__Pyx_PyByteArray_GET_SIZE(__pyx_v_pyparser->_buf) =
+ __pyx_v_length) > __pyx_v_pyparser->_max_line_size);
+       if (unlikely(__pyx_t_5)) {
+
+         /* "aiohttp/_http_parser.pyx":722
+  *     try:
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             status =3D pyparser._buf + at[:length]             # <<<<<=
<<<<<<<<<
+  *             raise LineTooLong(status[:100] + b"...", pyparser._max_lin=
e_size)
+  *         extend(pyparser._buf, at, length)
+@@ -14809,7 +14809,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_u=
rl(llhttp_t *__pyx_v_parser, c
+         __pyx_t_6 =3D 0;
+
+         /* "aiohttp/_http_parser.pyx":723
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             status =3D pyparser._buf + at[:length]
+  *             raise LineTooLong(status[:100] + b"...", pyparser._max_lin=
e_size)             # <<<<<<<<<<<<<<
+  *         extend(pyparser._buf, at, length)
+@@ -14854,7 +14854,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_u=
rl(llhttp_t *__pyx_v_parser, c
+         /* "aiohttp/_http_parser.pyx":721
+  *     cdef HttpParser pyparser =3D <HttpParser>parser.data
+  *     try:
+- *         if length > pyparser._max_line_size:             # <<<<<<<<<<<=
<<<
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:     =
        # <<<<<<<<<<<<<<
+  *             status =3D pyparser._buf + at[:length]
+  *             raise LineTooLong(status[:100] + b"...", pyparser._max_lin=
e_size)
+ */
+@@ -14878,7 +14878,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_u=
rl(llhttp_t *__pyx_v_parser, c
+  *                    const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser =3D <HttpParser>parser.data
+  *     try:             # <<<<<<<<<<<<<<
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             status =3D pyparser._buf + at[:length]
+ */
+     }
+@@ -14968,7 +14968,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_u=
rl(llhttp_t *__pyx_v_parser, c
+  *                    const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser =3D <HttpParser>parser.data
+  *     try:             # <<<<<<<<<<<<<<
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             status =3D pyparser._buf + at[:length]
+ */
+     __pyx_L5_except_error:;
+@@ -15045,7 +15045,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_s=
tatus(llhttp_t *__pyx_v_parser
+  *                       const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser =3D <HttpParser>parser.data             #=
 <<<<<<<<<<<<<<
+  *     try:
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+ */
+   __pyx_t_1 =3D ((PyObject *)__pyx_v_parser->data);
+   __Pyx_INCREF(__pyx_t_1);
+@@ -15056,7 +15056,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_s=
tatus(llhttp_t *__pyx_v_parser
+  *                       const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser =3D <HttpParser>parser.data
+  *     try:             # <<<<<<<<<<<<<<
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             reason =3D pyparser._buf + at[:length]
+ */
+   {
+@@ -15071,16 +15071,16 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on=
_status(llhttp_t *__pyx_v_parser
+       /* "aiohttp/_http_parser.pyx":736
+  *     cdef HttpParser pyparser =3D <HttpParser>parser.data
+  *     try:
+- *         if length > pyparser._max_line_size:             # <<<<<<<<<<<=
<<<
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:     =
        # <<<<<<<<<<<<<<
+  *             reason =3D pyparser._buf + at[:length]
+  *             raise LineTooLong(reason[:100] + b"...", pyparser._max_lin=
e_size)
+ */
+-      __pyx_t_5 =3D (__pyx_v_length > __pyx_v_pyparser->_max_line_size);
++      __pyx_t_5 =3D ((__Pyx_PyByteArray_GET_SIZE(__pyx_v_pyparser->_buf) =
+ __pyx_v_length) > __pyx_v_pyparser->_max_line_size);
+       if (unlikely(__pyx_t_5)) {
+
+         /* "aiohttp/_http_parser.pyx":737
+  *     try:
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             reason =3D pyparser._buf + at[:length]             # <<<<<=
<<<<<<<<<
+  *             raise LineTooLong(reason[:100] + b"...", pyparser._max_lin=
e_size)
+  *         extend(pyparser._buf, at, length)
+@@ -15094,7 +15094,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_s=
tatus(llhttp_t *__pyx_v_parser
+         __pyx_t_6 =3D 0;
+
+         /* "aiohttp/_http_parser.pyx":738
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             reason =3D pyparser._buf + at[:length]
+  *             raise LineTooLong(reason[:100] + b"...", pyparser._max_lin=
e_size)             # <<<<<<<<<<<<<<
+  *         extend(pyparser._buf, at, length)
+@@ -15139,7 +15139,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_s=
tatus(llhttp_t *__pyx_v_parser
+         /* "aiohttp/_http_parser.pyx":736
+  *     cdef HttpParser pyparser =3D <HttpParser>parser.data
+  *     try:
+- *         if length > pyparser._max_line_size:             # <<<<<<<<<<<=
<<<
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:     =
        # <<<<<<<<<<<<<<
+  *             reason =3D pyparser._buf + at[:length]
+  *             raise LineTooLong(reason[:100] + b"...", pyparser._max_lin=
e_size)
+ */
+@@ -15163,7 +15163,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_s=
tatus(llhttp_t *__pyx_v_parser
+  *                       const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser =3D <HttpParser>parser.data
+  *     try:             # <<<<<<<<<<<<<<
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             reason =3D pyparser._buf + at[:length]
+ */
+     }
+@@ -15253,7 +15253,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_s=
tatus(llhttp_t *__pyx_v_parser
+  *                       const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser =3D <HttpParser>parser.data
+  *     try:             # <<<<<<<<<<<<<<
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             reason =3D pyparser._buf + at[:length]
+ */
+     __pyx_L5_except_error:;
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index 5da835bc6..e1edee310 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -718,7 +718,7 @@ cdef int cb_on_url(cparser.llhttp_t* parser,
+                    const char *at, size_t length) except -1:
+     cdef HttpParser pyparser =3D <HttpParser>parser.data
+     try:
+-        if length > pyparser._max_line_size:
++        if len(pyparser._buf) + length > pyparser._max_line_size:
+             status =3D pyparser._buf + at[:length]
+             raise LineTooLong(status[:100] + b"...", pyparser._max_line_s=
ize)
+         extend(pyparser._buf, at, length)
+@@ -733,7 +733,7 @@ cdef int cb_on_status(cparser.llhttp_t* parser,
+                       const char *at, size_t length) except -1:
+     cdef HttpParser pyparser =3D <HttpParser>parser.data
+     try:
+-        if length > pyparser._max_line_size:
++        if len(pyparser._buf) + length > pyparser._max_line_size:
+             reason =3D pyparser._buf + at[:length]
+             raise LineTooLong(reason[:100] + b"...", pyparser._max_line_s=
ize)
+         extend(pyparser._buf, at, length)
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index 25604dbcc..8cb591f20 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -1272,6 +1272,17 @@ def test_http_request_max_status_line_under_limit(p=
arser: HttpRequestParser) ->
+     assert msg.url =3D=3D URL("/path" + path.decode())
+
+
++def test_http_request_max_status_line_fragmented(
++    parser: HttpRequestParser,
++) -> None:
++    # Split an overlong request target across reads so that each callback
++    # fragment is under the limit but the accumulated target is not.
++    match =3D "400, message:\n  Got more than 8190 bytes when reading"
++    with pytest.raises(http_exceptions.LineTooLong, match=3Dmatch):
++        parser.feed_data(b"GET /" + b"a" * 8000)
++        parser.feed_data(b"a" * 8000 + b" HTTP/1.1\r\nHost: a\r\n\r\n")
++
++
+ def test_http_response_parser_utf8(response) -> None:
+     text =3D "HTTP/1.1 200 Ok\r\nx-test:=F2=E5=F1=F2\r\n\r\n".encode()
+
+@@ -1349,6 +1360,17 @@ def test_http_response_parser_status_line_under_lim=
it(
+     assert msg.reason =3D=3D reason.decode()
+
+
++def test_http_response_parser_status_line_too_long_fragmented(
++    response: HttpResponseParser,
++) -> None:
++    # Split an overlong reason phrase across reads so that each callback
++    # fragment is under the limit but the accumulated reason is not.
++    match =3D "400, message:\n  Got more than 8190 bytes when reading"
++    with pytest.raises(http_exceptions.LineTooLong, match=3Dmatch):
++        response.feed_data(b"HTTP/1.1 200 " + b"a" * 8000)
++        response.feed_data(b"a" * 8000 + b"\r\n\r\n")
++
++
+ def test_http_response_parser_bad_version(response) -> None:
+     with pytest.raises(http_exceptions.BadHttpMessage):
+         response.feed_data(b"HT/11 200 Ok\r\n\r\n")
+--
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb =
b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 3c07933200..1a6baebfe9 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -13,6 +13,7 @@ SRC_URI +=3D " \
     file://CVE-2026-54274.patch \
     file://CVE-2026-54275.patch \
     file://CVE-2026-54276.patch \
+    file://CVE-2026-54277.patch \
 "

 CVE_PRODUCT =3D "aiohttp"
--
2.35.6


--_000_DS0PR11MB72628C0FBE37B5EBB656FEAAD6A52DS0PR11MB7262namp_
Content-Type: text/html; charset="windows-1251"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
251">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hello everyone,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Please disregard the =93Changes in v2=94 section below, it was included ina=
dvertently. The patch itself remains unchanged and should still be reviewed=
 as submitted. Apologies for the confusion.</div>
<div><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Darsh Kelaiya</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Ci=
sco) &lt;dkelaiya@cisco.com&gt;<br>
<b>Sent:</b> Tuesday, August 18, 2026 23:45<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;; Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco) =
&lt;dkelaiya@cisco.com&gt;<br>
<b>Subject:</b> [oe][meta-python][wrynose][PATCH 07/10] python3-aiohttp: fi=
x CVE-2026-54277
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">From: Darsh Kelaiya &lt;dkelaiya@cisco.com&=
gt;<br>
<br>
This patch applies the upstream fix as referenced in [2], using<br>
the commit shown in [1].<br>
<br>
[1] <a href=3D"https://github.com/aio-libs/aiohttp/commit/5ab61bb4cd88f19b7=
12f12c7c9295fe262bf804d" id=3D"OWAd013e5ac-4b75-a15c-615c-a471aebf9a4f" cla=
ss=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/aio-libs/aiohttp/commit/5ab61bb4cd88f19b712f12c7c9295fe2=
62bf804d</a><br>
[2] <a href=3D"https://github.com/advisories/GHSA-63hw-fmq6-xxg2" id=3D"OWA=
248210b8-ab25-50d3-6abc-decf1a7bb99d" class=3D"OWAAutoLink" data-auth=3D"No=
tApplicable">
https://github.com/advisories/GHSA-63hw-fmq6-xxg2</a><br>
<br>
Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
---<br>
Changes in v2<br>
- Added the corresponding generated aiohttp/_http_parser.c changes.<br>
- Updated cb_on_url() and cb_on_status() in the generated C parser to<br>
&nbsp; enforce max_line_size against the accumulated parser buffer.<br>
- Ensured the security fix is included when Wrynose builds the<br>
&nbsp; generated C parser without regenerating it from the patched .pyx.<br=
>
- Documented the Wrynose-specific backport changes in the patch<br>
&nbsp; metadata.<br>
---<br>
&nbsp;.../python3-aiohttp/CVE-2026-54277.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 249 ++++++++++++++++++<br>
&nbsp;.../python/python3-aiohttp_3.13.5.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&nbsp;2 files changed, 250 insertions(+)<br>
&nbsp;create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54277.patch<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-5=
4277.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-5=
4277.patch<br>
new file mode 100644<br>
index 0000000000..db50155d33<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.pa=
tch<br>
@@ -0,0 +1,249 @@<br>
+From f61e8949f10a0e77ceba28a6639627e6e57bf167 Mon Sep 17 00:00:00 2001<br>
+From: &quot;J. Nick Koston&quot; &lt;nick@koston.org&gt;<br>
+Date: Sun, 7 Jun 2026 00:33:03 -0500<br>
+Subject: [PATCH] [PR #12826/36df6c13 backport][3.14] Enforce max_line_size=
 on<br>
+ fragmented request target and reason in C parser (#12837)<br>
+<br>
+CVE: CVE-2026-54277<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/aio-libs/aiohttp/=
commit/5ab61bb4cd88f19b712f12c7c9295fe262bf804d" id=3D"OWAfb245ddf-6724-2a9=
e-fc9a-4e7ef3a3fcf8" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">http=
s://github.com/aio-libs/aiohttp/commit/5ab61bb4cd88f19b712f12c7c9295fe262bf=
804d</a>]<br>
+<br>
+Backport Changes:<br>
+- Added aiohttp/_http_parser.c because Wrynose builds the<br>
+&nbsp; pre-generated C parser without running Cython.<br>
+- Updated cb_on_url() and cb_on_status() to enforce max_line_size<br>
+&nbsp; against the accumulated parser buffer.<br>
+<br>
+(cherry picked from commit 5ab61bb4cd88f19b712f12c7c9295fe262bf804d)<br>
+Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
+---<br>
+ CHANGES/12826.bugfix.rst&nbsp; |&nbsp; 1 +<br>
+ aiohttp/_http_parser.c&nbsp;&nbsp;&nbsp; | 36 ++++++++++++++++++---------=
---------<br>
+ aiohttp/_http_parser.pyx&nbsp; |&nbsp; 4 ++--<br>
+ tests/test_http_parser.py | 22 ++++++++++++++++++++++<br>
+ 4 files changed, 43 insertions(+), 20 deletions(-)<br>
+ create mode 100644 CHANGES/12826.bugfix.rst<br>
+<br>
+diff --git a/CHANGES/12826.bugfix.rst b/CHANGES/12826.bugfix.rst<br>
+new file mode 100644<br>
+index 000000000..7e095615d<br>
+--- /dev/null<br>
++++ b/CHANGES/12826.bugfix.rst<br>
+@@ -0,0 +1 @@<br>
++Fixed the C HTTP parser not enforcing ``max_line_size`` on a request targ=
et or response reason phrase that is split across multiple reads; each frag=
ment was checked on its own, so an accumulated line could exceed the limit =
without raising ``LineTooLong``.
 The accumulated length is now checked, matching the pure-Python parser -- =
by :user:`bdraco`.<br>
+diff --git a/aiohttp/_http_parser.c b/aiohttp/_http_parser.c<br>
+index 911c9aa65..14c5b3350 100644<br>
+--- a/aiohttp/_http_parser.c<br>
++++ b/aiohttp/_http_parser.c<br>
+@@ -14760,7 +14760,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_u=
rl(llhttp_t *__pyx_v_parser, c<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *at, size_t len=
gth) except -1:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; cdef HttpParser pyparser =3D &lt;HttpPars=
er&gt;parser.data&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;<b=
r>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:<br>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:<br>
+ */<br>
+&nbsp;&nbsp; __pyx_t_1 =3D ((PyObject *)__pyx_v_parser-&gt;data);<br>
+&nbsp;&nbsp; __Pyx_INCREF(__pyx_t_1);<br>
+@@ -14771,7 +14771,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_u=
rl(llhttp_t *__pyx_v_parser, c<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *at, size_t len=
gth) except -1:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; cdef HttpParser pyparser =3D &lt;HttpPars=
er&gt;parser.data<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; try:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:<br>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; status =3D pyparser._buf + at[:length]<br>
+ */<br>
+&nbsp;&nbsp; {<br>
+@@ -14786,16 +14786,16 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on=
_url(llhttp_t *__pyx_v_parser, c<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* &quot;aiohttp/_http_parser.pyx&quo=
t;:721<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; cdef HttpParser pyparser =3D &lt;HttpPars=
er&gt;parser.data<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;<b=
r>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; status =3D pyparser._buf + at[:length]<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; raise LineTooLong(status[:100] + b&quot;...&quot;, pyparser._max_lin=
e_size)<br>
+ */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __pyx_t_5 =3D (__pyx_v_length &gt; __pyx_v=
_pyparser-&gt;_max_line_size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __pyx_t_5 =3D ((__Pyx_PyByteArray_GET_SIZE=
(__pyx_v_pyparser-&gt;_buf) + __pyx_v_length) &gt; __pyx_v_pyparser-&gt;_ma=
x_line_size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(__pyx_t_5)) {<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* &quot;aiohttp/_http_pa=
rser.pyx&quot;:722<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:<br>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; status =3D pyparser._buf + at[:length]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&l=
t;&lt;&lt;&lt;&lt;&lt;&lt;<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; raise LineTooLong(status[:100] + b&quot;...&quot;, pyparser._max_lin=
e_size)<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extend(pyparser._=
buf, at, length)<br>
+@@ -14809,7 +14809,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_u=
rl(llhttp_t *__pyx_v_parser, c<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __pyx_t_6 =3D 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* &quot;aiohttp/_http_pa=
rser.pyx&quot;:723<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:<br>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; status =3D pyparser._buf + at[:length]<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; raise LineTooLong(status[:100] + b&quot;...&quot;, pyparser._max_lin=
e_size)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extend(pyparser._=
buf, at, length)<br>
+@@ -14854,7 +14854,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_u=
rl(llhttp_t *__pyx_v_parser, c<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* &quot;aiohttp/_http_pa=
rser.pyx&quot;:721<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; cdef HttpParser pyparser =3D &lt;HttpPars=
er&gt;parser.data<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;<b=
r>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; status =3D pyparser._buf + at[:length]<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; raise LineTooLong(status[:100] + b&quot;...&quot;, pyparser._max_lin=
e_size)<br>
+ */<br>
+@@ -14878,7 +14878,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_u=
rl(llhttp_t *__pyx_v_parser, c<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *at, size_t len=
gth) except -1:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; cdef HttpParser pyparser =3D &lt;HttpPars=
er&gt;parser.data<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; try:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:<br>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; status =3D pyparser._buf + at[:length]<br>
+ */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+@@ -14968,7 +14968,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_u=
rl(llhttp_t *__pyx_v_parser, c<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *at, size_t len=
gth) except -1:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; cdef HttpParser pyparser =3D &lt;HttpPars=
er&gt;parser.data<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; try:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:<br>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; status =3D pyparser._buf + at[:length]<br>
+ */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; __pyx_L5_except_error:;<br>
+@@ -15045,7 +15045,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_s=
tatus(llhttp_t *__pyx_v_parser<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const ch=
ar *at, size_t length) except -1:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; cdef HttpParser pyparser =3D &lt;HttpPars=
er&gt;parser.data&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;<b=
r>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:<br>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:<br>
+ */<br>
+&nbsp;&nbsp; __pyx_t_1 =3D ((PyObject *)__pyx_v_parser-&gt;data);<br>
+&nbsp;&nbsp; __Pyx_INCREF(__pyx_t_1);<br>
+@@ -15056,7 +15056,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_s=
tatus(llhttp_t *__pyx_v_parser<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const ch=
ar *at, size_t length) except -1:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; cdef HttpParser pyparser =3D &lt;HttpPars=
er&gt;parser.data<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; try:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:<br>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; reason =3D pyparser._buf + at[:length]<br>
+ */<br>
+&nbsp;&nbsp; {<br>
+@@ -15071,16 +15071,16 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on=
_status(llhttp_t *__pyx_v_parser<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* &quot;aiohttp/_http_parser.pyx&quo=
t;:736<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; cdef HttpParser pyparser =3D &lt;HttpPars=
er&gt;parser.data<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;<b=
r>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; reason =3D pyparser._buf + at[:length]<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; raise LineTooLong(reason[:100] + b&quot;...&quot;, pyparser._max_lin=
e_size)<br>
+ */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __pyx_t_5 =3D (__pyx_v_length &gt; __pyx_v=
_pyparser-&gt;_max_line_size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __pyx_t_5 =3D ((__Pyx_PyByteArray_GET_SIZE=
(__pyx_v_pyparser-&gt;_buf) + __pyx_v_length) &gt; __pyx_v_pyparser-&gt;_ma=
x_line_size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(__pyx_t_5)) {<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* &quot;aiohttp/_http_pa=
rser.pyx&quot;:737<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:<br>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; reason =3D pyparser._buf + at[:length]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&l=
t;&lt;&lt;&lt;&lt;&lt;&lt;<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; raise LineTooLong(reason[:100] + b&quot;...&quot;, pyparser._max_lin=
e_size)<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extend(pyparser._=
buf, at, length)<br>
+@@ -15094,7 +15094,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_s=
tatus(llhttp_t *__pyx_v_parser<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __pyx_t_6 =3D 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* &quot;aiohttp/_http_pa=
rser.pyx&quot;:738<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:<br>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; reason =3D pyparser._buf + at[:length]<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; raise LineTooLong(reason[:100] + b&quot;...&quot;, pyparser._max_lin=
e_size)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extend(pyparser._=
buf, at, length)<br>
+@@ -15139,7 +15139,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_s=
tatus(llhttp_t *__pyx_v_parser<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* &quot;aiohttp/_http_pa=
rser.pyx&quot;:736<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; cdef HttpParser pyparser =3D &lt;HttpPars=
er&gt;parser.data<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;<b=
r>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; reason =3D pyparser._buf + at[:length]<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; raise LineTooLong(reason[:100] + b&quot;...&quot;, pyparser._max_lin=
e_size)<br>
+ */<br>
+@@ -15163,7 +15163,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_s=
tatus(llhttp_t *__pyx_v_parser<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const ch=
ar *at, size_t length) except -1:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; cdef HttpParser pyparser =3D &lt;HttpPars=
er&gt;parser.data<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; try:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:<br>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; reason =3D pyparser._buf + at[:length]<br>
+ */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+@@ -15253,7 +15253,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_s=
tatus(llhttp_t *__pyx_v_parser<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const ch=
ar *at, size_t length) except -1:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; cdef HttpParser pyparser =3D &lt;HttpPars=
er&gt;parser.data<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp; try:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;<br>
+- *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparse=
r._max_line_size:<br>
++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) =
+ length &gt; pyparser._max_line_size:<br>
+&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; reason =3D pyparser._buf + at[:length]<br>
+ */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; __pyx_L5_except_error:;<br>
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx<br>
+index 5da835bc6..e1edee310 100644<br>
+--- a/aiohttp/_http_parser.pyx<br>
++++ b/aiohttp/_http_parser.pyx<br>
+@@ -718,7 +718,7 @@ cdef int cb_on_url(cparser.llhttp_t* parser,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *at, size_t length) exc=
ept -1:<br>
+&nbsp;&nbsp;&nbsp;&nbsp; cdef HttpParser pyparser =3D &lt;HttpParser&gt;pa=
rser.data<br>
+&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparser._max_l=
ine_size:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) + length=
 &gt; pyparser._max_line_size:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
tatus =3D pyparser._buf + at[:length]<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
aise LineTooLong(status[:100] + b&quot;...&quot;, pyparser._max_line_size)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extend(pyparser._buf, at,=
 length)<br>
+@@ -733,7 +733,7 @@ cdef int cb_on_status(cparser.llhttp_t* parser,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *at, =
size_t length) except -1:<br>
+&nbsp;&nbsp;&nbsp;&nbsp; cdef HttpParser pyparser =3D &lt;HttpParser&gt;pa=
rser.data<br>
+&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if length &gt; pyparser._max_l=
ine_size:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if len(pyparser._buf) + length=
 &gt; pyparser._max_line_size:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eason =3D pyparser._buf + at[:length]<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
aise LineTooLong(reason[:100] + b&quot;...&quot;, pyparser._max_line_size)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extend(pyparser._buf, at,=
 length)<br>
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py<br>
+index 25604dbcc..8cb591f20 100644<br>
+--- a/tests/test_http_parser.py<br>
++++ b/tests/test_http_parser.py<br>
+@@ -1272,6 +1272,17 @@ def test_http_request_max_status_line_under_limit(p=
arser: HttpRequestParser) -&gt;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; assert msg.url =3D=3D URL(&quot;/path&quot; + pat=
h.decode())<br>
+<br>
+<br>
++def test_http_request_max_status_line_fragmented(<br>
++&nbsp;&nbsp;&nbsp; parser: HttpRequestParser,<br>
++) -&gt; None:<br>
++&nbsp;&nbsp;&nbsp; # Split an overlong request target across reads so tha=
t each callback<br>
++&nbsp;&nbsp;&nbsp; # fragment is under the limit but the accumulated targ=
et is not.<br>
++&nbsp;&nbsp;&nbsp; match =3D &quot;400, message:\n&nbsp; Got more than 81=
90 bytes when reading&quot;<br>
++&nbsp;&nbsp;&nbsp; with pytest.raises(http_exceptions.LineTooLong, match=
=3Dmatch):<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; parser.feed_data(b&quot;GET /&=
quot; + b&quot;a&quot; * 8000)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; parser.feed_data(b&quot;a&quot=
; * 8000 + b&quot; HTTP/1.1\r\nHost: a\r\n\r\n&quot;)<br>
++<br>
++<br>
+ def test_http_response_parser_utf8(response) -&gt; None:<br>
+&nbsp;&nbsp;&nbsp;&nbsp; text =3D &quot;HTTP/1.1 200 Ok\r\nx-test:=F2=E5=
=F1=F2\r\n\r\n&quot;.encode()<br>
+<br>
+@@ -1349,6 +1360,17 @@ def test_http_response_parser_status_line_under_lim=
it(<br>
+&nbsp;&nbsp;&nbsp;&nbsp; assert msg.reason =3D=3D reason.decode()<br>
+<br>
+<br>
++def test_http_response_parser_status_line_too_long_fragmented(<br>
++&nbsp;&nbsp;&nbsp; response: HttpResponseParser,<br>
++) -&gt; None:<br>
++&nbsp;&nbsp;&nbsp; # Split an overlong reason phrase across reads so that=
 each callback<br>
++&nbsp;&nbsp;&nbsp; # fragment is under the limit but the accumulated reas=
on is not.<br>
++&nbsp;&nbsp;&nbsp; match =3D &quot;400, message:\n&nbsp; Got more than 81=
90 bytes when reading&quot;<br>
++&nbsp;&nbsp;&nbsp; with pytest.raises(http_exceptions.LineTooLong, match=
=3Dmatch):<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response.feed_data(b&quot;HTTP=
/1.1 200 &quot; + b&quot;a&quot; * 8000)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response.feed_data(b&quot;a&qu=
ot; * 8000 + b&quot;\r\n\r\n&quot;)<br>
++<br>
++<br>
+ def test_http_response_parser_bad_version(response) -&gt; None:<br>
+&nbsp;&nbsp;&nbsp;&nbsp; with pytest.raises(http_exceptions.BadHttpMessage=
):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response.feed_data(b&quot=
;HT/11 200 Ok\r\n\r\n&quot;)<br>
+--<br>
+2.35.6<br>
+<br>
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb =
b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb<br>
index 3c07933200..1a6baebfe9 100644<br>
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb<br>
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb<br>
@@ -13,6 +13,7 @@ SRC_URI +=3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-54274.patch" id=3D"OWAe=
039a234-f834-05f1-c2f2-692017eb1d66" class=3D"OWAAutoLink" data-auth=3D"Not=
Applicable">
file://CVE-2026-54274.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-54275.patch" id=3D"OWA9=
6c7f1ee-cf87-a74f-d3ef-4125625db548" class=3D"OWAAutoLink" data-auth=3D"Not=
Applicable">
file://CVE-2026-54275.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-54276.patch" id=3D"OWAd=
7a91208-8bdc-fb66-f667-55695f318664" class=3D"OWAAutoLink" data-auth=3D"Not=
Applicable">
file://CVE-2026-54276.patch</a> \<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-54277.patch" id=3D"OWA34d08d=
3a-1bd5-c0b1-6574-f0e15135ee33" class=3D"OWAAutoLink" data-auth=3D"NotAppli=
cable">
file://CVE-2026-54277.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;CVE_PRODUCT =3D &quot;aiohttp&quot;<br>
--<br>
2.35.6<br>
<br>
</div>
</body>
</html>

--_000_DS0PR11MB72628C0FBE37B5EBB656FEAAD6A52DS0PR11MB7262namp_--

