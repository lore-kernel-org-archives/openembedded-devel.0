Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MBt1W-0002GX-CF
	for openembedded-devel@openembedded.org; Wed, 03 Jun 2009 18:09:06 +0200
Received: (qmail 30709 invoked from network); 3 Jun 2009 16:00:08 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 3 Jun 2009 09:00:08 -0700
Date: Wed, 3 Jun 2009 09:00:07 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090603160007.GJ26065@smtp.west.cox.net>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 02/12] qt4-embedded: added directfb plugin
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
X-List-Received-Date: Wed, 03 Jun 2009 16:09:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 03, 2009 at 06:37:12PM +0300, Ihar Hrachyshka wrote:
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
>  recipes/qt4/qt4-embedded.inc |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
> index bae52ab..3d986b2 100644
> --- a/recipes/qt4/qt4-embedded.inc
> +++ b/recipes/qt4/qt4-embedded.inc
> @@ -3,7 +3,7 @@ SECTION = "libs"
>  LICENSE = "GPL QPL"
>  PRIORITY = "optional"
>  HOMEPAGE = "http://www.trolltech.com"
> -DEPENDS += "tslib"
> +DEPENDS += "directfb tslib"
>  INC_PR = "r11"

So, here's a problem.  We both don't allow use flags and we force
directfb stuff to be done in foo-directfb (libxine / synaesthesia seems
to be the exception to this rule) rather than the main foo package.

-- 
Tom Rini


