Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF6F74C1A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jul 2018 13:41:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6FDfbJl027171
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Jul 2018 06:41:38 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Sun, 15 Jul 2018 06:41:31 -0700
To: Khem Raj <raj.khem@gmail.com>, <Martin.Jansa@gmail.com>,
	<akuster808@gmail.com>
References: <1531497317-26576-1-git-send-email-hongxu.jia@windriver.com>
	<f831e0e9-60e6-7a54-d051-c21604c0bb6a@gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <04bb8026-4d28-2a40-7dd0-4b8ff34e9222@windriver.com>
Date: Sun, 15 Jul 2018 21:41:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <f831e0e9-60e6-7a54-d051-c21604c0bb6a@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] mozjs: 17.0.0 -> 52.8.1
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
X-List-Received-Date: Sun, 15 Jul 2018 13:41:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年07月14日 01:31, Khem Raj wrote:
> fails for configure
> | checking for the Android toolchain directory... not found
> | Traceback (most recent call last):
> |   File
> "/mnt/a/oe/build/tmp/work/cortexa7hf-neon-vfpv4-bec-linux-gnueabi/mozjs/52.8.1-r0/mozjs-52.8.1/js/src/../../configure.py",
> line 115, in <module>
> |     sys.exit(main(sys.argv))
> |   File
> "/mnt/a/oe/build/tmp/work/cortexa7hf-neon-vfpv4-bec-linux-gnueabi/mozjs/52.8.1-r0/mozjs-52.8.1/js/src/../../configure.py",
> line 34, in main
> |     sandbox.run(os.path.join(os.path.dirname(__file__), 'moz.configure'))
> |   File
> "/mnt/a/oe/build/tmp/work/cortexa7hf-neon-vfpv4-bec-linux-gnueabi/mozjs/52.8.1-r0/mozjs-52.8.1/python/mozbuild/mozbuild/configure/__init__.py",
> line 359, in run
> |     raise InvalidOptionError('Unknown option: %s' % without_value)
> | mozbuild.configure.options.InvalidOptionError: Unknown option:
> --disable-static

Hi Khem,

The `--disable-static' option has already been explicitly removed by me

in mozjs 52.8.1, I could not reproduce the failure in my build, would you

please paste the reproduce steps, or result of `bitbake -e mozjs' to trace

where the option come from

//Hongxu


