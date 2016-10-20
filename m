Return-Path: <joelguittet@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2335D71C84
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 06:36:05 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id o68so74703799qkf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 23:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=92zTqE6NVJ6IK32Qo8lub1Lnyw24J6oFS52X6pM6CzM=;
	b=0QIFZhXYcKY3+Y0jdZY8WEb+AFQpod5PBhj9wG4ZNIneg8g0zJ4QKt/cARELMLvv5G
	L/ug4HoqL9SC0ZJU6D+pnDPugvAEOGnUvmBeNoWT5RiprFN3KLnp4QTmXgQdytThEYwy
	Je3KfEDulrzxcgixThLXZ1pgwQmJ+oxf/HLEaPtIVSv7IPcfyaYrlUplrE9p74cYlV3t
	BPXaXKXIj3/ZgfQY6D4UeGZcnZz5bB+t2emDrU5EpA3H3wfEjyue80ZSbZj/pJ26/Xrr
	rj+3V71xO5qpZjQvSbot+5ueG2+OrLGBZnLN0p6hYzZUEVUbew5xDT7S+7u8T5RHlONc
	Tuig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=92zTqE6NVJ6IK32Qo8lub1Lnyw24J6oFS52X6pM6CzM=;
	b=C/9zTrZ4Tky7F9OSILK1AFcbJY8KknI5zJEnHFGzg8NdzuP0d5rgLsLod5SewzXX+j
	ZiLU8rMQrfbZD08ZV83uyA11OWxPJlLoX9mf3aPlAIXF1SFnJkta4KuaYIa+MeLn5NEJ
	r7QYcgf1y4Ua+G+y6Ut9pN7LMWt7ZoAtbbQKU/GSPxt1mHIngn7D1cfNhutp/9ma53jr
	+H5MoiVC+kWx+tgOQm4J49TBRhOQr3M4AvBI+XfBCbIRGGpkx8rSQtkS2t9HW3PCFEkV
	PzjG3JpPuMnrZj7LkgZmNXiSmCmak0FqwigdG0YeBQuUS12jJoGxR8tGQ/LSbEKx/M49
	M8XQ==
X-Gm-Message-State: AA6/9RlZy+3cbyD86mi9VCcCKfILf5QypKOpqc/TxD6qTspKh1zx3O9iDcm7upvfxqORlnAQ31QGMWBLbDxtBA==
X-Received: by 10.194.22.103 with SMTP id c7mr6376698wjf.34.1476945366851;
	Wed, 19 Oct 2016 23:36:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.171.94 with HTTP; Wed, 19 Oct 2016 23:36:06 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=ABl_Guittet?= <joelguittet@gmail.com>
Date: Thu, 20 Oct 2016 08:36:06 +0200
Message-ID: <CAOwy=PPr-9vu=kJTSR8qJk6_31jjP1FrUO3XvO_JrSDb2-n-fQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-java] fails to fetch icedtea
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
X-List-Received-Date: Thu, 20 Oct 2016 06:36:06 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm building an image with OpenJDK, but fetching icedtea fails. It was
correctly done few weeks ago. Log indicates error on checksum, but I have
reviewed changes on meta-java and I do not understand why. Anybody with the
same issue?

Log:

WARNING: Checksum failure encountered with download of
http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/archive/f89009ada191.tar.bz2;name=openjdk;unpack=false
- will attempt other sources if available
WARNING: Renaming /home/kubuntu/yocto/build/downloads/f89009ada191.tar.bz2
to
/home/kubuntu/yocto/build/downloads/f89009ada191.tar.bz2_bad-checksum_2bc941373ca4b033c9a25f972eec7858
ERROR: Fetcher failure for URL: '
http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/archive/f89009ada191.tar.bz2;name=openjdk;unpack=false'.
Checksum mismatch!
File: '/home/kubuntu/yocto/build/downloads/f89009ada191.tar.bz2' has md5
checksum 2bc941373ca4b033c9a25f972eec7858 when
c26bbb33addfaeb14d28a1329b4b5a3e was expected
File: '/home/kubuntu/yocto/build/downloads/f89009ada191.tar.bz2' has sha256
checksum 5efd8e66f18fcbf45527bcc74aa3e6ed11f66bc793c88e3841925c4acb4827ba
when 54a0ef02b56b265b4122324e08a33c42ececbf2a300ada260611e7b6ccdba96d was
expected
If this change is expected (e.g. you have upgraded to a new version without
updating the checksums) then you can use these lines within the recipe:
SRC_URI[openjdk.md5sum] = "2bc941373ca4b033c9a25f972eec7858"
SRC_URI[openjdk.sha256sum] =
"5efd8e66f18fcbf45527bcc74aa3e6ed11f66bc793c88e3841925c4acb4827ba"
Otherwise you should retry the download and/or check with upstream to
determine if the file has become corrupted or otherwise unexpectedly
modified.

ERROR: Function failed: Fetcher failure for URL: '
http://icedtea.classpath.org/hg/release/icedtea7-forest-2.1/archive/f89009ada191.tar.bz2;name=openjdk;unpack=false'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/kubuntu/yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/temp/log.do_fetch.10452
ERROR: Task 1258
(/home/kubuntu/yocto/build/../meta-java/recipes-core/icedtea/
icedtea7-native_2.1.3.bb, do_fetch) failed with exit code '1'

Regards,
Joel

