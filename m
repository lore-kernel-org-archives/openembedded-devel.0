Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 481B765CC3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 01:42:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2U1gOm1010737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 18:42:24 -0700
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 29 Mar 2016 18:42:23 -0700
To: <openembedded-devel@lists.openembedded.org>, "Ashfield, Bruce"
	<Bruce.Ashfield@windriver.com>
References: <1459239776-3868-1-git-send-email-rongqing.li@windriver.com>
	<CADkTA4PJWOcidD42V9vAHBQLu6QDb3fgKkT7LGiav9zRWeX6uA@mail.gmail.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <56FB2EFD.4080201@windriver.com>
Date: Wed, 30 Mar 2016 09:42:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PJWOcidD42V9vAHBQLu6QDb3fgKkT7LGiav9zRWeX6uA@mail.gmail.com>
Subject: Re: [PATCH][meta-oe] virt-what: add the recipe
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
X-List-Received-Date: Wed, 30 Mar 2016 01:42:24 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年03月29日 22:22, Bruce Ashfield wrote:
> On Tue, Mar 29, 2016 at 4:22 AM, <rongqing.li@windriver.com> wrote:
>
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> virt-what is a a shell script which can be used to detect if the program
>> is running in a virtual machine.
>>
>
> Did you consider meta-virtualization for this ? not a big concern .. just
> wondering.
>
> Bruce

it is related virt, I will send it to meta-virtualization.

this is needed by tuned, so I add it firstly before add tuned.


-Roy

>
>
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   .../recipes-extended/virt-what/virt-what_1.15.bb   | 36
>> ++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>   create mode 100644 meta-oe/recipes-extended/virt-what/virt-what_1.15.bb
>>
>> diff --git a/meta-oe/recipes-extended/virt-what/virt-what_1.15.bb
>> b/meta-oe/recipes-extended/virt-what/virt-what_1.15.bb
>> new file mode 100644
>> index 0000000..7509eee
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/virt-what/virt-what_1.15.bb
>> @@ -0,0 +1,36 @@
>> +SUMMARY = "Detect if we are running in a virtual machine"
>> +DESCRIPTION =" virt-what is a shell script which can be used to detect if
>> the program \
>> +is running in a virtual machine. \
>> +The program prints out a list of "facts" about the virtual machine, \
>> +derived from heuristics.  One fact is printed per line. \
>> +If nothing is printed and the script exits with code 0 (no error), \
>> +then it can mean either that the program is running on bare-metal or \
>> +the program is running inside a type of virtual machine which we don't \
>> +know about or can't detect. \
>> +Current types of virtualization detected: \
>> + - hyperv       Microsoft Hyper-V \
>> + - kvm          Linux Kernel Virtual Machine (KVM) \
>> + - openvz       OpenVZ or Virtuozzo \
>> + - powervm_lx86 IBM PowerVM Lx86 Linux/x86 emulator \
>> + - qemu         QEMU (unaccelerated) \
>> + - uml          User-Mode Linux (UML) \
>> + - virtage      Hitachi Virtualization Manager (HVM) Virtage LPAR \
>> + - virtualbox   VirtualBox \
>> + - virtualpc    Microsoft VirtualPC \
>> + - vmware       VMware \
>> + - xen          Xen \
>> + - xen-dom0     Xen dom0 (privileged domain) \
>> + - xen-domU     Xen domU (paravirtualized guest domain) \
>> + - xen-hvm      Xen guest fully virtualized (HVM) \
>> +"
>> +
>> +SECTION = "base"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +SRC_URI = "
>> http://people.redhat.com/~rjones/virt-what/files/${PN}-${PV}.tar.gz"
>> +
>> +inherit autotools
>> +
>> +SRC_URI[md5sum] = "35d19ca3305e8ae88c1985fbd8388f53"
>> +SRC_URI[sha256sum] =
>> "7ab9220d4682eadf9139c6afe62d33ebd273fff69e49054279caba5514937c41"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

