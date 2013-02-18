Received: from mail-bk0-f54.google.com ([209.85.214.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1U7Q3n-0006rY-27
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2013 13:43:07 +0100
Received: by mail-bk0-f54.google.com with SMTP id w5so2506797bku.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 04:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=V1YAvSZS8IQr2FcqHLkOBrxiM1wJSYOFiKPBkwJUiNY=;
	b=HefGkbESCKnpPNUzc9VcbEoFCc4v65jKF5FVUyBBj4jLBjJHofLYmaHU6V3YbfQ5sG
	6iHECto1VNs+30eUdBi+wnbho52tZYDjb3LjPvL+bA0JBOX6u/FXEm91az12YRRvopQL
	ArFCpxpFy+6MQSHbvXD1HVGLF9I6ZqbGSDf9c8fPLWQSqNTZZSivUDweQ/ZnR6vG/b95
	xb6EZ8jsHaErAj0ZDiU0pKJseijV9I2aOqOpRpA6QChLkMpSUQiY8kJ9IA+iOWdppxIX
	b3W70wz4nXTs4tnSlMRf6VifHE0d7WDiqMU1nSAXzddDKnJtqaa6a7+AGf09/r2THLpz
	NXOQ==
X-Received: by 10.204.128.151 with SMTP id k23mr4557977bks.65.1361190419109;
	Mon, 18 Feb 2013 04:26:59 -0800 (PST)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.204.25.141 with HTTP; Mon, 18 Feb 2013 04:26:38 -0800 (PST)
In-Reply-To: <20130218094145.29630.63354@hoothoot>
References: <20130218094145.29630.63354@hoothoot>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Mon, 18 Feb 2013 21:26:38 +0900
X-Google-Sender-Auth: 3XGdWWUx-9KctiCvNXDr2yWC7mQ
Message-ID: <CAPESJy7YAk9vj56pPkATdJO95xv8gwysyRyA9vyEq5YX-MyD=Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: build dependency cycles in openembedded
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
X-List-Received-Date: Mon, 18 Feb 2013 12:43:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

you can find the line like:
DEPENDS = "XXXXXX-native"
in some recipes.

So, you can describe dependency to native tools from target build if necessary.
I guess this is the answer for the sentence what I have read the
second paragraph of [1]:

> Since the full distribution for the new architecture is not yet available,
> dependency cycles have to be broken during cross as well as native compilation.

I can't answer "how" the dependency to XXXX-native chosen, in which
recipe and to which native tools.
When I start to try OpenEmbedded, the dependencies were already well-built.
Maybe there is someone who can answer for deeper question.

Regards,
-- 
Takeshi Hamasaki

2013/2/18 Johannes Schauer <j.schauer@email.de>:
> Dear list,
>
> I am analyzing build dependency graphs for rpm and deb based binary
> distributions. I gave a talk about my work on this years FOSDEM [1]. To improve
> my work I was looking into Gentoo and Openembedded.
>
> While build dependency cycles in Gentoo are easily taken care of by manually
> compiling some source packages with different USE flags, how is this topic
> handled in OpenEmbedded?
>
> Searching the wiki, mailinglist and internet I was not able to find good
> sources which explain how serious the problem of build dependency cycles in
> OpenEmbedded is when bootstrapping a new target from nothing. I also did not
> find how build dependency cycles are dealt with, should they occur.
>
> Could you direct me to some resources which document the status and handling of
> build dependency cycles in OpenEmbedded?
>
> Thanks!
>
> cheers, josch
>
> [1] https://fosdem.org/2013/schedule/event/debian_bootstrap/
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


