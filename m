Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 01E107198A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2018 06:29:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5B6TF7Q019878
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Jun 2018 23:29:31 -0700
Received: from localhost.corp.ad.wrs.com (128.224.162.139) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Sun, 10 Jun 2018 23:28:53 -0700
To: Richard Leitner <richard.leitner@skidata.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180607092459.33931-1-wenlin.kang@windriver.com>
	<20180607092459.33931-2-wenlin.kang@windriver.com>
	<2dae9a9a-a6e4-1c01-d167-0dc92f9e1bbf@skidata.com>
	<5ffe90b0-c8ab-dfe4-99c4-d63d53edc8ec@windriver.com>
	<6e0af238-add1-f319-1d56-cf0315814b50@skidata.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <16b16d90-2395-0f19-34fd-4013703db914@windriver.com>
Date: Mon, 11 Jun 2018 14:31:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <6e0af238-add1-f319-1d56-cf0315814b50@skidata.com>
Subject: Re: [meta-java][PATCH 2/2] openjdk-8: combine the -dbg package
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
X-List-Received-Date: Mon, 11 Jun 2018 06:29:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Richard,

On 06/08/2018 06:07 PM, Richard Leitner wrote:
> On 06/08/2018 11:02 AM, Wenlin Kang wrote:
>> On 2018年06月08日 15:39, Richard Leitner wrote:
>>> Hi,
>>> thank you for you patch!
>>>
>>> On 06/07/2018 11:24 AM, Wenlin Kang wrote:
>>>> One recipe should only have one -dbg package, because OE only picks
>>>> up all .debug file into the last one -dbg package listed in variable
>>>> PACKAGES.
>>> Why should one recipe, altough it conains multiple packages have only
>>> one dbg package? Shouldn't the openjdk-8-demo-dbg package contain the
>>> debug information for the openjdk-8-demo package?
>>
>> This may be OE's policy, if one recipe contain multiple -dbg package , other -dbg packages all will be
>> a empty pacakge, only have one will contain all .debug file,  you can see the source "meta/classes/package.bbclass"
> 
> But obviously the demo-dbg package isn't empty because it has its "FILES" defined ;-)
> 
>>
>> 1129 python populate_packages () {
>> 1130     import glob, re
>>
>> 1156     for pkg in packages.split():
>> 1157         if pkg in package_list:
>> 1158             msg = "%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg
>> 1159             package_qa_handle_error("packages-list", msg, d)
>> 1160         # If debug-with-srcpkg mode is enabled then the src package will have
>> 1161         # priority over dbg package when assigning the files.
>> 1162         # This allows src package to include source files and remove them from dbg.
>> 1163         elif split_source_package and pkg.endswith("-src"):
>> 1164             package_list.insert(0, pkg)
>> 1165         elif autodebug and pkg.endswith("-dbg") and not split_source_package:    <==============
>> 1166             package_list.insert(0, pkg)
>> 1167         else:
>> 1168             package_list.append(pkg)
>> 1169     d.setVar('PACKAGES', ' '.join(package_list))
>> 1170     pkgdest = d.getVar('PKGDEST')
>> ...
>>
>> 1177     debug = []
>> 1178     for root, dirs, files in cpath.walk(dvar):
>> 1179         dir = root[len(dvar):]
>> 1180         if not dir:
>> 1181             dir = os.sep
>> 1182         for f in (files + dirs):
>> 1183             path = "." + os.path.join(dir, f)
>> 1184             if "/.debug/" in path or path.endswith("/.debug"):    <==============
>> 1185                 debug.append(path)
>> 1186
>>
>>>
>>> Nonehteless according to my first quick test the demo-dbg package
>>> contains lots of other debug information too...
>>> So maybe it would be the better way to fix the content of the different
>>> dbg packages rather than removing one?
>>
>> I also thought this, but  after discussing with the other guys,  the result is a recipe can only have
>> a -dbg package, and this is OE's policy.
> 
> Do you have a pointer to this discussion (or if it exists to the according documentation) for us?

For oe-core's recipes, each recipe only has one dbg package, split dbg packages
doesn't make any sense since they usually can't be run independently. Please
see oe-core's commit:

commit a3b000643898d7402b9e57c02e8d10e677cc9722
Author: Ross Burton <ross.burton@intel.com>
Date:   Tue Dec 15 16:32:43 2015 +0000

     meta: more removals of redunant FILES_${PN}-dbg

     In some recipes overly-split -dbg packages were merged into PN-dbg.  Unless
     there's a very good reason, recipes should have a single -dev and -dbg package.

// Robert

// Robert

> 
> Thanks & regards;Richard.L
> 

