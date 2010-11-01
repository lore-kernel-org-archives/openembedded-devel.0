Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PCyHu-0007am-Jd
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 18:35:19 +0100
Received: by ywo32 with SMTP id 32so3536445ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 10:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=eQgwc6pWwHObddVfqfXYqU/TjNJm4cknGjN2TExq1Bg=;
	b=iUd7jajEXjtMom/rAD098MrCT4ezKL7ZsPllxCut+NFR8VMMLbg1ZVjhaYSjTySzrW
	CLAAg3IiOC23oC0fCACmdGzkuzMRNzPDesh7Vp8V1B62pqRotgxXWV1kMr4DJY0QS5jY
	jWDHrzE20sS6+D6Gt35itZl/yshfX4nOkTsY8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=NzFiO+zGmYHAoN50vfR6ylxnJtNNp+SM9UOa6Rv8mGprpvUCOXi0AC6E8w01vQb9Bm
	MHJbY7EqST5nMWQWxEbpKZ6+jtm2RjIu0rGYmwcNT7QE6L/7QpBz/v/EdF7u332OPSgC
	AjJhyfCOXEL1CN7gbfBai0nYNvqUr+rtbXJO8=
Received: by 10.90.62.5 with SMTP id k5mr44061aga.47.1288632869155; Mon, 01
	Nov 2010 10:34:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Mon, 1 Nov 2010 10:34:08 -0700 (PDT)
In-Reply-To: <AANLkTiksz3oEOdF6n14or=2Up18_bKYTCskYyuKR=zQ5@mail.gmail.com>
References: <AANLkTiksz3oEOdF6n14or=2Up18_bKYTCskYyuKR=zQ5@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Nov 2010 10:34:08 -0700
Message-ID: <AANLkTiku8rNT-HXfOtyPAgD_3VnTxLnZzEPfqCjS5ZKS@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Possible issue with sqlite3-native and tcl-native
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
X-List-Received-Date: Mon, 01 Nov 2010 17:35:19 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 1, 2010 at 9:31 AM, Hans Henry von Tresckow
<hvontres@gmail.com> wrote:
> I ran into some strange build errors building sqlite3-native recently.
> The build was failing on tclsh8.4 not being able to load
> libtcl8.4.so.0 . This turned out to be an issue in my host
> environment. It did point out however, that we now build and stage
> tcl8.5-native instead of tcl8.4-native. Unfortunately I don't know
> enough about the sqlite3 build system to offer a patch at this time.
>
> Should I file a bug on this?
>

hmmm sure. Add the relevant logs too.

> --
> Henry von Tresckow (hvontres)
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


