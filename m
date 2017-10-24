Return-Path: <alex.stewart@ni.com>
X-Greylist: delayed 1564 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Oct 2017 19:54:54 UTC
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 57A3F7197A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 19:54:54 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v9OJRHeR025812 for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 14:28:52 -0500
Received: from nam03-dm3-obe.outbound.protection.outlook.com
	(mail-dm3nam03lp0017.outbound.protection.outlook.com [207.46.163.17])
	by mx0b-00010702.pphosted.com with ESMTP id 2dr36wa5xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 14:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2c/LuJKItANv3UtLI8EiS2JjZSKNOXGkJAGerOmVbQI=;
	b=kVBdCDvVceilEytWpZHtDFqFW+kxcDql0Uk5FY57MQqBkwXrdE34kY30qXhlGRjwdrCAcRCy/9EKtBRK5Jsp8dwU+G1Gp867EAuDdgqxjTl+W5hC/XZnQrJfjHRQ1NVcy5Pn9yRFA6HTgAsfrSrWHoN0Lxd2ZVmaxUikEHBnSSk=
Received: from rtosams.amer.corp.natinst.com (130.164.62.200) by
	DM2PR0401MB0973.namprd04.prod.outlook.com (2a01:111:e400:3c0f::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.156.4;
	Tue, 24 Oct 2017 19:28:49 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Oct 2017 14:27:54 -0500
Message-Id: <20171024192754.19623-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [130.164.62.200]
X-ClientProxiedBy: BN6PR14CA0033.namprd14.prod.outlook.com
	(2603:10b6:404:13f::19) To DM2PR0401MB0973.namprd04.prod.outlook.com
	(2a01:111:e400:3c0f::11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e018a04-b54c-4139-13fc-08d51b157421
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DM2PR0401MB0973; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0973;
	3:yS81jbRzGUYWGFBliG552tDnbT9zCKnp9RbAC538U9LSL8P6AzrUF9VscMxAb2ikNc6M1nKfKKknHGPA3AEmDW/rW1RgU5RYXiVCkXm8HJyv1C5scZo4V3Yr9FDrVdysC4zjkWO6KmoXf+/RIycPjVrw067vgUfK4jtX+C03EYrtzQstDvgQMf9cpMuPS+PvCfEDhzvq1R2nA7DGnVREQbcTa68bLBeB+CDPV9MBTbMR2X8N8xsKAfCHjUsSca0+;
	25:/KChwpTV+2/+LbFhb2urqcRac8d0dTXBK6JLTlrW/FFeB1wxD/Rmd1JapThUvv1HFOcyCx/0IICQqLLEL6zrL53yDB0V+hP9ij+2QB7wFx7b4pewIuJaDEYyK1EqpWyJZfwLixsm0vx7r9+z4yi5/Lp3Xv+KJWXVCEq7GuOZMorvgd5FHfGs6Ir8cBkSZEcW67EofEbHPJkiYFcPfKZqDY5pOrYVPWmXO71mFHClXtGvQuJvOR5bJCY54abrL/ITReYCNGbEeK3cruSetBHXefN7lIfYLlBWj6vSM1c5RhBC1CxDk58xBwj4Mi9joknEF+Bx8likJn0fu1ljtGpBQA==;
	31:vM1ibvtTPtj9LhxkmyvR86AJOYAzNNH/y2njALMJtlyuKCrP+wr9H/thw+UU5/dGHXzscG9y+PiLY+HCw57BYwvn0uwYd1FW0915p9grBa6hWC8Tp1i8qH9IwsjL0balpp7VocVSRMaL5Vk1HuRIgMGGGiZA9wCQXKOzzt0MlpsMpYbgAGrAf55HYl8il/tirA+iOTs36ZUthpit6meC7vOyGa+8VtOZED2OqfTSiro=
X-MS-TrafficTypeDiagnostic: DM2PR0401MB0973:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0973;
	20:ogeC+tkvmT4y0wSvQ/tHvhZr3H4xEXHxwrzcN7SUoZbk9Kvmt5lOGDetp9oGUTLtwK8REjIWj4hFWI7To9VvrHtLwVGCRFjTjGaX8Cl74zpZ6MbAocKJzk+QfqDbLBJyE52h76kOCmZxEdRUs95CLc0456qum646qKXtgSx9OOF3ZaDWlaVXMxl1YpmdnzQ9xleoyU9lPcZCZNfOAXYjifs8vmLdcK1/vUd6alCYafas+uHy2iHR9oG99v0lm4rUB/29fVKY7dHGD5eobrzRk8QlyznmDGTmli4YMSTX3j96qwI5TGeD0fwHBJAsL1SVTO96fWkT2xM6FdYasXze8p/T9rn3JI52/Xsw60aRdcqXmvMHsVbl2k0mR4odvqCy2gNiTqZt7LiPYfTmrngp8sWQu+mpxLjZW3LOoImLwfhK5vUYSf+iMyIoFJPvrVY6tFf+PzlO1sra2YdyTRT409EU2p+NcEUnUe4TAbLd+g71dUXaE1/5uEK3dt+wwo7fMOJpgFmRpsOORxU0uv87QPW2toAOpKuUeJx/KrHKAq8x7/lxg3IlvWDrFa14/q8AnjCZzk7QGFsAnqrqB/nBMuxImmHEEexCcoUISBQzSpg=;
	4:sUpRWh9Gv7x5xlgfIRDW/1QU+uORlx69jnp/bJcY+WeB0t3wZqlEbZ1Rl8ASItrmlnM6ic40NYQvjpi76Y7hCZ4kuESNRvIgb5+UcaTUSUrNPZkfTxenfgpgUZpx8A9VZ5SY7HIlRyZ6YnlE9S9HsmgcqgxZwVzHoylHpqeCSxehVWdfWPIWfbKqSyIOGddhsaDzKb3CWM2TUjA7jIjOiKEHqnO7p3N6s90NE330y7v98yr+iJ+vouWhsQH53/fCTz7jH7K6WvINfFzkCzuytMsQxiPZnJ6JrhC1B/hqnVU=
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Microsoft-Antispam-PRVS: <DM2PR0401MB09739511A1F878FF80C72B3CFE470@DM2PR0401MB0973.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(93001095)(3002001)(10201501046)(3231020)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(20161123560025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM2PR0401MB0973; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM2PR0401MB0973; 
X-Forefront-PRVS: 047001DADA
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(376002)(346002)(189002)(199003)(2361001)(6512007)(50226002)(50986999)(8936002)(25786009)(6486002)(6506006)(575784001)(81166006)(86362001)(47776003)(2351001)(81156014)(53936002)(6306002)(16586007)(8676002)(66066001)(189998001)(305945005)(48376002)(50466002)(6116002)(36756003)(316002)(68736007)(7736002)(106356001)(16526018)(3846002)(97736004)(1076002)(478600001)(2906002)(105586002)(101416001)(5003940100001)(5660300001)(6666003)(33646002)(4326008)(6916009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0401MB0973;
	H:rtosams.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0401MB0973;
	23:lW9G2hNJxiu3j6wa86corISHaoNzmmCNKh+mpAn?=
	=?us-ascii?Q?6EP0sImZPRIFRKlOSd3HjLLvufeDw7rebFgT1dy9N71tMQO3k7ug7gnlRTse?=
	=?us-ascii?Q?WSn06vZBPPtcSuuR+mtlQjtqzu7WlHQ8GQqqWxbklhEbg/q94K3JJXtIkIPc?=
	=?us-ascii?Q?DVZsjTmveP57jAn9swLPez3+Sm01ATtF29LuXm7keP/x5rGaYG6v6BpxRlPL?=
	=?us-ascii?Q?fPNcs/ISrMd//sOeD7JnIV0NzNr6Ao5tWtUXmmNSxwhR1aVbVkXIgm+OmeEj?=
	=?us-ascii?Q?5ywQ6zE0nJM1T4UpXrr2PEFTfz7AQGIDdsbh8TQQfjcLzAEDHEXFJymKNT/7?=
	=?us-ascii?Q?9L1YavOW4n1y1znUm7wG+T1bRtzmKwzboQenEI5OM324duqdiEdkmL+3I5Rd?=
	=?us-ascii?Q?j1v+JMlv4D0A6o0a/BwubnZcS+s3CAksNGvRV51JKYiLnC3h02pmw6ITfcVH?=
	=?us-ascii?Q?XElclxT328nPh4Mf9g784BqWQiRmHd8VJ5arX4inowtUdJCW0CTllCw+rns9?=
	=?us-ascii?Q?7Dlu4KHLX0I2UcoHnjtqqc0k9B923Ui1ZXa2TycxCzMug37TmbbJCk2Gy4Of?=
	=?us-ascii?Q?zdldY8PLzZceqIWSG2X6EokwzRZafhzjEBU2o9fIHgYJypZU4Uw5Xiv6nQCb?=
	=?us-ascii?Q?5qB6Uxwe3zTmf7GBZG3OAF+4UVtZv8NX6tLHyUei2K/qY48D/e5TBCwK6ajG?=
	=?us-ascii?Q?6shSZnPdoUGzp9vZ1/I8p9xjX6xv+NP6rNwJ7f/bW4z4FWhG5pEl12eug0sT?=
	=?us-ascii?Q?peU3V0zqSsf5M7tPV+xB2YMUY8E6C9HOAzVVx3gkRwYz/mh//DOso6PCsoFh?=
	=?us-ascii?Q?pfNpEaBGLcNmp63lovTLRTcb8/EyW6F6RofVTNpc/5OZVHejI1CqlOmFRMr3?=
	=?us-ascii?Q?tHA9FTSwobjQXJRWzyVgVPXRugaw4xBqKXbSW0e7FuaW1KEHGKyeyV4YIXiu?=
	=?us-ascii?Q?9sU/gRM1sdflFqlhzYJKBGa/r6S5bj3wt/AoonazIJqUz8ss0WWYG867nboZ?=
	=?us-ascii?Q?YIhZwL0v2o7RAQmIDiutzKlcyPpVlnUD3FN0f4mSnV/WwsnWYI86s5MzxVlb?=
	=?us-ascii?Q?mMShNh34Rahdom/ndEh20BTqCa8y6XveEkjNAXFgUyWt72Ep4uBM/6lS1fX1?=
	=?us-ascii?Q?4ayVjaI0YehM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0973;
	6:GyNPeXafYb/hqTLDDjO5cwLWNrWIaJZ97Q1+rrPxLx41BFJrhJUfeTOlTz7SLT4fUF7cd2xbFOE6+9YJ9kBLaCApiF97jR0F/USSvhoRocol5e3/+6vt/Cx6qXd1Yoe1rR4S+5TbArnc0EVa1z7iHsb+0BXwkG2D6YUUoPu4XjnG3l/b5q7BdFXrHWAS1SQxI7FtGb4K2rYI88NmNWQ34xznmxINW3yf+D6POy/V5g+ABvrSP+rVEPKoO19nqlKV4PsP7etDY9obhB9a8QTsbkKssBlglcvezSiEEFshdUeyRjzMJGH1ZqljFr96uXSzuP0qbXTcjfprYX0pFc+Llw==;
	5:eQqUt56JimcXFjwVo8t6r/juVMX91Q+iAMjIiXQ4cLfaBNOrDL9+ArBH66ejLuVWHyr7aN26qISwVaXK+IACgvrN4YVDA5rT7JxnFZ2HbBIXskjQ/YVzhcQXBNvAFN4Ts/ilHRNCdralnJ9YOqIxKQ==;
	24:QwKCEwXJ9iJXhgiJ9xa6hr/nihJPRsP4iwkfl4lafIxGNkjRkfXn7fGr6rPPQ+dnqF0ib9lTnMs0fZGdWVZbnQi9joz2XoZkhjy8s+RfSVI=;
	7:hUhWDKCKPXdD/YzD8+87ytrjK9tv71vW2g6NYEpX1/mpaBp/c6Z3S52x80uW9l3lHkynyzJLoBKrlysRYt+lQeXhf2Fp5LPyFzxooSaKMA6wCaOL/A6qA4C2l0gEBVVnr5rBRmzFn3DV347MD0urPv8q2s+MU6T8ckhtC9qdaw6S4JwPTMF0OJKw3NkxWoJ6DjGLNHGPVXuTF3LQPAGve4TF0Pq0TMxKSgUZkDhw6DI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2017 19:28:49.6568 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e018a04-b54c-4139-13fc-08d51b157421
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0401MB0973
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-10-24_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1710240266
Subject: [meta-oe][meta-python][PATCH] python-future: add new recipe
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
X-List-Received-Date: Tue, 24 Oct 2017 19:54:55 -0000
Content-Type: text/plain

python-future is a compatibility library allowing python3.x code to run
on python2.x runtimes. This package also includes the 'futurize' utility
to convert python2 code to python2/3 agnositic code.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta-python/recipes-devtools/python/python-future_0.16.0.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-future_0.16.0.bb

diff --git a/meta-python/recipes-devtools/python/python-future_0.16.0.bb b/meta-python/recipes-devtools/python/python-future_0.16.0.bb
new file mode 100644
index 0000000000000000000000000000000000000000..46f7fe50f6f9cbc7223e2dddfe2fb29815f083bd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-future_0.16.0.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Clean single-source support for Python 3 and 2"
+HOMEPAGE = "https://python-future.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3f457538b297bd0ef86564b8ac216ad7"
+
+SRC_URI[md5sum] = "3e8e88a2bda48d54b1da7634d04760d7"
+SRC_URI[sha256sum] = "e39ced1ab767b5936646cedba8bcce582398233d6a627067d4c6a454c90cfedb"
+
+PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d"
+
+inherit pypi setuptools
+
+BBCLASSEXTEND = "native"
-- 
2.11.0


