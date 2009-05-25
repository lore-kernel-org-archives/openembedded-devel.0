Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M8Pk3-0000CK-Rl
	for openembedded-devel@openembedded.org; Mon, 25 May 2009 04:16:44 +0200
Received: (qmail 29494 invoked from network); 25 May 2009 02:08:46 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 24 May 2009 19:08:46 -0700
Date: Sun, 24 May 2009 19:08:46 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090525020845.GS23842@smtp.west.cox.net>
References: <1243199407-28031-1-git-send-email-ihar.hrachyshka@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1243199407-28031-1-git-send-email-ihar.hrachyshka@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] directfb: added new version 1.2.8
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
X-List-Received-Date: Mon, 25 May 2009 02:16:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 25, 2009 at 12:10:07AM +0300, Ihar Hrachyshka wrote:

> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
>  conf/checksums.ini                                 |    4 +++
>  .../directfb/directfb-1.2.8/ts_lib_autotools.patch |   22 ++++++++++++++++
>  recipes/directfb/directfb_1.2.8.bb                 |   27 ++++++++++++++++++++
>  3 files changed, 53 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/directfb/directfb-1.2.8/ts_lib_autotools.patch
>  create mode 100644 recipes/directfb/directfb_1.2.8.bb

NAK.  Can you please add in:
    file://directfb-1.2.x-fix-pkgconfig-cflags.patch;patch=1 \
    file://mkdfiff.patch;patch=1 \
    file://dont-use-linux-config.patch;patch=1 \
(from the files/ dir).  Thanks.

-- 
Tom Rini


