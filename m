Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T1LmF-0001lW-6h
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 20:23:39 +0200
Received: from localhost ([127.0.0.1]:51200 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T1L6G-0001vx-Up
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 17:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=U8+MyhYdMSb7eZWIMV6HkkBuiXM=; b=Ru9TUFpoWIX8pQ5JKL9BAhy0NzKb
	gYY7xTw/ebZ/L2+SsNueT79+Dne3J4TC98ekbwx94NhbxOY9P0kI/l/xrVEgkDFP
	MGHxDNxE8bEcxwsgMlQ52k7qObacuA4SWOQeZfZPyP//MSjTzHkWLmf8EXaUfsFN
	oFRD/Jwo7u/apy0=
Received: from cpc2-cmbg15-2-0-cust171.5-4.cable.virginmedia.com
	([86.26.12.172]:52093 helo=[192.168.1.113])
	by eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1T1L6G-0001vu-SC for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 17:40:16 +0000
Message-ID: <502A8D7E.1000009@communistcode.co.uk>
Date: Tue, 14 Aug 2012 18:40:14 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAL2sKTn13OQ4edHfMwEVzLrpEO1prWGJ_V-1ueZj4KH4BBTDtA@mail.gmail.com>
	<k0d7ds$odu$2@dough.gmane.org>
	<CAL2sKTm8xG5o7MfWiALcXrzTsvqk-vR0VmkJbC4Wt4ecCZVxPQ@mail.gmail.com>
In-Reply-To: <CAL2sKTm8xG5o7MfWiALcXrzTsvqk-vR0VmkJbC4Wt4ecCZVxPQ@mail.gmail.com>
Subject: Re: [RFC][PATCH v2] plowshare: Add Git version (initial recipe)
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
X-List-Received-Date: Tue, 14 Aug 2012 18:23:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 14/08/2012 13:50, Matthieu wrote:
> Add recipe for plowshare (git repository).
>
> v2:
> - fix big mistake DEPENDS => RDEPENDS
> - set SRCREV to empty string
> - keep PE=1 to respect upstream scheme
>
> Signed-off-by: Matthieu Crapet <mcrapet@gmail.com>
> ---
>   meta/recipes-support/plowshare/plowshare_git.bb |   27
> +++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>   create mode 100644 meta/recipes-support/plowshare/plowshare_git.bb
>
> diff --git a/meta/recipes-support/plowshare/plowshare_git.bbb/meta/recipes-support/plowshare/
> plowshare_git.bb
> new file mode 100644
> index 0000000..f819255
> --- /dev/null
> +++ b/meta/recipes-support/plowshare/plowshare_git.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "Command-line download/upload tool for file sharing hosters"
> +HOMEPAGE = "http://code.google.com/p/plowshare/"
> +SECTION = "console/utils"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +# Follow uptream (debian) naming convention,
> +# for example: plowshare_1~git20120807-1_all.deb
> +PV = "gitr${SRCPV}"
> +PE = "1"
> +SRCREV = ""
> +
> +RDEPENDS_${PN} = "bash curl"
> +SRC_URI = "git://
> code.google.com/p/plowshare.git;protocol=http;branch=master"
> +S = "${WORKDIR}/git"
> +
> +inherit allarch
> +
> +# Nothing to compile, it's scripts!
> +do_compile() {
> + :
> +}
> +
> +do_install() {
> + oe_runmake PREFIX="${prefix}" DESTDIR="${D}" install
> +}
> --
> 1.7.9.5
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Matthieu,

Before you bear the wrath of Koen, I would recommend you at least move 
this to an appropriate layer (such as somewhere in meta-oe[1]).

The general consensus is that things only go in oe-core if they are 
required for a core-system build.

[1] https://github.com/openembedded/meta-oe


