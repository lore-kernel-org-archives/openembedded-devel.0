Return-Path: <eajames@linux.ibm.com>
X-Greylist: delayed 5836 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Dec 2018 17:33:59 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by mail.openembedded.org (Postfix) with ESMTP id B5CCF6C648
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 17:33:59 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	wB3Fsk38106696 for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Dec 2018 10:56:44 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2p56rfbes1-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 10:56:43 -0500
Received: from localhost
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <openembedded-devel@lists.openembedded.org> from
	<eajames@linux.ibm.com>; Mon, 3 Dec 2018 15:55:29 -0000
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
	by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 3 Dec 2018 15:55:26 -0000
Received: from b03ledav002.gho.boulder.ibm.com
	(b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id wB3FtPcf24969468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 3 Dec 2018 15:55:25 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B672913604F;
	Mon,  3 Dec 2018 15:55:25 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 412AD13605D;
	Mon,  3 Dec 2018 15:55:24 +0000 (GMT)
Received: from oc6728276242.ibm.com (unknown [9.85.222.96])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon,  3 Dec 2018 15:55:23 +0000 (GMT)
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>
References: <20181202191346.15104-1-raj.khem@gmail.com>
	<eb3254e5-90c9-1bad-f187-0e95fe054e9e@gmail.com>
	<CAMKF1srHSspXWvuWAZfNqAJWA0hT0H3qhfMdjcbPhMSfF5iOKQ@mail.gmail.com>
	<be795047-899c-b3da-f303-292a604a13e2@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Mon, 3 Dec 2018 09:55:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <be795047-899c-b3da-f303-292a604a13e2@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18120315-0036-0000-0000-00000A64C72D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010165; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000270; SDB=6.01126428; UDB=6.00585002;
	IPR=6.00906562; 
	MB=3.00024426; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-03 15:55:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18120315-0037-0000-0000-000049D8F1CB
Message-Id: <ef9e5625-ea91-5a00-ae05-63883831b17d@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-12-03_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1812030149
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] libvncserver: Update to latest version
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
X-List-Received-Date: Mon, 03 Dec 2018 17:34:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 12/03/2018 09:43 AM, Eddie James wrote:
>
>
> On 12/02/2018 10:46 PM, Khem Raj wrote:
>> On Sun, Dec 2, 2018 at 12:40 PM akuster808 <akuster808@gmail.com> wrote:
>>>
>>>
>>> On 12/2/18 11:13 AM, Khem Raj wrote:
>>>> From: Eddie James <eajames@linux.ibm.com>
>>>>
>>>> The latest release of libvncserver is almost two years old. A 
>>>> number of
>>>> security fixes and enhancements have recently been committed. Since 
>>>> the repo
>>>> is stable, point the recipe to the latest commit.
>>>>
>>>> libvncserver switched from autotools to cmake, so update the recipe as
>>>> necessary, and add PACKAGECONFIG options to allow a more minimal 
>>>> build and
>>>> install.
>>>>
>>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>   .../libvncserver/libvncserver_0.9.11.bb       | 25 
>>>> -------------------
>>>>   .../libvncserver/libvncserver_git.bb          | 23 +++++++++++++++++
>>>>   2 files changed, 23 insertions(+), 25 deletions(-)
>>>>   delete mode 100644 
>>>> meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
>>>>   create mode 100644 
>>>> meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
>>>>
>>>> diff --git 
>>>> a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb 
>>>> b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
>>>> deleted file mode 100644
>>>> index 38dac06e64..0000000000
>>>> --- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
>>>> +++ /dev/null
>>>> @@ -1,25 +0,0 @@
>>>> -DESCRIPTION = "library for easy implementation of a RDP/VNC server"
>>>> -HOMEPAGE = "https://libvnc.github.io"
>>>> -SECTION = "libs"
>>>> -PRIORITY = "optional"
>>>> -LICENSE = "GPLv2"
>>>> -LIC_FILES_CHKSUM = 
>>>> "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
>>>> -
>>>> -DEPENDS += "zlib libsdl jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
>>>> -
>>>> -PACKAGECONFIG ??= 
>>>> "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
>>>> -PACKAGECONFIG[systemd] = ",,systemd"
>>>> -
>>>> -RDEPENDS_${PN} += "libpng gtk+ libgcrypt"
>>>> -
>>>> -inherit distro_features_check autotools binconfig pkgconfig
>>>> -
>>>> -REQUIRED_DISTRO_FEATURES = "x11"
>>> X11 was dropped. is it handled in some on the fashion?
>> what caused the x11 dep in first place ? if it was gtk+ then this has 
>> been
>> dropped. 

Yes, as far as I can tell there is no dependency on X11 in the latest 
libvncserver. Some of the optional dependencies may require X11 
(libsdl2?) but that's handled by packageconfig and by the libsdl recipe 
I would assume.

Thanks for sending this to the list btw, had real trouble with my first 
attempt :)

Eddie


