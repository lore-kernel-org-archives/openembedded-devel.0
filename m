Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kristoffer.ericson@gmail.com>) id 1Ot3ZU-0004UB-Dc
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 21:11:08 +0200
Received: by ewy7 with SMTP id 7so2612486ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 12:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:reply-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=FDR+DTb+3Xegl5QEF9mr/BMD9/715RAp4R3ZAqcDo9Y=;
	b=Lyg4PC+VJSu6V0IFDPiqDgJEyG3JWfAB2PSiUlRGO3jgBBIVUWgv0mzyyMN40YlbNp
	Y49VvtkGCSRXqF9Xru4QW5byibGVuPcJT/RKecssRnTPhfhtaJpLjXHl4XOR6cTUdQOY
	0k4NK0KilEYwxH6H7s2eS+GXcM+66r0gzJFFg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=OKIckUNFYiQ0ufPQuWp1P/gtLT7vp/zFZ4gm8crZOyGY13n8DJRI+woGTZSNT3bYFA
	kZ+DipdS98ahNkW35ydiwdPJelUb7VlXXqlqskJoP0uUwVpTp2nlW26h/BT805g4yHIL
	P5fFJkC4vbgtK36bBYVRvwBtRMxiJHMeZn6eE=
Received: by 10.213.48.193 with SMTP id s1mr131563ebf.20.1283885636315;
	Tue, 07 Sep 2010 11:53:56 -0700 (PDT)
Received: from localhost (c-96dde555.010-30-6c6b7012.cust.bredbandsbolaget.se
	[85.229.221.150])
	by mx.google.com with ESMTPS id v8sm10381661eeh.2.2010.09.07.11.53.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Sep 2010 11:53:55 -0700 (PDT)
Date: Tue, 7 Sep 2010 20:56:47 +0200
From: Kristoffer Ericson <kristoffer.ericson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100907185647.GC15949@boggieman.bredbandsbolaget.se>
References: <20100907163605.GA15949@boggieman.bredbandsbolaget.se>
	<AANLkTikinUbL68vz9fgLSeoyeB+XnKPH+qf4VHv4pRvd@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikinUbL68vz9fgLSeoyeB+XnKPH+qf4VHv4pRvd@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.215.47
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
X-List-Received-Date: Tue, 07 Sep 2010 19:11:09 -0000
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

Got it working by doing
ssh-add .ssh/id-rsa

> 
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


