Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QfGVY-0006Zo-2Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 21:14:36 +0200
Received: by wwi18 with SMTP id 18so1851911wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 12:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WRvyh5EJGkmO1zTUbPyj4hAD+nbt5SIQONy8ddHNh6M=;
	b=i4pbB3hzqck19gaOO/2FOuBTqc+RXhweG0CVZ+MYtWsRjCuwCpBTKTt7mECJ+Bntgq
	3MmpeeY9tXlZpJkqX/bTpZqe071mZx4q6udozwmm4EO5kK0XzswWBi767bBIoN6q6est
	AGe/nqSRGByOn1qDN97QcYMIblsC8UOKZuWXg=
MIME-Version: 1.0
Received: by 10.227.10.31 with SMTP id n31mr2084212wbn.97.1310152243115; Fri,
	08 Jul 2011 12:10:43 -0700 (PDT)
Received: by 10.227.200.15 with HTTP; Fri, 8 Jul 2011 12:10:43 -0700 (PDT)
In-Reply-To: <13872098A06B02418CF379A158C0F14601620D1E2B@dnce02.ent.ti.com>
References: <1310017138-8936-1-git-send-email-agnel.joel@gmail.com>
	<1310022018.4532.21.camel@mattotaupa>
	<CAD=GYpaAHX=RiS98pXAqE3bRbBs6gsbXQoSCdcs8+9u=2F267w@mail.gmail.com>
	<CAD=GYpZX9Y5JbQH9YQ7Ozu6Kp6uf72ooFiys-2Ga_aR_q29R6A@mail.gmail.com>
	<1310140540.4517.1.camel@mattotaupa>
	<1310140818.4517.3.camel@mattotaupa>
	<13872098A06B02418CF379A158C0F14601620D1E2B@dnce02.ent.ti.com>
Date: Fri, 8 Jul 2011 14:10:43 -0500
Message-ID: <CAD=GYpZgya_v86J+OhDUN-rQXnXGBDT3QT-HXTj_+G0sKme7wA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: "Kooi, Koen" <k-kooi@ti.com>
Cc: "Kridner, Jason" <jdk@ti.com>, "Fernandes, Joel A" <joelagnel@ti.com>,
	Paul Menzel <paulepanter@users.sourceforge.net>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] pulseaudio: Run as system-wide instance instead of per-user
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
X-List-Received-Date: Fri, 08 Jul 2011 19:14:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 8, 2011 at 11:07 AM, Kooi, Koen <k-kooi@ti.com> wrote:
> (posting from the airport)
>
> If I understood correctly Joel is going to try out 0.9.22 to see if that fixes session mode, and it not, try to make systemmode a separate recipe that both .15 and .22 could optionally use.
>
> Joel, please correct me if I'm wrong :)

Hi Koen,

That's right :)

While I'm doing a build, I am also posting detailed logs to pulseaudio
ML about the failure of an older version, just incase.

Just mentioning that I'm setting PREFERRED_VERSION_pulseaudio to
0.9.22 in conf/.../angstrom-2008-preferred-versions.inc

I do recall from the phone that you mentioned something about an
"armv7" specific variable but I couldn't find it. Let me know if
setting the above mentioned variable is ok.

Thanks and Have a safe flight.

Regards,
Joel


