Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1Kl6YY-0000Km-Tg
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Oct 2008 20:36:14 +0200
Received: by ug-out-1314.google.com with SMTP id y2so930786uge.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2008 11:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type:references;
	bh=Enuo4oWFVUmR78zyfpuxjysdCNVJhTRL5fFFNExvgGc=;
	b=MimecKgSzmcWbIIJj4u5m955r1TBqQu1gQBOHHkKsqB2VRFSBX44TFi+HOJZhY/X9b
	d55WfayGd5CFo1pSAzK8MWCz7nIXHls8/FGL54UAunVBebfG1zsBglcXKX38k1MEaIMj
	BG8Ia01vgIwiTdj1EhZUc+mE/CzNvXNt9m0i0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:references;
	b=iTDHF5+ChaYFlxrZfhuaMCk3AsUkj04QzOfHQlKmAoOQxAZOu4B5OKsWbERptDLmeA
	rJQCqq6KFOqwaBStCgsBRJDtZHfu/TfYs5ouIqnXQ6Jr4sVfZVzoHA/bRUiNhf0nZv3H
	ESD0C52vAjmaPvyaXzBzk2p9uaCOMYG7JLTiU=
Received: by 10.210.56.7 with SMTP id e7mr10109202eba.5.1222885926297;
	Wed, 01 Oct 2008 11:32:06 -0700 (PDT)
Received: by 10.210.138.17 with HTTP; Wed, 1 Oct 2008 11:32:06 -0700 (PDT)
Message-ID: <359c5480810011132h5ff6e32n14086cc77a3745d4@mail.gmail.com>
Date: Wed, 1 Oct 2008 20:32:06 +0200
From: "Nicola Mfb" <nicola.mfb@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48E3AFB5.5000600@balister.org>
MIME-Version: 1.0
References: <48E36C18.4090504@smartlink.ee>
	<873ajglc0d.fsf@neumann.lab.ossystems.com.br>
	<48E3762E.6000203@smartlink.ee>
	<359c5480810010634m377ab993rd030d8c0c917b8b3@mail.gmail.com>
	<gc017m$gq4$1@ger.gmane.org> <48E39BC1.6080200@dls.net>
	<48E3AFB5.5000600@balister.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: git master not updating
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
X-List-Received-Date: Wed, 01 Oct 2008 18:36:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2008/10/1 Philip Balister <philip@balister.org>

> [...]
>>
>>
>> How does a makefile affect the branches not being updated?
>>
>
> The problem is that if someone has a problem and shows up in #oe asking why
> there are not any updates. If they can't explain the actual command to do
> the updates, most of the people in #oe cannot help.
>
> Please have people using makefiles ask for help in the project specific
> channels first.
>

If an user does not understand that git pull does not updates, and that git
log does report 26 september, how may he know that the git server is at
openenembedded? it would report problems to openmoko, or fso!
Peoples are asking here because they read git.openembedded.net in the
Makefile, someone know that you are migrating to git, so it's normal to
think that the git server at openembedded should work!
The *only* problem is that the git server is a test installation as you may
only derive from the wiki!
So you may be gentle with peoples and update the oe wiki saying that using
git is unsupported, so makefile authors may decide to not use it just now,
and use it later!

     Nicola

