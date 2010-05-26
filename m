Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OHJZ0-0004Qc-S4
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 18:34:40 +0200
Received: from gandalf.denix.org ([unknown] [71.255.238.44])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L31003P6CIGKLO8@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	26 May 2010 11:30:17 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0A77214AF64; Wed,
	26 May 2010 12:30:16 -0400 (EDT)
Date: Wed, 26 May 2010 12:30:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100526163016.GG23464@denix.org>
References: <1274879375-19626-1-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-2-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-3-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-4-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1274879375-19626-4-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: Re: [PATCHv2 4/7] getting_oe: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 16:34:40 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, May 26, 2010 at 08:09:32AM -0500, Chase Maupin wrote:
> * Fixed up typos and other errors in the documentation.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  docs/usermanual/chapters/getting_oe.xml |   26 ++++++++++++++++++++++----
>  1 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
> index d18c955..c82df3a 100644
> --- a/docs/usermanual/chapters/getting_oe.xml
> +++ b/docs/usermanual/chapters/getting_oe.xml
> @@ -98,7 +98,7 @@ $ <command>git</command> clone git://git.openembedded.org/openembedded</screen>
>          seems good practice to update your OpenEmbedded tree at least
>          daily. To do this, run:
>          <screen>
> -$ <command>cd</command> $OEBASE
> +$ <command>cd</command> $OEBASE/openembedded
>  $ <command>git</command> pull</screen>
>        </para>
>      </section>
> @@ -142,7 +142,7 @@ $ <command>git</command> pull</screen>
>  
>        <para>Since the path to your OpenEmbedded installation will be used in
>          many places, setting it in your environment will allow you to use
> -        the <varname>$OEBASE</varname> variable in all pathes and make it
> +        the <varname>$OEBASE</varname> variable in all paths and make it
>          easier to change in the future should the need arise. To
>          set <varname>$OEBASE</varname> if you use a Bourne like shell
>          <footnote>
> @@ -342,6 +342,16 @@ MACHINE = "om-gta01"</screen>
>              </varlistentry>
>  
>              <varlistentry>
> +              <term><literal>base-image</literal></term>
> +              <listitem>
> +                <para>Build an image that is the smallest possible image
> +                  which allows for ssh access and the ability to install
> +                  additional packages using ipkg.
> +                </para>
> +              </listitem>
> +            </varlistentry>
> +
> +            <varlistentry>
>                <term><literal>console-image</literal></term>
>                <listitem>
>                  <para>Build an image without the X11, gtk+, or qt windowing
> @@ -463,9 +473,10 @@ MACHINE = "om-gta01"</screen>
>              </varlistentry>
>  
>              <varlistentry>
> -              <term><literal>task-native-sdk</literal></term>
> +              <term><literal>task-sdk-native</literal></term>
>                <listitem>
> -                <para>Mata-package for native (on-device) SDK.
> +                <para>Meta-package for native (on-device) SDK.  i.e. libc, gcc,
> +                  make, etc.
>                  </para>
>                </listitem>
>              </varlistentry>
> @@ -536,6 +547,13 @@ MACHINE = "om-gta01"</screen>
>                  <para>Builds the appropriate kernel for your device.</para>
>                </listitem>
>              </varlistentry>
> +
> +            <varlistentry>
> +              <term><literal>virtual/bootloader</literal></term>
> +              <listitem>
> +                <para>Builds the appropriate bootloader for your device.</para>
> +              </listitem>
> +            </varlistentry>
>            </variablelist>
>          </para>
>        </section>
> -- 
> 1.6.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


