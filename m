Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MARoY-0001Sv-Us
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 18:53:47 +0200
Received: (qmail 27450 invoked from network); 30 May 2009 16:45:13 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 May 2009 09:45:13 -0700
Date: Sat, 30 May 2009 09:45:13 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090530164513.GH23842@smtp.west.cox.net>
References: <1243535051-10168-1-git-send-email-msmith@cbnco.com>
	<1243535051-10168-2-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <1243535051-10168-2-git-send-email-msmith@cbnco.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] vim: be an alternative to /bin/vi; switch to	INC_PR
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
X-List-Received-Date: Sat, 30 May 2009 16:53:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2009 at 02:24:11PM -0400, Michael Smith wrote:

> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  recipes/vim/gvim_7.0.bb |    2 +-
>  recipes/vim/vim.inc     |    9 ++++++++-
>  recipes/vim/vim_6.4.bb  |    2 ++
>  recipes/vim/vim_7.0.bb  |    2 +-
>  4 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/vim/gvim_7.0.bb b/recipes/vim/gvim_7.0.bb
> index a073e65..60aa041 100644
> --- a/recipes/vim/gvim_7.0.bb
> +++ b/recipes/vim/gvim_7.0.bb
> @@ -3,7 +3,7 @@ VIMVER = "70"
>  require vim.inc
>  
>  DEPENDS += "gtk+ xt"
> -PR = "r1"
> +PR = "${INC_PR}.1"
>  FILESPATHPKG =. "vim-${PV}:vim:"

The FILESPATHPKG change here hasn't been submitted yet :)  This
particular change is

Acked-by: Tom Rini <trini@embeddedalley.com>

But I can't git am without the missing bit :)

-- 
Tom Rini


