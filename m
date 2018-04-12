Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 022657469A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 14:12:15 +0000 (UTC)
Received: from [IPv6:2001:16b8:462d:7300:a212:e281:6e27:17b]
	(200116b8462d7300a212e2816e27017b.dip.versatel-1u1.de
	[IPv6:2001:16b8:462d:7300:a212:e281:6e27:17b])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 93BD7287782;
	Thu, 12 Apr 2018 14:10:26 +0000 (UTC)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180412133558.9655-1-Martin.Jansa@gmail.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <7f04089b-7479-2575-6d91-8887118d19f8@zonque.org>
Date: Thu, 12 Apr 2018 16:12:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180412133558.9655-1-Martin.Jansa@gmail.com>
Subject: Re: [meta-qt5][rocko][WIP][PATCH] qt5: upgrade to 5.9.5
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
X-List-Received-Date: Thu, 12 Apr 2018 14:12:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On Thursday, April 12, 2018 03:35 PM, Martin Jansa wrote:
> * use latest revision from 5.9, because 5.9.5 tag is only on 5.9.5
>   branch which might get removed in future I was told
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I'm getting the following errors with this patch:

WARNING: qtxmlpatterns-5.9.4+gitAUTOINC+3444bfc803-r0 do_fetch: Failed
to fetch URL
git://github.com/qt/qtxmlpatterns.git;name=qtxmlpatterns;branch=5.9;nobranch=1;protocol=git,
attempting MIRRORS if available
ERROR: qtxmlpatterns-5.9.4+gitAUTOINC+3444bfc803-r0 do_fetch: Fetcher
failure: Unable to find revision
3444bfc8039c5090b02fd7f98abe8064a73019d7 in branch 5.9 even from upstream
ERROR: qtxmlpatterns-5.9.4+gitAUTOINC+3444bfc803-r0 do_fetch: Fetcher
failure for URL:
'git://github.com/qt/qtxmlpatterns.git;name=qtxmlpatterns;branch=5.9;nobranch=1;protocol=git'.
Unable to fetch URL from any source.
ERROR: qtxmlpatterns-5.9.4+gitAUTOINC+3444bfc803-r0 do_fetch: Function
failed: base_do_fetch
ERROR: Logfile of failure stored in:
/home/daniel/src/nepos/poky/build/tmp-glibc/work/aarch64-nepos-linux/qtxmlpatterns/5.9.4+gitAUTOINC+3444bfc803-r0/temp/log.do_fetch.3513
ERROR: Task
(/home/daniel/src/nepos/poky/build/conf/../../../meta-qt5/recipes-qt/qt5/qtxmlpatterns_git.bb:do_fetch)
failed with exit code '1'
WARNING: qtbase-native-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Failed
to fetch URL
git://github.com/qt/qtbase.git;name=qtbase;branch=5.9;nobranch=1;protocol=git,
attempting MIRRORS if available
ERROR: qtbase-native-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Fetcher
failure: Unable to find revision
f2095f2c66d0dae8525879f6c14165ace650e7f1 in branch 5.9 even from upstream
ERROR: qtbase-native-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Fetcher
failure for URL:
'git://github.com/qt/qtbase.git;name=qtbase;branch=5.9;nobranch=1;protocol=git'.
Unable to fetch URL from any source.
ERROR: qtbase-native-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Function
failed: base_do_fetch
ERROR: Logfile of failure stored in:
/home/daniel/src/nepos/poky/build/tmp-glibc/work/x86_64-linux/qtbase-native/5.9.4+gitAUTOINC+f2095f2c66-r0/temp/log.do_fetch.3509
ERROR: Task
(/home/daniel/src/nepos/poky/build/conf/../../../meta-qt5/recipes-qt/qt5/qtbase-native_git.bb:do_fetch)
failed with exit code '1'
WARNING: qtbase-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Failed to fetch
URL
git://github.com/qt/qtbase.git;name=qtbase;branch=5.9;nobranch=1;protocol=git,
attempting MIRRORS if available
ERROR: qtbase-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Fetcher failure:
Unable to find revision f2095f2c66d0dae8525879f6c14165ace650e7f1 in
branch 5.9 even from upstream
ERROR: qtbase-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Fetcher failure
for URL:
'git://github.com/qt/qtbase.git;name=qtbase;branch=5.9;nobranch=1;protocol=git'.
Unable to fetch URL from any source.
ERROR: qtbase-5.9.4+gitAUTOINC+f2095f2c66-r0 do_fetch: Function failed:
base_do_fetch
ERROR: Logfile of failure stored in:
/home/daniel/src/nepos/poky/build/tmp-glibc/work/aarch64-nepos-linux/qtbase/5.9.4+gitAUTOINC+f2095f2c66-r0/temp/log.do_fetch.3511
ERROR: Task
(/home/daniel/src/nepos/poky/build/conf/../../../meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_fetch)
failed with exit code '1'



Also, I guess you also need to bump the version number in
recipes-qt/qt5/qt5-git.inc, right?


Thanks,
Daniel

