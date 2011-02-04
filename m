Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PlL0q-0007mt-6z
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 13:43:44 +0100
Received: by bwz10 with SMTP id 10so2487444bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 04:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0aU85wLPnBXOCLWSbvm+kktpB4bfAYxXwGtifEdNvUk=;
	b=lvFHFp4/ZBokREzQq10zpVQBXOOPhZx2BmnsErSuiaK9em7fN9KxFUEQK+SVdGUdj4
	qKpwJk51dLiPhNHi6a8H2PBaUK/0c5GMjJ5U3kFTYT+V4RCjwedZfRJeENRpfBrR/+O6
	64aXzL9L38Wbi1cExHY+dXvAcKbai65nieX5Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=N/NmdIyy0W/qEsj6dfd7m+V0ZQ3yAFdAOjJb7NnotA4zOv1dDcEpbRw8etXPeNMhIO
	vheI+yk+Sg94G7ReVJ7d1/h9CFmQE/VpFAkruUcUBEN95Z2o3PIUkOTVP7mjyrWqN25x
	yWZABZdjLLAYNjgi2rAgVqc3B/PHgh6M5YIYI=
MIME-Version: 1.0
Received: by 10.204.102.146 with SMTP id g18mr11379484bko.163.1296823365221;
	Fri, 04 Feb 2011 04:42:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.56.135 with HTTP; Fri, 4 Feb 2011 04:42:45 -0800 (PST)
In-Reply-To: <AANLkTik5RVEsxh_jtXTjQRM3sKBrmwmOaWbqs2eKKop=@mail.gmail.com>
References: <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com> <20110203070901.GA11867@denix.org>
	<4D4AE93E.2020509@mentor.com> <20110203222035.GA19477@denix.org>
	<4D4B35A7.4040000@mentor.com>
	<AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>
	<20110204081659.GQ4580@excalibur.local>
	<AANLkTinrcXmdF=P8KUc8_cWfchPEM=q7UaDbCbQknteF@mail.gmail.com>
	<20110204090348.GR4580@excalibur.local>
	<AANLkTik5RVEsxh_jtXTjQRM3sKBrmwmOaWbqs2eKKop=@mail.gmail.com>
Date: Fri, 4 Feb 2011 12:42:45 +0000
X-Google-Sender-Auth: SL67e1NRzVvaZdW4-Gijo8mTOig
Message-ID: <AANLkTi=f0V2=U9rAZd9HTk8VdgqZbRC+2NJ8YE-4SZbw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Fri, 04 Feb 2011 12:43:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 4, 2011 at 09:57, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Actually I did not react on the libtool forcing upon everyone, but on
> the QA errors (where this thread was about).
> That was also the cause of the ostrich remark (which was definitely
> not aimed at you in person, but more a general comment, triggered by
> the fact that I have some experience with projects being outsourced to
> an unnamed country where a bug report also could be "repaired" by
> removing the message or the the symptom instead of tackling the root
> cause).
>
> What I see is a lack of interest in fixing the existing QA errors.
> I've sent out a few error reports to the list a while ago, (on recipes
> that I feel not comfortable with), but unfortunately that did not
> result in any action :-(

I think we ought to FAIL on QA errors. Distros can ignore the errors
if they want but OE as a whole cannot do that.

For me, this looks as a blocker for 2011.3 release.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


