Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.81])
 by mx.groups.io with SMTP id smtpd.web11.18857.1609405423451370047
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Dec 2020 01:03:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LZ6+4Qpe;
 spf=pass (domain: windriver.com, ip: 40.107.94.81, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXA3Qb7aI6q9DqF1bPUfOmn3KQJW1Z60mbrhk5jhqvJHjVhuH+Qz5T0yH0P0BaBSQBoA5r5k4eilMyd8EzSWbcfmlYaT/t1LWlHpkllGO9BkP856YlqjbDH1dcrCo+klQM3W7EVGzsXlq5Cd2BdhSsNa6no7pPFdOE8u52MwB98pPgBgF458SOALzGbQp64yMEh3GjORXopDUIllmKC6KPorwI092aTHY5tclvSDs56kvCdbybODhQoUUK/mvaEayFe4/FZCjfSDL3LGRYO1XinZZXBeKDjSjtvb8ypCEflfS6oeGhuBzdbB/64YLruEO+UouMaCk51khbY9ts/JoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCdtavJfwHTx2ZdAiFrqvA+GFrQDW3nYJXxUprTTz5o=;
 b=iIoDHi1rNyDlaWkEWj09VzdLABTu8NQqXPNG1fVgeRcmThazVylAv3yxHj05OD/SzXJlaDQizeSwZYfsjUbUzp8boD9/8ZHBIZCj8ril3uuz1fdaGMCIFKCicVDLPkF72xJUY+KVyknrAXqZtX35Erk6siHpAp+UCiWj1x1VyPSh3bErm1EM8WCx0nHROOt/VKUchAOhojP8NTrGhEVhMXYkwd9cbEwy63liCk8+YkkVqB9N/IvY2efQ2TnqFqhoDEC9b98mZi+ZHD5bkkLwIeYqwm7iPfKsue7xliksho55M+db84y8qPmIGp9FJxPZ+o59i3hj/dQC5YRy6m8vFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCdtavJfwHTx2ZdAiFrqvA+GFrQDW3nYJXxUprTTz5o=;
 b=LZ6+4QpedYKKifMWvnkae/9LUQAg6S+Ba/8lomxhS0Tho/DUCIq8fY/UMLi2xxIleMPfWY4hUOG6Mo+PepKNiW4BnrC00AobRCW4LmU/xQUmQGNPgEGdaQukK0U1AZKVATuabf0wRihINeK+73W/jJtGToDZNE9Sbhoxm6+tYN4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2190.namprd11.prod.outlook.com (2603:10b6:301:5b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Thu, 31 Dec
 2020 09:03:41 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3721.020; Thu, 31 Dec 2020
 09:03:41 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/3] ebtables: add missing file ebtables.common
Date: Thu, 31 Dec 2020 17:03:29 +0800
Message-ID: <20201231090331.223784-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:203:c9::7) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HKAPR03CA0020.apcprd03.prod.outlook.com (2603:1096:203:c9::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.2 via Frontend Transport; Thu, 31 Dec 2020 09:03:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92fcef80-a609-4e48-7c9c-08d8ad6af879
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2190:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2190A1870309D58FB7BD5212F9D60@MWHPR1101MB2190.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:52;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	187quUa/cYsZo17xhiv6pwuQEdZsP9GGgL85jMS73sEbhCST4p98hciOlyf5DobYM+8PlQyY+yIuEmFW1iSvNg7/I07UWMLDE3clRXFmkx5HyhTiNQP1X5q55fCP+MSFMINfgo7B5yN+/BNwb0NpJPXoGYPrUv1DK1mOda2oimnTejP35iLEO4gE8zFl7DKP/S7i78NuhCm+r1Ub/mmL8XyLm1ZPVztcGeBL10vaKsnY0+MsNKixsivl4YtMlkuGKpRps1Svbr3NlxjBX2mz1PAiIkyqpbxVwzcZ8Uh+GtRVgoIWSeeRdIth7AcSdzR2QJhqjQ4a3zWvZB/EArEKNlQ2CA2TXmkzMfS8z7lqMQHHg5iSr2vsXEwHpYI0ozOogKZAbDkzmphtKyWGbxX8oPlXqx9TVaIiGJbRpehG1szIXpjYX6FFX8UR5P6cRcmDFU+DEjgUoDowtg43mXxpAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(136003)(396003)(346002)(66946007)(66476007)(8936002)(2906002)(316002)(52116002)(5660300002)(478600001)(1076003)(8676002)(66556008)(36756003)(6506007)(86362001)(6486002)(16526019)(44832011)(26005)(2616005)(956004)(186003)(83380400001)(6512007)(6666004)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?VNFbaNQkRn3u5N35BI9S0h9HjrfgG+k3wPrN/CFv+1rgQmnOPDA8ngBLLU9h?=
 =?us-ascii?Q?ziBDQuPAl5M0/+BxkvsOo1MOxIOcZgcHjs2fZ5QlZsM+fNO2n2apWC/nzcKx?=
 =?us-ascii?Q?VhgLZzK9S5sL8jQRaJjx9ie1trxCY3W26etWq6kOttPIcHdd4PExE/RzY8uH?=
 =?us-ascii?Q?h1To69QuFw9HFykxy+yFyeK0SkW89O3qsp+NnSYtI9o2GjwTSCjwvl1hF/YK?=
 =?us-ascii?Q?DotZfmFMXGPyt5BzNGIsEYtz4ablSe2gJ9EcKhiqohAgYIEp1D/E4EPnJ+nY?=
 =?us-ascii?Q?5uWH8vQKSuARLmRkgngy5vj7QQ5j6aPdSv9SqruK1Ha2T7B37N0gFlJhvc6b?=
 =?us-ascii?Q?cePlilAWHfV9exTysz0O5KuJdWhKY6o+jAtFTMEZk1agUmAiEa/6w4Cz+UxX?=
 =?us-ascii?Q?7ptwRl6Pzp26vxYlFNnZvccCc8UQkIoQlgsrTLmAuk0FMamtwEzu7Hbtd3Hl?=
 =?us-ascii?Q?5N12IlojcobKNk74GgwF5v9i6irBgpJmgl+F0pGQtFJFFhICHo7nQsMGZqeU?=
 =?us-ascii?Q?pRDlhVr7CkH/nTDzMMmgb0axABwsrw5JvkjJDum3S8WTRG6LC7Pslo0E4LSe?=
 =?us-ascii?Q?fVKL34v1h4hPESIdD7aAXHv2zujlTVl7l8/mtSqvJqBTso2NC/DYwNY9SjIK?=
 =?us-ascii?Q?q/9UAJAd2OYXge+m+OSM5jPwqTrDGoc5sUdMhunyKQq02A5rXoHIwy2CctKe?=
 =?us-ascii?Q?bdr2Rgi2SYN9AB8/nKVTycdM+qN9asE3mMx6pk2XlkZQURensAFxccnzkVuc?=
 =?us-ascii?Q?NsT4xepsMOPkcah7W3juaA2mkZx7NK4Hc3pyNOA7aZPUvIc980MKq6dbZULZ?=
 =?us-ascii?Q?DWBBAptHO7B3UyNkxHtoC8iDzWbj894ma65wqAOVXYYAm2aveComxMXn6HIN?=
 =?us-ascii?Q?EI26RNpj3SMtq9/9Dsfp5QC21p/nQArT316j9SKSeICDJ3LjJq7gtejbDGDp?=
 =?us-ascii?Q?p6XSrSJsIiJ37yTdphN3QGfGWzqIBCdPg1XwO/2Hi8s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 09:03:41.9337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 92fcef80-a609-4e48-7c9c-08d8ad6af879
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoiA2Jj65SI49jTB70x2WMCNuwl0jAk2A5fLDMqjZTnvYdSgfzN/QfF3YTMudqwmN/tu3OL6ApdZc8x6xyyJDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2190
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The ebtables.common is required by ebtables.service. Add it back.

Fixes:
systemd[660]: ebtables.service: Failed to locate executable /usr/sbin/ebtab=
les.common: No such file or directory
systemd[660]: ebtables.service: Failed at step EXEC spawning /usr/sbin/ebta=
bles.common: No such file or directory

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../ebtables/ebtables-2.0.11/ebtables.common  | 163 ++++++++++++++++++
 .../ebtables/ebtables_2.0.11.bb               |  10 +-
 2 files changed, 170 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.11=
/ebtables.common

diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtabl=
es.common b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtable=
s.common
new file mode 100644
index 000000000..d948422e9
--- /dev/null
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables.comm=
on
@@ -0,0 +1,163 @@
+#!/bin/sh
+
+[ -x /usr/sbin/ebtables-legacy ] || exit 1
+
+EBTABLES_DUMPFILE_STEM=3D/etc/ebtables/dump
+
+RETVAL=3D0
+prog=3D"ebtables"
+desc=3D"Ethernet bridge filtering"
+umask 0077
+
+#default configuration
+EBTABLES_MODULES_UNLOAD=3D"yes"
+EBTABLES_LOAD_ON_START=3D"no"
+EBTABLES_SAVE_ON_STOP=3D"no"
+EBTABLES_SAVE_ON_RESTART=3D"no"
+EBTABLES_SAVE_COUNTER=3D"no"
+EBTABLES_BACKUP_SUFFIX=3D"~"
+
+config=3D/etc/default/$prog
+[ -f "$config" ] && . "$config"
+
+get_supported_tables() {
+	EBTABLES_SUPPORTED_TABLES=3D
+	/usr/sbin/ebtables-legacy -t filter -L 2>&1 1>/dev/null | grep -q permiss=
ion
+	if [ $? -eq 0 ]; then
+		echo "Error: insufficient privileges to access the ebtables rulesets."
+		exit 1
+	fi
+	for table in filter nat broute; do
+		/usr/sbin/ebtables-legacy -t $table -L &> /dev/null
+		if [ $? -eq 0 ]; then
+			EBTABLES_SUPPORTED_TABLES=3D"${EBTABLES_SUPPORTED_TABLES} $table"
+		fi
+	done
+}
+
+load() {
+	RETVAL=3D0
+	get_supported_tables
+	echo -n "Restoring ebtables rulesets: "
+	for table in $EBTABLES_SUPPORTED_TABLES; do
+		echo -n "$table "
+		if [ -s ${EBTABLES_DUMPFILE_STEM}.$table ]; then
+			/usr/sbin/ebtables-legacy -t $table --atomic-file ${EBTABLES_DUMPFILE_S=
TEM}.$table --atomic-commit
+			RET=3D$?
+			if [ $RET -ne 0 ]; then
+				echo -n "(failed) "
+				RETVAL=3D$RET
+			fi
+		else
+			echo -n "(no saved state) "
+		fi
+	done
+	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
+		echo -n "no kernel support. "
+	else
+		echo -n "done. "
+	fi
+	if [ $RETVAL -eq 0 ]; then
+		echo "ok"
+	else
+		echo "fail"
+	fi
+}
+
+clear_rules() {
+	RETVAL=3D0
+	get_supported_tables
+	echo -n "Clearing ebtables rulesets: "
+	for table in $EBTABLES_SUPPORTED_TABLES; do
+		echo -n "$table "
+		/usr/sbin/ebtables-legacy -t $table --init-table
+	done
+
+	if [ "$EBTABLES_MODULES_UNLOAD" =3D "yes" ]; then
+		for mod in $(grep -E '^(ebt|ebtable)_' /proc/modules | cut -d' ' -f1) eb=
tables; do
+			rmmod $mod 2> /dev/null
+		done
+	fi
+	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
+		echo -n "no kernel support. "
+	else
+		echo -n "done. "
+	fi
+	if [ $RETVAL -eq 0 ]; then
+		echo "ok"
+	else
+		echo "fail"
+	fi
+}
+
+save() {
+	RETVAL=3D0
+	get_supported_tables
+	echo -n "Saving ebtables rulesets: "
+	for table in $EBTABLES_SUPPORTED_TABLES; do
+		echo -n "$table "
+		[ -n "$EBTABLES_BACKUP_SUFFIX" ] && [ -s ${EBTABLES_DUMPFILE_STEM}.$tabl=
e ] && \
+			mv ${EBTABLES_DUMPFILE_STEM}.$table ${EBTABLES_DUMPFILE_STEM}.$table$EB=
TABLES_BACKUP_SUFFIX
+		/usr/sbin/ebtables-legacy -t $table --atomic-file ${EBTABLES_DUMPFILE_ST=
EM}.$table --atomic-save
+		RET=3D$?
+		if [ $RET -ne 0 ]; then
+			echo -n "(failed) "
+			RETVAL=3D$RET
+		else
+			if [ "$EBTABLES_SAVE_COUNTER" =3D "no" ]; then
+				/usr/sbin/ebtables-legacy -t $table --atomic-file ${EBTABLES_DUMPFILE_=
STEM}.$table -Z
+			fi
+		fi
+	done
+	if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
+		echo -n "no kernel support. "
+	else
+		echo -n "done. "
+	fi
+	if [ $RETVAL -eq 0 ]; then
+		echo "ok"
+	else
+		echo "fail"
+	fi
+}
+
+case "$1" in
+	start)
+		[ "$EBTABLES_LOAD_ON_START" =3D "yes" ] && load
+		;;
+	stop)
+		[ "$EBTABLES_SAVE_ON_STOP" =3D "yes" ] && save
+		clear_rules
+		;;
+	restart|reload|force-reload)
+		[ "$EBTABLES_SAVE_ON_RESTART" =3D "yes" ] && save
+		clear_rules
+		[ "$EBTABLES_LOAD_ON_START" =3D "yes" ] && load
+		;;
+	load)
+		load
+		;;
+	save)
+		save
+		;;
+	status)
+		get_supported_tables
+		if [ -z "$EBTABLES_SUPPORTED_TABLES" ]; then
+			echo "No kernel support for ebtables."
+			RETVAL=3D1
+		else
+			echo -n "Ebtables support available, number of installed rules: "
+			for table in $EBTABLES_SUPPORTED_TABLES; do
+				COUNT=3D$(( $(/usr/sbin/ebtables-legacy -t $table -L | sed -e "/^Bridg=
e chain/! d" -e "s/^.*entries: //" -e "s/,.*$/ +/") 0 ))
+				echo -n "$table($COUNT) "
+			done
+			echo ok
+			RETVAL=3D0
+		fi
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload|force-reload|load|save|status=
}" >&2
+		RETVAL=3D1
+esac
+
+exit $RETVAL
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/m=
eta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
index fc544e1b6..08d4d661d 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
@@ -13,6 +13,7 @@ RRECOMMENDS_${PN} +=3D "kernel-module-ebtables \
=20
 SRC_URI =3D "http://ftp.netfilter.org/pub/ebtables/ebtables-${PV}.tar.gz \
            file://ebtables-legacy-save \
+           file://ebtables.common \
            file://ebtables.service \
            "
=20
@@ -33,9 +34,12 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/ebtables-legacy-save ${D}${base_sbindir}/ebtab=
les-legacy-save
 	sed -i 's!/sbin/!${base_sbindir}/!g' ${D}${base_sbindir}/ebtables-legacy-=
save
 	# Install systemd service files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/ebtables.service ${D}${systemd_unitdir}/system
-	sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/ebtabl=
es.service
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)=
}; then
+		install -d ${D}${systemd_unitdir}/system
+		install -m 0644 ${WORKDIR}/ebtables.service ${D}${systemd_unitdir}/syste=
m
+		sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/ebtab=
les.service
+		install -m 0755 ${WORKDIR}/ebtables.common ${D}${sbindir}/ebtables.commo=
n
+	fi
 }
=20
 do_configure_prepend () {
--=20
2.25.1

