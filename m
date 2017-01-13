Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id DE93371D9E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:33:08 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r144so12108045wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Y2zETFjYtQkqX+Q/EcmpbeKxbej/Y5BkD56gNIBxQaM=;
	b=Yf+hvdHedEXdHi+RYuL418/EUQfgSln0ghKRe+Z/mCTNd3cmgjL7hPFymlmv0iNDc3
	ZEFi9M26iYSWBA5kzokEkUlq9SXYE80Q1I50tmuBXZWDwWMRepm/QDz9nMxGki9UwCA6
	8ApU+/AYMHNRmLe4mAyh3A67ycImONvMHBRIVQCailVkz77DPht7FsrODJV0D+6rmxoF
	k9/EMEQ4YwgC/wmLtyrZy5Kl+k02A+vDvtoWaoIp2nwAe6dzJ0q4eMmpGoGNBA8J9s8o
	83Div8zMQ8/Fu1kVZtfmZIWASm8m3hsHJOEBeKSAI4ps7euqxLLq/Ti5v4PsvNkp+HRw
	WmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Y2zETFjYtQkqX+Q/EcmpbeKxbej/Y5BkD56gNIBxQaM=;
	b=ahSq9LmPagvVZc94y0+IQs+SRBstdEE6+QpEgDD3iqlNyQv9Qh0eA2wGqHeB/lrVf5
	N29WIZKZSXIsyawaSDX3MmsSemJcwa0VQRzbafzgAjJ5wzL99hcouKjgbFeYt1S1BY/q
	kBKau4gc/bpC9o5pDbmfxyOG5zf+erl0okcZe6tiA9S/SJnzX5XxiduNyokEn64jU2x2
	8P7xQQWqZiv46gf0w43+OOPe3rfaUYsxkje8f4TN/Iepsi6XMIjKc1G00PUTVCaHwTas
	VYNkM3iuATsEJzH5ucV598V6tV0VZepWcEj4mLO2beolQ0MFFNlpg3J410a+e1yaxBB/
	OCCA==
X-Gm-Message-State: AIkVDXKXjsmxE0zRKfBugvLUlvwkt3br4dHgn1Nt4z6QcN0rFPCP6TsQsyNM8pMXNG5F+xMzuJk3Cuu8N7XxwA==
X-Received: by 10.223.165.28 with SMTP id i28mr12610640wrb.82.1484317987893;
	Fri, 13 Jan 2017 06:33:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Fri, 13 Jan 2017 06:33:07 -0800 (PST)
In-Reply-To: <1484316051-25329-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1484316051-25329-1-git-send-email-yannick.gicquel@iot.bzh>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 13 Jan 2017 15:33:07 +0100
Message-ID: <CA+chaQc_Hu4-hDwx5Z2xdjvDOgNwyo+SHnOjyajV+AJdQQ+SOg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 1/2] ccache: enable max size setup for ccache dir
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
X-List-Received-Date: Fri, 13 Jan 2017 14:33:09 -0000
Content-Type: text/plain; charset=UTF-8

Patches for oe-core needs to go to openembedded-core ML.

On Fri, Jan 13, 2017 at 3:00 PM, Yannick Gicquel <yannick.gicquel@iot.bzh>
wrote:

> ccache directories are limited to 1G by default.
> This patch enables the configuration of their limits, and as default
> location is TMPDIR, it proposes a size limit to "0" (unlimited).
>
> The setup can be overloaded in local.conf by setting
> CCACHE_MAX_SIZE to a custom value if needed.
>
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
> ---
>  meta/classes/ccache.bbclass | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
> index 93fcaca..8a80040 100644
> --- a/meta/classes/ccache.bbclass
> +++ b/meta/classes/ccache.bbclass
> @@ -1,6 +1,21 @@
>  CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
>  export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
>  CCACHE_DISABLE[unexport] = "1"
> +CCACHE_MAX_SIZE ?= "0"
>
>  do_configure[dirs] =+ "${CCACHE_DIR}"
>  do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
> +
> +def init_ccache():
> +    # dummy python version
> +    return
> +
> +init_ccache() {
> +    if [ -n "${CCACHE}" ]; then
> +        ${CCACHE} -M ${CCACHE_MAX_SIZE}
> +    fi
> +}
> +
> +do_compile_prepend() {
> +    init_ccache
> +}
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

