Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MEjXl-0003bi-R6
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 14:38:09 +0200
Received: by an-out-0708.google.com with SMTP id b6so754742ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2009 05:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dK0cgyIxr3e2LqBz8VtM2s0TT3UCxXnqLxoFEC5mU/0=;
	b=kg5+vl86cjKMsFW1Jyum4XtcI7bX0I/n/uUBD3WLOFe0G0PHeiXKBhQ7JqDEzkxNEw
	8SlOLnjqypofBKi09m6KZ8UcIGMyE85XfCIYw6/nmIAafXoAKqhQw3f0cFQJpnXCLaFu
	9J4jkc74v/SG3AIKYluUICgzo5VqEnTv3BtKs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aFQMiN1iTWCivarPigm7z8efXFkH8EnQFeb6hVIqqhF8zMQwWjFFNRjVXCEaQJ42Jo
	gsCc68kW5gVlW3alZZdivUueFIsIgirJ+/qgGLrbK4lIHqHg4b/4S2ny2dKp2ZNdHdI+
	Pd+5MpuWU7qgRIRbkXJsj2gFeRz6eWvBnHyls=
MIME-Version: 1.0
Received: by 10.231.36.77 with SMTP id s13mr1232938ibd.1.1244723302082; Thu, 
	11 Jun 2009 05:28:22 -0700 (PDT)
In-Reply-To: <1244721978.28486.107.camel@hammer.suse.cz>
References: <1244366174.4412.11.camel@daniel-laptop>
	<1244384219.4431.46.camel@utx.utx.cz>
	<1244385233.4151.27.camel@lenovo.internal.reciva.com>
	<1244402010.4463.36.camel@utx.utx.cz>
	<1244402413.4151.36.camel@lenovo.internal.reciva.com>
	<1244721978.28486.107.camel@hammer.suse.cz>
Date: Thu, 11 Jun 2009 14:28:22 +0200
Message-ID: <c384c5ea0906110528u105b1a97lc1e86fc3413b3b18@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: e2fsprogs-libs failed on latest org.openembedded.dev branch
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
X-List-Received-Date: Thu, 11 Jun 2009 12:38:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Thu, Jun 11, 2009 at 2:06 PM, Stanislav Brabec<utx@penguin.cz> wrote:
> bitbake -v e2fsprogs-libs
> bitbake -v util-linux-ng

I just have seen both fail, and only succeed after a clean and retry.

I think we are looking at a race condition considering sub-packaging.

Updated http://bugs.openembedded.net/show_bug.cgi?id=5101 on this.

Regards,
-- 
Leon


