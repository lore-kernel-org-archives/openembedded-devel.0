Return-Path: <aaron.zinghini@seeingmachines.com>
X-Greylist: delayed 80380 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 Feb 2017 17:21:20 UTC
Received: from AUS01-ME1-obe.outbound.protection.outlook.com
	(mail-me1aus01on0098.outbound.protection.outlook.com [104.47.116.98])
	by mail.openembedded.org (Postfix) with ESMTP id 49F7A65CBF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 17:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seeingmachines.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=Thp4tz9GBHqWr8xVqscnDTqPwbnGTZ/8MxL0fWbMKJ4=;
	b=ljJLQm7WtTOAkGeFy6xvuvPipUOdsj0KRhmu8eseWs9w8ugfpu5JoR54IRzVmY8AfBYwYa0pAN8NXdofo/91ql1fODS2KNBVQF2etVviQyatUaibR913gmJQUUxipVAjd4NsDaf6DTvCl4t+tSGAtb97OBKa0tE5FUfVoYTAouE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=aaron.zinghini@seeingmachines.com; 
Received: from aaron-desktop.sm.local (173.10.236.117) by
	ME1PR01MB0611.ausprd01.prod.outlook.com (10.169.163.145) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.888.16; Tue, 14 Feb 2017 17:21:16 +0000
From: Aaron Zinghini <aaron.zinghini@seeingmachines.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Feb 2017 10:20:55 -0700
Message-ID: <1487092855-32555-1-git-send-email-aaron.zinghini@seeingmachines.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [173.10.236.117]
X-ClientProxiedBy: BN3PR0401CA0002.namprd04.prod.outlook.com (10.162.159.140)
	To ME1PR01MB0611.ausprd01.prod.outlook.com (10.169.163.145)
X-MS-Office365-Filtering-Correlation-Id: 7fef5900-e951-4839-612f-08d454fde312
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:ME1PR01MB0611;
X-Microsoft-Exchange-Diagnostics: 1; ME1PR01MB0611;
	3:kTwPXO107Q9zYNGzPUhTP6GUy83KQL7mfX17tcgFIbEg5FvidN4do6q2IrPkaUjrqU0Apj7c7dbCb8hssx3NyJXALrPYnA65a+srzH7/xyCuoj2QYwx3HAZ8DTiJYlSba4EFrIbK6TIXFl2WpHbLZv8byVdVOsKGikS8D2yUCguOd3c9VPiHgqNFIK7OxcR2W+kccQ1jMzOyQmlnsTkcC9jvPASFtaxi7RVSv8cQmfTCWapYlarU19Our8hVwbNQzUeJy89nKVXbYnffFR4BeQ==;
	25:AfM6k+aALwjpKvPH2yUPyI1gd67ua2rIIUbaaflEGWhKZ24q+PyVGD7TQMp3rWinc1y9dD3Mfjp4LWA4MnpLhuVcmx1a/cyibAi0pRhJSAsXWZJa8Hb38ZnmnD3UrlMiz4AO5ORhbIXn943vEWQpqmQMuEY1SjlYMcwteS7z3TRcxBcadj9vTkyJqhVx0UJUTBfN9gBBGcWgKJYydmyfJChy969AdqhMjqDnjIJBD/a5A70i9ZvZpfH1VLyii2Rrj7b2khn0rNuOr1JkE3p+SojIdpkSaFhfzp4GacxTzohiIOV4z+4xmFMt3Xv3E9OrVvL8avjUDxK3eTzaKWVRf4Ava+EGrbtHBSLNIgamxxJSBa7eyTdntcDvaxKUY/5iPgTVlXWcAcp5QbXgZK3ePM8K8Nh1HkKs3I26+t7hJipXKRDYx/HgsZWO9RH4ygkftAzPaK9ugEbEzt25ViCV0w==
