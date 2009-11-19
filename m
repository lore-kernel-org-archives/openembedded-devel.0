Received: from mail-yw0-f177.google.com ([209.85.211.177])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NB7bT-0005FE-TN
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 15:03:23 +0100
Received: by ywh7 with SMTP id 7so2074594ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 06:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=mbasaisvigmwTHoT/yY8v822K6Xk/pz8RP1CNdgcPjU=;
	b=M4pL3KqUuf/ojJkBJwI0+xveqSyz1ExkobZ6wWSJjFjdef5k/J/ko85tfc3slxj82j
	p6pXudjwJ7cDY4LfCEUd0ysjeFmWIJQvMI1Yz5MXTjgEkssjak8X9abcSd+G6TuEFXBB
	u9JEJbA2vWu0LVF1AfD1D8zDQUFCz4f4YIGUI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=J0Euc40O2dcrRaTqFABbbQlXwNq3RdpMXC5EYDyJPW9Di5j4a6i324NTY5YZ22fJda
	kadq4cvnnvVe29lwSjJS/yEm4rcSW/qddy8XPLAe8HhSBeP0B16drglGkhzLmy5Ze057
	M2ORwA7pLzM+YN6VtzEqBKhFmfBqkhPTXJIvs=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.161.135 with SMTP id h7mr1030hbd.105.1258639313419; Thu, 
	19 Nov 2009 06:01:53 -0800 (PST)
In-Reply-To: <1258638966.5229.25.camel@dax.rpnet.com>
References: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
	<1258576924.25369.687.camel@lenovo.internal.reciva.com>
	<be7a9f3d0911181421i4d3a1ffy2417cbbd91d9a1ff@mail.gmail.com>
	<1258631715.23826.63.camel@mill.internal.reciva.com>
	<be7a9f3d0911190542j2bea66ccs65d6261b9c92bf87@mail.gmail.com>
	<1258638966.5229.25.camel@dax.rpnet.com>
Date: Thu, 19 Nov 2009 12:01:53 -0200
X-Google-Sender-Auth: 8909a7b381363689
Message-ID: <be7a9f3d0911190601r4243233fv807e4f04d6b631cc@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Merging of stable/2009 into dev
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
X-List-Received-Date: Thu, 19 Nov 2009 14:03:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Thu, Nov 19, 2009 at 11:56 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> I think you actually want to do something like:
>
> git-merge --strategy=ours
>
> which should leave OE.dev unchanged.
>
> Does that actually help though?

No since it would lose any specific commit done for local development.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


