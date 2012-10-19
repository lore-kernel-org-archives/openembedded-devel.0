Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TP2s0-00011P-6y
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 05:03:32 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so8885ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 19:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=m9t8tpgvjkFouR0OMRczzk6ngHh8anGTFUo8fjvLo88=;
	b=if02xjoFqHoC2aVWwTOsKhTbZqhaNLCLtm1fiBZ7zaQatkBbRMHRV9XjfyizYCpY+6
	NaoXC0G7t3IinGa01kgAvrlO9Z2MjfuE8OA2c6tgfn90GnO4MM6HfeJj41RezZaZA88S
	0WFvZXz+pbAzx9djpCoXUTymvHgOXdCDBftKxZt0mzp92Lty58WxUDZBV9HfLwYz5AWI
	iuhY+WzN3iTwA88PX2VPHvJmAsZrc0m0bcnH0Bmlix9UxdvuWqEdGt7oP922TScm1wXw
	PUSb8JvQiZ1efU8EViQN0U94EhOx90KOK9X0L8XkKa0xJE6eDK/lGlgTtfjXFHgC38ol
	if5w==
MIME-Version: 1.0
Received: by 10.42.91.75 with SMTP id o11mr18805797icm.57.1350615011320; Thu,
	18 Oct 2012 19:50:11 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Thu, 18 Oct 2012 19:50:11 -0700 (PDT)
In-Reply-To: <06adf65bf49ad5e358ec6ac70880211741fe1d4b.1350589969.git.Martin.Jansa@gmail.com>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
	<06adf65bf49ad5e358ec6ac70880211741fe1d4b.1350589969.git.Martin.Jansa@gmail.com>
Date: Fri, 19 Oct 2012 04:50:11 +0200
Message-ID: <CALbNGRSfeX-psVtxT9b6ECbfkQGS6cqu_HeeYJ=pV+pkefehAQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 5/5] mcnavi: move from meta-oe to meta-efl
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
X-List-Received-Date: Fri, 19 Oct 2012 03:03:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 18, 2012 at 9:54 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * mcnavi depends on ecore, but meta-oe does not depend on meta-efl
> * thanks to kergoth for reporting this!
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  {meta-oe => meta-efl}/recipes-navigation/mcnavi/mcnavi_0.3.3.bb | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename {meta-oe => meta-efl}/recipes-navigation/mcnavi/mcnavi_0.3.3.bb (100%)
>
> diff --git a/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
> similarity index 100%
> rename from meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
> rename to meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
> --
> 1.7.12.4
>
Just for the admins: Pure move patches do not make it into patchwork
(had same with [1])

Andreas

[1] https://gitorious.org/schnitzeltony-oe-meta/meta-openembedded/commit/7acc5d92451fb14627736c9099249f8952b5deab


