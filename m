Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QbbcL-0003YB-5m
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 18:58:29 +0200
Received: by bwf20 with SMTP id 20so412253bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 09:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wvA05jGkcij7noCSxX/mLWt0h58gpG1pVho3QckAQBg=;
	b=BkmsYAXk5MbmVEoIsxgquc1h3Tizo2rRTxH3s27yYDXaIur59LmdBuMs9oA7XrrZyD
	LgUQJv9kaArFJHCfVynnyZxhIYxXpNY3ymDolvDTgXAmbtGf9K6ztrv7oLNUDc0w6ZNl
	kVxjxoDg4+61u/2CxRkmnlg4n5OCw88gZkzpM=
MIME-Version: 1.0
Received: by 10.204.39.14 with SMTP id d14mr5582788bke.200.1309280084615; Tue,
	28 Jun 2011 09:54:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.73.70 with HTTP; Tue, 28 Jun 2011 09:54:44 -0700 (PDT)
In-Reply-To: <iud0mc$e52$1@dough.gmane.org>
References: <cover.1309272010.git.otavio@ossystems.com.br>
	<iucpq7$uav$1@dough.gmane.org>
	<BANLkTinqwZhxLGtp997dgKh9BmAD02LU-A@mail.gmail.com>
	<iucsbb$gp2$1@dough.gmane.org>
	<BANLkTimmBeR1COc-BRuASQf3O3g20uhkxg@mail.gmail.com>
	<iud0mc$e52$1@dough.gmane.org>
Date: Tue, 28 Jun 2011 13:54:44 -0300
X-Google-Sender-Auth: 6VDP7uTx3SODK3nKR4xywwjTfqc
Message-ID: <BANLkTikUF5FUaoyWDzJ61dnj7JmNo876eA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/2] Fix parse errors
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
X-List-Received-Date: Tue, 28 Jun 2011 16:58:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2011 at 13:49, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
>> Can you describe a use case?
>
> Rolling out a fix for the generic package without having to rebuild it N
> times.

When doing this fix you should bump PR, right? in this case, this will
be (or ought to be) rebuild for all machines thus for me seems it will
be the same end result.

The only use case I see is very risky since it fully depends on the
developper to know which machine it needs to be build to and like.
This IMO is wrong and the risk of forget a need rebuild is bigger then
the reduction of build and cpu cycles.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


