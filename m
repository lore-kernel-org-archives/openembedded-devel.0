Return-Path: <cshored@thecshore.com>
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id C8A1178829
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 11:14:26 +0000 (UTC)
Received: from [192.168.4.128] (135-23-247-100.cpe.pppoe.ca [135.23.247.100])
	by mail.thecshore.com (Postfix) with ESMTPSA id D5CB229C7;
	Fri,  2 Mar 2018 06:14:26 -0500 (EST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com D5CB229C7
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com D5CB229C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1519989267;
	bh=KvcRtnLKKRGbXh/J7H5mN0Nq8S7PUiA0+WkMpGJilUk=;
	h=From:Subject:To:References:Date:In-Reply-To:From;
	b=tN6lHh1lNsz2p649KEJMSKFiMrP5a5ZMgmEWVtGuR2Jd/b5v4TjcG6wBcvjkpc7ZY
	hPMQ81iZjNveCjquhrjzEzySGLUAOqk9J2nD6qd4iI7nWDIAh4ZXTiCzg36iIcmTPx
	KOWSQ+sgxkj62PVpkeADGVtqUydGKVfNtAn8Ye68=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.3 at mail.thecshore.com
From: "Daniel F. Dickinson" <cshored@thecshore.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>,
	openembedded-devel@lists.openembedded.org
References: <1519911354-18140-1-git-send-email-jkrishnanjanappa@mvista.com>
Message-ID: <b62eb1b1-67db-1d28-5c73-4f60150499a7@thecshore.com>
Date: Fri, 2 Mar 2018 06:14:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519911354-18140-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: Re: [meta-openwrt][PATCH 1/5] openwrt-lua: remove hardcoded 'lib' string to a generic value CMAKE_INSTALL_LIBDIR
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
X-List-Received-Date: Fri, 02 Mar 2018 11:14:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

Hi!

Great to see someone else interested in meta-openwrt!  I'll try and look 
at these this weekend.  I noticed Khem asked for a PR on GitHub.  If 
you're not comfortable with that I can help, otherwise look forward to 
seeing your PR on github!

Regards,

Daniel

On 2018-03-01 08:35 AM, Jagadeesh Krishnanjanappa wrote:
> This solves a bunch of below errors and warnings when the libdir is /usr/lib64 for
> 64bit machine or in multilib environment:
> 
> The libubox warning:
> -- snip --
> WARNING: libubox-2.0.0+gitAUTOINC+96305a3caf-r0 do_package: QA Issue: libubox: Files/directories were installed but not shipped in any package: /usr/lib/lua/5.1/uloop.so
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> libubox: 1 installed and not shipped files. [installed-vs-shipped]
> -- snip --
> 
> The ubox recipe fails with below errors:
> 
> -- snip --
> .../ubox/git-r0/recipe-sysroot-native/usr/bin/x86_64-montavista-linux/../../libexec/x86_64-montavista-linux/gcc/x86_64-montavista-linux/7.2.0/ld: cannot find -lubus collect2: error: ld returned 1 exit status
> -- snip --
> 
> -- snip --
> | ../ubox/git-r0/recipe-sysroot-native/usr/bin/x86_64-montavista-linux/../../libexec/x86_64-montavista-linux/gcc/x86_64-montavista-linux/7.2.0/ld: cannot find -luci
> | collect2: error: ld returned 1 exit status
> -- snip --
> 
> -- snip --
> WARNING: ubox-git-r0 do_package: QA Issue: ubox: Files/directories were installed but not shipped in any package: /usr/lib/libvalidate.so
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or
> delete them within do_install.
> ubox: 1 installed and not shipped files. [installed-vs-shipped]
> ERROR: ubox-git-r0 do_package_qa: QA Issue: /usr/sbin/validate_data contained in package ubox requires libvalidate.so()(64bit), but no providers found in RDEPENDS_ubox? [file-rdeps]
> WARNING: ubox-git-r0 do_package_qa: QA Issue: ubox-dbg: found library in wrong location: /usr/lib/.debug/libvalidate.so [libdir]
> ERROR: ubox-git-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
> ERROR: ubox-git-r0 do_package_qa: Function failed: do_package_qa
> -- snip --
> 
> The ubus build fails with below error:
> -- snip --
> ERROR: ubus-git-r0 do_package_qa: QA Issue: /usr/bin/ubus contained in package ubus requires libubus.so()(64bit), but no providers found in RDEPENDS_ubus? [file-rdeps]
> WARNING: ubus-git-r0 do_package_qa: QA Issue: ubus-dbg: found library in wrong location: /usr/lib/.debug/libubus.so [libdir]
> ERROR: ubus-git-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
> ERROR: ubus-git-r0 do_package_qa: Function failed: do_package_qa
> -- snip --
> 
> -- snip --
> WARNING: ubus-git-r0 do_package: QA Issue: ubus: Files/directories were installed but not shipped in any package: /usr/lib/lua/5.1/ubus.so
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> ubus: 1 installed and not shipped files. [installed-vs-shipped]
> -- snip --
> 
> The netifd recipe fails with below error:
> 
> -- snip --
> | cp: target ‘.../tmp_new/work/corei7-64-montavista-linux/netifd/git-r0/image/lib64/netifd/’ is not a directory
> | WARNING: .../tmp_new/work/corei7-64-montavista-linux/netifd/git-r0/temp/run.do_install.27647:1 exit 1 from 'cp -dR --preserve=mode,links .../tmp_new/work/corei7-64-montavista-linux/netifd/git-r0/git/scripts/* .../tmp_new/work/corei7-64-montavista-linux/netifd/git-r0/image/lib64/netifd/'
> -- snip --
> 
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>   classes/openwrt-lua.bbclass | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/classes/openwrt-lua.bbclass b/classes/openwrt-lua.bbclass
> index 793f363..d67ff58 100644
> --- a/classes/openwrt-lua.bbclass
> +++ b/classes/openwrt-lua.bbclass
> @@ -4,7 +4,7 @@
>   # for the terms.
>   
>   OECMAKE_C_FLAGS += "-DLUA_COMPAT_5_1"
> -EXTRA_OECMAKE += "-DLUAPATH=/usr/lib/lua/5.1"
> +EXTRA_OECMAKE += "-DLUAPATH=${libdir}/lua/5.1"
>   
>   FILES_${PN}  += "${libdir}/* ${datadir}/lua/5.*/"
>   FILES_${PN}-dbg  += "${libdir}/lua/5.*/.debug"
> @@ -12,3 +12,12 @@ FILES_${PN}-dbg  += "${libdir}/lua/5.*/.debug"
>   DEPENDS += "lua5.1-native"
>   OECMAKE_C_FLAGS += "-I${STAGING_INCDIR}/lua5.1"
>   CFLAGS += "-I${STAGING_INCDIR}/lua5.1"
> +
> +do_configure_prepend () {
> +    if [ -e "${S}/CMakeLists.txt" ] ; then
> +        sed -i -e \
> +	"s:ARCHIVE DESTINATION lib:ARCHIVE DESTINATION \${CMAKE_INSTALL_LIBDIR}:g" \
> +	-e "s:LIBRARY DESTINATION lib:LIBRARY DESTINATION \${CMAKE_INSTALL_LIBDIR}:g" \
> +	${S}/CMakeLists.txt
> +    fi
> +}
> 


