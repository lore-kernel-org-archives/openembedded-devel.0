Received: from [64.233.184.238] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1GavtU-0006ND-56
	for openembedded-devel@openembedded.org; Fri, 20 Oct 2006 17:02:44 +0200
Received: by wr-out-0506.google.com with SMTP id i31so251634wra
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Oct 2006 07:55:34 -0700 (PDT)
Received: by 10.35.76.9 with SMTP id d9mr732567pyl;
	Fri, 20 Oct 2006 07:55:32 -0700 (PDT)
Received: by 10.35.118.16 with HTTP; Fri, 20 Oct 2006 07:55:32 -0700 (PDT)
Message-ID: <432beae0610200755x31b0caa0i389bf5b8972e98a@mail.gmail.com>
Date: Fri, 20 Oct 2006 07:55:32 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200610201608.42551.christopher.lang@plus.cablesurf.de>
MIME-Version: 1.0
References: <200610201608.42551.christopher.lang@plus.cablesurf.de>
Cc: openembedded-devel@openembedded.org
Subject: Re: inherit both kernel and autotools
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2006 15:02:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/20/06, Christopher Lang <christopher.lang@plus.cablesurf.de> wrote:
>
> Hi,
>
> In a .bb recipe, if I write: "inherit kernel autotools", which one of the two
> overlapping exported methods "do_configure" and "do_install" will be the ones
> used when bitbaking the .bb file?
>
> The methods from kernel or autotools?
>
> Does it depend on the order of the two classes? "kernel autotools" or
> "autotools kernel"?
>
>
> kernel.bbclass: EXPORT_FUNCTIONS do_compile do_install do_stage do_configure
> autotools.bbclass: EXPORT_FUNCTIONS do_configure do_install
>

I would think that the last one inherited would override the other.
This isn't hard to test yourself, though.

-- 
Justin Patrin


