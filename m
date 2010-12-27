Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PXKty-0003HN-FW
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Dec 2010 22:46:47 +0100
Received: by iwn8 with SMTP id 8so9264858iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Dec 2010 13:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=DAckvUxJCctQcj0bZy6pZztFA3mrzvNH5FeTBtye3CA=;
	b=T1/ntvo1fB2djUciHb4kTOqw3ZPR8SIyuba/6+iVPqPSl8hsD/P+RnlzSZFqR/C+5v
	kcQoCRagz5Yr/9mBhgcZsIv5cqdbw7bWj85HbksJQxh4x/ttK+vzMqPC7O3muIqkYa2p
	/pML1hzF8+n8E7PvHhUelqyU03MPAkDaJIG6c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pR5/KjP7hLHP7oYg4UXcJQ4kOq9v/AODSTqJU9fB0hMDu6ADyQNxBZJTIy6WBwiMGj
	f9FYcrcLWj2LivdNqsMKUXcogU3jm9fe7o2GSwPSpdlpD24h4jLR+9hIvfYg4qZ5tSO4
	a02MjErlR+lbopmsXIvMOZI7cikQCxe7ALc7k=
MIME-Version: 1.0
Received: by 10.231.31.1 with SMTP id w1mr12847977ibc.7.1293486381539; Mon, 27
	Dec 2010 13:46:21 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Mon, 27 Dec 2010 13:46:21 -0800 (PST)
In-Reply-To: <1293476385-7289-1-git-send-email-bgamari.foss@gmail.com>
References: <1293476385-7289-1-git-send-email-bgamari.foss@gmail.com>
Date: Mon, 27 Dec 2010 22:46:21 +0100
Message-ID: <AANLkTinJOUZtpiQowkHH6CHs1wdoMXrobNR_Qb9StxM6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Python 2.7.1 support
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
X-List-Received-Date: Mon, 27 Dec 2010 21:46:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/27 Ben Gamari <bgamari.foss@gmail.com>:
>
> I spent a few hours over the last few days forward porting the python 2.6
> recipes to 2.7.1. At this point I can build both python-native and python on
> for my ARM target. I don't have time or access to hardware at the moment so I
> can't test the produce binaries but I figured I'd send this out in the name of
> release early, release often.
>
> If someone has the time and inclination to test this, I'm sure it would be
> appreciated. I believe the 2.7 series should be API compatible with 2.6, so all
> of the existing extensions should work unmodified. Are there any other barriers
> to merging that I haven't thought of?
>
> Has anyone thought about how we are going to handle python 2/3 coexistence? Or,
> even better, has anyone looked into putting together some recipes?
>
> Cheers,
>
> - Ben

What about sending a patch for this (with DEFAULT_PREFERENCE = "-1" as
it is not tested).
That at least gives others the possibility to peek into it.

Frans


