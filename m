Return-Path: <mspinler@linux.vnet.ibm.com>
X-Greylist: delayed 4031 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Oct 2018 16:29:41 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by mail.openembedded.org (Postfix) with ESMTP id A9A1D79C05
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 16:29:41 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w9QFJUeB059662 for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 11:22:31 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2nc5b4rey5-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 11:22:30 -0400
Received: from localhost
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <openembedded-devel@lists.openembedded.org> from
	<mspinler@linux.vnet.ibm.com>; Fri, 26 Oct 2018 09:22:30 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
	by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Fri, 26 Oct 2018 09:22:27 -0600
Received: from b03ledav006.gho.boulder.ibm.com
	(b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id w9QFMRSm17301682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL) for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 15:22:27 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA458C6057
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 15:22:26 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4656C6055
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 15:22:26 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 15:22:26 +0000 (GMT)
MIME-Version: 1.0
Date: Fri, 26 Oct 2018 10:24:36 -0500
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: openembedded-devel@lists.openembedded.org
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18102615-0020-0000-0000-00000E7FFBDB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009939; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000268; SDB=6.01108292; UDB=6.00574087;
	IPR=6.00888378; 
	MB=3.00023918; MTD=3.00000008; XFM=3.00000015; UTC=2018-10-26 15:22:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18102615-0021-0000-0000-000063822ACE
Message-Id: <4d527ec6c1ac5415dcc51bf71ad4d6cf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-10-26_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=838 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1807170000 definitions=main-1810260129
Subject: Using libpam with systemd but without systemd-logind
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
X-List-Received-Date: Fri, 26 Oct 2018 16:29:41 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Our embedded system uses systemd and libpam, but doesn't use systemd's
logind package.

The libpam recipe,
https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-extended/pam/libpam_1.3.0.bb#L149,
will add pam_systemd.so to common-session if it detects systemd is used.

However, systemd will only even build pam_systemd.so if the logind 
package is enabled, shown here:
https://github.com/systemd/systemd/blob/15b1180945f2cfa0f7938626ff060c8b52606a1a/meson.build#L1747

So in our case, since we are explicitly disabling logind, pam will 
complain
in the journal about not being able to find pam_systemd.so.

As logind isn't a systemd distro feature, I'm not sure how libpam can 
really know
that it doesn't need to add pam_systemd.so to common-session?

Does anyone have any ideas on ways to handle this?

Thanks,
Matt


