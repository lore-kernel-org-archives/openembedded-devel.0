Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1N7tOk-0000EJ-0f
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 17:16:53 +0100
Received: by fxm1 with SMTP id 1so171310fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 08:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=smsGtLUfQF+9LXJM4AjgXDCSwtQF+FOYpf8fYU0gBwU=;
	b=irO9qC7R1poPJwHMYr42BUMuIQGCVTx8a5KWC6R7GBHZ+GSTwIYc0wGPR9Hh+vVgrV
	ty+DLeCcU68Jc+ttrAfz2n6V9zSVqJ7jm34MM0obwFVJlUjlsF1zlwKBE/fvt7wOujBN
	outhiC0cQjXDKKNLBSAaDaCyw/4Tvale2bHy4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=d9i+MNlxsUcicGYshb9fNp6bgAQJqEBNeTGPldLYf+alAqSLAIzId0IeVxC2La971o
	KJtXxsHnswBfXOHIKzaNvc3mlOkZMKyWaZcs3yFpabPdJqzCAeYsGqbU9NVXWTBwuaFO
	+lpMN2bkdAnr9b2OWHAto6Utu+lO5q82dFPZE=
MIME-Version: 1.0
Received: by 10.239.195.196 with SMTP id s4mr14083hbi.209.1257865610474; Tue, 
	10 Nov 2009 07:06:50 -0800 (PST)
In-Reply-To: <be7a9f3d0911100638n45c6aeb5n30d0ed7c7deb1a25@mail.gmail.com>
References: <1257858446.3077.3.camel@opal>
	<20091110132756.GC3998@excalibur.local>
	<be7a9f3d0911100638n45c6aeb5n30d0ed7c7deb1a25@mail.gmail.com>
Date: Tue, 10 Nov 2009 16:06:50 +0100
Message-ID: <d2b9ea600911100706q7b04d4bbt14bf2586779f7c74@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM: Summary of 'OE and Poky', 'Hosting', 'Bugtracker'
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
X-List-Received-Date: Tue, 10 Nov 2009 16:16:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 10, 2009 at 3:38 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> On Tue, Nov 10, 2009 at 11:27 AM, Stefan Schmidt
> <stefan@datenfreihafen.org> wrote:
>> For me user and other topic branches worked well on the main repository. The
>> only issue I have is the flood of commits on the commit ml when a branch gets
>> rebased, but that is something that a filter in the commit mail hook should be
>> able to solve.
>
> In fact I believe that the best option would be to have individual
> trees at the server as is done at git.kernel.org so people can work at
> their individual tree and ask for pull or review. That avoids non-used
> branches at the main repository.
>
> My 2c.

I agree 100% with you on that.  I don't see any advantage of trying to
stuff so much into common repositories. It just increases the
time/bandwidth needed by git fetch.  Nobody uses all branches anyway.

So I will throw 2c into that bucket as well :-)

/Esben


