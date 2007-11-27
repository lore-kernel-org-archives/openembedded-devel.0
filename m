Received: from [209.85.198.186] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mwhoosier@gmail.com>) id 1Ix6XJ-0004uF-7l
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2007 20:56:01 +0100
Received: by rv-out-0910.google.com with SMTP id c24so984266rvf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2007 11:53:04 -0800 (PST)
Received: by 10.141.167.5 with SMTP id u5mr2132054rvo.1196193184849;
	Tue, 27 Nov 2007 11:53:04 -0800 (PST)
Received: by 10.35.15.5 with HTTP; Tue, 27 Nov 2007 11:53:04 -0800 (PST)
Message-ID: <d543f5920711271153v5964f4e2te91f0d0347dd1e95@mail.gmail.com>
Date: Tue, 27 Nov 2007 13:53:04 -0600
From: "Matt Hoosier" <matt.hoosier@gmail.com>
Sender: mwhoosier@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1196172204.6780.37.camel@localhost.localdomain>
MIME-Version: 1.0
References: <474AFA66.30509@gmx.net>
	<1196166155.6780.11.camel@localhost.localdomain>
	<157949636.20071127154357@gmail.com>
	<1196172204.6780.37.camel@localhost.localdomain>
X-Google-Sender-Auth: 120bce8fb9314970
Subject: Re: python skills and bug 2412
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
X-List-Received-Date: Tue, 27 Nov 2007 19:56:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 27, 2007 8:03 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> A proper use for RPROVIDES is for something like gtk+-directfb to
> RPROVIDE gtk+. If an app linked against one, it should be able to run
> against the other (I'm assuming thats the case, if its not there
> shouldn't be an RPROVIDES).

I've tried this, and you have problems with the apps already being
linked not only against libgtk-2.0.so.x.y.z, but also the closure of
the dependencies which it had at link-time. So if the X11 version of
Gtk was staged at the time your app linked, the references to
libx11.so will exist its its binary.

Is there some way to suppress this eager resolution of transitive
shared library dependencies?


