Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.70])
 by mx.groups.io with SMTP id smtpd.web11.5015.1612508503594202208
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 23:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NQt7QMUB;
 spf=pass (domain: windriver.com, ip: 40.107.243.70, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJMQfcccI25AePAHc1EV+FocyJfYmpLW8Rc/unObMtZMSJ9pa6GomUHxpqlqGfT+755cULCTuz+f916Z8+vdXixkYIbOJJKLmfmCZUeCYSlOf3KvIn2cZmfKbfuF/7FxBNegWXTChDpYiwJso5ZhX3vHvf7qmbBnMYvpjcIZwP5rBPdJkYqvjd9VmmUdSLfD9wQcC88RRN5J6GHkPfmFWMSXzYprXiLfoKsVUmN2TdQnb5RYiEor4SjpH6ZEx0/JDjTtepveErfu28s+KSeHML2/OPDX5tI4cV6z6/vMzkO75zhvrUvKqGWDWSQ3m5ihnUUmw4sp4NO+JHxbLdjeZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRoCk0AC00BYSPFw9zWBaOs/BrZSIAXH/ddF5kLxn+4=;
 b=NysutB45qBzELfYt4EiKqgBa69bqhFYVjjptgrqx1gLtXo69gL1iBgWg8IjgqDqm4Zs4JrpsJ8Wu/ncX6w7/q3FUmSCjQlVQEGsLAc5BlRYbjeyAIjQPLwrFs7fELt3iA3cX2yYXiqTnwnXEiHpsD7QmT5Il9jHz7+ynE4wjOQs5kJKr/OShOnnSstruUxIiAoz24I60HorNRpUgULa40f6wF4i29crNRvtc222j1L3w+fkXpcHTr/diGAzazO6KsOL4c9JoCZVYoDJzIAKF9uz1MXi+WqFUHnci3H2EWsw02UKZfmiByudcKBosc+d8KhLSL2+XUAjMZ13memWiWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRoCk0AC00BYSPFw9zWBaOs/BrZSIAXH/ddF5kLxn+4=;
 b=NQt7QMUBSkKc/QihRJyXQnmMUoirA9AZ0Re7AaI/woZu0pmVPwHbc2LRKHLlAoWe2HhS7hm4KyKGobmTLvpTP8KQJbWvp4K4clGY6J3FyvYat1tWGpYubDN7X3Kpvu9phJdcMcIo66S1NjuF8g/QajX4V7nci4FyAJyaFAoCjPA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Fri, 5 Feb
 2021 07:01:42 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3825.017; Fri, 5 Feb 2021
 07:01:42 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] netsnmp: remove --with-openssl=PATH configure option
