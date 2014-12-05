Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 9095772341
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 11:44:34 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id D8CE9F8119A; Fri,  5 Dec 2014 04:44:34 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id AE0F7F81199;
	Fri,  5 Dec 2014 04:44:33 -0700 (MST)
Message-ID: <54819AB7.1000400@mlbassoc.com>
Date: Fri, 05 Dec 2014 04:44:55 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1417779660-18387-1-git-send-email-awais_belal@mentor.com>
In-Reply-To: <1417779660-18387-1-git-send-email-awais_belal@mentor.com>
Subject: Re: [meta-oe][PATCH 1/2] mplayer2: use B = "${S}"
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
X-List-Received-Date: Fri, 05 Dec 2014 11:44:43 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-12-05 04:40, Awais Belal wrote:
> The mplayer2 package does not support out of tree builds
> and the do_configure step also tries to find the configure
> script in the same build directory while the script lies in
> the src directory.
> This patch updates the builddir to point to the srcdir in
> order to cope with the above issues.
>
> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>   meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> index 65fab1f..4656057 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> @@ -29,6 +29,7 @@ PR = "r13"
>   PARALLEL_MAKE = ""
>
>   S = "${WORKDIR}/git"
> +B = "${S}"
>
>   FILES_${PN} = "${bindir}/mplayer ${libdir} /usr/etc/mplayer/"
>   CONFFILES_${PN} += "/usr/etc/mplayer/input.conf \
>

It would probably be better to just inherit autoconf-brokensep
which does the same thing but documents the reason for the change.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

