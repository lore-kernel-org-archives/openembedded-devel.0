Received: from fg-out-1718.google.com ([72.14.220.156])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O08ro-0003GM-AR
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 09:44:34 +0200
Received: by fg-out-1718.google.com with SMTP id e12so61616fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Apr 2010 00:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=AsWmL048SKcZQU8I6kk1f/ik7WoeRZk1hoHzlajYDBU=;
	b=leHYCXyqAGaaLZPyq7WzXsjfaoKiC/PEzJ6Ivq/ESOeZkYOQAlUxVnU10TNvDvDqoe
	PEY8RynNVzKJ+4fBc1JqvCBqlih8s1qAUhJIG2CnnBpE9jtAtJzqil6Qml4CmwkYsrwk
	8h3khGRy3ycVKTKp1fhDsM/E2s2TVF1VoBLmU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NUQRGZn4E6SPTODEIq+eqLU3BlUzR8in6EiChfUdnfTgOUf9mFZKc7pEIV6XLeBkcR
	wRQqge8dB03sQaHwpAn0NXXIsOPekMdrZC8hKMTjiN0B8EjIJdySOAS2q9NUE2e99EIW
	yjMYsZlojKwEBgYjWcjVQinyHPzAvmk0pQuv4=
Received: by 10.86.22.32 with SMTP id 32mr1808976fgv.61.1270798780650;
	Fri, 09 Apr 2010 00:39:40 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm560465fxm.10.2010.04.09.00.39.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 09 Apr 2010 00:39:39 -0700 (PDT)
Date: Fri, 9 Apr 2010 09:39:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100409073952.GI3269@jama>
References: <201004081428.07413.khimov@altell.ru>
	<1270797788-25090-1-git-send-email-khimov@altell.ru>
	<1270797788-25090-2-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1270797788-25090-2-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] preferred-om-2008-versions.inc: use latest tzcode-native/tzdata
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
X-List-Received-Date: Fri, 09 Apr 2010 07:44:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 09, 2010 at 11:23:08AM +0400, Roman I Khimov wrote:
> Is there any reason not to use latest tzdata?

I don't see one too and I guess that nobody is using
preferred-om-2008-versions anymore..

> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  conf/distro/include/preferred-om-2008-versions.inc |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/distro/include/preferred-om-2008-versions.inc b/conf/distro/include/preferred-om-2008-versions.inc
> index d46a9f6..2c38437 100644
> --- a/conf/distro/include/preferred-om-2008-versions.inc
> +++ b/conf/distro/include/preferred-om-2008-versions.inc
> @@ -1873,8 +1873,6 @@ PREFERRED_VERSION_twm ?= "1.0.3"
>  PREFERRED_VERSION_twutils ?= "0.2"
>  PREFERRED_VERSION_txdrug ?= "0.1"
>  PREFERRED_VERSION_tximage ?= "0.2"
> -PREFERRED_VERSION_tzcode-native ?= "2007k"
> -PREFERRED_VERSION_tzdata ?= "2007k"
>  PREFERRED_VERSION_u2nl ?= "1.3"
>  PREFERRED_VERSION_uae4all ?= "0.7.1"
>  PREFERRED_VERSION_ubahnnav ?= "0.4.1"
> -- 
> 1.6.4.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


