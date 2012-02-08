Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RvDct-00071Q-HQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 20:56:23 +0100
Received: by eekd41 with SMTP id d41so256567eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 11:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=CIr9HOxTFLeoueCQ0uRO7Cd2DU8qVEpt1EKfFi+vjT0=;
	b=f17+UfCZXLlsRIJA0gn+2eN/sDOn1KuOLn6XsnNu2o3upHbvOGgQQ3bCVv9IGagTUD
	7tZO+ZMbf3vEar+PFIX+P56nko9z7IiWw3wSv0yhf7f4CVGJfukFWfPgTCjFgMoE15LH
	mg3maVcUTnw/3kvTWwUnFYp5n1gdj1zCwzIUQ=
MIME-Version: 1.0
Received: by 10.14.52.17 with SMTP id d17mr8834503eec.56.1328730499870; Wed,
	08 Feb 2012 11:48:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 11:48:19 -0800 (PST)
In-Reply-To: <4F32CE7B.8050109@opendreambox.org>
References: <4F2A97B7.2080709@opendreambox.org>
	<CAP9ODKqah-6Y6hp-beD0hUi=-r6VXJ02QD=puXFFYW2Hq8FACw@mail.gmail.com>
	<4F32CE7B.8050109@opendreambox.org>
Date: Wed, 8 Feb 2012 17:48:19 -0200
X-Google-Sender-Auth: BYtsueaMg_u3jIPswqLh-YQs2Jc
Message-ID: <CAP9ODKr+bmWJX8tjesyTvP8_4pEgFDXjOA+s2ZbSq5U+=PC4rw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] giflib: don't depend on libsm if x11 is unavailable
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
X-List-Received-Date: Wed, 08 Feb 2012 19:56:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 8, 2012 at 17:35, Andreas Oberritter <obi@opendreambox.org>wrote:

> I already explained in the commit message, why a PR bump is not needed.
> Can you please explain which other possible failures you're expecting,
> so I can learn why my reasoning may be wrong?
>
> This patch only fixes an unavailable build dependency at bitbake level,
> nothing more.
>

Can the user call:

bitbake libsm

and then build giflib? in case of positive, we need to enforce have or not
it linked.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

