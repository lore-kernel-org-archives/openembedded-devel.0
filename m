Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SFr8k-0000WN-4V
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2012 20:10:34 +0200
Received: by pbcum15 with SMTP id um15so1489158pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2012 11:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QFPYs/Fzd2LuWXecALfwm/ztzJbfkYYjICi2RdhzQak=;
	b=eSddyliCjqo1I6VMK8vE6LPKXLrXVkpoj6ucoaeXedc7EmnGEjRlYQY78Ss4uWK98N
	Apildccra/Z9y4y0b3Dsj8yUniOMkih5rxbY0OueBpI+BUJVKw2AT1B2GBoLuWB6e1lJ
	i7eTP0cb7tO7IcpEG0jCCJdVBPAnBDoIpqIo0EJYeCdN+8R935RM6/EGeMzjV2dOoCue
	E9ZndyXdFjNeBpP6NPHFwVliO7DsVj8O5vBdCqE2JrdMA5EN2gbxeJ8IhSqf1TeyFIYu
	cP6WMcLAcB3cMofy32PJCzJ1TctiRTQDWAlSgqVdwlwFZxr6opH1BpEqqPIfp9cysJJC
	MbSA==
MIME-Version: 1.0
Received: by 10.68.218.168 with SMTP id ph8mr6426176pbc.51.1333648881229; Thu,
	05 Apr 2012 11:01:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.60.161 with HTTP; Thu, 5 Apr 2012 11:01:21 -0700 (PDT)
In-Reply-To: <b2c8f6c6ee91d09594c19275e8f1bdba12e2690a.1333604512.git.anders@chargestorm.se>
References: <cover.1333604512.git.anders@chargestorm.se>
	<b2c8f6c6ee91d09594c19275e8f1bdba12e2690a.1333604512.git.anders@chargestorm.se>
Date: Thu, 5 Apr 2012 15:01:21 -0300
X-Google-Sender-Auth: JnXuGa30nqx1a9CyUat9PD1yo2c
Message-ID: <CAP9ODKp4S-r4mSGPjvMr1O3DjDyuGDmjNfud4YddyBOUhjyLCg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] sqlite: cp instead of mv in do_configure
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
X-List-Received-Date: Thu, 05 Apr 2012 18:10:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 5, 2012 at 02:42, Anders Darander <anders@chargestorm.se> wrote=
:
> The use of mv in do_configure() made bitbake error out if a second run
> of do_configure was requested. Copy the file instead.
>
> Signed-off-by: Anders Darander <anders@chargestorm.se>

This fixes the build-failures I had :-D I were going to propose same change=
.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


