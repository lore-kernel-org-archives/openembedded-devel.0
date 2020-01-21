Return-Path: <prvs=282131db8=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id EBAFF7FD8D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1579606024; x=1611142024;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=aAJVZlvUilieWNeEMY6DZJVWvKjTvklLnaA4Zs174Bk=;
	b=BiVdc93Zq26/HNWr30kv5RIvuWCVo7guSgJUVCdtE9jXL/LuuTAvq0nf
	sYdHViL1CSwxuFETWam5wk91m6L+prWw9EUtvdWqdNotUvdLMhOZsWNUr
	69n1N4h88WZ5hdZ3u8EZQmdstyH7oINeVYHY/JP/p9PHP+gePdIzENv6s
	tiA2UgWs640Q2BEHM0nl9chPoXe4MHFttE3BMu/Uj4500WPMfgm6bj85w
	5WGA+YYz5xHij5nN0S8s/DYrWOSMTurxWBCyyAC9WkZHksh///6Po0g62
	2SP11ivflqDqU31XyuQTo6Yn83DFP20Ztdx5VD70XSX+qEO+To1AXy6xn A==;
IronPort-SDR: CpY7WZNipBX9BE4J9RONj8QuQVRFOc2rI1loFPNf8GJV/jKcC34m13LOvC6r29uoMdXVQ+602z
	PPbtjBrusTTZ0J397FXprFmu1F9CQ3cAHX7aCr5PBD2pIT7b4l1thYy0sLFBOaplJ2Pnh2sLFu
	B4saRMiqIZUQDBzuHYusIJr+//JR/C8XWuU64gExEzxdfJrJMECoyZly5ChEckl8jNP3wZotMH
	zLd8dFLT4wwimZgh6wOzM9pemPhWx8Wk+AH+tq1RVaSgncTZeNCnRZ0Y2Y7bjQnb226JSfwTsV
	+yk=
X-IronPort-AV: E=Sophos;i="5.70,345,1574118000"; 
   d="scan'208";a="2495336"
Date: Tue, 21 Jan 2020 12:27:01 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: <mohamad.noor.alim.hussin@intel.com>
Message-ID: <20200121112701.GA24847@pcleri>
References: <20191231071948.28950-1-mohamad.noor.alim.hussin@intel.com>
	<20191231071948.28950-2-mohamad.noor.alim.hussin@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191231071948.28950-2-mohamad.noor.alim.hussin@intel.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH v3 1/2] openjdk-12: Add new recipe
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
X-List-Received-Date: Tue, 21 Jan 2020 11:27:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

On Tue, Dec 31, 2019 at 03:19:47PM +0800, mohamad.noor.alim.hussin@intel.com wrote:
> From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
> 
> Openjdk-12 is implementation of Java SE 12.
> This recipe taken from branch jdk12u on release 12.0.2+10 [1].
> Openjdk-12 can compile with glibc on x86_64, x86 and aarch64. Compiling
> against musl is not working. This recipe require openjdk-11 to be installed
> on host machine.

Can you implement a switch to select if jdk12 should be built from
hosttools or not?
Something similar to https://patchwork.openembedded.org/patch/160000/ ?

I don't want to have a "hard" depenency on openjdk as a hosttool.

Thanks!

regards;rl

> 
> Some highlight features for openjdk-12 taken from [2-9]
>     189: 	Shenandoah: A Low-Pause-Time Garbage Collector (Experimental)
>     230: 	Microbenchmark Suite
>     325: 	Switch Expressions (Preview)
>     334: 	JVM Constants API
>     340: 	One AArch64 Port, Not Two
>     341: 	Default CDS Archives
>     344: 	Abortable Mixed Collections for G1
>     346: 	Promptly Return Unused Committed Memory from G1
> 
> For more information see source code at [10].
> 
> References
> [1] https://openjdk.java.net/projects/jdk/12/
> [2] https://openjdk.java.net/jeps/189
> [3] https://openjdk.java.net/jeps/230
> [4] https://openjdk.java.net/jeps/325
> [5] https://openjdk.java.net/jeps/334
> [6] https://openjdk.java.net/jeps/340
> [7] https://openjdk.java.net/jeps/341
> [8] https://openjdk.java.net/jeps/344
> [9] https://openjdk.java.net/jeps/346
> [10] https://hg.openjdk.java.net/jdk-updates/jdk12u/rev/7b6accc7c009
> 
> Signed-off-by: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
> ---

...

