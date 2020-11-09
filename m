Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.84])
 by mx.groups.io with SMTP id smtpd.web08.10514.1604924020321864982
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 04:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.onmicrosoft.com header.s=selector2-skidata-onmicrosoft-com header.b=bT4wLFBn;
 spf=pass (domain: skidata.com, ip: 40.107.20.84, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyDflsVUKP6moOK11p7TN57dOZHeeiqG1F7eB2Qgd68kHCsYlCcKburl3mVPrOMGCMwcQ1vLMhrMDvhM2axwE7m5y+c1DwPqxXwBD7qbz7FVpEkWTbCwTqWzGE01er5d7v2e+OQkPFk1OyZN240kpm5kTfm3wY6oaul9n9tnYSqC9qR7RmVXY49F7GLrJMy+pF2+yP+HWWaOcJ1uQsYhvfRi612EXIJ4ZYoehgqV/wifwNAB/aVCRRTlo0/FNPAbFpeRevM3HEeUA42sYESz9aXA/KRaFlFHf+42w3ez0z3yaJTyxzvFNX9w2jPo8KQIRAJdd8qFb3XoivCmfCM/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVkbky28AYC5LvJLc79bu1RIK8uyRNY7gglY2pMbibQ=;
 b=Melm4dXtpIStgFi/qLD2L7YzcmjaxV6Z6lcGhXNMiUDo6bK3BU1cOYkCcav1PJ7iLgmpxIgjaZz6u/n7VenNS40BNSL2zGOdq2IuR66DN3TkTxOuRwdg9MpvkLi4YJUkU17KTfyulvJGcYWFzvRTDGvhrcgONarCmaFSTHjcrQfGDRVhmJdwv+JpeD7Rqut9hBZTWn76O1GgTDmz4RSPvkz8xesHL0Un3M4XZXX02vK6EEBk/PZu/GwxafnhdAbUJgawB2THitAkoQhObdIEUeui2R9KN6ERrfJCjbHISgK/m8zZgnjbnHbPEVQfygyvEIwwOJPtMuXvwdAOkvGmFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skidata.onmicrosoft.com; s=selector2-skidata-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVkbky28AYC5LvJLc79bu1RIK8uyRNY7gglY2pMbibQ=;
 b=bT4wLFBnm8+zvjMO68jXnfGUyqdoCDvhgvUbAbuOFmO+LTrOg9at0RLj4s6DrsOALwqBHzH8XrDt0GZ9AhKLfTIAa4VXc/oQb/IR1NsGPfCZekSwIbLyqH7YaHUKYTUL3wfZt/BXbkiew6lc3jO3pQ/6h1kczbZ3honY0+EpmcU=
Authentication-Results: wittra.se; dkim=none (message not signed)
 header.d=none;wittra.se; dmarc=none action=none header.from=skidata.com;
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19) by VI1PR01MB6688.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:186::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Mon, 9 Nov
 2020 12:13:37 +0000
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::59c1:ae16:40e0:7c6]) by VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::59c1:ae16:40e0:7c6%4]) with mapi id 15.20.3541.024; Mon, 9 Nov 2020
 12:13:37 +0000
