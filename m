Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R2KFi-00015A-0y
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Sep 2011 11:53:34 +0200
Received: by bke11 with SMTP id 11so1020299bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Sep 2011 02:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=LcwNwno2G9MEOSxD7W4glq1KjjLM1vBCYtO6yyl3plE=;
	b=hcruJ42T6qfNeqmQ/oEZu7WAY9AV000p8/bKvQeiwYpUxQXYfoOOpThTCPOzsZpwEz
	ShNjRwOkgxFbyP/q1c+FgC+YiIsB+PUqpCVVK60xaYhNnXqVLCaNwk3ZWAfOsF0l3RUF
	4nHXMXOoggnZKlqwmWR6Fj24SO+nVlnH+zpKo=
MIME-Version: 1.0
Received: by 10.204.3.23 with SMTP id 23mr480817bkl.301.1315648108299; Sat, 10
	Sep 2011 02:48:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Sat, 10 Sep 2011 02:48:28 -0700 (PDT)
In-Reply-To: <20110910082657.GB5456@jama.jama.net>
References: <CAP9ODKr25u3yPbnAsS8Suc2wngTtJhDbn9egMXZZpUtLQqbZTg@mail.gmail.com>
	<20110910082657.GB5456@jama.jama.net>
Date: Sat, 10 Sep 2011 06:48:28 -0300
X-Google-Sender-Auth: fVC79Ou-k8SFmVxKCezm76f8Aqc
Message-ID: <CAP9ODKpeZvpA4avwj4FpiBxHFs+FVjQn0XyJYU3-yzCCp6Wn2g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] X randr-support.patch breaks geode
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
X-List-Received-Date: Sat, 10 Sep 2011 09:53:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 10, 2011 at 05:26, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Do someone has any clue WHY this patch breaks it and if we can drop
>> this from meta-oe repository? It seems to not be used on
>> OpenEmbedded-Core so seems to be quite specific to something related
>> from previous machine support. Maybe move it to the specific layer?
>
> As I said on IRC, it's needed for xinput-calibrator to work properly.

In this case:

 - why this is on meta-oe only?
 - how we can make geode to work with this applied?

Currently I've disabled this in our company layer but I'd like to have
a more longterm solution and solve it properly.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


