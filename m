Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RunXn-00081b-A3
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 17:05:23 +0100
Received: by eaal10 with SMTP id l10so1967643eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=UphnlL5qxUzrk3kWM+jr2Gcje8OGjAG8d39Y/zoGelw=;
	b=FNw6tnTBlACa189LrLJXU5Xpb0NNUpd5h+Nkp/KFwIf8qKlSYqIywIkaJyBimA2taU
	3nZQtyNUpOB1B5TXLDG/C6LZ8OXGD5YgWVokps4UmT4hBbBnrIt+ywBynErKxQSKnLyi
	5K+c6NwZXfyhpcYBpukQyGf9pz65lTRgqUDYo=
MIME-Version: 1.0
Received: by 10.213.113.143 with SMTP id a15mr2207783ebq.50.1328630241066;
	Tue, 07 Feb 2012 07:57:21 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Tue, 7 Feb 2012 07:57:21 -0800 (PST)
In-Reply-To: <2290568.0amlKfqkN1@helios>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<1328627573-5217-3-git-send-email-schnitzeltony@googlemail.com>
	<2290568.0amlKfqkN1@helios>
Date: Tue, 7 Feb 2012 13:57:21 -0200
X-Google-Sender-Auth: r6SjFtk0ByCNugGV8WVBmzr4IcI
Message-ID: <CAP9ODKq7OCzMmUgN3hMuZKOghrr=noBShWd+4XxEz_zPuusLfQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][RFC 02/27] initmanager.bbclass: inital add
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
X-List-Received-Date: Tue, 07 Feb 2012 16:05:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 7, 2012 at 13:39, Paul Eggleton
<paul.eggleton@linux.intel.com>wrote:

> Would it be possible to turn this on its head and merge
> systemd.bbclass/update-rc.d.bbclass into one so that it does the
> appropriate
> thing for whatever INIT_MANAGER is set to for every recipe that uses it?
>

I'd say initmanager.bbclass ought to inherit both and handle the packaging
for both. As Koen said, I'd prefer to have it as an image decision not an
distro decision. We might not build one, if distro drops the feature but by
default both ought to be build IMO.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

