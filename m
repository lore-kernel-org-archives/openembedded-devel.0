Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUWEC-0003YT-RI
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 04:16:01 +0100
Received: by pzk27 with SMTP id 27so753196pzk.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Dec 2010 19:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=rA6xNTumQgT18ubHNOd9xXnLa+lJA4MchYsjDIE3nvk=;
	b=sSHnrl1HjEP+zC4He+krEBk0CRXq3/ZGL2VqwrCJ6elNQOweOz7shn2KtE1OQaoxM1
	LH3jYVNASpCQNO2EFUn66BW4wf3BeqArNQ2FQPfd7mtLq3/ewjSCDkWBcntcvDLyqTLF
	2ehWaYxx6qRKzHCDuvwgnBr+smko4TeodeWjU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Fuf1Hrt3ce35idsrc8+OU+ggwOoscdbHhBRXe4owmrbDe7i7tIfAmp88HJhArbKyyH
	V3uMnx1tfO2lsDJHpUAVyIfTqw4y0PklEhur7Lua8GB4At+ifSjHhS7agqxzW6rWnWih
	ixmArxx0RgJIQEIUvK+3dr6e/+yeWpy0oPis4=
Received: by 10.142.89.20 with SMTP id m20mr2953002wfb.13.1292814954172;
	Sun, 19 Dec 2010 19:15:54 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b11sm5112383wff.21.2010.12.19.19.15.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 19 Dec 2010 19:15:53 -0800 (PST)
Date: Sun, 19 Dec 2010 19:16:06 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101220031606.GC26429@gmail.com>
References: <1292540192-26920-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1292540192-26920-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCHv2] sourceipk: copy over hidden files and dirs
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
X-List-Received-Date: Mon, 20 Dec 2010 03:16:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/12/10 16:56), Chase Maupin wrote:
> * Copy hidden files and directories such as eclipse
>   project files.  Currently these files are not copied
>   for the top-level directory which makes applications with
>   eclipse project files not usable with eclipse.
> * Only need to copy hidden files for the top-level directory
>   since subdirectories do not experience this problem
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
> updated in version 2:
>     * Only copy hidden files in the top-level directory
>     * Handle the case where there are no hidden files
> ---
>  classes/sourceipk.bbclass |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
> index 97068de..17a7cdd 100644
> --- a/classes/sourceipk.bbclass
> +++ b/classes/sourceipk.bbclass
> @@ -106,6 +106,16 @@ sourceipk_do_create_srcipk() {
>          # Copy sources for packaging
>          mkdir -p $tmp_dir/${SRCIPK_INSTALL_DIR}
>          cp -RLf ${S}/* $tmp_dir/${SRCIPK_INSTALL_DIR}/
> +        # Copy any hidden files in the source directory such as
> +        # eclipse project files.  Use a regex to avoid trying to
> +        # copy the . and .. directories.  This is only required for
> +        # the top-level directory as the hidden files will be copied
> +        # for subdiretories.
> +        hidden_files=`find ${S} -maxdepth 1 -name ".*"`
> +        for f in $hidden_files
> +        do
> +            cp -rf $f $tmp_dir/${SRCIPK_INSTALL_DIR}/
> +        done
>  
>          if [ ${SRCIPK_INCLUDE_EXTRAFILES} != "0" ]
>          then
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


