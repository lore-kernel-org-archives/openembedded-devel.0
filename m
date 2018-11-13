Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 81CF26C115
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 22:55:31 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id u13-v6so13020838wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 14:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XONMV+EtZlO8l93+VDQllyIItv01HbYc9kMujpu3FLM=;
	b=lFihYCT/dCJIvZGMO9Lvwk1XLr9NJMT5EgfQhpDTSve8qA8AJdoKHjKC3ZJfFJUImu
	5Q1ThrmUMcnlhtn2dPyUqufExhoyHcLQ/LWeq+d1zFLKPwVB/NYBflamsFmoTrC+rb8E
	3wlXNDlqtdy0Gs+W9m8j34R5OnQ276ooyU80UO0a+NZ3Yj4ejve5TfD1qW3iOqHBu8ae
	lgibLBb5V5TxsXGIExaE/aMMBMjOEY9phQJMRm5/YAiOetNgxvzPSU4iw1nWrlA2EcCI
	YUKc6zPqOlIxxNpV9h4M4yxii2u3JmPZHsvn529IEpwZgGo+uSvLgC8ZWMLL5bHcWY/5
	D0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XONMV+EtZlO8l93+VDQllyIItv01HbYc9kMujpu3FLM=;
	b=guaRcAUr8UNCyIFOI8nJTpiX1HnaZbcfdxL4tauMxRG4c4ztAZvwcS1JT70V4T5Ijd
	YbTmcNPaJWFhm38CqcJwgUuZFpUJMVN72rD/fG/pnvaTYWFJ+MvVgCJ1xwO7u2mlynTj
	fw+r1bjgT5tOGO16SdpUgRAgMgPiaijBez+B81TArset78oFwsNUfh0v8GGBPAIJMe+n
	k77nmjI1wbTorXdYGKpkJ1dWfq7ojGCqlyvEocOq1NJYxFbKbugdwYaG2u1qsazeeii3
	R8Uddw1durqnGiQO9vTOJczBrbdbbRxZwNWBBXGGLJoN/dlaDUqcooGGYREHAGmStXjD
	ExGw==
X-Gm-Message-State: AGRZ1gLp+ouj/I7HizGYelrxr/ujDxJuPjdh9NjS8Z+ESnsHsejq2/E9
	NzFNFwKgci4tI5K91ShRzvY5j1cfFAcX1krdL84=
X-Google-Smtp-Source: AJdET5dJIwNetbSXUChO6BjPr17zZ4aPAGNx//1ZaApUQ7Pbhm9dr/Ix6uCIK/dUPyH+naMJ+vGNnwTu+ggMQjyDqxk=
X-Received: by 2002:a1c:124d:: with SMTP id 74-v6mr4968208wms.35.1542149732525;
	Tue, 13 Nov 2018 14:55:32 -0800 (PST)
MIME-Version: 1.0
References: <1542148831-30197-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1542148831-30197-1-git-send-email-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 13 Nov 2018 23:55:23 +0100
Message-ID: <CA+chaQfCoBFsOzLj6Vdf2tFX4hebD4bpqdXOMU4JstMScnJrBQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meta-oe: add selftest for sources.oe.org
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
X-List-Received-Date: Tue, 13 Nov 2018 22:55:32 -0000
Content-Type: text/plain; charset="UTF-8"

Is this the right URL? http://sources.openembedded.org/mirror/sources/
returns 404

meta/classes/mirrors.bbclass also uses:
cvs://.*/.*     http://sources.openembedded.org/ \n \
svn://.*/.*     http://sources.openembedded.org/ \n \
git://.*/.*     http://sources.openembedded.org/ \n \
hg://.*/.*      http://sources.openembedded.org/ \n \
bzr://.*/.*     http://sources.openembedded.org/ \n \
p4://.*/.*      http://sources.openembedded.org/ \n \
osc://.*/.*     http://sources.openembedded.org/ \n \
https?$://.*/.* http://sources.openembedded.org/ \n \
ftp://.*/.*     http://sources.openembedded.org/ \n \
npm://.*/?.*    http://sources.openembedded.org/ \n \

without the /mirror/sources suffix, maybe it's copy & paste issue from
downloads.yoctoproject.org which uses /mirror/sources?
git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \

But if the test works for you, then something even worse is going on :).

On Tue, Nov 13, 2018 at 11:40 PM Armin Kuster <akuster808@gmail.com> wrote:

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py | 30
> ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
>
> diff --git a/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
> b/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
> new file mode 100644
> index 0000000..79bebf5
> --- /dev/null
> +++ b/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
> @@ -0,0 +1,30 @@
> +import os
> +import re
> +import glob as g
> +import shutil
> +import tempfile
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
> +
> +class MetaOESourceMirroring(OESelftestTestCase):
> +    # Can we download everything from the OpenEmbedded Sources Mirror
> over http only
> +    def test_oe_source_mirror(self):
> +        self.write_config("""
> +BB_ALLOWED_NETWORKS = " sources.openembedded.org"
> +MIRRORS = ""
> +DL_DIR = "${TMPDIR}/test_oe_downloads"
> +PREMIRRORS = "\\
> +    bzr://.*/.*   http://sources.openembedded.org/mirror/sources/ \\n \\
> +    cvs://.*/.*   http://sources.openembedded.org/mirror/sources/ \\n \\
> +    git://.*/.*   http://sources.openembedded.org/mirror/sources/ \\n \\
> +    gitsm://.*/.* http://sources.openembedded.org/mirror/sources/ \\n \\
> +    hg://.*/.*    http://sources.openembedded.org/mirror/sources/ \\n \\
> +    osc://.*/.*   http://sources.openembedded.org/mirror/sources/ \\n \\
> +    p4://.*/.*    http://sources.openembedded.org/mirror/sources/ \\n \\
> +    svn://.*/.*   http://sources.openembedded.org/mirror/sources/ \\n \\
> +    ftp://.*/.*      http://sources.openembedded.org/mirror/sources/ \\n
> \\
> +    http://.*/.*     http://sources.openembedded.org/mirror/sources/ \\n
> \\
> +    https://.*/.*    http://sources.openembedded.org/mirror/sources/ \\n"
> +    """)
> +
> +        bitbake("world --runall fetch")
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

