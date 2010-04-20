Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O4G7e-0006bk-4G
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Apr 2010 18:16:27 +0200
Received: by vws19 with SMTP id 19so482904vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Apr 2010 09:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:received:message-id
	:subject:to:cc:content-type;
	bh=EmU6EguUS5sEtx73SsmDrBqefMnBcGSFU1+oeCAlskE=;
	b=K9XmFEZRP85Anj0ZI6+JLAh/C3xlAXUw+399Kvb3biT8KMgF6KTLIdk8JIXzz5nfQO
	hZc91q7VMuW4t6EP/ADk5mpgzNn8ekAVVhUqgB66ALxYxBuUNxAWlctdOEgz9qoJUKMo
	TORmDSGZSX4/8ha2E8LoKj+tRS1MDeVRXYVKs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=lk7Ch2fB6vz2b3IqudYBqDY6noocF9mMQ9nqyi/mnxmAU3TOUMZC5FKZG4jRmOguKc
	lDSx32PNxCr90gGHsrOQWqx/LvxPtKXz/KRZ/eVKca2ilN5waJb/tmQd4KOWhZ+okZCK
	3Rhn8R0Q6GfP6bajKKsB//BFBztmLMSMj1BH8=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.46.205 with HTTP; Tue, 20 Apr 2010 09:12:27 -0700 (PDT)
In-Reply-To: <1271752342-17886-1-git-send-email-vjensen@gmx.de>
References: <1271752342-17886-1-git-send-email-vjensen@gmx.de>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 20 Apr 2010 09:12:27 -0700
X-Google-Sender-Auth: af5cc4d42e284c91
Received: by 10.229.234.68 with SMTP id kb4mr2332376qcb.103.1271779967669; 
	Tue, 20 Apr 2010 09:12:47 -0700 (PDT)
Message-ID: <w2yb6ebd0a51004200912z3c14ea0es393821ff0e0bcf3b@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: Re: [PATCH] base.bbclass: base_do_compile() accepts GNUmakefile as Makefile
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
X-List-Received-Date: Tue, 20 Apr 2010 16:16:28 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 20, 2010 at 1:32 AM, Vitus Jensen <vjensen@gmx.de> wrote:

> GNU make will look for GNUmakefile, makefile and Makefile.  GNUmakefile
> isn't recommended but used by some programs, e.g. canutils.
>
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>


Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

