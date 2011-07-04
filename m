Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ebutera@gmail.com>) id 1QdpSU-0001eS-I6
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 22:09:30 +0200
Received: by vxa37 with SMTP id 37so4281266vxa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jul 2011 13:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=NLpXPBlD8qV3BvQpmAH1yDS+VgY9cl3Xu9MUA2rXtO4=;
	b=LWfF5ZokOnvjlRJ0kJC0x6b+DHjvcJTfKgV3gjHqY5oDKQIr/F9iQX8Kh9ctcbTKmK
	k0+845esEusEBD1gB+rKvEYfryNJXkeIJxUD3bOEZ8lKTtts5jB5WxNtA6IxDTLW61EK
	fAmZ4uoPvj2kL+Hso01UdTkWJfJqVPIp/FZoo=
MIME-Version: 1.0
Received: by 10.52.72.227 with SMTP id g3mr4154939vdv.226.1309809940968; Mon,
	04 Jul 2011 13:05:40 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.52.165.232 with HTTP; Mon, 4 Jul 2011 13:05:40 -0700 (PDT)
In-Reply-To: <1309803629.20865.8.camel@BTW1>
References: <1309803629.20865.8.camel@BTW1>
Date: Mon, 4 Jul 2011 22:05:40 +0200
X-Google-Sender-Auth: Qr4aDKzEuj1wWwIFni5xApq1FfA
Message-ID: <CA+2YH7uyJUNWuvcNEC5jnsqkZs9Hnri7sxq0aZXWf1r88tU_qw@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Cannot compile helloworld-image
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
X-List-Received-Date: Mon, 04 Jul 2011 20:09:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 4, 2011 at 8:20 PM, Alessandro Sappia
<a.sappia@biotechware.com> wrote:
> Hi all,
> I just configured OE on my box and I tried to compile helloworld-image
> to check if everything is fine.
> I'm actually unable to complete with success this build because of this
> error:
> -----------------------------

Try with:

BB_NUMBER_THREADS = "1"

and have a look at the thread "[oe] gettext-native fails to build" of
some days ago to know where i copied this hint from! (and maybe try
oe-core branch too).

Ciao,

Enrico


