Return-Path: <stefan.ghinea@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B40C74A5B
	for <webhook@archiver.kernel.org>; Sat, 18 Mar 2023 00:16:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.278.1679098574469390443
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Mar 2023 17:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pqfm6Ohb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2441645370=stefan.ghinea@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32I0BX5m026541
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Mar 2023 00:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=8OzA9yR+fi+WRc8wZvewT8bLP8Q5qNF5KoAqwbVtO5k=;
 b=pqfm6Ohbq54RGbS5oxeH11Wc7XxtW6B0WpbR8Ck/nwL5+FP+vPbjU58Y45GV2e8cqP5Z
 niPtOSNgHAWW+pCEcksyilka1VzI0rNOKKlhUH/vjzBBOzaFiWgcy5OjBWSXgrDoh/XN
 Q37IUFiU1EiQqgmvWKW4Y5axQ8hVELxmjzy+PpFfT0E76OJx7ItFCmdmPLuVBG7h1NjO
 KYTHU3a/Dk+jxu9KphjQvlAS3tCslEQqRdvWkm8s0/GtyX6YDBxwTkqL5XYKULUWOB0x
 oEGmD+8AIr7gCfeXfP9UBgzi3usYz5ZDcPy/jSCR0Pf/XD+Sb3oXdjbApWpciioYAXrm uA== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbq1ha7an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Mar 2023 00:16:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gnd7B/wdVj79HAshz7y9AbHc8jpaMlyA2HIctvl40E+MsXdjT4IvvhiMFQCJRBctLObwTVRSz6VghGrsTrJiCWK94xYQkKwrySnu9GZTnrItu6hAk/Jt/PizTtjaMGA8hUH2JzaOsjf1HO2frsybRhIc8GI/hKwQ8IUJ1pAlb298pshmO/bsO/7Ix534amSdOiB3YLMlQBGAjv9eMmG9m5Vat2qgtWXrZbMw9HYWcCdzaEcaxUFES+8uwcR7tem+Uqc+UvdTw5OYzeXLtG5Rr8zrlNl85QTZKqLxDo/yPsUO77lbX4qrCt8gATdO94k9MguNklraXEFA185zlI8oiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OzA9yR+fi+WRc8wZvewT8bLP8Q5qNF5KoAqwbVtO5k=;
 b=TXzCmrvA231eS59hej+zuzY4goeUzlIbOApvs+xBAu4feB8EWUhr77QzPh32HsgtoCPlYD/kuiZwj0Lo9KVgVVUEOk6vXpslrD9lydjmpYk6O9hejdTcNkjMfsH6iFvVrNjq8pdsPK+CF/vtRY0LZBfEUf/aLW+tDEbECEDn0NRrqc/LguVTtmt2BWR8bLIjZ7lUztyZGnp1C48i8nJhdNtpA5WxO/sXhtRGMN2dxkOqHD8y2WlLzgDQTX+YKWu9cSjpb1U/mLj23IZcRwuxGXH7S2itg8neLQYHqF0LeWH/NVmdF6w+FrwHfaJ4iKBqZagv2NzcuAlQ+7+OlTwT3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Sat, 18 Mar
 2023 00:16:11 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::fc79:efda:317e:62a3]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::fc79:efda:317e:62a3%4]) with mapi id 15.20.6178.024; Sat, 18 Mar 2023
 00:16:11 +0000
