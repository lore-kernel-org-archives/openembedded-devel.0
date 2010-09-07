Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ot1Xm-00081a-Dn
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 19:01:15 +0200
Received: by pvg6 with SMTP id 6so1901333pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=ttjI4yQriItd1RHt4lazxeUzKBumDF657lMk2fFsg6s=;
	b=qGMhqDHXnGHlBRWiUU6Lvf+viFm8m8j0pX5uN3RlAY1t6xJ/MO+k7OG53rmqC/tXIC
	+qE7QmWd454ysIfmBmiUvM2qNLQqUqiECw6eXtq5sdUy4lUZOhqIiBDu0xkfrIA9n9n0
	lxjLAc2raNJXx/bMlIWnITNDSHdT+bNqQd85Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=RC/Z9NMh4jyqFhvOp7HJ+0qY9AbqMzF0Y4UVXOUO4OIe+sHLl0bovtyxic3CUgJgFm
	O0tZzodImHFrUEbDP8aRsZMtOZvNl7X70v4eZq+sZdF5cePVGfyOrSMtQfj+agJuFOR0
	WdGDGrAW7uCEfsPLIbJ2eb30bes+bZH0SmSmQ=
Received: by 10.142.246.1 with SMTP id t1mr159652wfh.80.1283878832555; Tue, 07
	Sep 2010 10:00:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Tue, 7 Sep 2010 10:00:12 -0700 (PDT)
In-Reply-To: <20100907163605.GA15949@boggieman.bredbandsbolaget.se>
References: <20100907163605.GA15949@boggieman.bredbandsbolaget.se>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Sep 2010 10:00:12 -0700
Message-ID: <AANLkTikinUbL68vz9fgLSeoyeB+XnKPH+qf4VHv4pRvd@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Moving keys to development server
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
X-List-Received-Date: Tue, 07 Sep 2010 17:01:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 7, 2010 at 9:36 AM, Kristoffer Ericson
<kristoffer.ericson@gmail.com> wrote:
> Greetings,
>
> We at JLime are setting up an development server to be able for all
> developers to work on same machine (and build/push alot faster). Im having issues
> getting the write access from the server (works fine from my laptop).
> Ive moved the keys into my server user account but cant get it to work.
> It fails with access denied.
>
> So, what am I missing

your private ssh keys which are in ~/.ssh on your laptop
either you copy them over or you can setup keychain/ssh-agent
to forward it from your laptop to this server whatever fits your security needs

>
> Best wishes
> Kristoffer
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