X-Microsoft-Exchange-Diagnostics: 1; ME1PR01MB0611;
	31:HI/CCIk4VBxIwOZRs/paw5uQJfe7zpamS9pi/kEGXPMzJPxAS/hW4kd/LbMkZOfZ4lnD1R7EQMwWA9JgfBH0cN/CgPbpwvw16AXE69u5q7Q0dJ85/G1zCN8O196H+JI57SyT1GdJHdnPhW9ThTqvoqGQ/z7lEDlJUNjdrK2Y7y7D42xI2K+dAZyXAM0d6oqar7AJ085igb1woFuwpIzIZSnEz+R9RCMxWz0k+wRWRayQUGxaK5F4EjUUEZ1L4pg6;
	20:1VcYONLWS6kM4EArnqzrPRZEfyJDunyg7YRduDFpw8mAu/X6vN/1G2rU0UfFTkiMKKPHmOaz09LgJ017PxHtnN1ZBbVjWw31p4tpVXORjPPoIasexWxMbSF/0yUBDD7KhSBryqmoj7OwzHluA9IcaFPSYBgOmxykFyprMv1ODtt+0eCSlQm+LKyTWUvEqRVmimc55DH6IVWLTyXmXVIQRhNLxtzb3Zj5OrBWaUKUtECMZHytYeHrBzIEpngnk4br2KPlmMwoffhNhJf6VvJloD5O06i+DDQAniDY2gcOCp68adIahw93+J/qedhwm1SNSAFva+cB1nqz4eqlykoVRA==
X-Microsoft-Antispam-PRVS: <ME1PR01MB06119E54BF3D4C5EC8E76572F1580@ME1PR01MB0611.ausprd01.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6041248)(20161123560025)(20161123555025)(20161123558025)(20161123562025)(20161123564025)(6042181)(6072148);
	SRVR:ME1PR01MB0611; BCL:0; PCL:0; RULEID:; SRVR:ME1PR01MB0611; 
X-Microsoft-Exchange-Diagnostics: 1; ME1PR01MB0611;
	4:DFbi4T2oEh2MW0qtD51D9HYMORn33dHdBAlHJbslTfBsjwHW1K6jN47eiacSP+F88x/cqftaYFpTis8ncysJVQca1Kvwd2613HFq0U0vmt8yhZ64TpqMHl3dDoL4YYLLuzK9DQ0iJG76fhpxzyE01jE9aIeKC6R5FzU19Ssj7hbNUz8Qhxq2DksIQ9mMkoIgKkeHuiFI09rAkMAKouxM536zFpoyRGpEBBb/Re3StD2/OzvjoyCC7Yg2MRq1Ncv9QPaHlfWvpjQ0pmLpJC17NVegHGbLYFAQ3EeVKSNINRdo6miZtK381TAOBPSnrwq4PgQcF5pXQurD54ZYDExC96MQiS/cPpwN20zGuq84Zs3c2tSAGcACBUGAOTSHzP8uZMEUf9yN27BNiMYTkeMCri7klqVUwXSIQHN4y5Rtr0Z8GfGmZrGVn0itU8lrnWcQ3qtLqQ0523NkA4+iv/aaF4ik8YItgM6V/M32yyFX7+d5iyXSRXFY06fgchW0OLEwcbCXLfTk7rft1JxOIV6kS5yYU3wfxE6TxQU7zwe3kixuHS1kSbGgrYKQFsh769IqgH862w0noPMDkJESpMsatFJPwUmFe6PuRrqZyg20IK0bGKqgbWYhKfOVOkM3GhBUdswJ8TvoNkDxqlYDy5dE/A==