From: Stefan Ghinea <stefan.ghinea@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe] [PATCH] redis: fix service redis-server restart  not working under sysvinit
Date: Sat, 18 Mar 2023 02:16:33 +0200
Message-Id: <20230318001633.18796-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0102CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::42) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4989:EE_|SA0PR11MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: 6017638a-6c72-4793-43e2-08db2745fa51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0ziXjo4L9rR+gJ4bt1V302NwdYKW/ESLJ6jf1gkiQ0pLtjy1eKtmcGdI87wiagRr2+SlAwCR5Qcbhn5Y3EoCyl3dGdnwN0AlMCGGh3/p/8bhwt/zOecZVDhcufXBGYTQfdQenDd0JlGgPf4ZKE5SKmeyxCJOrEdNHNIrUNG8D7sAXqmsnMCvjHiRR8kdTl9tr66EP8BMDMwQKC0U3NB9W6flBDXrIXlVVwr8ak1AKlbc+rPK3OJRNuo2Y/FEpktwN36vGyNsu86ARzA98L/ag6CloGJtviFKCSijQ3cas2Ir1sph8wLfk9HxX3XH7kKnLJNwrs1o7i0bDVz5hvxaieDqCyRjTPtO/Sexr7g15DpDPYim0iI9zUZSg4rf3qcVye3U7wlgLbK8EMyT1St+haRZ+GTg7nwyulV0058UDGXPsKkPGtQO81tg3K9AbftZp2kWmKlqtj6Uz23e/c2c0wprqMnsP8rA6EmEl22BCeCp+A7wfflOSDBqklGA5zRD2Y/U1BhZd3s7e/FIabLvGGg18xdZ+cDhFwsbkACtjSehKSprmOGQKvI0uT9UCDwbXFIMQ6H7yiDU4/u1p3lqcn4+g7FfQJIWHRrRI6NZ+0re5bBUtgkJOF4nPqISciZVW6s4xbmgimI1CerzFrj7YZi6Zw55oW/is888+dGGgBn5zz/tVE1J2PGdtdXW+bz9YPCd++HceNgTqyN2vKBTnA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(136003)(396003)(376002)(39850400004)(451199018)(2906002)(1076003)(41300700001)(26005)(6506007)(6512007)(86362001)(316002)(19627235002)(83380400001)(36756003)(52116002)(6486002)(478600001)(66556008)(6666004)(66946007)(66476007)(6916009)(8676002)(38350700002)(38100700002)(2616005)(8936002)(5660300002)(44832011)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5n2SE4JdnlPBhZwTLDgBCbfU74m4V2q7tspHdKET0iksVUz/v462nyhKFtDE?=
 =?us-ascii?Q?0mZ0AJfrhwcdSwWRIJhiGgvdzFWDEVWpR3ye+4zHGCtc+qz3dH93ONf/cTOJ?=
 =?us-ascii?Q?s/9/VFKT5kSb4VOleGcH5IxRC3nxix/8POzVf82Dhw15kwREOc8mTKDloxZl?=
 =?us-ascii?Q?h7lk5RmZWaMRknv3jP+b3+iguThy3v8A2O4hRpOcH1zFIHsi3hYnrD32uaCL?=
 =?us-ascii?Q?RSrwNl0t4JvdJ9gTMtmFG43uCHWDuOURJVeOFZRjEWIwvKFpjSSlidHonKE7?=
 =?us-ascii?Q?CMSIQyRGRmrCmQCVZce2zsOow7GDhs1/+0iSICQ8tXUeIlJ5hl7oLBokla3a?=
 =?us-ascii?Q?CN6TeEa+myJOdMoT/Nj69hBlmEyEgYNU5Jw0tkI+j6SIxIalaKmd/FrCiPcr?=
 =?us-ascii?Q?9LhHVV79/P1KSf3fGndGuJMNo5XbZaMc47PD/295Jv32IYMH7rx2TPWSV0T+?=
 =?us-ascii?Q?0o/LfSgwHUKqpNyxbA7MNJyiFGdIvOem1DY8YPi8FXzHTkIMf4FO4E97LRFu?=
 =?us-ascii?Q?xLPBcoBikX9dCa1Ncep2+ZPdL//pcZRUxEewadptPMjeblU3saBKoPwlQisM?=
 =?us-ascii?Q?b95ZGQ8Im+2ShNRfdT5r3Y1BlvU5FfdADJj8T9qh8BticejFon1cY0kIx5j6?=
 =?us-ascii?Q?tWYQuWMgU5VJ7O6djc9Qk9gZDOMGjapQGzOKzsxawnD6dOZr9IElREp1NSGi?=
 =?us-ascii?Q?POKHHksGRAjOpMWkv0OVJsa6+fou0apVfU2ovOes3nHgZLzRftJd0sYMqpOu?=
 =?us-ascii?Q?dYi7mhYO1ovt86ZZJ7P12pi8usk/p9I+lfSkZr73c1ppPpfOx5zAGG+irNwm?=
 =?us-ascii?Q?CtsYk347ndxUe0vYWssMxLqtE1EnUULLdoZMOblEV/+z2IxXf851xidsXbP9?=
 =?us-ascii?Q?SLZrnwMBEqeTEgnac2SrgYc4DSUd/sspCn0UzcjkGR0iwkG8nT57tZtcl+sv?=
 =?us-ascii?Q?B5Unh9/2LgojfnAfzKGqnwkpCTJnMv8LvjFwqFVQCGrWFx/khgdbUldgfRA1?=
 =?us-ascii?Q?74joEkLCri8CLqAZRr2O21fT8If7z1FF7w5zdof8yS2JYyi/7XkdqpZF17pI?=
 =?us-ascii?Q?NgtnNcrebuZmwGDjrG6N8/RNjQek0YhrU7cj8oAqCk3IZc73aKTp225HKPFC?=
 =?us-ascii?Q?vRRdoT4tAYFjS5ZM1ZT0NHXf05othISM5HljgRrVxHQv0r5mpm3VqqGvCVjh?=
 =?us-ascii?Q?0GDuYgvrlcNwfICkX997aCZAJasXclVpTBnYIwhdMcSI+mYCGIcVAwCySSRF?=
 =?us-ascii?Q?s9AOjmo3HC/Ywp8fQ9GX5+0qpOFQrroA/HSNEWLl6Hm4qx5mc+059B/73x2T?=
 =?us-ascii?Q?mBtJAy/KeGVmLqbVxBIiv3ixcxHZ5cEXtfI0Tc4dguLj+RqWjoxLjCIdP2nl?=
 =?us-ascii?Q?kJzAXfGRqiYwFebF9CQZrzqv9ofTnIOZajVwUFUVR+akaFzMf40xuvzI/7pz?=
 =?us-ascii?Q?25ZQ30RvyEwxWiU7ZPMo0KTmpqZPR0RfQdtDEozITTAkIWUD9elnYmscBzgi?=
 =?us-ascii?Q?7b/NmuwjE9/xpigefYKAD6xOjXA+G9AJXf0NlvaoLPia2KssfWbUmxuNwm4M?=
 =?us-ascii?Q?uxs1N3+IpO2uyPx8ve/XBIz2HsW1JjmmQqAJyq/azciVA1DAKOF8O//l6i9P?=
 =?us-ascii?Q?tw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6017638a-6c72-4793-43e2-08db2745fa51
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2023 00:16:11.1101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqjoD4CAtVbiqxaNhTowQCwTAZUMIwLUokbjZERnQTTCUmRlN34GOeVziAYyH+de//SCZEz/d4AzzzTxQRiVa/ciq8eizWVslr36Pe/4gNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
X-Proofpoint-ORIG-GUID: m9JRA0KvYilwZRnI72Hf70u-U7RhMC8A
X-Proofpoint-GUID: m9JRA0KvYilwZRnI72Hf70u-U7RhMC8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_20,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 adultscore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303180000
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Mar 2023 00:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101594

