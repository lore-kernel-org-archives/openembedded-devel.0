Received: from [209.85.198.185] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <kergoth@gmail.com>) id 1ItO8L-0002W4-Th
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Nov 2007 14:55:01 +0100
Received: by rv-out-0910.google.com with SMTP id c24so923881rvf
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Nov 2007 05:53:01 -0800 (PST)
Received: by 10.143.6.1 with SMTP id j1mr770882wfi.1195251018127;
	Fri, 16 Nov 2007 14:10:18 -0800 (PST)
Received: by 10.142.104.18 with HTTP; Fri, 16 Nov 2007 14:10:18 -0800 (PST)
Message-ID: <b6ebd0a50711161410m1e6ea2ddq60b7c3c942a3c736@mail.gmail.com>
Date: Fri, 16 Nov 2007 15:10:18 -0700
From: "Chris Larson" <clarson@kergoth.com>
Sender: kergoth@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1195158580.6376.328.camel@toontown>
MIME-Version: 1.0
References: <1195158580.6376.328.camel@toontown>
X-Google-Sender-Auth: aad8e5573c33e589
Subject: Re: altering cflags for autotools
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
X-List-Received-Date: Sat, 17 Nov 2007 13:55:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 15, 2007 1:29 PM, Tobias Pflug <tobias.pflug@gmx.net> wrote:
> hi..
>
> today i've been trying to package mod_python but had some difficulties
> because ${STAGING_INCDIR} was not included in the path thus
> mod_include.h (staged from the apache2 package) could not be found ->
> can't compile mod_python.
>
> Changing CFLAGS or EXTRA_CFLAGS has no effect. Looking at the autotools
> class that is no surprise because it doesn't seem to be read anywhere.
> How can I fix this? Do I have to patch the configure.in file ?

It doesn't need to be read anywhere.  It's exported, and autoconf uses
the environment CFLAGS by default.
-- 
Chris Larson - clarson at kergoth dot com
Dedicated Engineer - MontaVista - clarson at mvista dot com
Core Developer/Architect - TSLib, BitBake, OpenEmbedded, OpenZaurus


