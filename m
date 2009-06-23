Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ37j-0008QM-5D
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 12:21:07 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MJ2x0-0002JY-ST
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 10:10:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:10:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:10:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Jun 2009 11:12:23 +0200
Message-ID: <h1q69n$a5v$5@ger.gmane.org>
References: <200906230939.34062.marcin@juszkiewicz.com.pl>
	<1245747353-27218-2-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245747353-27218-2-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 048/125] s/IPKG_INSTALL/PACKAGE_INSTALL/
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
X-List-Received-Date: Tue, 23 Jun 2009 10:21:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-09 10:55, Marcin Juszkiewicz wrote:
> From: Mario Domenech Goulart<mario@ossystems.com.br>
>
> According to the git log (e.g.,
> 7302c6263934c237da66719bd42505b6c05d10cc), there was a change in the
> variable naming.  IPKG_INSTALL was renamed to PACKAGE_INSTALL some time
> ago. classes/rootfs_ipk.bbclass currently uses PACKAGE_INSTALL instead
> of IPKG_INSTALL.
>
> Signed-off-by: Mario Domenech Goulart<mario@ossystems.com.br>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   docs/usermanual/reference/class_rootfs_ipkg.xml |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/docs/usermanual/reference/class_rootfs_ipkg.xml b/docs/usermanual/reference/class_rootfs_ipkg.xml
> index b60adf8..98e6e25 100644
> --- a/docs/usermanual/reference/class_rootfs_ipkg.xml
> +++ b/docs/usermanual/reference/class_rootfs_ipkg.xml
> @@ -41,7 +41,7 @@
>
>       <listitem>
>         <para>Installs the list of requested<command>.ipkg</command>  packages,
> -<command>${IPKG_INSTALL}</command>;</para>
> +<command>${PACKAGE_INSTALL}</command>;</para>
>       </listitem>
>
>       <listitem>
> @@ -89,7 +89,7 @@
>
>     <variablelist>
>       <varlistentry>
> -<term>IPKG_INSTALL</term>
> +<term>PACKAGE_INSTALL</term>
>
>         <listitem>
>           <para>The list of packages which will be installed into the root
> @@ -212,4 +212,4 @@
>     which is executed without<xref linkend="fakeroot" />  and therefore can be
>     used from other classes, such as<xref linkend="image_class" />, that
>     are already running under the control of<xref linkend="fakeroot" />.</para>
> -</section>
> \ No newline at end of file
> +</section>




