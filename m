Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Llfzh-0007dW-L1
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 09:58:53 +0100
Received: by qyk30 with SMTP id 30so2347653qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 01:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=d4evm+palKacsLGLYHmIDn6GSTXRH+5NIAYsg5+X0uA=;
	b=dkgNANUt/byJRHoS9tetBcIF+awkMipdZjUhzyQU0YVbdfYZVEqZ0SFeP6j5J3DDLT
	XYOPeoHJUFPxd4hPuN3JIfbKV6HMFjW+CuABG69LNnoiWo1n7DzBo9glP/XdlKEfZPzx
	v11KSTuQV9fWtDyzCUDogT8UObGGYvYN4oM4U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=s1N89BiCdASuLQQ3pd84YtRHaWoaogrLkqyL2errmrQ4dLLDNu0Mf407FJy1WEVSMQ
	CM5qX3/7wRcYF2LLwAB2kj4BdCvZlwmgf2XQ1XcOcd1pUxxakhjvVUeXc1GvzPBLe4LG
	/wV+Hl0jPL3yX5o2NsJ2hRDw2tuxqWFQQ61d4=
Received: by 10.224.60.138 with SMTP id p10mr8452938qah.232.1237798650180;
	Mon, 23 Mar 2009 01:57:30 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 9sm8995465ywf.36.2009.03.23.01.57.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Mar 2009 01:57:29 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id A7ECA6100F0; Mon, 23 Mar 2009 05:57:27 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1237246365-32076-1-git-send-email-denis@denix.org>
	<1237246365-32076-4-git-send-email-denis@denix.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Mon, 23 Mar 2009 05:57:27 -0300
In-Reply-To: <1237246365-32076-4-git-send-email-denis@denix.org> (Denys
	Dmytriyenko's message of "Mon, 16 Mar 2009 19:32:44 -0400")
Message-ID: <87y6uw4nwo.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] base.bbclass: fix base_get_scmbasepath() to look for recipes/ and fall back to packages/ while parsing BBFILES
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
X-List-Received-Date: Mon, 23 Mar 2009 08:58:53 -0000
Content-Type: text/plain; charset=us-ascii

Denys Dmytriyenko <denis@denix.org> writes:


[...]

> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -773,7 +773,13 @@ python base_do_unpack() {
>  def base_get_scmbasepath(d):
>  	import bb
>  	path_to_bbfiles = bb.data.getVar( 'BBFILES', d, 1 ).split()
> -	return path_to_bbfiles[0][:path_to_bbfiles[0].rindex( "packages" )]
> +
> +	try:
> +		index = path_to_bbfiles[0].rindex( "recipes" )
> +	except ValueError:
> +		index = path_to_bbfiles[0].rindex( "packages" )
> +
> +	return path_to_bbfiles[0][:index]
>  
>  def base_get_metadata_monotone_branch(d):
>  	monotone_branch = "<unknown>"

In my opinion, while it makes life easier the result of it is mixed
environments.

I'm still using packages/ in our local distro and I haven't yet found
the time to merge current tree since we've a lot of local recipes that
will break and this change could make it simple but I still refrain
about having it included.

It looks like the logical thing is kind of "force" people to handle it.

My 2c.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