Date: Fri,  5 Feb 2021 15:01:22 +0800
Message-ID: <20210205070122.13262-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YTXPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::39) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YTXPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 07:01:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 419d72d0-36bc-45a6-8d3d-08d8c9a3e3df
X-MS-TrafficTypeDiagnostic: CO1PR11MB4849:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB484904478DBFDDB5ECFF7C78F1B29@CO1PR11MB4849.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZfvGGBpvQQtclAqRg9+QZGnG6WE7aFmdCH/hXkmCSu40u6IsEHxrljQi46j6MJ/wwWCD874xNv61dyZhhu906H6Qu/qNXbAZasEXXhzZbUZudD+QmQkIXlM5YASltjF/kg/MeA4B03IQYJt/9+NLp+MA+dWH3DwtgHvhaLcGocjWfkmX/vyf3jvaDRLmNIdyOEvTQqprWHE/UzHWa+xGYn8c/lKz7MdRzXdjmWnK8tnVqC8eoDd+n9cBxuv0Ftd0KVgY5apxL8KN/PJUZJexaix9gfJB/Oshzd6hiqEx/59wgrB4o27/xS5PMqvSVsvn0p/F20zsc2ccxf00iQUo+nuClBbeKLNcXPPeEiJ/hmcQQCLOkw4iZJPelfrMKBXZL+BMA9Sqi2Y1fWpnmtBDrJ6H9NKPHLFJ0K+xux6Hu8lcDyH1ZIVX3wD+Ph7LpV5YAudaIwubOFlyqJKw8lFJDou4267YV+9aCdPuYUUqaStJq+8ZG7Z/n0tUJaid0xAgKQF3/+hQVbTkY7SEA7jpfA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39850400004)(396003)(136003)(6486002)(6666004)(6916009)(8676002)(9686003)(6506007)(26005)(83380400001)(316002)(186003)(16526019)(2906002)(66476007)(478600001)(5660300002)(1076003)(86362001)(8936002)(36756003)(52116002)(6512007)(66556008)(2616005)(956004)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?DKaPODpg6QYQ1fxlFsDTLcSwStLNMiKeVmmstJU8lmc3POBslpb9tqEyEsm5?=
 =?us-ascii?Q?eH/K+3Y+GxVpsmvDtsjXDJpRXL4WU8v3pj9IrwDr3eAro1TnLTZBu5hlUpY7?=
 =?us-ascii?Q?wZQvnTZ+rAA/6ulC8TJFCcJfO658KWf1aH1vwesIeSwAFINkjllZtHeGGmLw?=
 =?us-ascii?Q?W0vn0fVpEQEeFtlUY6J4Y4Qb7KSp72RNZIUsOdQA42cjqQF9ZHj1uCeAe5UG?=
 =?us-ascii?Q?NNJ5YePUpGCv8tC0bsiIv5uP1JoT62EI1qnqsW0OsPzELvWLsEmxAS5mM2sJ?=
 =?us-ascii?Q?AL0yxj0EoLKuFx8tf7ITds2CtRYD9HGCci0VTVjyOKyEbSXXUuzk3lJ037mj?=
 =?us-ascii?Q?to0SLiP4Lzo4iwqW0QpQD9egKDbkzWxGLpK3RbFVzpxxLtk1ITcvTF3AsLS9?=
 =?us-ascii?Q?q43EOM72qy++M68Q8Xg/PkHc2UriMt7G292jIsASI3hp0tSmPfm/77/OQUMZ?=
 =?us-ascii?Q?zCs8xlRz3HKgY1uNzFFWoK+OeGqKh/2CLi+BynqNoasn7Hi+WtDokiMLP6fb?=
 =?us-ascii?Q?1JtVe+9p26eMwUnQlron6iXaLeta8N/T4oum2PYW6XQ/qeP5s+eGePn2Pv8a?=
 =?us-ascii?Q?fXTUa0NTR5Fo8q1ZK64vWpb/EX1ffdpy0mVMlq1G1PnRYmU0soJVlO5iYFGF?=
 =?us-ascii?Q?374sqyPk06sSiWxNqn+DtCxKgpiUuFgO4wOd2WWLcXYwvAxPiPxPZ5XePN6k?=
 =?us-ascii?Q?G0I62OWjT80MfhxKxGFtmuWO4wsO046Zh91yg33ReXa677cNL+36vtdJo80F?=
 =?us-ascii?Q?ym0jTok7jYToLmjh3Mo8LPn7C3+P/aaBzyiqbHzu41Mdf3lsuFfqoS0bsB+X?=
 =?us-ascii?Q?h7bDdJxaQX9XKPr57U/NAfjpr5NwZ6tAggRMb1P81uXbG9Jk+uZ4pnZizWIc?=
 =?us-ascii?Q?g2xmorW+g0WYyGXqBejiPCJ3kwpMD01jahXAqhum7tBE9cIbpwi1jXDUpW5n?=
 =?us-ascii?Q?9My/t4rKN8YyoN+ItWLz/FaguQwKuJD0W5o/GDENekk/XPXesa9k8BZqBvui?=
 =?us-ascii?Q?CwxvsTxTZZJaWCkFI0w7q8Ids4amgPORdYGfgeBt6hiUK/f8XB6FcDYqoXDb?=
 =?us-ascii?Q?1/uWN3idqyafjd/gdKq7gHtlmx77FX+yfSEUw7+1lKRzf6Luio06VXve8r7/?=
 =?us-ascii?Q?1DaTNRoMthpOM+iaNi96oQ6Zl5dbgmfa7T2ZKdIIREPr3ovGOvvVCZNbKZGr?=
 =?us-ascii?Q?WittxCKDHgVCxkoQ/Pe5BSduAAZE+Cwj/TjcXdZFZ6OLpqRphPdxFyULz7sI?=
 =?us-ascii?Q?fQ7LrM7Ty8njH7wRPjIm8eokdzMsHXDCEUscp/yLqUsU1xeXRJWi8HkB4luQ?=
 =?us-ascii?Q?N6oTu11MpZdLJle6DsZV8BHA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 419d72d0-36bc-45a6-8d3d-08d8c9a3e3df
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 07:01:42.2204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtEd264prF71qSY4PpAgFv58EfQsbeK2WDGxDqp3PpALV0J9g0f+xzvHYfN4mIkNM4iR0VosgC/1UWbO/IGSCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The openssl already added in DEPENDS and the openssl related library
will be in recipe-sysroot. So it's meanlingless to add the configure
option "--with-openssl=3D${STAGING_EXECPREFIXDIR}" as the below help messag=
e.
 $ cd /prj/net-snmp-5.9/
 $ ./configure --help
 [snip]
 --with-openssl=3DPATH             Look for openssl in PATH/lib,
                                  or PATH may be "internal" to build with
                                  minimal copied OpenSSL code for USM only
 [snip]

And there is also a side effect after add the above openssl configuration
as the build path is added for NSC_LDFLAGS in /usr/bin/net-snmp-config.
NSC_LDFLAGS=3D"-L/prj/tmp/work/corei7-64-wrs-linux/net-snmp/5.9-r0/recipe-s=
ysroot/usr/lib64 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,relr=
o,-z,now"

To improve reproducibility for netsnmp as below.
 $ sed -i -e 's@${STAGING_DIR_HOST}@@g' -i ${D}${bindir}/net-snmp-config

The NSC_LDFLAGS in net-snmp-config will be changed to below:
NSC_LDFLAGS=3D"-L/usr/lib64 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed =
-Wl,-z,relro,-z,now"

But it will result in other packages which depend on net-snmp such as
corosync, quagga and etc uses the build host library and introduce
below do_configure error.
ERROR: QA Issue: This autoconf log indicates errors, it looked at host incl=
ude and/or library paths while determining system capabilities.
Rerun configure task after fixing this. [configure-unsafe]

So remove the useless configuration to fix the issue.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb b/m=
eta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
index 051e168f0..d9040c164 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
@@ -58,7 +58,6 @@ EXTRA_OECONF =3D "--enable-shared \
                 --with-install-prefix=3D${D} \
                 --with-persistent-directory=3D${localstatedir}/lib/net-snm=
p \
                 ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '--wi=
th-endianness=3Dlittle', '--with-endianness=3Dbig', d)} \
-                --with-openssl=3D${STAGING_EXECPREFIXDIR} \
                 --with-mib-modules=3D'${MIB_MODULES}' \
 "
=20
--=20
2.29.2

