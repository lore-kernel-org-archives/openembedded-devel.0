Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OHHqD-0005lu-38
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 16:44:18 +0200
Received: from p5b035a88.dip.t-dialin.net ([91.3.90.136] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OHHmC-0007AG-N5 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 16:40:11 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1OHAQY-0007R2-RV
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 08:49:18 +0200
Date: Wed, 26 May 2010 08:49:18 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100526064918.GH22917@excalibur.local>
References: <1274854676-5931-1-git-send-email-koen@openembedded.org>
	<1274854676-5931-4-git-send-email-koen@openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1274854676-5931-4-git-send-email-koen@openembedded.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_06_12,SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/7] Usermanual/getting_oe: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 14:44:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 2010-05-26 at 08:17, Koen Kooi wrote:
> From: Chase Maupin <chase.maupin@ti.com>
> 
> * Fixed up typos and other errors in the documentation.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> Signed-off-by: Koen Kooi <k-kooi@ti.com>

Non-native speaker ack:
Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

> ---
>  docs/usermanual/chapters/getting_oe.xml |   26 ++++++++++++++++++++++----
>  1 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
> index d18c955..cb82220 100644
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
> +                <para>Build and image that is the smallest possible image
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
> 1.7.0
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


