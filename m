Return-Path: <kwangsub.kim@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0105.outbound.protection.outlook.com [104.47.2.105])
	by mail.openembedded.org (Postfix) with ESMTP id 8C83A6093A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Feb 2018 09:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=VroHxvDV3wh2n034K1LZeYs92oo7j2AtsM7d24hoQLA=;
	b=qbttEy5MSIkmVYMu669ldpIBaOceSP534DwvWnnkIrIcYcBOnvVKnElawFXDiLQfbsbu+WI1yQIo/OagBUAAQM8heFJ+UnvgR9lXq3DriFswmL8HoRK7w2CpT4z7F3aitVPhtZoQYRdVvZsUXl8LOF1J+ZdvKAFylXJuz295JyA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=kwangsub.kim@qt.io; 
Received: from localhost.localdomain (175.195.156.153) by
	DB6PR0202MB2486.eurprd02.prod.outlook.com (2603:10a6:4:1a::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.506.18;
	Mon, 19 Feb 2018 08:53:50 +0000
From: Kwangsub Kim <kwangsub.kim@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Feb 2018 17:53:21 +0900
Message-Id: <1519030401-9299-1-git-send-email-kwangsub.kim@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [175.195.156.153]
X-ClientProxiedBy: SLXP216CA0050.KORP216.PROD.OUTLOOK.COM
	(2603:1096:100:5::12) To DB6PR0202MB2486.eurprd02.prod.outlook.com
	(2603:10a6:4:1a::8)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7108b09-0ccd-4dfe-23d1-08d577764c95
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:DB6PR0202MB2486; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2486;
	3:NwvhFw6RWqbl1yjbTu/mZqmhf37U0/MQgZQU4dBoNSxPzTyzLR4vq3AY0Gg6lizF19bSp1Qq8cphlpO7s7ekf9HECc9PtFSGxJTZQmULHkZoDQx/11I2ehHoBlmTAHxjRkB4Z6a/2QtXF87zmhfaMu6EwQzezdFDiRhuk289XROAaZpOwElC3A5ZbXg2j6uLbELK/z+BXYFwthUiRxH2zY332uzXZW51YMlu7l328g8ERVAxOiP8pLYnFa4fTf8r;
	25:wrNiLAWOA3S0gtDIwulyKYKAuC55T8wK/0p3g0s7gEZNrzbBfJfrI6sLfWE3wwz21ZfapHIcBBiEEaHfDscK8GZS5o2sb1N/E5av3T9X0XxkRjkdGS67RXVeHvPcesNVl8JSl1qNJ2lrQV1o1AK4uC8bKueRvNt7zbYF9nhhG+Y7tZ0SwiIfBHlvQPrWOJb+B3bxPJ1uzzTdDPWDQbRhOVM096AjSsfLlu0cJzL2WY+QzY3MBDdmKAdch1rNvK1FGA+kA7cNu7Pbt8dD+FJ4MrXCfXDIJEAOO9mlDLKDGfIefe5LvQYkXwErnZ6C7v187xLB74BfhtqKFzrqpTGGgQ==;
	31:uzSLJwcVKrmy/uzNSofc19AVnaHExXF/DPlGj+bVzp0Qb9q74MfS9/SOi26cnhiguqmR9jkOzmNPn+j6Co6dkmbGa2Dvpm/qEA9v5lp6/VLKJbfgAFYQUnGA7hZy73AfqrVi1RSV/f9ge4Gw2HuKi4j/DSWVv7qCj95YZbw+Uoe0f/EdvwoTfaljIwjHfpsUQSfSo2dgoUqFreh2rFLkuP/A1faQ2Jj52Tk9mo3auLA=
X-MS-TrafficTypeDiagnostic: DB6PR0202MB2486:
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2486;
	20:aOxxFsWNwATOSXOrAqn4q+NJnEj8kx/jNJp37/flcS3w9ivw6DJcB4f38l9cq2U2EbXJpLyZp83C+JETLJWQ3/JFp/EySb6j+qFxJeWBuLOMTQ0l6fWUY3ojQ2GNZKD33ZxoyuYfTmfAqBN8D319XBFfwLiczLPtiElqUOgkpKfSfVu45LuQSbt2JmqoOEBk+Q3AsQFXdrNkpLGk7wRrdEr9FQIX5XzrQo0hAEdNCPFSS9gO9wJFayqI1a3OHHAiBKdTuNuP9QEcfyL9arWOq9pMH5sAgxPPl9yoT3afzlG5G5QpaI+EKEJ87s+oT+ZWrACXSU2bOj4r00FXIxH+RAj3NfvkkTizR/2wSHogFDaxnUe8p7Ev4JkSaK6nVGu4wihH8KUUR/7vVXeByJNPDdvM6SYmk15LVcwbl9uXEQ+zjWO00KF6KVI/n1MLaPQa5fvkauk4X7rgqJZDB/YXayrJVCz82QTAg12zeTh8HUkVWBkfR5ct6rmBw/2OOSJx;
	4:gBk2FPRAK2yQgwXTzLx1ZWPdbWufQ3DCCWtf7EpJcwT8Vzb55Vo7/QpmYj/ugdLF6QfIPnb80zz9BhwNwLhrN21qM0LI9yLEbYwILCav1sEVl63n3SW5I2vu0cPy4ZSWmQiwSesk1IPiG0uQ2OLa1DiajRlKtzyPdcg33F6aot27k9Z8IZcXIBwr9Ea6mjJJ34aKnGwnlG8OQRES4F4n+lxPuJJkE1VswpNGuDe1cQcKHXG8ITY2klFR71rAO8gC73epmC/t/WV4qykHbFJ+irstF3ijgz5QSEN9iNyzHGlOwsQS9dK6XGsiNp5QLSOx
X-Microsoft-Antispam-PRVS: <DB6PR0202MB2486C6E0CE01531B12DE6FC886C80@DB6PR0202MB2486.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(278428928389397);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231101)(944501161)(93006095)(93001095)(6041288)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(6072148)(201708071742011);
	SRVR:DB6PR0202MB2486; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0202MB2486; 
