Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P9L6I-0007aS-3t
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 19:08:18 +0200
Received: by fxm3 with SMTP id 3so905429fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 10:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=Nk+jvUcE+1A9IgI2YQ02nnooRyWqHYxVCEA6bsFyzGo=;
	b=g4VcZRzorJYjlRWlcrPZFkYIH/DEKGlncHmPDOAlJzVpDOuGFuXz8SYmNy3z/EmVbD
	mG0zj2I+dhGIvh4Te+1LDNgNPWcjbmgLnZLI2YlslcrqGoaHOXgU9f1Yncwx+EV8nK2f
	CmD721QlfC/qQiunNzVsV4DmVk7ifqUyS/gvM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=CAcsJRIThifcoY6BEGrYiVpQnM5950M41oiL/8ENq7UNGInDQJ1nQ8F3ra+Nd1qvN4
	+pL5JJolijBGC4rqxBjuVGRRt/XjV+8uNlUFHRtfwQX36bTEsnA767Agph2/O9BLR1gv
	wcmw0qdzehTUjzLASgNt9vyrNBxDVZUbSO3Ro=
Received: by 10.216.141.209 with SMTP id g59mr2868064wej.10.1287767259547;
	Fri, 22 Oct 2010 10:07:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Fri, 22 Oct 2010 10:06:22 -0700 (PDT)
In-Reply-To: <i9s8nh$e2$1@dough.gmane.org>
References: <i9s8nh$e2$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 22 Oct 2010 10:06:22 -0700
X-Google-Sender-Auth: NgK-BriURWKkUq3A7idY-dUnGpY
Message-ID: <AANLkTinSf5Ftqm9h+2bcKCjxOkqwKui4RaVuBJ49U7KD@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] using kernel.bbclass rename hook for external modules as well
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
X-List-Received-Date: Fri, 22 Oct 2010 17:08:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 22, 2010 at 7:56 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> Currently kernel.bbclass splits and renames modules into
> kernel-module-<foo>, but module.bbclass doesn't. What's your opinion on
> making modules.bbclass follow the same logic for consistency?
> To make upgrade paths work the 'kernel-modules' metapackage would be
> ${PN} for external modules.
>

This sounds like a very good idea to me, it would make the package list much
more consistent and improve the user experience, imo.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

