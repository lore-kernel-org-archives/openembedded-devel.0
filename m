Return-Path: <xiao.zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6080A65D1B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 06:25:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3P6PaUq020216
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 23:25:36 -0700 (PDT)
Received: from [128.224.162.189] (128.224.162.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 24 Apr 2014 23:25:35 -0700
Message-ID: <5359FFDC.1000206@windriver.com>
Date: Fri, 25 Apr 2014 14:25:32 +0800
From: zhangxiao <xiao.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
X-Originating-IP: [128.224.162.189]
Cc: "Bruce.Ashfield" <bruce.ashfield@windriver.com>
Subject: How to deal with complex patch including creating new patches?
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
X-List-Received-Date: Fri, 25 Apr 2014 06:25:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Experts,

As we know, usually we have to add patches on source tree and in most cases
what we need to do is just add the source of the patch into SRC_URI list
and bitbake will install it automatically in "patch" task.

While for some complex cases, for example the netcat as below:

http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb?h=master

...
  8        SRC_URI = 
"${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat 
\
  9 
${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-7.debian.tar.gz;name=netcat-patch"
...

It has two sources: one source tree as 
"netcat-openbsd_${PV}.orig.tar.gz"and the other is a patch
called "netcat-openbsd_${PV}-7.debian.tar.gz".

While the patch is not simple as usual that beside common modifications 
on source tree,
it also creates several patches that also need to be installed. To deal 
with it, this
bb file make it in do_compile in line 22 as below:
...
20        do_compile() {
21            cd ${S}
22            while read line; do patch -p1 < 
${WORKDIR}/debian/patches/$line; done < ${WORKDIR}/debian/patches/series
23            pkgrel=4
24            oe_runmake CFLAGS="$CFLAGS 
-DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\""
25        }
...

Of course it is not good and will cause error when we force re-compile it
since those patches had already been installed in the previous compile task.

The how to fix it?

Currently I can find two methods as below:

First, for line 21, 22 of do_compile that install new created patches, 
remove them.
Then:

A) Add a do_patch_append and install those new created patches to this 
function;

B) Convert the netcat-openbsd_${PV}-7.debian.tar.gz to a pure patch. Let it
contains all modifications and no need to create more patches any more. Then
place this new created patch locally and modify the SRC_URI to point to it.

Compare with A and B, which one is advised here? Why? Any suggestions 
and comments is helpful!

Of course, we can also leave the patch installation in do_compile but just
add a flag to make it. But that is really not a good method. :-)

Thanks
Xiao