Under sysvinit when trying to restart redis-server using
service redis-server restart two calls are made to start-stop-daemon, first
with the --stop argument and then with --start argument consecutively.

Because the process doesn't immediately terminate when start-stop-daemon
--stop is called, the next call to start-stop-daemon --start finds the
process still running and does not attempt to start another one.

This leads to only a stop of the redis-server process when a restart is
requested. This behavior affects all redis versions using sysvinit only.

This can be fixed by using the --retry <timeout/schedule> argument with
start-stop-daemon --stop in order for the call to block until the process
terminates so that start-stop-daemon --start will attempt to start a new
process.

Unfortunately the --retry argument works only in the implementation of
start-stop-daemon provided by dpkg package and is ignored in the
implementation provided by busybox package.

A repeated check if the process is still running and another try with
another signal after a timeout will effectively simulate a stop with
--retry=TERM/5/KILL/5 schedule.

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 .../redis/redis-7/init-redis-server           | 31 +++++++++++++++++++
 .../redis/redis/init-redis-server             | 31 +++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis-7/init-redis-server b/meta-oe/recipes-extended/redis/redis-7/init-redis-server
index 6014d70c0..c5f335f57 100755
--- a/meta-oe/recipes-extended/redis/redis-7/init-redis-server
+++ b/meta-oe/recipes-extended/redis/redis-7/init-redis-server
@@ -27,6 +27,37 @@ case "$1" in
     restart)
         echo "Stopping redis-server..."
         start-stop-daemon --stop --quiet --exec /usr/bin/redis-server
