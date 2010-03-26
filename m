Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Nux6w-0002LS-MH
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 01:09:15 +0100
Received: from [192.168.1.4] (62-47-228-162.adsl.highway.telekom.at
	[62.47.228.162])
	by drlauer-research.com (Postfix) with ESMTP id C3145584182
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Mar 2010 01:08:05 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1269555678-8427-1-git-send-email-ospite@studenti.unina.it>
References: <1269555678-8427-1-git-send-email-ospite@studenti.unina.it>
Organization: Vanille-Media
Date: Fri, 26 Mar 2010 01:06:05 +0100
Message-ID: <1269561965.3252.26.camel@opal>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] task-fso-compliance: depend on fso-abyss
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
X-List-Received-Date: Fri, 26 Mar 2010 00:09:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> diff --git a/recipes/tasks/task-fso-compliance.bb b/recipes/tasks/task-fso-compliance.bb
> index e1776a8..50230f0 100644
> --- a/recipes/tasks/task-fso-compliance.bb
> +++ b/recipes/tasks/task-fso-compliance.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "The freesmartphone.org framework -- install this task to make you
>  SECTION = "fso/base"
>  LICENSE = "MIT"
>  PV = "1.0"
> -PR = "r8"
> +PR = "r9"
>  
>  inherit task
>  
> @@ -12,6 +12,7 @@ RDEPENDS_${PN} = "\
>  #  fso-apmd \
>    fso-gpsd \
>  #  fso-monitord \
> +  fso-abyss \
>    connman \
>    connman-scripts \
>  #  connman-plugin-bluetooth \

That's wrong, fso-abyss is only used for some of the machines (i.e.
Openmoko ones). Installing it unconditionally only blows up the images.
We should rather find out why something depends on it when you build for
an EZX machine.

:M:




