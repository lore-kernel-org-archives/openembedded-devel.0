Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TRlh5-0000jB-1k
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 17:19:31 +0200
Received: from [10.155.1.52] (unknown [91.224.175.20])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 5E321D2218
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 17:06:01 +0200 (CEST)
Message-ID: <508AA6D5.1030009@linaro.org>
Date: Fri, 26 Oct 2012 17:05:57 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAJTo0LYm7bwU0fNYcD8wQ3unJm_ShoW-ej5tZ3FeeogEztJGnQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYm7bwU0fNYcD8wQ3unJm_ShoW-ej5tZ3FeeogEztJGnQ@mail.gmail.com>
Subject: Re: Danny stable release branch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 15:19:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 26.10.2012 15:44, Burton, Ross pisze:
> Hi,
> 
> Now that 1.3 is released[1] I can announce that I'm the Danny stable
>  release series maintainer.  This involves pulling any relevant 
> security fixes, build fixes and critical bug fixes from master, and 
> periodically rolling a 1.3.x release.
> 
> Obviously there's a lot of activity in master so whilst I intend to 
> consider every commit, if anyone submits patches to master that 
> should also be in danny, please say so either in a direct mail or 
> with a tag in the subject line.

Are there chances that AArch64 related changes which are present in
master can get into danny? Everything other then gnu-config should be
safe and not affect other targets:

commit 468c074ba15cd4b93600d5ba5a1fdc032718d7c3
Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date:   Thu Oct 4 16:15:08 2012 +0200

    pcmanfm: mark AArch64 as compatible

    Signed-off-by: Saul Wold <sgw@linux.intel.com>

commit c9514779de7fa6ea4cfa0c911cff25ea8c6a5152
Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date:   Wed Oct 3 16:29:01 2012 +0200

    packagegroups: disable kexec, valgrind, lttng, systemtap on AArch64

    Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>

commit 1dbf17d221ee9d50c5de8c04144c92fdc78d6d73
Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date:   Wed Oct 3 11:20:12 2012 +0200

    util-linux: add AArch64 support

    Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>

commit 490b12126aff7e8e59569ebb471ce04ba4962b7c
Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date:   Wed Oct 3 11:18:33 2012 +0200

    openssl: add AArch64 support

    Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>

commit 39d71c8c41276091688decb64d418e1e3637e2b6
Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date:   Thu Sep 27 15:13:08 2012 +0200

    insane.bbclass: add AArch64 support

    Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>

commit 9583a46221580ba46ebfd6d561d3a4d6b0d42eea
Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date:   Thu Sep 27 14:59:25 2012 +0200

    kernel-arch.bblass: add AArch64 support

    Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>

commit fde788cf5b0e480a675d2aa256af0915a120bc65
Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date:   Thu Sep 27 14:59:04 2012 +0200

    siteinfo.bbclass: add AArch64 support

    Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>


