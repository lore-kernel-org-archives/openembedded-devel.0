Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P9IxW-0005ev-1b
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 16:51:06 +0200
Received: by ewy2 with SMTP id 2so476387ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 07:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=n0w43PT13rXuIlc4slHjqRbjLibSYE1uSWa/oytv5JQ=;
	b=wvtPDpiWTd8xIdTRJFSWvvcXEs2EJukGoMbeNElE0UGkBgvxrLx6GcproeDsitfrrQ
	bkC1srIVMCJhkfhqAO2sMM9tfyIHKYEdXWKN9PIWpYqw8R6zUe0or/3adT5R0JBniomE
	H7+pv4DyeGcyw6QIP28LQ0cdXRVNXTh9ye9sg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Z12cOX4NABKhl5AZIpZW05E1emTfdxUBH6YsHXnL9mISvt9JogcGhf9sU1BzxXk7qL
	Zh8y816/cRPNEzYSShqUb0HemWD9g3Qv+GRYFfnvlknlkSrsXHH2yhoTFeKkJUH/kg+8
	6H41Y9urKDZmuwbAtC2VVd2oqMd84xu1xdarc=
Received: by 10.216.82.197 with SMTP id o47mr2689637wee.45.1287759026935; Fri,
	22 Oct 2010 07:50:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Fri, 22 Oct 2010 07:50:06 -0700 (PDT)
In-Reply-To: <1287730684-14143-1-git-send-email-raj.khem@gmail.com>
References: <1287730684-14143-1-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 22 Oct 2010 07:50:06 -0700
X-Google-Sender-Auth: u5VGZZA-Ke5kRcF0b2DGascPGjQ
Message-ID: <AANLkTi=pk+WvkmaAmGaauq=ArSs7KoCN+t3QFUYba_1f@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/5] libtool: Rename --with-sysroot to --with-libtool-sysroot
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
X-List-Received-Date: Fri, 22 Oct 2010 14:51:06 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 21, 2010 at 11:58 PM, Khem Raj <raj.khem@gmail.com> wrote:

> * To avoid name conflict with binutils and gcc we rename the option
> * We also stage the cross and native libtool in same relative path
>  so it can be accessed equally well from recipes using BBCLASSEXTEND =
> "native"
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

I'm going to assume you've got the code end of things down, and not bother
reviewing it in depth, as I'm no libtool code expert, but you have my ack
for the concept :)

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

