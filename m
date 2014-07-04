Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A65C60424
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jul 2014 10:14:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s64AEcEi005648
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 4 Jul 2014 03:14:39 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 4 Jul 2014 03:14:38 -0700
Message-ID: <53B67E8D.6060702@windriver.com>
Date: Fri, 4 Jul 2014 18:14:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <53B676FE.50809@communistcode.co.uk>
In-Reply-To: <53B676FE.50809@communistcode.co.uk>
Subject: Re: tcpdump: bitbake throws autoconf errors, error message confusing
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
X-List-Received-Date: Fri, 04 Jul 2014 10:14:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


The error message comes from meta/classes/insane.bbclass:

grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation'

The log you showed didn't contain the words, so that it should not error,
maybe you have to debug in meta/classes/insane.bbclass.

Btw., the meta-oe's tcpdump is 4.3.0, yours is 4.5.1, maybe there are
other differences, for example you have used another insane.bbclass ?
(Just a guess)

// Robert

On 07/04/2014 05:42 PM, Jack Mitchell wrote:
> So tcpdump is failing to build in my latest uprev to all things HEAD.
> The error message is a touch cryptic:
>
> ERROR: This autoconf log indicates errors, it looked at host include
> and/or library paths while determining system capabilities.
> Rerun configure task after fixing this. The path was
> '/home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/core2-32-oe-linux/tcpdump/4.5.1-r0/build'
> ERROR: Function failed: do_qa_configure
>
> log: http://ix.io/dg9
>
> Looking at the log I can't see where that specific path is used... can
> anyone shed any light?
>
> Cheers,
>

