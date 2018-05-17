Return-Path: <hannu.lounento@vaisala.com>
X-Greylist: delayed 17966 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 May 2018 11:59:38 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0085.outbound.protection.outlook.com [104.47.0.85])
	by mail.openembedded.org (Postfix) with ESMTP id 27FA5748EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 11:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=w8KC5+bnxiQT9GILx3LoB4GUot+jT2hsrtnfoST9Zi8=;
	b=JF5UORxPP5kU9EVEKHhDqr3vWNlSCjbD+RHd2pPY3M512JRxDWRlK88+lXUrbgZ5fpUAbjGCOa3St/OCoutKci6XBZF26NS6qGnAdZ9dE+1vGYnzYDku2k/LYWNBqUiLBz/73QfdbeY5964cPN3IQzDn+yoBVJTZPioULeCueHQ=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=hannu.lounento@vaisala.com; 
Received: from hel-eptripper.corp.vaisala.com (193.143.230.131) by
	VI1PR0602MB3501.eurprd06.prod.outlook.com (2603:10a6:803:10::28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.755.16;
	Thu, 17 May 2018 04:27:54 +0000
From: Hannu Lounento <hannu.lounento@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 04:27:22 +0000
Message-Id: <20180517042722.87840-1-hannu.lounento@vaisala.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: AM5PR0402CA0024.eurprd04.prod.outlook.com
	(2603:10a6:203:90::34) To VI1PR0602MB3501.eurprd06.prod.outlook.com
	(2603:10a6:803:10::28)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0602MB3501; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3501;
	3:pK1M25XaBTqo8olles7ABKK1zmRx2owbCH8LQceTijyp6QbHwmX0uRuRdyNk0ZkRZmnA/6hd4wbKvH8u54DZ1vTVHsSZoDktBOIREAv2N4JUpXWjJbFB6yn/XigO4aLre5bMGPodfuCxe8j1H13hUWbeb99YHjE/VzmVZPnTfvMdAHkpVRawbDbSPLpsKeMp7FZIH5m64bzgnX+/D/H1DkJfzKeo+C+az6jTBiCZBkWKA/9uB7tIxJbcMGAuio41;
	25:A9dRhfPGd+FgtApR8LdzLUUQ/3ln1mWq5eZ8rShhHigYd3FWnBO6r+HWa8VnIDcQsJF8pLMEJHCVccOzLam5pMhSxdFaThXBxzzrjA5rF9rwnzK2ZFbo+H3yt4gpspASLF15kfOLJkhfle4AN+TfjweAvu31zThhTJAF/deMpjU3fAQdoitdPM1X7qEmSSkZ6vNTzh8nJnJRvudxUfOdE0w8ggjnKiutdPTxa+Ib+WqofMYyovP5bO2ucNDVWezH3OeXNjomkD5SybxwaHU0ASxIw4UFkLkYqUp4l5kvvHGfHrw8dkG8Baf63czbTh9GYiE8An+3ZEuVp2/u76BcUw==;
	31:FWEZc1akWs226Uig3E/9NU0fKXhdEiMBw3fc5gfmO044S0QnLcwxeuaEyi+Ei6pziKH5mXm/Nr0ilF/KCoAqk4K4fsekrhw0MRrtdNuwu6RC4jhZC97ypxcXms+r4qpU67ZpdNVb/iOoPnXjDxd/WNVeT3pqTHwZLbot8MK9Z24kVactEFeKcMCsG/ukB6VOId/MiPne6EmS8Uq/UyBDNRJnnVqoIQnHxh9pA8K+FMw=
X-MS-TrafficTypeDiagnostic: VI1PR0602MB3501:
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3501;
	20:evemzN1DvuzbgmgKuVaNtxbfnzqmtTvYnP/OZHWFgM4jYiEnzN6okPQ9CLkY2PRDv9TJj2Yy/LIg3aS9PxWi0CXNSPqKRiheeD6hNkjqzJzhDsjM8hr62a1c0Ek8tvqr1yQ0IWhexBJ2iHnA2oUSiSTaEiU0LqEipQWwr9rghAY=;
	4:fMQSxSSicZzQDvE66k19NcoEknzCpO2YuOy6GSv3MlFzyXJy3do4uQZ7uZe7uvtw53Jk6K3RkPekML9NJMPRUoI+1lytHPWoTAo+HUon5NFue1DZncP8tXAP+7YmPXPUEz27csLfpZE0QqDgLE1D3wFpOizNWAiTOhz8V1567pk8jA3ebcjWYnQzpl8Ju0FDN+BaZylrwOPYexiGNhHrxgToD26lZa3cZH7rvzRBi4RCshhWkFIiwRxKsMwtXbr71KjLIx8u8u8b1u1Q8n3LgQ==
X-Microsoft-Antispam-PRVS: <VI1PR0602MB3501E7F6915DC0D9F38784598E910@VI1PR0602MB3501.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231254)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:VI1PR0602MB3501; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0602MB3501; 
X-Forefront-PRVS: 067553F396
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(39380400002)(396003)(376002)(366004)(346002)(189003)(199004)(174874002)(6116002)(3846002)(305945005)(8936002)(1857600001)(4326008)(81166006)(6916009)(5660300001)(478600001)(81156014)(107886003)(2616005)(486006)(8676002)(1076002)(575784001)(25786009)(47776003)(956004)(66066001)(53936002)(86362001)(6666003)(476003)(186003)(2906002)(26005)(386003)(105586002)(50466002)(50226002)(16526019)(51416003)(6486002)(44832011)(7696005)(106356001)(2351001)(7736002)(2361001)(15650500001)(97736004)(316002)(16586007)(48376002)(36756003)(68736007)(59450400001)(52116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0602MB3501;
	H:hel-eptripper.corp.vaisala.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0602MB3501;
	23:/9HzMk6BhjWyknqHEiPxxDAUHa7hUvIZOum+R6y?=
	=?us-ascii?Q?4fILIvMJ5EStnPlJ7xxa+7K9BMzy5QzFc/6ipiSxU3+kJyBHGl2wydnnWMQI?=
	=?us-ascii?Q?r/Ier8/NgqnToGAclpDKg/8QKru7T0HmvJ8+5unk1dqhpMyA2y8hnyJROwO+?=
	=?us-ascii?Q?8AEatVHQMspXxcSpAgREPLiff1gM80XxszfWFpErTJUHCwO0koXFQHO/bewF?=
	=?us-ascii?Q?VDCG0I36aWpqfdYEeFuvrucq/wIS/oouQyCtmeKOyc7QWHrjJo5EfBTwRlip?=
	=?us-ascii?Q?p85aSrrL049TzXoT96qUwq5rwBvW6wZ8KalfGYgRAU+y1sEp+dbu1cYs+9NP?=
	=?us-ascii?Q?3O0e2NYjDYkSKrSRYPjwr3H7lPrduz9YwRRHlCahcRwCdnxxV51BycJTP4nS?=
	=?us-ascii?Q?r7PvyP0XurT5r8ru1xXKK1i63oPkeOf041B2wSnJKYEJMHyiqd2ysn9kGDEz?=
	=?us-ascii?Q?qoNsVwfBo+IxU+QyqqCHUXKIzzDAm8eZ7A/utuOcvyJJ3xxwPBBkWOv+INeT?=
	=?us-ascii?Q?R048FfCWI0XOl6br8iBDakVpcxRVBUmGS5hSHVfDQ+70zmRZsSoT3mwOTLYx?=
	=?us-ascii?Q?gWkNcbpHMYzAQYMkHGUgLzapzjJpkibHb3EzrEBGtaIJMfcMiTauUDjHXjWS?=
	=?us-ascii?Q?a4QOMAhakVwD0dS3jnVXxVG1KKZd73le1/1Cd7HSeWABf19iuUL+cGxANQGK?=
	=?us-ascii?Q?6MN0sHICQrr4qtWe+nStlXwHMGekL/BZZMVinViY41+nccvJfpj6cwRaQny7?=
	=?us-ascii?Q?lEmedZZkQukf8j6I4t/2NhrZWWsIX4vLVPdkIWXAHT8R1/JNHdANz58iCgcU?=
	=?us-ascii?Q?s6kiB7+nznP5t7f/XbTcIdzh0dgKNsT1kP7gcwSNdAoXyPkfhdLZ+VdsAD3Z?=
	=?us-ascii?Q?RI0CLh3l90Rl7/irrLlfEigWqMFp8ZVb2LYRuZP3wRjO1cOC2Q44e1pDTYw0?=
	=?us-ascii?Q?195Jh/BKNEACrU3uybiui0jNL2RCHVEKhfrEQQYGwc7QcMp14htcFcGV0slf?=
	=?us-ascii?Q?vW4XfXxoH65fF5zyblsY/oYboJEXo9ErRPyI2Rjb+xYwkBNyYzuRjPTqRAuH?=
	=?us-ascii?Q?APk520T7TTGJSPqZ1mZhXvBRHW11rC62EfcGLXLofSfXPcgkJKqFc09mc9lR?=
	=?us-ascii?Q?IH4aIGgFmj57Kx0BlDk/TlqcsM1MtZ5OHdUhz2puPfmKEwilSVJv2h5zkJcl?=
	=?us-ascii?Q?90aw65qBqZBuHl4zTIBjfNWAkiBSAKMfKnPN5gh54bpIU+umdmJU9cbFHLlv?=
	=?us-ascii?Q?2cgt83BMMEnTElYnMuE41EoTwkN/Mwe5ZO+p9DfxO+BkJIU4IqfBVWpzlAwG?=
	=?us-ascii?Q?hGPZbQEdPyfVa5sRglTPX4lbTex+YwP0zQ5srlokVhTve?=
X-Microsoft-Antispam-Message-Info: MHto9dxpO/aRfKUD8qdm25TT3Uaf3NJAMnS6TyFIvKWVSUTqFQqI1rr9L7vZ+wbET/sJB8BQx33hXniVifIgdXYWfb4LTbnsP5toCzAJwvebW1S3nXFs2+SBCSWNh7/x3dEvHIk4YDNnZ6vikNMd12uUqJwcT/oVtSmYc2WnNQAcoLqBz3QBoDy5yorkKQxx
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3501;
	6:E9pFYboa/tXcUrm/IpG1vNnkL7ThWVL2orqq7gFZcXs0DXTZWHp6lzQ53fres2mAokOAgg1G/KirwWk42e4bUheom9VWeB34hrODqRlI/Mp5U0l8jJZFIe9rvBfIfqlz5kzHx1HPPmvL0CGtTnl/MklgF2t2PPjquw752olG4tQVa7YM7zyJkvPqyjExLgzGMV83uPiNnkF6KnzNCy+E3NwUm9bt31m1iyrmW4mApC1puaygVMB1kwlXzUH45C0ELzl9aCWafDnSexd6Th/RfcncXZ+FLqJ19qRvAOwelfjPy4+hd5I/LQQW80yp25JC0szEDjGIbIoTr40wvMbVtGvMjVR66bSkkxLcD9F6xKwiJ1yl3z0AQM95WMfS6HmRCvcgp3cZtrzLXoW0quidrqhazZZK7/z+sr/88oklAnxNoFl++Lp1u09nxEmSQGjLngqJOQ1yY2qBF2M6QeZQcA==;
	5:Nc+teodPZNEJ8hPYbouzSHSMkWg+OTih1BxgyCvpKKp/uxVOo4mKoJzRcvIEHe5P4hOY+IvPu0CAMgo3aYtZkQLRw3Bh+7vtpgZxXh1sxBnOsXW/SlCRzn70XvedRbPGj/jAjHFy7WaKb6ZgWyol6rlAn+skeppmCGux+Sn7aaY=;
	24:o07T696ihb3i3mhIEXsHQRWM/o2q07gYoorZSCMb17nOKFd/THNZRrDC5OFfTbE1S/KNEfXdjYGokQbVIGvTD9fTfnTf0pLLBUm28M+iqXo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3501;
	7:whlbS83vK6fW8gB0n7FszGZ6yy/3wAIRTfMlds+9fzHnr0FwQvAweGfdxtp7Wcmf7l8T3mOKMChbYMxyHLZTVm0M2DgkfGHZi8kz1TGtoLmKeKyFVmgzbM9frmoCaW/0EB2vgfNKmQwd7GftfrNZEPje2A8Wd5Wg01xml3P8RLVeUi4+BgsidB3s56Hrir6HcNCdNFkMTa3UtsoavSZiVmp2lr4wlsFJIDM8h7ArXIrAJWgQ5XktQSqo+uZnd5De
X-MS-Office365-Filtering-Correlation-Id: 2249bc59-f3ba-4105-1ef8-08d5bbae8f81
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2018 04:27:54.5975 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2249bc59-f3ba-4105-1ef8-08d5bbae8f81
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB3501
Subject: [meta-networking][PATCH] vlan: use update-alternatives for vconfig
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
X-List-Received-Date: Thu, 17 May 2018 11:59:39 -0000
Content-Type: text/plain

Busybox also provides the command 'vconfig' when CONFIG_VCONFIG is
enabled.

Busybox has a priority of 50.

Prior to the patch running

    bitbake core-image-minimal

produced the warnings

    WARNING: core-image-minimal-1.0-r0 do_rootfs: busybox.postinst returned 1, marking as unpacked only, configuration required on target.
    WARNING: core-image-minimal-1.0-r0 do_rootfs: Intentionally failing postinstall scriptlets of ['busybox'] to defer them to first boot is deprecated. Please place them into pkg_postinst_ontarget_${PN} ().
    If deferring to first boot wasn't the intent, then scriptlet failure may mean an issue in the recipe, or a regression elsewhere.
    Details of the failure are in /path/to/poky/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.
    WARNING: core-image-minimal-1.0-r0 do_rootfs: [log_check] core-image-minimal: found 1 warning message in the logfile:
    [log_check] WARNING: Intentionally failing postinstall scriptlets of ['busybox'] to defer them to first boot is deprecated. Please place them into pkg_postinst_ontarget_${PN} ().

where log.do_rootfs contained

    update-alternatives: Error: not linking /path/to/poky/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs/sbin/vconfig to /bin/busybox.nosuid since /path/to/poky/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs/sbin/vconfig exists and is not a link

when a workspace layer created by devtool contained

    $ cat workspace/appends/busybox_%.bbappend
    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

    SRC_URI_append = " file://vconfig.cfg"

and

    $ cat workspace/appends/busybox/vconfig.cfg
    CONFIG_VCONFIG=y

and local.conf contained

    $ tail -n2 conf/local.conf
    IMAGE_INSTALL_append = " busybox"
    IMAGE_INSTALL_append = " vlan"

Signed-off-by: Hannu Lounento <hannu.lounento@vaisala.com>
---
 meta-networking/recipes-connectivity/vlan/vlan_1.9.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
index bd55efce2..7eea5d135 100644
--- a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
+++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a77392d9aeb486884
 
 S = "${WORKDIR}/${BPN}"
 
+inherit update-alternatives
+
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 # comment out MakeInclude in Makefile which sets build environment
@@ -30,3 +32,7 @@ do_install () {
     install -d ${D}/${base_sbindir}
     install -m 0755 ${S}/vconfig ${D}/${base_sbindir}/
 }
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "vconfig"
+ALTERNATIVE_LINK_NAME[vconfig] = "${base_sbindir}/vconfig"
-- 
2.11.0


