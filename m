Received: from mail-qy0-f196.google.com ([209.85.221.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O25Aa-0003kO-RU
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 18:10:29 +0200
Received: by qyk34 with SMTP id 34so436592qyk.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Apr 2010 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:received:message-id
	:subject:to:cc:content-type;
	bh=l0ThFhreLQFSCg+ddsllLRYXrs88YVqZToB5uUYn6/s=;
	b=XVIO3GDlDRQLvhHMvaYgF7Z7XHc4XS+YV9QeEO7REBCJzzs/ptvqnpJpgFsKQse8xg
	VEtq0pPWws0ZOpOqa6CXBxMAmcTJPm+cb/kCSRuu1HtXum38i2Sk3Qa/jjGJxkS9M+mu
	4OjuJLkqGoGcoQyBjFMBnP37KBWILLDHg5k7E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=A365lRLe+G3QZSaPxLtggfUByscOAODHX6KvipesSunW4QgyD/x8WtDyojeesDD3WL
	dC0v2fKiaarhOY28DOjAMhlTnWeMTWFJ1u8ajCz2rqIQ4rLHA322Y5meoLSA98g+ybiK
	AcnZqMI6aykNSoZgd0i/jQIryYPwxC6kU21OE=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.46.205 with HTTP; Wed, 14 Apr 2010 09:06:39 -0700 (PDT)
In-Reply-To: <1271240361-8354-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1271240361-8354-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 14 Apr 2010 09:06:39 -0700
X-Google-Sender-Auth: 6fe078aff8d43ba3
Received: by 10.229.222.82 with SMTP id if18mr6051688qcb.65.1271261219625; 
	Wed, 14 Apr 2010 09:06:59 -0700 (PDT)
Message-ID: <i2lb6ebd0a51004140906l4e17837s1519efbf83026714@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.196
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] autotools.bbclass: swapped calls of intltoolize + autoreconf
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
X-List-Received-Date: Wed, 14 Apr 2010 16:10:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 14, 2010 at 3:19 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> Because 'intltoolize' checks whether aclocal.m4 contains a recent copy
> of 'intltool.m4' and it will fail when the found version is too old,
> 'aclocal' must be called before 'intltoolize'.
>
> I built projects it with intltool-0.40.6-r3, autoconf-2.65-r9,
> automake-1.11.1-r3 and gettext-0.17-r6 successfully with this change but
> it will require probably tests with older versions.
>
> This patch is a requirement for
> http://patchwork.openembedded.org/patch/1858/ because 'autopoint' from
> the 'aclocal' call will override 'intltool' files and build will fail
> then.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

