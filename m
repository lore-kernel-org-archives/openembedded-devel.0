Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvQLS-0005Dn-U4
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 09:54:29 +0200
Received: by iwn2 with SMTP id 2so5925485iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 00:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=u8l1qhPgM5LxWvYEFYg9Dp9S//k/btlp2NTn2uQ1crI=;
	b=x1Qrw3NbcwgeJFyottMBvGDm4vl4ZCuAZOox6JlrNdAiB6IlEQgnVWdKYUwOUDnVZ0
	TZs8WH2/sDuGv6ijSThIE6uTTb+xlZUf9vLaSQrQNHK6LKbzQYMdqmNPSE+jjSTZ+kCl
	Rhh/xydBJMNpjxwBfz2bBdPw5S1FXqcGkMqrg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=XtfSUWP6EZa0HompgYe/iUDGMX9mErPc35BPIsKbpEbDpV/D+OS/CZhrDgakzch0Pl
	g/h9UQVVvee3XX3q8cMyVb6PQ+FSfo+sCmCT1OIH2PdItbR3Lri5oR7NFmXApsL3txO9
	hZAgCpICvgckmIXAWUwuDf0hKVo2KnPVEJOhA=
MIME-Version: 1.0
Received: by 10.231.35.77 with SMTP id o13mr7415239ibd.92.1284450820574; Tue,
	14 Sep 2010 00:53:40 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Tue, 14 Sep 2010 00:53:40 -0700 (PDT)
In-Reply-To: <1284449149-31426-1-git-send-email-khimov@altell.ru>
References: <AANLkTimZs1Our0mEetgXnYGPyhyQf8SQCXu2JE8vU6MZ@mail.gmail.com>
	<1284449149-31426-1-git-send-email-khimov@altell.ru>
Date: Tue, 14 Sep 2010 09:53:40 +0200
Message-ID: <AANLkTik3MwbsLDB2nrUT2pe6poD0fa3M18=0hhkVcces@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dnsmasq: remove versions prior to 2.52
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
X-List-Received-Date: Tue, 14 Sep 2010 07:54:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/14 Roman I Khimov <khimov@altell.ru>:
> These have known unpatched security issues, 2.52 is in the repo for quite some
> time, anyone who cares should be using that already.
>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

verified no one pins these or has a DEFAULT_PREFERENCE for any.
This is not the case and as they have security issues:

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


