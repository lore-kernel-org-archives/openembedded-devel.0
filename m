Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1OHcXW-000585-PY
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 14:50:35 +0200
Received: by gwb15 with SMTP id 15so3121789gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 05:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=uMEiYTav/PfzegRySGKb+BSpp97UYXCwSFhJsAVvODk=;
	b=SXwSqHRoEyQHBB6lB9pUDW+Z0OGVpBSNe8Txm3pC9pMBLeOPHEvsQRfVftSHIaRD28
	3lmwrtARNScgP0YXrlwSWj4M8chyuBSufiwAIIsPptFunb3ufmQaki/U2oIkFJNGbmWi
	9jpeJxLO9xwbPlrPyMhvRgP6ZR/wJxvzJl9rM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=J8N/sMlxIk9Yh68B7DiCtROzUb2nqpsIkp4F/ubp6yODsCjv20owplB05O1pirYMaH
	ouJkqdoiA+tMnvng4xOU/7cFqa5h/5A8D2A1v8+qDJsunPFZ7VjzhDdrqAwNPTmS4xnT
	7iNTSA+Fl9WFdd5ilXwzBNwbYE4Qtevf4KuLk=
MIME-Version: 1.0
Received: by 10.42.3.197 with SMTP id 5mr837934icp.24.1274964373451; Thu, 27 
	May 2010 05:46:13 -0700 (PDT)
Received: by 10.231.171.85 with HTTP; Thu, 27 May 2010 05:46:13 -0700 (PDT)
In-Reply-To: <htj03o$u5k$1@dough.gmane.org>
References: <AANLkTin5ULxoMD23AleqaBLBxR8zinSd8OfO8NgpKvTn@mail.gmail.com>
	<htj03o$u5k$1@dough.gmane.org>
Date: Thu, 27 May 2010 14:46:13 +0200
Message-ID: <AANLkTinD7QYTCSSBMn7ZngKKo2BAyG5NUAi_kbzqKSA1@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: developmet setup
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
X-List-Received-Date: Thu, 27 May 2010 12:50:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

I do 'git diff' and 'git commit' in the work directory, what's stopping you?
>

Hi Koen,
in my work dir of

commit d9264a5e565906ccf75f695dbecd251e21407fdf
Author: Khem Raj <raj.khem@gmail.com>
Date:   Tue May 11 21:26:31 2010 -0700

the command:
  find . -name .git
doens't report any git tree.

So I try the same command in the download dir and I find:
downloads/git/arago-project.org.git.projects.u-boot-davinci.git/.git/

So I guess that git clone is done from the remote server to download dir.
But you are saying you can do git diff in your working directory.
How is you typical bb file?
Which bb file can be look as an example?

The other problem about having a git tree inside the work directory is that
sometimes a git pull requires to rebuild all the working directory, but
normally my development is done in an overlay and I hope that is possible to
have the overlay working directory different from the openembedded working
directory.

Regards,
Raffaele

