Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tux.jens@googlemail.com>) id 1OOt4r-0006OI-QM
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 15:54:50 +0200
Received: by fxm18 with SMTP id 18so649984fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:sender:user-agent;
	bh=rkINhylEhLh0ecPH6gy81T+2hn6PlWq68tknERf2UOw=;
	b=Gan6hZtGCcRLffe5BnejUpdbmYRvyUBc2TxLQQi/hWWZqfi9c7L32gofV+m1Hl40bi
	L9ZYdOXmh1SFOru34DvER7AONqbM5RLNf6ZIYK4VEDDhQhe6gPqNfflFC5uC4u1ov91M
	TmMkorXGTvUG2BawRWXwMXT4FN2/+I7v+Nq1Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to:sender
	:user-agent;
	b=QCpzgK34bOcJjmp4SCN/RrJrkrqRDs708a6mziZFvTWEFSVowR1qKu56SLFDo4B230
	aZSJrDlGjw+AIM/nFhOqKiFrjW4xwsSQDn90mR5sPYg02p17XXA39kxICdpoZMQ0PN+P
	N2VQFLA5kd+CsXSdigo42cgQg6OJ33GvcyKbQ=
Received: by 10.223.65.73 with SMTP id h9mr9165655fai.75.1276696220758;
	Wed, 16 Jun 2010 06:50:20 -0700 (PDT)
Received: from merkur.sol.de (p4FD70B46.dip0.t-ipconnect.de [79.215.11.70])
	by mx.google.com with ESMTPS id o19sm12371271fal.23.2010.06.16.06.50.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 16 Jun 2010 06:50:19 -0700 (PDT)
Received: from jens by merkur.sol.de with local (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1OOsif-0000Ia-6a
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 15:31:53 +0200
Date: Wed, 16 Jun 2010 15:31:53 +0200
From: Jens Seidel <jensseidel@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100616133150.GA1135@merkur.sol.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <201006161433.54486.schnitzeltony@gmx.de>
	<20100616124248.GD31405@jama>
	<201006161451.26478.schnitzeltony@gmx.de>
MIME-Version: 1.0
In-Reply-To: <201006161451.26478.schnitzeltony@gmx.de>
Sender: Jens Seidel <tux.jens@googlemail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: tux.jens@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: xfce 4.6.2 recipes
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
X-List-Received-Date: Wed, 16 Jun 2010 13:54:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 16, 2010 at 02:51:26PM +0200, Andreas Mueller wrote:
> diff --git a/recipes/xfce-base/exo-0.3.107/exo-0.3.107-iocharset.patch b/recipes/xfce-base/exo-0.3.107/exo-0.3.107-iocharset.patch
> new file mode 100644
> index 0000000..a667f11
> --- /dev/null
> +++ b/recipes/xfce-base/exo-0.3.107/exo-0.3.107-iocharset.patch
> @@ -0,0 +1,79 @@
> +diff --git a/exo-mount/exo-mount-hal.c b/exo-mount/exo-mount-hal.c
> +index 791a536..4b130c3 100644
> +--- a/exo-mount/exo-mount-hal.c
> ++++ b/exo-mount/exo-mount-hal.c
> +@@ -616,6 +618,30 @@ oom:  g_set_error (error, G_FILE_ERROR, G_FILE_ERROR_NOMEM, g_strerror (ENOMEM))
> + 
> + 
> + /**
> ++ * exo_mount_hal_iocharset:
> ++ *
> ++ * Determines the preferred iocharset for filesystems
> ++ * that support it.
> ++ *
> ++ * Return value: iocharset string or %NULL if none.
> ++ **/
> ++static const gchar*
> ++exo_mount_hal_iocharset ()
> ++{
> ++  const gchar* cs = g_getenv("EXO_MOUNT_IOCHARSET");
> ++  if (cs != NULL)
> ++    return cs;
> ++
> ++  const char* codeset = nl_langinfo (CODESET);
> ++  if (codeset && !strcmp (codeset, "UTF-8"))
> ++    return "utf8";
> ++
> ++  return NULL;

Should this be
     return codeset;
? Otherwise how to specify an encoding such as ISO-8859-1?

> --- /dev/null
> +++ b/recipes/xfce-base/xfce-utils_4.6.2.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION="XFCE4 Utilities"

XFCE4 or Xfce4?

Compare also other DESCRIPTIONS!

> +++ b/recipes/xfce-base/xfce4-session_4.6.2.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "xfce4-session is a session manager for Xfce 4 Desktop  Environment"

two spaces

Jens