Date: Mon, 9 Nov 2020 13:13:34 +0100
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Chencheng Zhang <chencheng@wittra.se>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] Checksum mismatch on jdk8u272-ga.tar.bz2
Message-ID: <20201109121334.GC1573@brokenbit>
References: <CAE5diG3RNzo20M-w1oG6kWoBdA12UHuEQ88y3rMAF35UsHhpJQ@mail.gmail.com>
In-Reply-To: <CAE5diG3RNzo20M-w1oG6kWoBdA12UHuEQ88y3rMAF35UsHhpJQ@mail.gmail.com>
X-Originating-IP: [83.215.125.121]
X-ClientProxiedBy: AM0PR06CA0131.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::36) To VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19)
Return-Path: richard.leitner@skidata.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brokenbit (83.215.125.121) by AM0PR06CA0131.eurprd06.prod.outlook.com (2603:10a6:208:ab::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 12:13:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4e19995-d007-43ce-1384-08d884a8e329
X-MS-TrafficTypeDiagnostic: VI1PR01MB6688:
X-Microsoft-Antispam-PRVS: 
	<VI1PR01MB6688239D8342E62FF07D7C53F0EA0@VI1PR01MB6688.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	otmpUFbSiP4NHEBIdwY3Zb2XaitN4AygovJ06izZrFG4xcqPZJxAk/OkEI9Lq5VOc2o4RULRIgNeWezmPJ4uYy49y1DWGR/ogSIb4omnSvjBFmnFpQW9JJZtGEjTHKYN8Rio1N4MIGWauAWC3hn5e3qMZSe6PakV06Y4oQ+HqT6SnpVOKhg9rwlVn5ZePnK5CSBbZfdXAhAbNfodtAPFsjCOZ4WnWCSg0yPd2vzUQkpDl26uaAJeP+rcxaflsJIPqLP+cm0I/hjujZZ2NzjJumgNhKOzQcGKRelBrOqw4tylI0GcpQhx0QDBaEIKXQoXbEi/P3UQeLRqqoSHKYdOod6KHoLER1D+6PjjSz2ykBPL2MDu6s/7WGn9H4faOXKpEy0cWKFwZy2QF7tiiWztDg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR01MB5007.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(376002)(136003)(346002)(366004)(186003)(956004)(26005)(16526019)(5660300002)(44832011)(86362001)(316002)(478600001)(4326008)(6916009)(66946007)(33656002)(9576002)(66476007)(66556008)(966005)(6666004)(6496006)(33716001)(55016002)(9686003)(83380400001)(2906002)(1076003)(8936002)(8676002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	VEtgCFOU4foEJO10joawArZMbgTAr+cl2QDZeVGqUprTy4HNzdU1Mgyd/G/o1ZHI/LacAE1kY4R+/jtl/jD7imkyzEFrGHfuwxEinAlKVmueyhufLDPmZsuFGDjCEDWZbY06XnnDOnUSXMHDYzfNZAwJK5GZ50YU6UgUNOEEs2EJ1CP16YCDDMXMnyIUl/BLc9nUBlmbWr2F3An/3CD7k54QL4Beh/h1PXwg0JRxnpFp/xVQGxNcQK8QMei9wA9b1RKoR27cDqzmxP+6YExkmqKw7WgiAlu62SCsz0K0w4EP6tj/MhdBxdXlNFQnVTPT+KYR6uppmwK1pUeHXuMmsW9Y0T4SaNmvvpWcE0ukrAF1dkl9zK7x/kT03PdMQB4YoYu44kD3EAZQG9KN+HbAPJrUhfRf3799PUvTPexKy/rrqFGIRdTiDQzNPK83fRkpaLIx6JJ5tUK3S5YeLLNAq7vFqdU3b69dOeRc0PhS56LFMqHVLCGRr7chwvtDJC7GS9pGhAwadyftR4ZkfgVGz78WHz+d7bl53T6D9DeC71clL/7ZogEExHoYdVUaCjVoWXlP1WsINpsx7ZN1K52Yk6j0HGKru3Fm6JQHitPoLM1LOSVO3lIByd2p7BF5HCWyf/QC6tOLmOXB/L6O3ivzsgSdBadEHsnQAHiV2Dl1hK7WOs++YTdT++7zdJwGtkSHoi7sCB+CPcDYyqMtY3uu/RSlLZVr+cYyIr4wOfGJ22gxujMcR7gOcquo4zY8O/kcMHxO+P4caaHN1fjRCJcPHOHPgwLwhUZqru8TCJrwJLec7exy72fIdyQfYkXAlJ5LLDl5qNMeG+1fGtTGACUjlqjB9g7oHaNLn2BxkjuV9f5e0S152si/KN6S0GK/6z9ovwdTAgxOxKYjB55cK8o9bw==
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e19995-d007-43ce-1384-08d884a8e329
X-MS-Exchange-CrossTenant-AuthSource: VI1PR01MB5007.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 12:13:37.5556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3d52ce8f-cef6-4b27-bace-cf9989cf3973
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9bpEiTWVHbsqvSaM5OIJSGk17nzzjuneTrX3p7h2kVzhOPme05NPlnMvy00KJLrMh/AiIdrEYdwDj7PRltumclwgecv8hRhzt4+tfbSWuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB6688
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chencheng,

On Mon, Nov 09, 2020 at 11:05:30AM +0100, Chencheng Zhang wrote:
> Hi Richard,
> 
> I got the following error when using latest dunfell branch of meta-jave:
> 
> ERROR: openjdk-8-native-272-r0 do_fetch: Fetcher failure for URL: '
> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u272-ga.tar.bz2;downloadfilename=openjdk8-272-jdk8u-jdk8u272-ga.tar.bz2;name=openjdk'.
> Checksum mismatch!
> 
> File: 'build/downloads/openjdk8-272-jdk8u-jdk8u272-ga.tar.bz2' has sha256
> checksum 3b335df278915237986ccdfc40e262d5b6a711072b2a0b99bf2b197dc9ff0cff
> when a80476dfe32c12882fe2d87bdb0dd37fc4a0dae8dd95f0c22c7c2445fc08ff7e was
> expected

It seems the checksums of the archive have changed:

   $ ls -l openjdk8-272-jdk8u-jdk8u272-ga.tar.bz2
   -rw-rw-r--. 1 build build 457222 Oct 22 20:59 openjdk8-272-jdk8u-jdk8u272-ga.tar.bz2

   $ sha256sum openjdk8-272-jdk8u-jdk8u272-ga.tar.bz2
   a80476dfe32c12882fe2d87bdb0dd37fc4a0dae8dd95f0c22c7c2445fc08ff7e  openjdk8-272-jdk8u-jdk8u272-ga.tar.bz2

   $ curl -s https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u272-ga.tar.bz2 | sha256sum
   3b335df278915237986ccdfc40e262d5b6a711072b2a0b99bf2b197dc9ff0cff  -

After further investigation it seems a "jdk8u275-b00" tag was added for
the same revision as our "jdk8u272-ga" is on:

   $ diff -Naur old/jdk8u-jdk8u272-ga/.hg_archival.txt new/jdk8u-jdk8u272-ga/.hg_archival.txt
   --- old/jdk8u-jdk8u272-ga/.hg_archival.txt	2020-09-28
   02:52:24.000000000 +0200
   +++ new/jdk8u-jdk8u272-ga/.hg_archival.txt	2020-09-28
   02:52:24.000000000 +0200
   @@ -3,3 +3,4 @@
    branch: default
    tag: jdk8u272-b10
    tag: jdk8u272-ga
   +tag: jdk8u275-b00

Therefore it should be fine to update the corresponding checksum. As
this affects also other jdk8u repos I'll push an update in a minute.

Thanks for the catch!

regards;rl

> 
> 
> Could you please be kind enough to take a look at this?
> Thanks!
> 
> BR/Chencheng
