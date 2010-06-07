Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLQmZ-0007cP-4I
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 03:06:14 +0200
Received: by mail-px0-f175.google.com with SMTP id 14so872669pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 18:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=0vd2CNlAZar/VV7Nv7uiAjfm7rszGPUHdBqWAC004cA=;
	b=MyfsIMItm7lKYAcbUIDsFqBSjzbGevwgW/yNqisVlHtaudZSBFTZCX5QRPWJPE3a/Z
	+0KRxC2ihaDBV+AaNOxlhuaaGY4Dicjo9IKRheCAS9NP5ZpjzAcY7Izf1QNt1jdjJXaZ
	m/9Cgw2yphLX41c9QHk7qwQfKLPtRAUHTJoMo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=LRx6iH4nOEK/Dg8PKwomSXQATyW2OqjxB0kXMZ1iU3RUkLeHGKixEK6SmDOF6sm/rP
	RIZgylJEhBu86TCQZaaU09UfVBYEdgo7ylk8pZIFOshILbpGYvrApPTw47oHhFs8eUdm
	I4Dpw1UZCIN7yehTwiO1ASJxZWPtM1Lg5mkdU=
Received: by 10.114.187.40 with SMTP id k40mr11020590waf.30.1275872481687;
	Sun, 06 Jun 2010 18:01:21 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d16sm33777075wam.12.2010.06.06.18.01.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Jun 2010 18:01:20 -0700 (PDT)
Date: Sun, 6 Jun 2010 18:01:23 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100607010123.GD6723@gmail.com>
References: <alpine.DEB.2.00.1006050351360.10633@lynx>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1006050351360.10633@lynx>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Manual: Add missing unpack file formats to list.
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
X-List-Received-Date: Mon, 07 Jun 2010 01:06:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (05/06/10 03:53), Robert P. J. Day wrote:
> 
> Add entries for .tbz2, .xz, .tar.xz and .jar files.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>


applied thanks

> 
> ---
> 
> diff --git a/docs/usermanual/reference/var_src_uri.xml b/docs/usermanual/reference/var_src_uri.xml
> index b858e8a..a86fdba 100644
> --- a/docs/usermanual/reference/var_src_uri.xml
> +++ b/docs/usermanual/reference/var_src_uri.xml
> @@ -113,7 +113,7 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
>      </varlistentry>
> 
>      <varlistentry>
> -      <term>.tbz, .tar.bz2</term>
> +      <term>.tbz, .tbz2, .tar.bz2</term>
> 
>        <listitem>
>          <para>Bzip2 compressed tar archives which will be extracted with
> @@ -143,7 +143,25 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
>      </varlistentry>
> 
>      <varlistentry>
> -      <term>.zip</term>
> +      <term>.xz</term>
> +
> +      <listitem>
> +        <para>xz (LZMA2) compressed files which will be decompressed with
> +        <command>"xz -dc &lt;srcfile&gt; &gt; &lt;srcfile&gt;"</command>.</para>
> +      </listitem>
> +    </varlistentry>
> +
> +    <varlistentry>
> +      <term>.tar.xz</term>
> +
> +      <listitem>
> +        <para>xz (LZMA2) compressed tar archives which will be decompressed with
> +        <command>"xz -dc &lt;srcfile&gt; | tar x --no-same-owner -f -"</command>.</para>
> +      </listitem>
> +    </varlistentry>
> +
> +    <varlistentry>
> +      <term>.zip, .jar</term>
> 
>        <listitem>
>          <para>Zip archives which will be extracted with <command>"unzip -q
> 
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
> 
>             Linux Consulting, Training and Kernel Pedantry.
> 
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


