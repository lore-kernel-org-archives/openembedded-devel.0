Return-Path: <prvs=539d5a1e3=Richard.Leitner@skidata.com>
X-Greylist: delayed 590 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 Jan 2018 12:07:31 UTC
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 9119871C70
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 12:07:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.46,330,1511823600"; 
   d="scan'208";a="1197997"
To: Jose Diaz de Grenu <Jose.DiazdeGrenu@digi.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1515412157-30726-1-git-send-email-Jose.DiazdeGrenu@digi.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <fca0add8-d2b2-2ab1-02d1-d6232e668105@skidata.com>
Date: Mon, 8 Jan 2018 12:57:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1515412157-30726-1-git-send-email-Jose.DiazdeGrenu@digi.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] openjdk-7: fix compile errors with current poky master (gcc6)
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
X-List-Received-Date: Mon, 08 Jan 2018 12:07:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jose,

On 01/08/2018 12:49 PM, Jose Diaz de Grenu wrote:
> From: Richard Leitner <richard.leitner@skidata.com>
> 
> Using the current poky master openjdk-7 wasn't buildable. This patch
> fixes those problems by adding three more patches to openjdk-7.
> 
> These patches basically add/fix GCC6 support. Furthermore the
> LDFLAGS_HASH_STYLE variable (which was removed by the
> icedtea-crosscompile-fix.patch) is re-introduced and set to "both" for
> compatibility reasons.
> 
> Following two patches were originally written by Abdur Rehman and taken
> from meta-mentor [1]:
> 	icedtea-flags-to-compile-with-GCC-6.patch
> 	icedtea-specify-overloaded-variant-of-fmod.patch
> 
> [1] https://github.com/MentorEmbedded/meta-mentor
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> Signed-off-by: Jose Diaz de Grenu <Jose.DiazdeGrenu@digi.com>

AFAIK this patch was already merged to meta-java/master...
So why the resend?

regards;Richard.L

