Received: from [74.125.92.150] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LpqCf-00070K-KS
	for openembedded-devel@openembedded.org; Fri, 03 Apr 2009 22:41:31 +0200
Received: by qw-out-1920.google.com with SMTP id 5so1028088qwf.6
	for <openembedded-devel@openembedded.org>;
	Fri, 03 Apr 2009 13:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=LWL+IslvQ+U6cG113+IxuvUxGACAunNsvxrUxDkf1pc=;
	b=U86tA05CoDGnkj7CuWjRcFqTyRNIy6ZfuObXdoIO0Nv15Ezjp7wbpGi+8OqQmAhGmV
	syph0DQjznWWP6GI74ixZMPFpRwN+adTaxl/Z7AJ7vv9o7gSdxRPnJSwch+C0PmMRuiN
	1TXr/og/exD+CXLKdPx8RNFJnuIJmqRLd7P10=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=WH7dKxrRU4I32IdWQYcIfXvbe1tWu89L8CYv7cDmG/p7ENiDTuBUnSN8PkoKYkbcmm
	O83hQzwDqFwLUzn2o2SrOEW14Al74OB/5bnFwIAkl2o+3kftr0bp3echLa0JlH0PwRja
	V2Z58ZJrNCHcxPxI8Ng3lqPw8kYpjS3R6q6nU=
Received: by 10.224.28.207 with SMTP id n15mr2052054qac.46.1238791136213;
	Fri, 03 Apr 2009 13:38:56 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 4sm555787yxd.6.2009.04.03.13.38.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 03 Apr 2009 13:38:55 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 4BD7C6100B7; Fri,  3 Apr 2009 17:39:10 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <20090403171052.GE30840@smtp.west.cox.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Fri, 03 Apr 2009 17:39:10 -0300
In-Reply-To: <20090403171052.GE30840@smtp.west.cox.net> (Tom Rini's message of
	"Fri, 3 Apr 2009 10:10:53 -0700")
Message-ID: <87ab6x4glt.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 74.125.92.150
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [PATCH] wireless-tools: Fix libiw/ifrename packages, bump PR.
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
X-List-Received-Date: Fri, 03 Apr 2009 20:41:31 -0000
Content-Type: text/plain; charset=us-ascii

Tom Rini <trini@kernel.crashing.org> writes:

> I'm sending this for review since it actually puts ifrename into its own
> package as was apparently intended, but not happening.  Giving people
> the weekend + Monday to complain and Tuesday AM (US -0700) I'll push.
>
>  We weren't creating the above packages as we needed to use '=+' not
>  '+=' here to take things from the default package.  For these
>  additional packages, add files with '=' not '+=' and we only need to add
>  ${sysconfdir}/network to the base package glob.  Also we need to run
>  install-static to get libiw.a to be installed.

[...]

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


