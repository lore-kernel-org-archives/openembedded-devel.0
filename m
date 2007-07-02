Received: from [217.116.0.29] (helo=correo11.acens.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <joaquinduran@adtelecom.es>) id 1I5HG0-0008Fq-6j
	for openembedded-devel@openembedded.org; Mon, 02 Jul 2007 10:27:40 +0200
Received: (qmail 10784 invoked from network); 2 Jul 2007 08:22:47 -0000
Received: from unknown (HELO [194.179.62.51])
	(joaquinduran.adtelecom.es@[80.37.108.33])
	(envelope-sender <joaquinduran@adtelecom.es>)
	by correo11.acens.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	2 Jul 2007 08:22:47 -0000
Message-ID: <4688C402.5060208@adtelecom.es>
Date: Mon, 02 Jul 2007 11:23:14 +0200
From: Joaquim Duran <joaquinduran@adtelecom.es>
Organization: AD Telecom
User-Agent: Thunderbird 2.0.0.4 (X11/20070618)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1I4QwQ-0002do-J9@linuxtogo.org>
In-Reply-To: <E1I4QwQ-0002do-J9@linuxtogo.org>
Subject: Re: [oe-commits] org.oe.dev gtkmm: update to 2.10.10. Closes 2544.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2007 08:27:40 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

En/na Laibsch commit ha escrit:
> gtkmm: update to 2.10.10.  Closes 2544.
> 
> Author: Laibsch@openembedded.org
> Branch: org.openembedded.dev
> Revision: 57fa0ccbbdbca8c188108e3c4fbde4702976f3c6
> ViewMTN: http://monotone.openembedded.org/revision.psp?id=57fa0ccbbdbca8c188108e3c4fbde4702976f3c6
> Files:
> 1
> packages/gtkmm/gtkmm_2.8.3.bb
> packages/gtkmm/gtkmm_2.10.10.bb
> packages/gtkmm/gtkmm.inc
> Diffs:
> 
> #
> # mt diff -raaafb999d11846eacd606047f3cddf7a583a9e0c -r57fa0ccbbdbca8c188108e3c4fbde4702976f3c6
> #
> # 
> # 
> # rename "packages/gtkmm/gtkmm_2.8.3.bb"
> #     to "packages/gtkmm/gtkmm_2.10.10.bb"
> # 
> # patch "packages/gtkmm/gtkmm.inc"
> #  from [e31db8a96e6aa60a1f27bc20642644a3204a2e57]
> #    to [7ec54b72cd502a1cb8e82dbb3ff44ccfbc0575b4]
> # 
> # patch "packages/gtkmm/gtkmm_2.10.10.bb"
> #  from [c45df8de54265c0f006a7958dae49e88c83d7783]
> #    to [42dacfdf2a031c9cdccd5a2559171f16c6dc4440]
> # 
> ============================================================
> --- packages/gtkmm/gtkmm.inc	e31db8a96e6aa60a1f27bc20642644a3204a2e57
> +++ packages/gtkmm/gtkmm.inc	7ec54b72cd502a1cb8e82dbb3ff44ccfbc0575b4
> @@ -1,9 +1,10 @@ LICENSE = "LGPL"
>  DESCRIPTION = "C++ bindings for the GTK+ toolkit."
>  HOMEPAGE = "http://www.gtkmm.org/"
>  SECTION = "libs"
>  PRIORITY = "optional"
>  LICENSE = "LGPL"
> -DEPENDS = "glibmm gtk+"
> +DEPENDS = "atk glibmm gtk+"
> +PR = "r0"
>  
>  inherit autotools pkgconfig flow-lossage
>  


[...]

I don't agree with the change that you've introduced in the dependencies.

That is, gtk+ is also depending on atk, so include atk in gtkmm has no 
sense.

The dependences from file gtk-2.10.inc are:

DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor gtk-doc 
libgcrypt cairo cups"

Could you test it once again? Which version of gtk are you using?

Thanks and Best Regards,
Joaquim Duran


