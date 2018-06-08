Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF956025F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2018 09:11:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w589BIML025208
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Jun 2018 02:11:33 -0700
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Fri, 8 Jun 2018 02:11:06 -0700
To: Richard Leitner <richard.leitner@skidata.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180607092459.33931-1-wenlin.kang@windriver.com>
	<20180607092459.33931-2-wenlin.kang@windriver.com>
	<2dae9a9a-a6e4-1c01-d167-0dc92f9e1bbf@skidata.com>
	<5ffe90b0-c8ab-dfe4-99c4-d63d53edc8ec@windriver.com>
From: Wenlin Kang <wenlin.kang@windriver.com>
Message-ID: <bded0530-256e-4297-51b5-17a6e2698882@windriver.com>
Date: Fri, 8 Jun 2018 17:10:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <5ffe90b0-c8ab-dfe4-99c4-d63d53edc8ec@windriver.com>
X-Originating-IP: [128.224.162.186]
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
X-List-Received-Date: Fri, 08 Jun 2018 09:11:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年06月08日 17:02, Wenlin Kang wrote:
> On 2018年06月08日 15:39, Richard Leitner wrote:
>> Hi,
>> thank you for you patch!
>>
>> On 06/07/2018 11:24 AM, Wenlin Kang wrote:
>>> One recipe should only have one -dbg package, because OE only picks
>>> up all .debug file into the last one -dbg package listed in variable
>>> PACKAGES.
>> Why should one recipe, altough it conains multiple packages have only
>> one dbg package? Shouldn't the openjdk-8-demo-dbg package contain the
>> debug information for the openjdk-8-demo package?
>
> This may be OE's policy, if one recipe contain multiple -dbg package , 
> other -dbg packages all will be
> a empty pacakge, only have one will contain all .debug file,  you can 
> see the source "meta/classes/package.bbclass"
>
> 1129 python populate_packages () {
> 1130     import glob, re
>
> 1156     for pkg in packages.split():
> 1157         if pkg in package_list:
> 1158             msg = "%s is listed in PACKAGES multiple times, this 
> leads to packaging errors." % pkg
> 1159             package_qa_handle_error("packages-list", msg, d)
> 1160         # If debug-with-srcpkg mode is enabled then the src 
> package will have
> 1161         # priority over dbg package when assigning the files.
> 1162         # This allows src package to include source files and 
> remove them from dbg.
> 1163         elif split_source_package and pkg.endswith("-src"):
> 1164             package_list.insert(0, pkg)
> 1165         elif autodebug and pkg.endswith("-dbg") and not 
> split_source_package:    <==============
> 1166             package_list.insert(0, pkg)
> 1167         else:
> 1168             package_list.append(pkg)
> 1169     d.setVar('PACKAGES', ' '.join(package_list))
> 1170     pkgdest = d.getVar('PKGDEST')
> ...
>
> 1177     debug = []
> 1178     for root, dirs, files in cpath.walk(dvar):
> 1179         dir = root[len(dvar):]
> 1180         if not dir:
> 1181             dir = os.sep
> 1182         for f in (files + dirs):
> 1183             path = "." + os.path.join(dir, f)
> 1184             if "/.debug/" in path or path.endswith("/.debug"):   
>  <==============
> 1185                 debug.append(path)
> 1186

1187     for pkg in package_list:
1188         root = os.path.join(pkgdest, pkg)
1189         bb.utils.mkdirhier(root)
1190
1191         filesvar = d.getVar('FILES_%s' % pkg) or ""
1192         if "//" in filesvar:
1193             msg = "FILES variable for package %s contains '//' 
which is invalid. Attempting to fix this but you should correct the 
metadata.\n" % pkg
1194             package_qa_handle_error("files-invalid", msg, d)
1195             filesvar.replace("//", "/")
1196
1197         origfiles = filesvar.split()
1198         files, symlink_paths = files_from_filevars(origfiles)
1199
1200         if autodebug and pkg.endswith("-dbg"): <============
1201             files.extend(debug)            <============

>
>>
>> Nonehteless according to my first quick test the demo-dbg package
>> contains lots of other debug information too...
>> So maybe it would be the better way to fix the content of the different
>> dbg packages rather than removing one?
>
> I also thought this, but  after discussing with the other guys, the 
> result is a recipe can only have
> a -dbg package, and this is OE's policy.
>
>>
>> But I'm of course open for discussions ;-)
>>
>>> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>>> ---
>>>   recipes-core/openjdk/openjdk-8_16xbyy.bb | 10 +++-------
>>>   1 file changed, 3 insertions(+), 7 deletions(-)
>> regards;Richard.L
>
>

-- 
Thanks,
Wenlin Kang