+
+        # Since busybox implementation ignores --retry arguments repeatedly check
+        # if the process is still running and try another signal after a timeout,
+        # efectively simulating a stop with --retry=TERM/5/KILL/5 schedule.
+        waitAfterTerm=5000000 # us / 5000 ms / 5 s
+        waitAfterKill=5000000 # us / 5000 ms / 5 s
+        waitStep=100000 # us / 100 ms / 0.1 s
+        waited=0
+        start-stop-daemon --stop --test --quiet --exec /usr/bin/redis-server
+        processOff=$?
+        while [ $processOff -eq 0 ] && [ $waited -le $waitAfterTerm ] ; do
+            usleep ${waitStep}
+            ((waited+=${waitStep}))
+            start-stop-daemon --stop --test --quiet --exec /usr/bin/redis-server
+            processOff=$?
+        done
+        if [ $processOff -eq 0 ] ; then
+            start-stop-daemon --stop --signal KILL --exec /usr/bin/redis-server
+            start-stop-daemon --stop --test --quiet --exec /usr/bin/redis-server
+            processOff=$?
+        fi
+        waited=0
+        while [ $processOff -eq 0 ] && [ $waited -le $waitAfterKill ] ; do
+            usleep ${waitStep}
+            ((waited+=${waitStep}))
+            start-stop-daemon --stop --test --quiet --exec /usr/bin/redis-server
+            processOff=$?
+        done
+        # Here $processOff will indicate if waiting and retrying according to
+        # the schedule ended in a successfull stop or not.
+
 	echo "Starting redis-server..."
         start-stop-daemon --start --quiet --exec /usr/bin/redis-server -- $ARGS
 	;;
diff --git a/meta-oe/recipes-extended/redis/redis/init-redis-server b/meta-oe/recipes-extended/redis/redis/init-redis-server
index 6014d70c0..c5f335f57 100755
--- a/meta-oe/recipes-extended/redis/redis/init-redis-server
+++ b/meta-oe/recipes-extended/redis/redis/init-redis-server
@@ -27,6 +27,37 @@ case "$1" in
     restart)
         echo "Stopping redis-server..."
         start-stop-daemon --stop --quiet --exec /usr/bin/redis-server
+
+        # Since busybox implementation ignores --retry arguments repeatedly check
+        # if the process is still running and try another signal after a timeout,
+        # efectively simulating a stop with --retry=TERM/5/KILL/5 schedule.
+        waitAfterTerm=5000000 # us / 5000 ms / 5 s
+        waitAfterKill=5000000 # us / 5000 ms / 5 s
+        waitStep=100000 # us / 100 ms / 0.1 s
+        waited=0
+        start-stop-daemon --stop --test --quiet --exec /usr/bin/redis-server
+        processOff=$?
+        while [ $processOff -eq 0 ] && [ $waited -le $waitAfterTerm ] ; do
+            usleep ${waitStep}
+            ((waited+=${waitStep}))
+            start-stop-daemon --stop --test --quiet --exec /usr/bin/redis-server
+            processOff=$?
+        done
+        if [ $processOff -eq 0 ] ; then
+            start-stop-daemon --stop --signal KILL --exec /usr/bin/redis-server
+            start-stop-daemon --stop --test --quiet --exec /usr/bin/redis-server
+            processOff=$?
+        fi
+        waited=0
+        while [ $processOff -eq 0 ] && [ $waited -le $waitAfterKill ] ; do
+            usleep ${waitStep}
+            ((waited+=${waitStep}))
+            start-stop-daemon --stop --test --quiet --exec /usr/bin/redis-server
+            processOff=$?
+        done
+        # Here $processOff will indicate if waiting and retrying according to
+        # the schedule ended in a successfull stop or not.
+
 	echo "Starting redis-server..."
         start-stop-daemon --start --quiet --exec /usr/bin/redis-server -- $ARGS
 	;;
-- 
2.39.1


