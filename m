Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 015627C8C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 02:30:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1J2UvMO016163
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2019 18:30:58 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Mon, 18 Feb 2019 18:30:57 -0800
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Feb 2019 18:30:56 -0800
Message-ID: <20190219023057.42559-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-java][PATCH 0/1] test instruction
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
X-List-Received-Date: Tue, 19 Feb 2019 02:30:57 -0000
Content-Type: text/plain

1. Create app program, the content similar to:

   	JNIEnv *env = NULL;
	JavaVM *jvm = NULL;

	JavaVMInitArgs vm_args;
	vm_args.version = JNI_VERSION_1_2;
	vm_args.options = NULL;
	vm_args.nOptions = 0;
	vm_args.ignoreUnrecognized = JNI_TRUE;

	jint res = JNI_CreateJavaVM(&jvm, (void**)&env, &vm_args);
	if ( ( res == JNI_OK ) && ( jvm != NULL ) )
	{
		jvm->DestroyJavaVM();
	}

2. Create a shell script to run continually this app on a powerPC target(e.g. qemuppc).

3. It will get randomly a segment.

Note: I used jdk8u_72b05 on qemuppc, for 172b11, because I can't build to pass on ppc,
I don't test it, but I think this problem should be exist on latest version too.

Wenlin Kang (1):
  openjdk: fix a random crash on JNI_CreateJavaVM

 .../openjdk-8-release-172b11-common.inc       |  1 +
 ...otspot-fix-crash-on-JNI_CreateJavaVM.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch

-- 
2.17.1


