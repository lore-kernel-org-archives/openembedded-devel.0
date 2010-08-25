Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OoHDN-0005WW-SZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 16:44:35 +0200
Received: by fxm6 with SMTP id 6so357226fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 07:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=hRYvCX/RbeT9LvgBUwQ0JN8yCMjbn/lrWAIyk2TEhPo=;
	b=MFee+VLTlKPCIffy9p83u194usiefWsvF67UIWfFLKLpJiv+0N7nq73FW3C+PyzYwH
	zhbPtXbeVVlm9XjkiQY0IIAG8ZYk3pCXBeuiBPDE/JF1AruCyryNekECAAuPhdZZMMDs
	o/QE6o6zh8SUmhjZYfmQYBvnNxrrQ7dpj79sU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=pxrAeG+gagXxQmyMblpqKBW08sikevN+YoMdXA6sWoDGwEhyB+x8Z6ExuyVHLvcmyK
	SvJwZMPwYdHf8umoytr+jncHQuFUyrZJ2I/4uhcpYp8eN0b874uKeqHNlgg2ZFng7x/X
	Q0tOB87QtCZpVPvO0lSj5vr2hrhPDBjsrT58w=
Received: by 10.223.119.203 with SMTP id a11mr7664992far.42.1282747446847;
	Wed, 25 Aug 2010 07:44:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Wed, 25 Aug 2010 07:43:45 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Wed, 25 Aug 2010 08:43:45 -0600
Message-ID: <AANLkTikhCMBU=h90KpjDOEMEJgXDqVHdjpcLjdV9xq-s@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Patch procedure for dummies
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
X-List-Received-Date: Wed, 25 Aug 2010 14:44:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

Please give me feedback and I'll post this on the wiki.

A task-oriented guide to creating a patch:



> Let's say you create a new recipe and you'd like to submit it for inclusion
> (and you've already tested that it works, of course).
>
> 1. Now commit with a good strong helpful message
>
>     git add recipes/nodejs/
>     git commit # don't use the -m option
>
> 2. The message should look like this
>
>     added recipe for node.js
>
>     * added recipe for node.js (bug #5555 - no nodejs recipe)
>     ** patched libev's wscript to not try to execute code
>     ** patched node's wscript to not search in '/usr/include'
>
>     Signed-off-by: AJ ONeal <coolaj86@gmail.com>
>
> 3. Create your patch
>
>     git format-patch -1 # or however many commits are part of this change
>
> 3++. If you are submitting a second version also add "--subject-prefix
> [v2]"
>
>     git send-email
>
> Your patch will be immediately visible on
> http://patchwork.openembedded.org/patch/
>


> 4. Once your patch has been accepted or rejected, create an account and
> update the status to "accepted" or "rejected"
>
> 4++. If you get soft-rejected (a lot of feedback), make the changes, submit
> the next version, and update the status of the previous patch to
> "superseded"
>
> Appendix: Properly configuring git (using tekkub@gmail.com as an example
> user)
>
>     sudo apt-get install git-core git-email
>     git config --global user.name "Tekkub"
>     git config --global user.email "tekkub@gmail.com"
>     git config --global sendemail.smtpserver smtp.gmail.com
>     git config --global sendemail.smtpserverport 587
>     git config --global sendemail.smtpencryption tls
>     git config --global sendemail.smtpuser tekkupl@gmail.com
>