X-Forefront-PRVS: 0218A015FA
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(199003)(189002)(7736002)(81166006)(6506006)(38730400002)(8676002)(81156014)(5003940100001)(110136004)(50466002)(15974865002)(92566002)(107886003)(33646002)(6116002)(6486002)(68736007)(25786008)(48376002)(3846002)(6306002)(189998001)(450100001)(86362001)(6916009)(4326007)(47776003)(97736004)(8746002)(6512007)(66066001)(101416001)(2906002)(6666003)(50986999)(53936002)(42186005)(2351001)(5660300001)(105586002)(106356001)(36756003)(50226002)(81003)(305945005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:ME1PR01MB0611;
	H:aaron-desktop.sm.local; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: seeingmachines.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; ME1PR01MB0611;
	23:6kc31kOY8msYYq73AkdaIdM7GqkwYRq1VXERSFXD3?=
	=?us-ascii?Q?SuKfJJA6xcjJ3dpEMwewdbdMbHQrPXqqOcY1Y5qepYWxgnWQWWqRU5oAhP4x?=
	=?us-ascii?Q?a9wb3xzEdxuEqL3sWUhL6jFSPUIFe9RMH7tDq4P4eye9dfT253OAfsFjyx55?=
	=?us-ascii?Q?ZBk26pnY2tHlg6YUnru2G5m1HaARq1O4xrwggtNCdpXYkc2aBUC16QSMJiu0?=
	=?us-ascii?Q?KSpDy73nWsobv1uwBL2xLTvJoJhcFcU0dD0P5q9P92tkz/Q8zAQrsowWbrNx?=
	=?us-ascii?Q?RMhFqLbdAkUO0gQZjjnQEuENPQQJSXUYgcvcnc0UNjJgunXnMxTDEGcRESRS?=
	=?us-ascii?Q?2v8y/VpNThsA/hWSwUv7bIoMC+PMPGyPdoH3AK4Bmk3gmrwJeMFB56oYg/Da?=
	=?us-ascii?Q?iqtlGYwpdkYCFJhglqXEHQMtm3VUk4ovqelKoMmBDz+rxjpKelZDdHDY8Vof?=
	=?us-ascii?Q?vugi6PAwgt/hpVJ1MA5cp+vxhXvo5YaDAg6JDTCYfHH3/W6bCboBgjccDa1S?=
	=?us-ascii?Q?DqvKWwSV/uA5LSSYWl0HzQH6EVzqY0c23jwCF9k0EU1z7oqQxo423WntTJat?=
	=?us-ascii?Q?riMDgLt02+Hr1xdz/x8fYLlDGcobgvcHgm/omR3zgrkIeefm5vLxXlIdYnxY?=
	=?us-ascii?Q?KFGTa8iaWmYPM1x86qEpbuQE6HSZXTFFcSAz3OAxr2YlYXuqnPpiLzOUXr80?=
	=?us-ascii?Q?4GKqGcyEH+4hIpIMcbAcCxjzBWNXDHtuPrDT6vCt5j8yn8wo/ON26yJIdNm9?=
	=?us-ascii?Q?uaDTLXvXxeKY3DB/Lk1liItuMXMXqPrTsMC5jTJZc6mPRFi5WxUeAvCJHu6J?=
	=?us-ascii?Q?VrUtwcNFsTyVd043/Dg1a9yoCuk1er84PfruypbKxDAijhZfhReF6HV7YV4Y?=
	=?us-ascii?Q?2S89DVdgMtNwnitDgMtdr0RcaNctBo62qmad16oMKr267003pwMSwWQSmUVw?=
	=?us-ascii?Q?TQjEZDpJ3bnjLeb1DfWRB5EP97QVL2AG5BGa1Sa/Hz+NWZvx0Kin6/shuqpf?=
	=?us-ascii?Q?sCH6WU3EB7mmYJ4SW6q2yb9appmQcI4HhTfMV/8u1GnWD5wk9F6/XRZFjWQz?=
	=?us-ascii?Q?g5KS1ueRY0CJSHcbM9VFnjYSqLKdJPm19Gcfu9yETuMvbcLSG60c+DJIxZXB?=
	=?us-ascii?Q?HygTr0/aqzEiPMXueN2tyt9rt0ZY+EfqYteWjgXYyZUqISSHXG9uw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; ME1PR01MB0611;
	6:pl60uJV+1wyegkCiHpWnllhNq7+1yaZiZ7i2m0bhUVGnJbiN/VDCo518twEyImFMU8NZdvOpOCR5Hli3Rs1IJwOMxBm3rPcuw0NsUPl7hPE1wUsgvND0yl/H2yX19thg9P0ZBKalSiDFzmU+r4o/iOI2RsNkNEeaz8TgBLZhNAvFb4hCA0HyYkHx2WmHM67cDOoF5zRDfiHssNLI3G1nJJG2SKQIPMT3A6bL4+T/g/CEq7SIj8WfRMkvyK/eH3Wbnq7Tysn6/w1Xg2QYXVSDk4J3gJnoeRsLuIr9b7H0mRnnTb3G/yPNl4w7JOacAbhrMx684F8NDtQxd978JGEctW+xW9ZsAAbJF9f7Fyq+NPE++4h9XMROnqFMc9i7bvqj3V/OPIYRJ5etqJ+0UJJzhw==;
	5:2Cwf71CuKfcJy9q9nKqY4fOoXQd8iZR5HEfPGUg9D5loPDFiTGams4ULQSUE/wdytr0DL5Y3P9WUFjoNDBT4Nh41VDFsPRd3yOyMEpLjRiSXqzn6OOUeoGP/nzNKc9/xts7IJmHFwCG0yFST9lLgJA==;
	24:E76MzyYbeDarJhSKk7ggP68rmbP6flEulWaNxi1DGoM+eAemZt/C7Npd1AZjuW65muYvZHbUgSrnTCbtuN2HsvROw3iT6cJTsEAk5pWeVb0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; ME1PR01MB0611;
	7:n4pX0cxckDrIiKITnijZ22lHkI2485swV/yphrOngg1e8MtOJvi6W/YPbs9flREFwUIPBwZ1ZMYoeeWNBPMW4FUdCijCxA+CX6YFnwW5lzZ2aTW3Wn9evE34RIkIdzd6Ifm8/eksSOwF28Yi6Zbeiceh24IG6vWWiGmgkoy9tRs/HiFXsNY9AYQR0hIg4dSnLvEBFqjj7YqKWa5AlByUXg/nSfAw5hYNshIGQpcTXxk+W5bn9Bz7eYV2cuiYoIJiwBldN6jdPlkCO+0zRdJIpf+/o/5fM30/pLvgoup9NR2SRvbKdjIx3xi2Sgwb1g3L7p362lDvWfTbzh6f9XtSxlX6B/applkIWhQgEry5JRLEIFugZilioFLBBwtxexq1hXGub9HX9G1yfZbYKs0gYGVWDKJ1cVZrRFp3GrTjxHdOBkCxlVPoyV/6wxydLUiUxAOZs6Gd56mNQs1J3Eijimz1TBPg6iCF8A5hcCTLAFhpxIlomQXios4V9KeAg/DLrUuLf0zIJ8+Nxz/lCm7QVQ==
X-OriginatorOrg: seeingmachines.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2017 17:21:16.6463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME1PR01MB0611
Subject: [meta-swupd][PATCH] swupd-image.bbclass: add missing expand arg in getVars
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
X-List-Received-Date: Tue, 14 Feb 2017 17:21:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Add "True" to d.getVar() to avoid forking a little while longer.

The expand arg has been set to true by default in master branch and breaks =
compatibility with branches.

Signed-off-by: Aaron Zinghini <aaron.zinghini@seeingmachines.com>
---
 classes/swupd-image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/swupd-image.bbclass b/classes/swupd-image.bbclass
index 771a416..645adab 100644
--- a/classes/swupd-image.bbclass
+++ b/classes/swupd-image.bbclass
@@ -154,7 +154,7 @@ python () {
         mega_rootfs =3D mega_rootfs.replace('/' + pn +'/', '/bundle-%s-meg=
a/' % (pn_base or pn))
         d.setVar('MEGA_IMAGE_ROOTFS', mega_rootfs)
         mega_archive =3D mega_rootfs + '.tar'
-        workdir =3D d.getVar('WORKDIR')
+        workdir =3D d.getVar('WORKDIR', True)
         d.setVar('MEGA_IMAGE_ARCHIVE', mega_archive)
         mega_archive_rel =3D os.path.relpath(mega_archive, workdir)
         if os.path.sep not in mega_archive_rel:
--
2.7.4


Aaron Zinghini
Senior DSS Software Engineer










T       +1 917 346 2993
M       +1 917 346 2993
E       aaron.zinghini@seeingmachines.com
W       www.seeingmachines.com<http://www.seeingmachines.com>

[Seeing Machines]<https://www.seeingmachines.com/>

This email is confidential. If you are not the intended recipient, destroy =
all copies and do not disclose or use the information within. No warranties=
 are given that this email does not contain viruses or harmful code.

