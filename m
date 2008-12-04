Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1L8HEL-0000dW-41
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Dec 2008 17:39:09 +0100
Received: by rv-out-0708.google.com with SMTP id k29so4229568rvb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Dec 2008 08:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=jvwL+w7TKweskZYVu6zZx0I3Vx3icsSwKEFPIHLIC5I=;
	b=HtJJ3UiNF0v9euvafbGSt0rApxifOUea+fDHBucqOW+0r4xo0WkWDJUc49fx7DFG+/
	CkTS651zO9HJqM7qJo7tH7hTNVJOtISkC9eTa6nS2ttFFxD2fA+uObfuCx8U/dBX/0+v
	D7HffBVx+YpoDFFyb+ieqnk2RBiQO2EqwREwY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=gUcRF2+Y0Qbuhfn1MRzl9lGHFktsc3U8teMf45s5Yia/WIBckTE4mPFb8yABA52pCc
	x2/UgewAnaHbwpZddQXdLR3V0om3sLtUcEuW9ZBovQDOvO3Ly+TTqBrv/sVUcfQ3ycpS
	md4SUyIzFqlvsu2Wo8OkXsb+V9/wpACgrv0zk=
Received: by 10.141.49.6 with SMTP id b6mr7019710rvk.117.1228408533699;
	Thu, 04 Dec 2008 08:35:33 -0800 (PST)
Received: by 10.141.171.13 with HTTP; Thu, 4 Dec 2008 08:35:33 -0800 (PST)
Message-ID: <19c1b8a90812040835x61227baau2713bd667306b337@mail.gmail.com>
Date: Thu, 4 Dec 2008 08:35:33 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081204080249.GR16628@smtp.west.cox.net>
MIME-Version: 1.0
References: <20081204080249.GR16628@smtp.west.cox.net>
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: gdb-cross-sdk hacking around gcc-4.3 warnings?
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
X-List-Received-Date: Thu, 04 Dec 2008 16:39:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

IIRC yes. if thats the only patch needed then please go ahead and reenable it.

On Thu, Dec 4, 2008 at 12:02 AM, Tom Rini <trini@kernel.crashing.org> wrote:
> Hello, I see that in
> http://gitweb.openembedded.net/?p=openembedded.git;a=commit;h=6348b3baf7a61fc07626a3ecb29b539d438cfb4f
> we dropped -Werror from gdb-cross-sdk.  Was this for gcc-4.3 support?
> If so, could we replace that by importing
> http://patches.ubuntu.com/g/gdb/extracted/gcc-4.3-build-error.patch
> instead?  I'll do the work, just don't want to step on anyones toes if
> there was a different reason behind the change, thanks!
>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


