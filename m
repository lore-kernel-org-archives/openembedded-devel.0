Received: from [66.249.82.229] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HhAFI-0000k0-W8
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2007 22:07:17 +0200
Received: by wx-out-0506.google.com with SMTP id t14so668893wxc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2007 12:58:25 -0700 (PDT)
Received: by 10.90.69.8 with SMTP id r8mr2786226aga.1177617505368;
	Thu, 26 Apr 2007 12:58:25 -0700 (PDT)
Received: by 10.90.65.4 with HTTP; Thu, 26 Apr 2007 12:58:25 -0700 (PDT)
Message-ID: <c384c5ea0704261258j74fae9c0m5a764ab356b6e139@mail.gmail.com>
Date: Thu, 26 Apr 2007 21:58:25 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <4630FBDF.2060004@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
	<4630FBDF.2060004@dominion.kabel.utwente.nl>
Subject: Re: HEADS UP: insane.bbclass will now detect and stop the build on wrong RPATHs.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2007 20:07:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Justin, Koen, others,

On 4/26/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> Attached patch replaces bogus rpaths with '/lib' inside insane.bbclass. There
> are several things wrong with this approach, but it's a start.
>
I would consider this the best approach until we have figured out
where we have to move this to instead. Your patch will:
- remove the host paths, or replace them with something safe: /lib
- thus remove a theoratical security hole if /tmp is involved.
- thus speed up library loading on the target, by removing the
overhead of the target's linker trying a handful (~15) paths that will
not resolve for sure.

The proper place is somewhere in the shared library handling. Probably
we do not need 'chrpath' but possibly we can override the rpath
directly during linking.

This needs some investigation, but I suggest we include your patch so
that builds are not broken anymore.

Regards,
-- 
Leon


