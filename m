Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE4AC76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 10:20:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.62596.1679998817216222918
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Mar 2023 03:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BX9v/E+f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3451f6c416=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SA0l96004522
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 03:20:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=JpsomowcMN6v3d3DRmYdzx9RsJEA9+Qd3faUW6Jhz7w=;
 b=BX9v/E+fDI9DskqnPHMO+kQ0jbTrAFgqcIplYfB2yLrisfTacAkleAESSloM+c3g/k39
 zi7SA5sfmXFYo+MUn5ujRsLe9c96HVVLhl90QHY3QbKImLWFRRig1oUuXcYKg+aD0foT
 5MdSmtjpXJ3KpPS9xnu/fU7/6wVw/AuvxHA+V+uoyWGzK8MA/lM3+mD7FR8FECWF7RE6
 jXnbMZxlKr0Zj8+qYHd61SoWKJiwsKX8QyDJRoKF+ZDekwWod2G5OaWVUAewOQj4cIZn
 fe+diFUD2Y4kNWAUGRQyD8GEAu5lX2hM6Y3r7Fp2D9gVI50NlxKaKMfKIuxtoG0TAAE+ Vw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phv85tx0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 03:20:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5wiDHjxmRHSQaCzpa4s/KRGM/2sjBUH/iDx6pe1D4mkBpzBeYvt7IQFUmRQDW5dhcYcmyK3pFfojAsft4mq9RH9etE3IZNITRz8lQ1xYcauqBmKCYG87Nq7m1i1WgImPtLGIdCVFoCC9QClMIDs/+ZfUYIfWTzwLWLvM7d4cob3GfQQHB9FGTDgVHJ6uKOIsdgfEwDVirOOCXLgwv3FDaDp1iAZzwc4DSnnCqTVSMVs24RCTFG0av01kPODkdD/jTJLLYs+nUVHLUSvR1N7Ef07pQH3HXxoK+khckn7MKD4PvWDY0woHRbeDPPNIg9FG/3mw/WRbslly+XVTnf/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpsomowcMN6v3d3DRmYdzx9RsJEA9+Qd3faUW6Jhz7w=;
 b=OLsDXfyhqMGO86JjbKbrucKvZ+U5tEi3/UWhCBB0P1Exp+EiwlU1Rs0brgyOwoqbH8lrO7zv9cVJMieutUssazIgs5Mu3TPzWjmu2re/CbAGL19ph8CwAz4Wd+EVm8G+i35Zt9C4VVe64MVF9Y8se7cJlE9qMnlX7aQAU7iOHLZhLH1iA+akS80FYo4VlKYkxjbWSOc7mmyD3teX+gNpg40mVAD1G7UWRTfFe1Oo/E3gB/6z2cGjZkmZqplcDiXKqWfyKnZl4i/PqS01VJ9r+BZ1PQh3SE0BowDZx62bzBuhq08sRKFuSo/vwnsAugAkVH8KsBkYfEmSc159qWLzNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17)
 by DS0PR11MB8069.namprd11.prod.outlook.com (2603:10b6:8:12c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 10:20:14 +0000
Received: from MW5PR11MB5857.namprd11.prod.outlook.com
 ([fe80::d944:1a15:2e9a:8b29]) by MW5PR11MB5857.namprd11.prod.outlook.com
 ([fe80::d944:1a15:2e9a:8b29%4]) with mapi id 15.20.6222.028; Tue, 28 Mar 2023
 10:20:13 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-betamax: fix ptest failture of fixture and record modes
Date: Tue, 28 Mar 2023 03:20:07 -0700
Message-Id: <20230328102007.1218084-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0029.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::42) To MW5PR11MB5857.namprd11.prod.outlook.com
 (2603:10b6:303:19d::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5857:EE_|DS0PR11MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 26026598-d9e1-4aeb-d954-08db2f7604de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IIjjY7f44IC1eQoSwW5jfWDa59aOKqMEUgfWXGhGHK0ttT63VIbSgO+3MB5IqCIm2M4t6Hn9PL3NO7mXJ3+cYywQpb069WtqsMSD1eyyq+Zti8ov2DXvCNe5IaT4Fd+tz7x1fkeaLyNotfOIFkQHb/ZIpJErJRBP4Ns19EW/oPqzzpBIiSGslTctpO6ta5kSqpPbVkeeixmRurBkm8DfgwiQt3L/VEQ4kS22+E4TckFGWRHs6I2wko6frmj0Fj1VLY3DvqPSSbioS0U4RMWvVbtE7BOEs9iverU+YyRtt4AXp/ih1JWKd4CKEYM1JVwS+hiskn6puVs59Mjfv4pd5HF4ZJqJR+mjHI5M2DhheZc5AXOkxAAnRYSCD/FXszGXPUCF9+DSyTIYD2fjRn22B4IBPd9twJoDw22AAGuwOunPITn066hHHqj4pHcG4WSebT+udtykUy2lyiB+l1NUNBfn7jo9dyEljChkua65FyDwDhj2nvcPMj+OzQ3C2LNDzJMpFszq0LL8Enf2wyGJoCpZHI4kj8uYs6eFw6vi3fesWWObXBhTlTsKl7trFmW9V40XwAoJ0oHN8dO0KpgdxbxYBr416Cyctb91MPPErqY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5857.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(376002)(366004)(136003)(346002)(451199021)(316002)(478600001)(8936002)(86362001)(36756003)(5660300002)(30864003)(38350700002)(2906002)(38100700002)(66476007)(44832011)(6916009)(8676002)(66946007)(66556008)(41300700001)(1076003)(6506007)(6666004)(186003)(26005)(6512007)(2616005)(83380400001)(52116002)(966005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+SY6RKfqj+bueiQxpaB0LbKAMAT9WRK54WbelVGJKuPEu9RTUv4yfSK6bXQZ?=
 =?us-ascii?Q?1Rr5opVN10sw5BF5OSFPLq4HQWe0wP0//iuNk2ARoNWyh33EizWNaPXTnp+f?=
 =?us-ascii?Q?XIPkxS5l8HjWZq5r3wHgzH4hu57WuHu/0eygHtIJsbwxBRJX7GEOdlLZ0QQM?=
 =?us-ascii?Q?a7i+F4PEiO0v62CCw3wVS91+WQYxFjT8qQNDW74WjLXziwW7HViNEAiCamFF?=
 =?us-ascii?Q?FTQFa081dLqE/xgWJIcl/1AYZWo5WXGHbLRWoN4k8Furmat6V23KGqyQdykb?=
 =?us-ascii?Q?ppQpTlUu+7kIVsRtMuMf8/XVWCjYgFgwl1kRB0K6AjMjwmTZPOdS1cudh0hS?=
 =?us-ascii?Q?/heLHY0ENK0wTNNRbJFJBUbaTto/fEjElk0nLyLGzzlQF/Re7jR9j5drZIJh?=
 =?us-ascii?Q?WC+LmSHxRGnMzQ4Ey9HM6iTPdRwh3f6aYcoDefqIPhTxo3OpUyXPIdvhHe1r?=
 =?us-ascii?Q?MGIuZDY8zb175qO0o0R04t0y7FoO1JaUfq8QY1pYL3ZhQAKth4U7IccMDB7+?=
 =?us-ascii?Q?IiVAXnnDfDUkjQ/K1E/DEs70bfHBkm5B9lAnCpcGFkO7ERfdO7HV9mXTEbS+?=
 =?us-ascii?Q?RbCW28/p7RaftFWEeKH3kq+WyNwozsxrNI55dgFuGQOYYSCzus4JVutmoAOT?=
 =?us-ascii?Q?09H60exqhFUwbRvS5PNBiD/z9JAdvWIqLoQioGwdPA1bP2mfVr3/PwTCeEHA?=
 =?us-ascii?Q?CVUJZacPah+TlEqLOpcAA14BmjY2FzFfOlymFBGCJJ8Yld7CW+S4sSuAQm6a?=
 =?us-ascii?Q?i3610Yvl6PsBqfk4ZebOwNlrh+1/dAbDSOUMON9Lits+1jhVgyFd63MMZzbn?=
 =?us-ascii?Q?IlM5Wq3MjObwKKEmzAOYm0ivzEwQ3wh25W59KHklzjLP0GGNcAbaC7Wk5dsA?=
 =?us-ascii?Q?zUODa6xe+bslpbVpXje0pW+tvALoTdh/tr6U4toZY8TUHl/xK0tITIKsQQb7?=
 =?us-ascii?Q?tqqEYrR/fObZ6X66j35giNTAuiX0xM6cUv+V9iXxEFdygBWs/ZMh802UceM1?=
 =?us-ascii?Q?aNL1Azd0dxHc67SdhKfWJPbO7JF/qHlf6RFW/IQsgbxcV7ok0nHvBCtuqru8?=
 =?us-ascii?Q?6d3F0MExR+CJ0p+GZRyD142oSqV1Rq7NiXhnBWIXz8frtVn037ntHPPuOGXl?=
 =?us-ascii?Q?FjnycINRve1H/X0CvOwFJWtIC0aIOm2hyZ7svsMEf7JOUQpIe7748g63dfGq?=
 =?us-ascii?Q?tARHYwsi7IruK94RfnW30aRats9mDIaeHsBSlbHmwkhOGFZvQGFRErBarh+w?=
 =?us-ascii?Q?HYATVXfYITfJtOzzOowyRkFvCPFcC3TIO7uHzzAoUYa5gIE7pzgDLIIho7ZJ?=
 =?us-ascii?Q?fq9/KF7qZzhm1f0VZKAIdU9+7IWnpbErYmUFvHpy2E1mUR2cLt2vLTYdG86m?=
 =?us-ascii?Q?rn3qvsajG16QREQ8q7xUCKgAlRvEpj73K3HVZmtZMggETAfV5Iy+iK4kkLtq?=
 =?us-ascii?Q?2KGBY/XOMi3sVbZJ9spBBsb9UsUB5XPiXjd7Et0UQUyLzMv1CIi96kbEQdRp?=
 =?us-ascii?Q?DaNrmUsZ10i9myaMKtO6RlRQI4MJSXgUT7WRZv0FwIv2VFZdbmyCWRB1bFUJ?=
 =?us-ascii?Q?+0lHlY9FX9Gj0uHz5lhNmHklC2zVShfFSgYAZHfcGvD7dv9ZNBDyF/SOdbLr?=
 =?us-ascii?Q?Jg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26026598-d9e1-4aeb-d954-08db2f7604de
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5857.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 10:20:13.8773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBzzJI/jrstiZiky0kX5KqkvhDmcj3cSE9p3GLeera+KlYBfvwJQt05xSDUsYof9ZZjLWA29qx5Es4SiwI9ujC0ukQ20xlCvtGDZRAWvwMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8069
X-Proofpoint-GUID: ObUte3zedZrdW0b20sZJ5G6SJrqYDSYS
X-Proofpoint-ORIG-GUID: ObUte3zedZrdW0b20sZJ5G6SJrqYDSYS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 10:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101804

In betamax fixtures and recorde_modes ptest are failing due to
the deprecation of fixture usage and the httpbin.org service.
Drop these ptests in meta-oe, until there is a suitable solution
to fix this failure.

Validation:
Enable ptest and add python3-betamax into IMAGE_INSTALL
$runqemu ...
$cd /usr/[lib/lib64]/python3-betamax/ptest
$./run-ptest
ALL ptests PASS.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...op-ptests-fixtures-and-recorde_modes.patch | 333 ++++++++++++++++++
 .../python/python3-betamax_0.8.1.bb           |   1 +
 2 files changed, 334 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-betamax/0001-Drop-ptests-fixtures-and-recorde_modes.patch

diff --git a/meta-python/recipes-devtools/python/python3-betamax/0001-Drop-ptests-fixtures-and-recorde_modes.patch b/meta-python/recipes-devtools/python/python3-betamax/0001-Drop-ptests-fixtures-and-recorde_modes.patch
new file mode 100644
index 000000000..7adcb6832
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-betamax/0001-Drop-ptests-fixtures-and-recorde_modes.patch
@@ -0,0 +1,333 @@
+From 0e0b63ae80df5d7849b2e1c5ab9a668e8378b5e8 Mon Sep 17 00:00:00 2001
+From: Zhixiong Chi <zhixiong.chi@windriver.com>
+Date: Tue, 28 Mar 2023 06:05:45 +0000
+Subject: [PATCH] Drop ptests fixtures and recorde_modes
+
+The usage of fixture in test_fixtures has been deprecated.
+See https://docs.pytest.org/en/stable/explanation/fixtures.html and
+https://docs.pytest.org/en/stable/deprecations.html#calling-fixtures-directly
+for more information about fixtures.
+Meanwhile the test_record_modes relies on httpbin.org which has been sold and
+re-sold several times, and it adds X-Amzn-Trace-Id header that can possibly
+diff for each request.
+It leads to ptest failure, so drop it now until we find the solution.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ tests/integration/test_fixtures.py     |  60 -----------
+ tests/integration/test_record_modes.py | 132 -------------------------
+ tests/unit/test_fixtures.py            |  94 ------------------
+ 3 files changed, 286 deletions(-)
+ delete mode 100644 tests/integration/test_fixtures.py
+ delete mode 100644 tests/integration/test_record_modes.py
+ delete mode 100644 tests/unit/test_fixtures.py
+
+diff --git a/tests/integration/test_fixtures.py b/tests/integration/test_fixtures.py
+deleted file mode 100644
+index fc3d1e7..0000000
+--- a/tests/integration/test_fixtures.py
++++ /dev/null
+@@ -1,60 +0,0 @@
+-import os.path
+-
+-import pytest
+-
+-
+-@pytest.mark.usefixtures('betamax_session')
+-class TestPyTestFixtures:
+-    @pytest.fixture(autouse=True)
+-    def setup(self, request):
+-        """After test hook to assert everything."""
+-        def finalizer():
+-            test_dir = os.path.abspath('.')
+-            cassette_name = ('tests.integration.test_fixtures.'  # Module name
+-                             'TestPyTestFixtures.'  # Class name
+-                             'test_pytest_fixture'  # Test function name
+-                             '.json')
+-            file_name = os.path.join(test_dir, 'tests', 'cassettes',
+-                                     cassette_name)
+-            assert os.path.exists(file_name) is True
+-
+-        request.addfinalizer(finalizer)
+-
+-    def test_pytest_fixture(self, betamax_session):
+-        """Exercise the fixture itself."""
+-        resp = betamax_session.get('https://httpbin.org/get')
+-        assert resp.ok
+-
+-
+-@pytest.mark.usefixtures('betamax_parametrized_session')
+-class TestPyTestParametrizedFixtures:
+-    @pytest.fixture(autouse=True)
+-    def setup(self, request):
+-        """After test hook to assert everything."""
+-        def finalizer():
+-            test_dir = os.path.abspath('.')
+-            cassette_name = ('tests.integration.test_fixtures.'  # Module name
+-                             'TestPyTestParametrizedFixtures.'  # Class name
+-                             'test_pytest_fixture'  # Test function name
+-                             '[https---httpbin.org-get]'  # Parameter
+-                             '.json')
+-            file_name = os.path.join(test_dir, 'tests', 'cassettes',
+-                                     cassette_name)
+-            assert os.path.exists(file_name) is True
+-
+-        request.addfinalizer(finalizer)
+-
+-    @pytest.mark.parametrize('url', ('https://httpbin.org/get',))
+-    def test_pytest_fixture(self, betamax_parametrized_session, url):
+-        """Exercise the fixture itself."""
+-        resp = betamax_parametrized_session.get(url)
+-        assert resp.ok
+-
+-
+-@pytest.mark.parametrize('problematic_arg', [r'aaa\bbb', 'ccc:ddd', 'eee*fff'])
+-def test_pytest_parametrize_with_filesystem_problematic_chars(
+-        betamax_parametrized_session, problematic_arg):
+-    """
+-    Exercice parametrized args containing characters which might cause
+-    problems when getting translated into file names. """
+-    assert True
+diff --git a/tests/integration/test_record_modes.py b/tests/integration/test_record_modes.py
+deleted file mode 100644
+index 58c8846..0000000
+--- a/tests/integration/test_record_modes.py
++++ /dev/null
+@@ -1,132 +0,0 @@
+-from betamax import Betamax, BetamaxError
+-
+-from tests.integration.helper import IntegrationHelper
+-
+-
+-class TestRecordOnce(IntegrationHelper):
+-    def test_records_new_interaction(self):
+-        s = self.session
+-        with Betamax(s).use_cassette('test_record_once') as betamax:
+-            self.cassette_path = betamax.current_cassette.cassette_path
+-            assert betamax.current_cassette.is_empty() is True
+-            r = s.get('http://httpbin.org/get')
+-            assert r.status_code == 200
+-            assert betamax.current_cassette.is_empty() is True
+-            assert betamax.current_cassette.interactions != []
+-
+-    def test_replays_response_from_cassette(self):
+-        s = self.session
+-        with Betamax(s).use_cassette('test_replays_response') as betamax:
+-            self.cassette_path = betamax.current_cassette.cassette_path
+-            assert betamax.current_cassette.is_empty() is True
+-            r0 = s.get('http://httpbin.org/get')
+-            assert r0.status_code == 200
+-            assert betamax.current_cassette.interactions != []
+-            assert len(betamax.current_cassette.interactions) == 1
+-            r1 = s.get('http://httpbin.org/get')
+-            assert len(betamax.current_cassette.interactions) == 2
+-            assert r1.status_code == 200
+-            r0_headers = r0.headers.copy()
+-            r0_headers.pop('Date')
+-            r0_headers.pop('Age', None)
+-            r0_headers.pop('X-Processed-Time', None)
+-            r1_headers = r1.headers.copy()
+-            r1_headers.pop('Date')
+-            r1_headers.pop('Age', None)
+-            r1_headers.pop('X-Processed-Time', None)
+-            # NOTE(sigmavirus24): This fails if the second request is
+-            # technically a second later. Ignoring the Date headers allows
+-            # this test to succeed.
+-            # NOTE(hroncok): httpbin.org added X-Processed-Time header that
+-            # can possibly differ (and often does)
+-            assert r0_headers == r1_headers
+-            assert r0.content == r1.content
+-
+-
+-class TestRecordNone(IntegrationHelper):
+-    def test_raises_exception_when_no_interactions_present(self):
+-        s = self.session
+-        with Betamax(s) as betamax:
+-            betamax.use_cassette('test', record='none')
+-            self.cassette_created = False
+-            assert betamax.current_cassette is not None
+-            self.assertRaises(BetamaxError, s.get, 'http://httpbin.org/get')
+-
+-    def test_record_none_does_not_create_cassettes(self):
+-        s = self.session
+-        with Betamax(s) as betamax:
+-            self.assertRaises(ValueError, betamax.use_cassette,
+-                              'test_record_none', record='none')
+-        self.cassette_created = False
+-
+-
+-class TestRecordNewEpisodes(IntegrationHelper):
+-    def setUp(self):
+-        super(TestRecordNewEpisodes, self).setUp()
+-        with Betamax(self.session).use_cassette('test_record_new'):
+-            self.session.get('http://httpbin.org/get')
+-            self.session.get('http://httpbin.org/redirect/2')
+-
+-    def test_records_new_events_with_existing_cassette(self):
+-        s = self.session
+-        opts = {'record': 'new_episodes'}
+-        with Betamax(s).use_cassette('test_record_new', **opts) as betamax:
+-            cassette = betamax.current_cassette
+-            self.cassette_path = cassette.cassette_path
+-            assert cassette.interactions != []
+-            assert len(cassette.interactions) == 4
+-            assert cassette.is_empty() is False
+-            s.get('https://httpbin.org/get')
+-            assert len(cassette.interactions) == 5
+-
+-        with Betamax(s).use_cassette('test_record_new') as betamax:
+-            cassette = betamax.current_cassette
+-            assert len(cassette.interactions) == 5
+-            r = s.get('https://httpbin.org/get')
+-            assert r.status_code == 200
+-
+-
+-class TestRecordNewEpisodesCreatesCassettes(IntegrationHelper):
+-    def test_creates_new_cassettes(self):
+-        recorder = Betamax(self.session)
+-        opts = {'record': 'new_episodes'}
+-        cassette_name = 'test_record_new_makes_new_cassettes'
+-        with recorder.use_cassette(cassette_name, **opts) as betamax:
+-            self.cassette_path = betamax.current_cassette.cassette_path
+-            self.session.get('https://httpbin.org/get')
+-
+-
+-class TestRecordAll(IntegrationHelper):
+-    def setUp(self):
+-        super(TestRecordAll, self).setUp()
+-        with Betamax(self.session).use_cassette('test_record_all'):
+-            self.session.get('http://httpbin.org/get')
+-            self.session.get('http://httpbin.org/redirect/2')
+-            self.session.get('http://httpbin.org/get')
+-
+-    def test_records_new_interactions(self):
+-        s = self.session
+-        opts = {'record': 'all'}
+-        with Betamax(s).use_cassette('test_record_all', **opts) as betamax:
+-            cassette = betamax.current_cassette
+-            self.cassette_path = cassette.cassette_path
+-            assert cassette.interactions != []
+-            assert len(cassette.interactions) == 5
+-            assert cassette.is_empty() is False
+-            s.post('http://httpbin.org/post', data={'foo': 'bar'})
+-            assert len(cassette.interactions) == 6
+-
+-        with Betamax(s).use_cassette('test_record_all') as betamax:
+-            assert len(betamax.current_cassette.interactions) == 6
+-
+-    def test_replaces_old_interactions(self):
+-        s = self.session
+-        opts = {'record': 'all'}
+-        with Betamax(s).use_cassette('test_record_all', **opts) as betamax:
+-            cassette = betamax.current_cassette
+-            self.cassette_path = cassette.cassette_path
+-            assert cassette.interactions != []
+-            assert len(cassette.interactions) == 5
+-            assert cassette.is_empty() is False
+-            s.get('http://httpbin.org/get')
+-            assert len(cassette.interactions) == 5
+diff --git a/tests/unit/test_fixtures.py b/tests/unit/test_fixtures.py
+deleted file mode 100644
+index 387d9ce..0000000
+--- a/tests/unit/test_fixtures.py
++++ /dev/null
+@@ -1,94 +0,0 @@
+-try:
+-    import unittest.mock as mock
+-except ImportError:
+-    import mock
+-
+-import pytest
+-import unittest
+-
+-import requests
+-
+-import betamax
+-from betamax.fixtures import pytest as pytest_fixture
+-from betamax.fixtures import unittest as unittest_fixture
+-
+-
+-class TestPyTestFixture(unittest.TestCase):
+-    def setUp(self):
+-        self.mocked_betamax = mock.MagicMock()
+-        self.patched_betamax = mock.patch.object(
+-            betamax.recorder, 'Betamax', return_value=self.mocked_betamax)
+-        self.patched_betamax.start()
+-
+-    def tearDown(self):
+-        self.patched_betamax.stop()
+-
+-    def test_adds_stop_as_a_finalizer(self):
+-        # Mock a pytest request object
+-        request = mock.MagicMock()
+-        request.cls = request.module = None
+-        request.function.__name__ = 'test'
+-
+-        pytest_fixture.betamax_recorder(request)
+-        assert request.addfinalizer.called is True
+-        request.addfinalizer.assert_called_once_with(self.mocked_betamax.stop)
+-
+-    def test_auto_starts_the_recorder(self):
+-        # Mock a pytest request object
+-        request = mock.MagicMock()
+-        request.cls = request.module = None
+-        request.function.__name__ = 'test'
+-
+-        pytest_fixture.betamax_recorder(request)
+-        self.mocked_betamax.start.assert_called_once_with()
+-
+-
+-class FakeBetamaxTestCase(unittest_fixture.BetamaxTestCase):
+-    def test_fake(self):
+-        pass
+-
+-
+-class TestUnittestFixture(unittest.TestCase):
+-    def setUp(self):
+-        self.mocked_betamax = mock.MagicMock()
+-        self.patched_betamax = mock.patch.object(
+-            betamax.recorder, 'Betamax', return_value=self.mocked_betamax)
+-        self.betamax = self.patched_betamax.start()
+-        self.fixture = FakeBetamaxTestCase(methodName='test_fake')
+-
+-    def tearDown(self):
+-        self.patched_betamax.stop()
+-
+-    def test_setUp(self):
+-        self.fixture.setUp()
+-
+-        self.mocked_betamax.use_cassette.assert_called_once_with(
+-            'FakeBetamaxTestCase.test_fake'
+-        )
+-        self.mocked_betamax.start.assert_called_once_with()
+-
+-    def test_setUp_rejects_arbitrary_session_classes(self):
+-        self.fixture.SESSION_CLASS = object
+-
+-        with pytest.raises(AssertionError):
+-            self.fixture.setUp()
+-
+-    def test_setUp_accepts_session_subclasses(self):
+-        class TestSession(requests.Session):
+-            pass
+-
+-        self.fixture.SESSION_CLASS = TestSession
+-
+-        self.fixture.setUp()
+-
+-        assert self.betamax.called is True
+-        call_kwargs = self.betamax.call_args[-1]
+-        assert isinstance(call_kwargs['session'], TestSession)
+-
+-    def test_tearDown_calls_stop(self):
+-        recorder = mock.Mock()
+-        self.fixture.recorder = recorder
+-
+-        self.fixture.tearDown()
+-
+-        recorder.stop.assert_called_once_with()
+-- 
+2.35.5
+
diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
index 2caeb5afa..e3c5e7a3a 100644
--- a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61c15f0c146c5fb1a8ce8ba2f310d73c"
 
 SRC_URI += " \
         file://run-ptest \
+        file://0001-Drop-ptests-fixtures-and-recorde_modes.patch \
 "
 
 SRC_URI[md5sum] = "b8182d43a200fc126a3bf7555626f964"
-- 
2.35.5