X-Forefront-PRVS: 0588B2BD96
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(346002)(376002)(366004)(39380400002)(396003)(39840400004)(199004)(189003)(48376002)(3846002)(6116002)(50466002)(53936002)(106356001)(6512007)(16586007)(5660300001)(316002)(4326008)(25786009)(2906002)(2361001)(7736002)(97736004)(2351001)(81156014)(8676002)(81166006)(8936002)(478600001)(74482002)(50226002)(305945005)(6666003)(6916009)(186003)(105586002)(26005)(16526019)(6486002)(1857600001)(52116002)(51416003)(66066001)(47776003)(33896004)(6506007)(386003)(36756003)(86362001)(68736007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2486;
	H:localhost.localdomain; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0202MB2486;
	23:fJHP0zZiUddc0hMP/TR/HKGZhk5SU/bfpq+vTkL?=
	=?us-ascii?Q?NCihZN+mMYLwxluhGksSv29Gchj+z+bKfbOYj8zEUV0t2oBx5PIrKdBEHGqK?=
	=?us-ascii?Q?TjxaFO0K1ZokJlRN7hHOZdtzojNjMZe7uiTXxG4P+CRjEUvvP8OtQO8Gt3e7?=
	=?us-ascii?Q?XFSLKln4KavGTE7Y9tfi2kf5TtgGesjBLXZJNUwmkHjwlzmoX0ezXW7X2/VS?=
	=?us-ascii?Q?k+P9tGZdKLy5ePVgV5eCQMa05oOBdD0BDZ0DdyJt8ErpHMu/TytVn6xT/ogH?=
	=?us-ascii?Q?XLWby601XFnSCnxl1SDdU/Afz2X1ELjVa0gKo1E/RDklFtttWgjvyMkt9GkE?=
	=?us-ascii?Q?/ssyVdROSEnfnwERRT9cn+m5bqugAcsg89MkqE5+ypYv0IMg7gZ/uCxTQOwe?=
	=?us-ascii?Q?+yYGxTxgqKXIpD8ewoLo1UpA/m0uMya2lr47/qR3D3YrRrNk189dRE0A5Hxk?=
	=?us-ascii?Q?Y/++ASQTB/6dG7I84HqO0G/q1RtUEY+apaBsjzyzHxVfLO+mdTdNyJOYgi/Q?=
	=?us-ascii?Q?6C7omJAoAgimJdUn6+bO843xtMw+9Zb39sXMvR932Ud2Thvmv+yw/dwtBOWJ?=
	=?us-ascii?Q?20zdy11r+wqNrSHUVAbQ12ATUisWB24Oc9+vgzVxjTOCkDV9xYlHlEbHTb2j?=
	=?us-ascii?Q?dFfk6f+im+yvqBlqHIuLQvPBEbI8JG17bwGjIiHlfo//KIvQX1IcT+up2Y0f?=
	=?us-ascii?Q?Qd5tzPDq5mhhbZxlSfBvcr75H2rrAnppZpMleQFUYI9iBIAEda2ppVCCTQ/4?=
	=?us-ascii?Q?LmSvc09mNkSHzHXMLFPjbVrGPU9TGnsSL+eOBELeFgAXWJ4Dje37rP/9v/K9?=
	=?us-ascii?Q?bTJ4RXMRNCeQYQX+Gp80MWqfrwJsl7JfA1LIfVOnoNFK8jct96Ms61qDgtUZ?=
	=?us-ascii?Q?7MW2+UjIEzfISDw9W+s/+z4jw5rrm6wT+S/7CK0EQtbeKlQYJMPq+I9xhG/5?=
	=?us-ascii?Q?M4t75vOfOuxxPXPE6rf+dtWlgBNl0MhINIWPgQWSwNzp0SEXl8oHTWtkA2mx?=
	=?us-ascii?Q?hx6+z3PJb8BlvQyzGxieET7PgWCIF5vWxX8vNZ2KcdFM7BgnVUHpCmhCKZjP?=
	=?us-ascii?Q?o23fK4h6/yyXSm7eaZ2MpWv8tu2MxkPbKCP5vI/WEAKIeS9p/ckNGx4Ui0uu?=
	=?us-ascii?Q?zf/AAsn5g1hnY08bUJFa3HmKqQd+niSVd4pHVkJS7W1/5s9xDkKbm4gVNaYz?=
	=?us-ascii?Q?iKS66o9xdH3jv/wE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2486;
	6:KAu9jQ4aJg26xwJmIb6WsOhGjMFMIKKnCM+pVT4nQStHbv5EQeN2bYjZ99tEN0TshgfeX2byQi4HVsxjZQXDETbuKprdM1lndo1XqNNg9TImUyjCBS7okpFWeRvX/xo8CpWy5mvdPuMOlohl4muELmUH0AFiqVGyR6iha0KMi0e1wzfZrTPWfC43Pu7zGusAfdR293opzNkN1m4CMAiylxbt5WeEK6nffkteT11ajUHRBtUrd27wrH1IutkcmIDnUiuq2WdPXNwk0Bgjp9Skq0LMOWUtt/NvASeFTyIa94dzn7gCxUf+q3STSypPrXah/dD3PD+0k5jdsiGmEThBNsq5bpymBXEyoAqfnduhFD0=;
	5:Bv/Abdc2TTEfLPCjFomlpFTJmQFijkS/6inyeP1Z3inaF2hTSVOVcwPaCjZLh1L9Fwk1lmpaoRIUHPggGbn0DgXxHOgdqi9UIYvW9wC8+ANAXYrqLv+nXkvq/RMnOegKqreinl4ftA7YzyJOZ7D0T2KX9XdLwoFvbTCjE181HoI=;
	24:c5dNxUm5DPTS7tAZ8U+u2llVMC5Yuay4gRmoGsJEMDNr94doHWzTrWass51DxOc0P8JxRsw8ihG4TqbUf1B3UhOk+cUDsC2/gNlD+ccAd5Q=;
	7:spRnuC6WkCrNA0km/DO2tJjx67M/PqmAmuLCKlU7+O30jnMttDngMFokcnLUr3MszF3e+fwbF/tgUr1xm9hOFlVN/uiEzF0pFa2r/UQprGoucBiSoyc5rzef6j4tUO9gfxJdIX0UgmGBvSWWNkIIy33a00EQEsAT/ltW+10ubpcXVjvyfPNl2gf4VBxoxKAjbw/RETNIP02iBg/t3hi5icsz13G5sat5mOC6pBjrPn53rN3nv0Aqd+J1Ec0wQazs
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2018 08:53:50.4825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7108b09-0ccd-4dfe-23d1-08d577764c95
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2486
Subject: [meta-qt5][PATCH v2] qtbase: add a config option to optimize for size
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
X-List-Received-Date: Mon, 19 Feb 2018 09:26:05 -0000
Content-Type: text/plain

The '-optimize-size' option would enable the compiler to optimize
for size instead of speed. If the global compiler option already
included '-Os', this option would be enabled by default.

It would affect the whole Qt libraries and Qt applications as well.
This feature is available in Qt 5.9+.

Signed-off-by: Kwangsub Kim <kwangsub.kim@qt.io>
---
 recipes-qt/qt5/qtbase_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 4f3ade2..208a755 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -147,6 +147,9 @@ PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
 PACKAGECONFIG[libproxy] = "-libproxy,-no-libproxy,libproxy"
 PACKAGECONFIG[libinput] = "-libinput,-no-libinput,libinput"
 PACKAGECONFIG[journald] = "-journald,-no-journald,systemd"
+PACKAGECONFIG[optimize-size] = "-optimize-size,${QT_DEFAULT_OPTIMIZATION_FOR_SIZE}"
+
+QT_DEFAULT_OPTIMIZATION_FOR_SIZE = "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Os', '-optimize-size', '', d)}"
 
 QT_CONFIG_FLAGS_GOLD = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-use-gold-linker', '-no-use-gold-linker', d)}"
 QT_CONFIG_FLAGS += " \
-- 
2.7.4


