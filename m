Received: from [66.249.82.224] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HhE3k-0001r7-CB
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2007 02:11:36 +0200
Received: by wx-out-0506.google.com with SMTP id t14so721538wxc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2007 17:02:44 -0700 (PDT)
Received: by 10.90.72.10 with SMTP id u10mr3014252aga.1177632164154;
	Thu, 26 Apr 2007 17:02:44 -0700 (PDT)
Received: by 10.90.65.4 with HTTP; Thu, 26 Apr 2007 17:02:44 -0700 (PDT)
Message-ID: <c384c5ea0704261702w7daa59bftfb6c7e87ec51824b@mail.gmail.com>
Date: Fri, 27 Apr 2007 02:02:44 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <432beae0704261526j3817e929nba2d3900177420d1@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
	<432beae0704261022u16ba644dqb4781ac046a0a215@mail.gmail.com>
	<4630E310.5000008@dominion.kabel.utwente.nl>
	<432beae0704261110i5aa9f201te5144ccd97609222@mail.gmail.com>
	<1177625217.4992.1.camel@cimmeria.hyboria>
	<432beae0704261516y62dda543o62676432ac1bee76@mail.gmail.com>
	<1177626232.4992.8.camel@cimmeria.hyboria>
	<432beae0704261526j3817e929nba2d3900177420d1@mail.gmail.com>
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
X-List-Received-Date: Fri, 27 Apr 2007 00:11:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

my earlier heads up was not as critical as first expected: many
packages seem to be ok, but some are not.

As the previous scanelf output always included the filename under
investigation, we had a lot of false positives.

scanelf -BF%r#F <some_file> is the way to go.

A very easy way to see if any files contain a host-side RPATH is to run:

scanelf -R -BF%r#F <some_dir> | grep <your_oe_dir>

I'll continue in bug #2140.

Regards,

Leon


