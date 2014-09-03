Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C672F65FE7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Sep 2014 01:51:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s831pYJQ007897
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Sep 2014 18:51:34 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 18:51:34 -0700
Message-ID: <54067424.8050600@windriver.com>
Date: Wed, 3 Sep 2014 09:51:32 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20140902135015.93AF7504BC@opal.openembedded.org>
In-Reply-To: <20140902135015.93AF7504BC@opal.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : package_rpm: Add custom extension support for spec generation.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Sep 2014 01:51:43 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Build failure:
https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/30/steps/BuildImages/logs/stdio
...

ERROR: Error executing a python function in /home/pokybuild/yocto-autobuilder/yocto-worker/poky-tiny/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.16.bb:

The stack trace of python calls that resulted in this exception/failure was:
File: 'write_specfile', lineno: 554, function: <module>
      0550:
      0551:    specfile.close()
      0552:
      0553:
  *** 0554:write_specfile(d)
      0555:
File: 'write_specfile', lineno: 420, function: write_specfile
      0416:            bb.note("Not creating empty RPM package for %s" % splitname)
      0417:        else:
      0418:            spec_files_bottom.append('%%files -n %s' % splitname)
      0419:            if extra_pkgdata:
  *** 0420:                package_rpm_extra_pkgdata(splitname, spec_files_bottom, localdata)
      0421:            spec_files_bottom.append('%defattr(-,-,-,-)')
      0422:            if file_list:
      0423:                bb.note("Creating RPM package for %s" % splitname)
      0424:                spec_files_bottom.extend(file_list)
Exception: NameError: global name 'package_rpm_extra_pkgdata' is not defined

...

//Hongxu

On 09/02/2014 09:50 PM, git@opal.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master-next
> Commit: 4b42982b8e6d859315c0f95dc0d6e4bcadf9a785
> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=4b42982b8e6d859315c0f95dc0d6e4bcadf9a785
>
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Mon Sep  1 17:32:26 2014 +0100
>
> package_rpm: Add custom extension support for spec generation.
>
> Add hooks to allow customisation of the rpm spec files. Since python functions
> aren't visible in the data store, one variable is used to trigger the call to
> a separately named function. A dummy function is not provided since this then
> triggers various class ordering complexities which are best avoided.
>
> Ultimately this will be replaced by a refactor of the code to generate the
> spec file using a python class.
>
> This allows the tizen layer to add hooks for the security manifests for
> example.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> ---
>
>   meta/classes/package_rpm.bbclass | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 0a32b3e..65b4463 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -293,6 +293,7 @@ python write_specfile () {
>       spec_files_bottom = []
>   
>       perfiledeps = (d.getVar("MERGEPERFILEDEPS", True) or "0") == "0"
> +    extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA", True) or "0") == "0"
>   
>       for pkg in packages.split():
>           localdata = bb.data.createCopy(d)
> @@ -373,6 +374,8 @@ python write_specfile () {
>               else:
>                   bb.note("Creating RPM package for %s" % splitname)
>                   spec_files_top.append('%files')
> +                if extra_pkgdata:
> +                    package_rpm_extra_pkgdata(splitname, spec_files_top, localdata)
>                   spec_files_top.append('%defattr(-,-,-,-)')
>                   if file_list:
>                       bb.note("Creating RPM package for %s" % splitname)
> @@ -479,6 +482,8 @@ python write_specfile () {
>               bb.note("Not creating empty RPM package for %s" % splitname)
>           else:
>               spec_files_bottom.append('%%files -n %s' % splitname)
> +            if extra_pkgdata:
> +                package_rpm_extra_pkgdata(splitname, spec_files_bottom, localdata)
>               spec_files_bottom.append('%defattr(-,-,-,-)')
>               if file_list:
>                   bb.note("Creating RPM package for %s" % splitname)
>


