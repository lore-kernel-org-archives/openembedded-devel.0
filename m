Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kristoffer.ericson@gmail.com>) id 1Ot2wX-0003ug-Jv
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 20:30:55 +0200
Received: by eyb7 with SMTP id 7so2574656eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 11:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:reply-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=87lz9EBtj9I59M7uCbfxEbINtFw/Kl5e09HVtWRdiBM=;
	b=lJd0zrzOPgMvuWOPw1hf9I7VMviL6ioBC2pvensqoWLJX2jSvnCQZohbn9ko7aiE3S
	J866yEfKoMgq4gPcmFDH6h/g1yRVziHgxHfwlsHnWegr6JYWB8S9A2GkR/N1B8OA5sPp
	RgutOfypicPRtcRYOTQzDPcMboLKLyal0DSTs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=j8GYrHIIBBg8APt4IbL5FS0N38P/EGdbHjkNQCK6F5hJI3dUhhIQWfrB7+nPtPImqG
	/WgQgjJ44xm+G3DbfazWR43oWdzMekXv64u+LN+/t4EXUmIqINdeTAjJ3ttHkVCFWkOj
	afwy0zicHyNgQxPLGEBftCtL/TBwXDA7cJndk=
Received: by 10.213.13.142 with SMTP id c14mr62800eba.84.1283884214731;
	Tue, 07 Sep 2010 11:30:14 -0700 (PDT)
Received: from localhost (c-96dde555.010-30-6c6b7012.cust.bredbandsbolaget.se
	[85.229.221.150])
	by mx.google.com with ESMTPS id v59sm10342338eeh.16.2010.09.07.11.30.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Sep 2010 11:30:13 -0700 (PDT)
Date: Tue, 7 Sep 2010 20:33:06 +0200
From: Kristoffer Ericson <kristoffer.ericson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100907183306.GB15949@boggieman.bredbandsbolaget.se>
References: <20100907163605.GA15949@boggieman.bredbandsbolaget.se>
	<AANLkTikinUbL68vz9fgLSeoyeB+XnKPH+qf4VHv4pRvd@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikinUbL68vz9fgLSeoyeB+XnKPH+qf4VHv4pRvd@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: kristoffer.ericson@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
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
X-List-Received-Date: Tue, 07 Sep 2010 18:30:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Sep 07, 2010 at 10:00:12AM -0700, Khem Raj wrote:
> On Tue, Sep 7, 2010 at 9:36 AM, Kristoffer Ericson
> <kristoffer.ericson@gmail.com> wrote:
> > Greetings,
> >
> > We at JLime are setting up an development server to be able for all
> > developers to work on same machine (and build/push alot faster). Im having issues
> > getting the write access from the server (works fine from my laptop).
> > Ive moved the keys into my server user account but cant get it to work.
> > It fails with access denied.
> >
> > So, what am I missing
> 
> your private ssh keys which are in ~/.ssh on your laptop
> either you copy them over or you can setup keychain/ssh-agent
> to forward it from your laptop to this server whatever fits your security needs
> 

Ive done exactly that, but getting this:

kristoffer.ericson@jlime:~$ git clone git@git.openembedded.org:openembedded
Initialized empty Git repository in /home/users/kristoffer.ericson/openembedded/.git/
The authenticity of host 'git.openembedded.org (140.211.169.165)' can't be established.
RSA key fingerprint is xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'git.openembedded.org,140.211.169.165' (RSA) to the list of known hosts.
Agent admitted failure to sign using the key.
Permission denied (publickey).
fatal: The remote end hung up unexpectedly
kristoffer.ericson@jlime:~$ 

So what could it be? Is it because my username is different on the server (kristoffer.ericson vs kristoffer)?

> >
> > Best wishes
> > Kristoffer
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


