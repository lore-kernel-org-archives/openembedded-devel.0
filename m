Return-Path: <mikko.gronoff@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0137.outbound.protection.outlook.com [104.47.2.137])
	by mail.openembedded.org (Postfix) with ESMTP id 741EA789AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 16:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3f8goT/6cCuQg5WwoYuGqlHJY03vLVs+YiDJD2i3vqA=;
	b=eNNoz5JbJPJSOO2mUPHPfYAYjX9onBUZ4w16rW5gAdmq04hKPYJqpq+zQ9853eRsm6UchFtjyi/IX3Hs9VOZyT6owXhyODs7+Y3IRVitABKNQB45/cJfNuJR6EarbTp/1RYbymwe5QC1sysPxRI2jmslkY9tqaGI85WgFGntxZU=
Received: from qt.intra.qt (192.89.120.53) by
	DB6PR0202MB2760.eurprd02.prod.outlook.com (2603:10a6:4:a8::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.548.13;
	Fri, 2 Mar 2018 10:45:34 +0000
From: Mikko Gronoff <mikko.gronoff@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:45:24 +0200
Message-Id: <1519987524-4045-1-git-send-email-mikko.gronoff@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM0PR0102CA0048.eurprd01.prod.exchangelabs.com
	(2603:10a6:208::25) To DB6PR0202MB2760.eurprd02.prod.outlook.com
	(2603:10a6:4:a8::18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 186c0cb7-3e67-4e56-8137-08d5802aba41
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:DB6PR0202MB2760; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2760;
	3:pqGLUqcFK0Z3VAHAV+WyeVb6ZN7hv3ekGfMyrv2Xm/qNZFdjmM3NrAn3P27kKI+Zn3Xty7cOiDVNVfnXzAUQPh6jLjdSWDzx7diLcOW1uI0d+sR1BHnNcPuRCbBI+IX0AWdVrlZmCzj0Q91t41n66lIs5bf3Vm/ELbZze/pKcDY1WIgWQKtfDXShXAG+VPVKj2e9gayHy64xtMZoyC0KjhdnBiAMPDFJ7jx/GsDaQfvIILIYRejt9lkBHjHKUdiC;
	25:YDB4XqR4qzhp2I926m9RBRH6JeU8sllS9FM88Ng7PypVfvk2FsXlbtfMtkxwdMdLlNH5IuMxZxQq5bq/mttT0SgA7H1Hg5T/+bCWs9YO1nwm0ByVG+XQG44YoIcOHWrsIcq1zz3MSqYh1I1yY6zOxT8gzqgfOv3Q9H3/m7KfHJX0Ww9l8WqRwy+7KZrU+BiGxyao7OCn1rt5S/Mlqkyck5Tao4PjpiwktnyC95r9nTAay/rdg0llvEbbDQufWuZZ7ELvFi+IeGDDTMzfoi69f7OiE7BmlXt9NDYmed6P/eooV+C+Rma7qx1+UxcjgX5NVZqmVaD/hYtGuFSUDRlnrw==;
	31:gATk9pLWPvy4ivz8sFlcjQsOjNJFXF8HbmIw8tm19R7NYTf0mOILqU0sTrpK7eD0r+5o3gbXw9+LiNkN4GfTV8OSW4lZaQRS0yUA5WbSsaDIo3SBzIO1nCeOuZVdFtOmXKAtt20q+pgmuiWx95nncFHjzGlQiOijB85ynxmD5c3od3Zd9z7PqFvnly/jmbxeIkWkp2IKDguANPFrolusbyMdo+BMrgUkJfAgUl2N6oA=
X-MS-TrafficTypeDiagnostic: DB6PR0202MB2760:
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2760;
	20:Xd2tNXQz8xOa4+oXOS/rVmMT7UL1zeBz1NjYf7vX0OXX81+AbRSN1XEh6gAKsYTiG0x1IWFvCszDJhaD9A7uLvRdKi6LWtDVbjzedSilWYNX2EOS+nHTIvvLjeY3QL4okNx53mpbcM/sQMHd7e9yXu6nEwjzTKhERjpqgmydreDA0ns2VYraQldldkJGXy0zqElhc1gtWI+Cz8e6ypqZ+60LvUAAqNL2sgXMsCSCWMFxgGcb2IvHkDy9MWW5ifC3wXrzjsHd6T5Bqxu0+xKLdej5+Z6MFJWmiTqb9b0+I+FPZDsLo7F6nslIlSom4IwM/E4QP1eGL5XnohoPsi9OZMhIHWkmVLlNsbg0qALUFpC8fxwswaPNGnqrmm9jbN7NoFqhDHp/NCk35Mxv3R2wykqJXt9IiY3Eo+BvO2FM8I+YjWNE4bHHCULL5aGqr+oVvTGYaWHdqppaFFbHW2ZMgWwF1sAjpPxIMmZf2cl11Gf8SGeTZrIQKGUb8P70TKx/;
	4:fSWR/HS2W8OpojNtQ1nNtv31PNrZFZ4FMhc28vss6ygDnOrrX4iOJmZ3e8UjIe5bLaKtkyDLghdoOh2p/MHM1H9s/aZ4KpW3EI8IDo9WL8B9PX9y2+6k/zwt3QaTEPYSjpL3LW1PWn5QPp4ZhxUPzwnjrtXcJ3FPx/eWBZqq4REVT6qAhM/eUZgmiD9m53egb5l5s0hVshnU1wtublb07/6zp5FCJP9cafdXPdzYrr7de9mCelavS+YjilqjF8JYCPS/8tCo4RxrADlfNWDKgKGYQt1lVko3IEKv1Kn/hS5ZCbjsOl0aKsHjZwzUnA4e
X-Microsoft-Antispam-PRVS: <DB6PR0202MB2760B0552CA67AE875F0410DE9C50@DB6PR0202MB2760.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231220)(944501238)(6041288)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:DB6PR0202MB2760; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0202MB2760; 
X-Forefront-PRVS: 05991796DF
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(396003)(376002)(346002)(39380400002)(366004)(39850400004)(199004)(189003)(186003)(26005)(53416004)(16526019)(66066001)(6512007)(6346003)(53936002)(386003)(51416003)(59450400001)(47776003)(97736004)(106356001)(74482002)(33896004)(2351001)(16586007)(50466002)(316002)(478600001)(48376002)(52116002)(6506007)(5660300001)(2361001)(105586002)(6486002)(4326008)(25786009)(305945005)(36756003)(2906002)(8676002)(69596002)(575784001)(6916009)(7736002)(3846002)(68736007)(6116002)(81156014)(81166006)(50226002)(6666003)(86362001)(8936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2760; H:qt.intra.qt;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mikko.gronoff@qt.io; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0202MB2760;
	23:0wrfjqEm1Hm+0Mu5xHTpZdYqRN/8jNtWnIrT7bU?=
	=?us-ascii?Q?WYO/H544U1EH/SsvNJGru2M1Kp/uDqWPgVPN8PptbZJonAt/LxBC2GYgg7Kt?=
	=?us-ascii?Q?0lNuWASdJGUPakkIcJRU2rH5GKZFtET9h1Kl+/qNpLx8rrGH1ZNcGHrCensg?=
	=?us-ascii?Q?37eMJMtvnqRqjiKqcIxny7YVyLrNvg5iINZBlhr/bvF1A4B/SSVbBWaKNIzS?=
	=?us-ascii?Q?fb90pzbNchjGA9tInIzZc1HL65tPA1rs8c4a7WFBrn9cnlN7YsE9Dns9VVlf?=
	=?us-ascii?Q?rlbAAjFLP4ieLl0rBssn67mk72rBE8Zg4zmzE2qhze/yrpfW3f+s+2cdW8vz?=
	=?us-ascii?Q?Wx4nv4sjD6HaANametRzCEbuCkbFolgdEaWK5JY/7DSRo4WGZytyaAC4zj1t?=
	=?us-ascii?Q?MJ/Ax3qFvh5yZs1Ogd6yDSzKs3hrvtmSFwy1rLE+j7iZhR4363U1g4fe5TCv?=
	=?us-ascii?Q?2d/ChHahFqmxUCJtnD8FDz8TC7tiLgclEQYggN1lGQjW9u9RotHnshWjExJo?=
	=?us-ascii?Q?oHCZSjlZ+kz0BBZMH4iRu4vMlXKZqRsbJoceM94RY4g5R3WfUSfD8REz0FLw?=
	=?us-ascii?Q?M9pRSIrOcDJqW5nd3mLzp1vU46LhlzFABhujCFtfBKpn8RbEbsS/aLMfhUJB?=
	=?us-ascii?Q?7/5YT25kB3yGMTDfwRbWaom3qULCV+9mQ8Pbs1NbEhuxorevUUTSWY+qBbID?=
	=?us-ascii?Q?YWaleGgYYAMXXGx6E2Z09moysww3Vgp9wjDZsDdHID/JHfnxBVQVbVleIGHq?=
	=?us-ascii?Q?d5h6UuDKHnkAWpjRoA5B02rn7iyLg3OWSPRBV43FQQun0zEuQUqCOK2Hs+LO?=
	=?us-ascii?Q?WZxwDdGyMF1/BceJ9hM9DvWjnGKWwU/1iWJigH3EFvSq5Eorrx1bMbuMossM?=
	=?us-ascii?Q?0r86nxe8f/mRj6LIuFWr2qCSoCjiPHAlg/AWnZZe41+pAVAVzVkhVTCsgivw?=
	=?us-ascii?Q?X6SRE3HIfXXBnHaDD38jR/h9nNhLEio6qdgrd0ibWO1k0Jbj01D9J5K/NcMW?=
	=?us-ascii?Q?MYCDyolc+JAKsQOwUUK4O8ogg14JHWEO3BGerTJyJu3MGBcqtrVDE8gntKrL?=
	=?us-ascii?Q?liYLpVrrnO96fOAqYHQHSrldwIJtnYw7GVv0yfM87zRbBCJu2g/8YXGmJrrG?=
	=?us-ascii?Q?PVMmTkWNHg2lnkXrxcqjdWerWdF43O9eM7Tmvja2V1wmjgelG09OsVepYIqL?=
	=?us-ascii?Q?0dJpLnWCUBWL1b1f0AecsBT8eljIOvzEUvCjqtnOrsckiPzYreYGUH01Pjfj?=
	=?us-ascii?Q?Bv5KfSTTSYJsTNzU+TRM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2760;
	6:Kb40nCqAG9PsVlzG20h6t+0luhAFnse3VAWFbIVBZP1r/jwWeFKGSFbQU/Yyv5hREul0sJtEHGh8hjUy7ZHfVIBxfi+UW9TabpeXwR6WZ/H7LafXyS9hl4qvl2Yg+gYwuXM6sWaVH5qoJegNpwxWcTBrJwzEWeuGJeJOxFw+kKWWxTDu8j9SNyxolOpvMqhJ4J5IJXGm8ZZXGITBcF8KP/QBEEu7eoyGUa5H3kUGKr6fL4A532iGWHfPbObAKNkESvWhYKiKXK7mSUeDnMHiSio8xmU5hxERHxIoFlJn8Z7NY/sgAv3EG2CMR0tbNsKBMQJ+qatISXr4YoKkHsc0V323JdudgRHag65rrH98khs=;
	5:JuL9fxBaEFjo/GX4XLHPWxX5M0scgeuypEOh7iGgEyQC/K1UiCV59HqfZoaNVMKDps0AyLzzeHwVlFrmUuIg31VLHjU0J31slXcovAmYGZR/q0fENI09Ojtf/+WNb3oluoBzEiEeA/wvLm60z9oNI1ViZP9rxWPlMVdl/cwervw=;
	24:/3KyFz0Jd1ZXf+aAaDwMrcli+AuIGyWfnfvHLjIcGZIgks/KDuUIpeDl6WZdL/go7avTmwJWq3k3+PlPRNIswCVv0BHXY8rViQ0BWwZVZ8o=;
	7:k8BoJwMJf8d7ayFn/ioFkTa3/fODFhekQAxNWvAyWdTeCUafzPT36PHXvHa3juv+8ngYvJkvqBd1E2JeNAAK5tEUifsjVgSLB6U3O8kpBdOBPeTE0inWjHQw6EVJRnQqsBjhOZf8vlUU1Q0aejLTNmetABxIyhiaAp3dPfH3oHa96bFH55ZHc8ebm+AB8+jpD7Ke1DFAb6ST0n/OGgJCkWb+DWe03lYxahZXosoRazJLoNF2AJOBpYHCjd5U0yQz
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2018 10:45:34.1973 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 186c0cb7-3e67-4e56-8137-08d5802aba41
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2760
Subject: [meta-qt5][PATCH] Change default SRC_URI from github.com to code.qt.io
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
X-List-Received-Date: Fri, 02 Mar 2018 16:19:46 -0000
Content-Type: text/plain

There have been issues in the past with github qt mirror being out of
sync with code.qt.io for certain module repos. Right now there's been a
several days long break in update cycle for seemingly all the qt
modules where content has not been pushed to the github mirror. Change
the default SRC_URI to the more reliable code.qt.io.

Change-Id: Ic7d3b9a82ef0ae502e99a8516ef78ca09250fd1e
Signed-off-by: Mikko Gronoff <mikko.gronoff@qt.io>
Reviewed-by: Samuli Piippo <samuli.piippo@qt.io>
---
 conf/layer.conf                              | 4 ++--
 recipes-qt/examples/qt5everywheredemo_1.0.bb | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 7751ce2..f540710 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -33,7 +33,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 
 IMAGE_FEATURES[validitems] += "qtcreator-debug"
 
-QT_GIT ?= "git://github.com/qt"
-QT_LABS_GIT ?= "git://github.com/qt-labs"
+QT_GIT_PROJECT ?= "qt"
+QT_GIT ?= "git://code.qt.io/${QT_GIT_PROJECT}"
 QT_GIT_PROTOCOL ?= "git"
 QT_EDITION ?= "opensource"
diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/examples/qt5everywheredemo_1.0.bb
index dfbe4ae..36d57f1 100644
--- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
+++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://qml/QtDemo/main.qml;endline=39;md5=7d80863906a4bc8ffc
 DEPENDS = "qtdeclarative qtxmlpatterns qtgraphicaleffects qtsvg qtmultimedia"
 
 SRCREV = "35d72a2eba7456a2efc5eb8b77afbc00f69ba0ac"
-SRC_URI = "${QT_LABS_GIT}/qt-labs-qt5-everywhere-demo"
+QT_GIT_PROJECT = "qt-labs"
+SRC_URI = "${QT_GIT}/qt5-everywhere-demo"
 
 S = "${WORKDIR}/git/QtDemo"
 
-- 
2.7.4


