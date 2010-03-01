Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nm1nL-0008E9-Qu for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 10:20:12 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nm1kb-0006zK-Gn for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 10:17:17 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 10:17:17 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 10:17:17 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 01 Mar 2010 10:17:05 +0100
Message-ID: <hmg0mh$ou0$1@dough.gmane.org>
References: <1266605268-5957-1-git-send-email-clarson@kergoth.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100219 Shredder/3.0.3pre
In-Reply-To: <1266605268-5957-1-git-send-email-clarson@kergoth.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] package.bbclass: when running 'file', be explicit about the path to the magic
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
X-List-Received-Date: Mon, 01 Mar 2010 09:20:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I don't have 'file/' in STAGING_DATADIR_NATIVE so I now have lots of
unstripped stuff (150MB libxul.so). Could you please add an extra check
to see if file/magic exists?

regards,

Koen

On 19-02-10 19:47, Chris Larson wrote:
> From: Tom Rini <tom_rini@mentor.com>
> 
> This works around one relocation issue.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>
> ---
>  classes/package.bbclass |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/classes/package.bbclass b/classes/package.bbclass
> index 062f782..72c9053 100644
> --- a/classes/package.bbclass
> +++ b/classes/package.bbclass
> @@ -155,11 +155,12 @@ def runstrip(file, d):
>      import commands, stat
>  
>      pathprefix = "export PATH=%s; " % bb.data.getVar('PATH', d, True)
> +    magicfile = "%s/file/magic" % bb.data.getVar('STAGING_DATADIR_NATIVE', d, True) 
>  
> -    ret, result = commands.getstatusoutput("%sfile '%s'" % (pathprefix, file))
> +    ret, result = commands.getstatusoutput("%sfile -m %s '%s'" % (pathprefix, magicfile, file))
>  
>      if ret:
> -        bb.error("runstrip: 'file %s' failed (forced strip)" % file)
> +        bb.error("runstrip: 'file -m %s %s' failed (forced strip)" % (magicfile, file))
>  
>      if "not stripped" not in result:
>          bb.debug(1, "runstrip: skip %s" % file)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLi4YRMkyGM64RGpERAoPBAKCdNJV1xR2zZTGU6XSn/jHIDfrNCQCbBFWS
DrZI2u7qsGPg1ABHQh4loHU=
=spj2
-----END PGP SIGNATURE-----



