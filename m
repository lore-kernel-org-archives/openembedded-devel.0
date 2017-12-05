Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 481 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Dec 2017 13:37:06 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id B18DE77E4D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Dec 2017 13:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 0D12A31854C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Dec 2017 14:29:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 5Fw2CP2v6u7J
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Dec 2017 14:29:04 +0100 (CET)
Received: from t460p (p57A61659.dip0.t-ipconnect.de [87.166.22.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 095593180D3C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Dec 2017 14:29:03 +0100 (CET)
Date: Tue, 5 Dec 2017 14:29:03 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20171205142903.6443ab7e@t460p>
In-Reply-To: <1512466387-8999-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1512466387-8999-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Subject: Re: [PATCH] [meta-networking][PATCH] packagegroup-samba: new add
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
X-List-Received-Date: Tue, 05 Dec 2017 13:37:06 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Zheng,

On Tue, 5 Dec 2017 17:33:07 +0800
zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:

> Add packagegroup for samba, for there are too many rpms in samba and it's hard to manage.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../packagegroups/packagegroup-samba.bb            | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/packagegroups/packagegroup-samba.bb
> 
> diff --git a/meta-networking/recipes-connectivity/packagegroups/packagegroup-samba.bb b/meta-networking/recipes-connectivity/packagegroups/packagegroup-samba.bb
> new file mode 100644
> index 0000000..6177691
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/packagegroups/packagegroup-samba.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "samba package groups"
> +PV = "1.0"
> +PR = "r2"
> +
> +inherit packagegroup
> +
> +PROVIDES = "${PACKAGES}"
> +PACKAGES = "${PN}-server ${PN}-client ${PN}-ctdb-tests ${PN}-pidl"
> +
> +SUMMARY_${PN}-client = " samba client"
> +RDEPENDS_${PN}-client = "\
> +    smbclient \
> +    samba-common \
> +    winbind \
> +    registry-tools \
> +    "

Why don't you just create a samba-client meta package inside
the samba recipe instead?

> +
> +SUMMARY_${PN}-server = " samba server"
> +RDEPENDS_${PN}-server = "\
> +    samba \
> +    samba-common \
> +    "

All samba libraries already depend on samba-common, so samba depends on it
indirectly. Therefore this "package group" doesn't seem to be necessary.

> +
> +SUMMARY_${PN}-ctdb-tests = " samba ctdb-tests"
> +RDEPENDS_${PN}-ctdb-tests = "samba-ctdb-tests"
> +
> +SUMMARY_${PN}-pidl = "samba-pidl"
> +RDEPENDS_${PN}-pidl = "samba-pidl"

These two seem to be unnecessary, too.

Regards,
Andreas

