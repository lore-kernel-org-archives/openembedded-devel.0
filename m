Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OmCGf-00020F-QD
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 23:03:24 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id DC1B616609D2; Thu, 19 Aug 2010 15:02:46 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 64128166093C;
	Thu, 19 Aug 2010 15:02:17 -0600 (MDT)
Message-ID: <4C6D9BD9.6040206@mlbassoc.com>
Date: Thu, 19 Aug 2010 15:02:17 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282248521-32053-1-git-send-email-jkridner@beagleboard.org>
In-Reply-To: <1282248521-32053-1-git-send-email-jkridner@beagleboard.org>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base-files: beagleboard: profile: use nano
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
X-List-Received-Date: Thu, 19 Aug 2010 21:03:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2010 02:08 PM, Jason Kridner wrote:
> If nano is available and EDITOR isn't otherwise set, then use it.
> Advanced users who would prefer vi will know how to set EDITOR anyway.
> I can clearly see myself being frustrated typing 'export EDITOR=vi'
> every time I start a BeagleBoard test ramdisk image, but better me have
> that than to try to explain to someone fresh how to use vi.
>
> Signed-off-by: Jason Kridner<jkridner@beagleboard.org>
> ---
>   recipes/base-files/base-files/beagleboard/profile |   41 +++++++++++++++++++++
>   1 files changed, 41 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/base-files/base-files/beagleboard/profile
>
> diff --git a/recipes/base-files/base-files/beagleboard/profile b/recipes/base-files/base-files/beagleboard/profile
> new file mode 100644
> index 0000000..7b1cf52
> --- /dev/null
> +++ b/recipes/base-files/base-files/beagleboard/profile
> @@ -0,0 +1,41 @@
> +# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
> +# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
> +
> +PATH="/usr/local/bin:/usr/bin:/bin"
> +# EDITOR needed for packages like cron
> +if [ "$EDITOR" ]; then

You sure you don't want this test instead?
   if [ -z "$EDITOR" ]; then

Otherwise, you'll be overriding some guy's choice and never defining
it for those who haven't


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


