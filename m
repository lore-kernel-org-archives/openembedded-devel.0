Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by mail.openembedded.org (Postfix) with ESMTP id D67CE601A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 09:28:23 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Wed, 25 Jun 2014 11:28:21 +0200
Date: Wed, 25 Jun 2014 11:28:07 +0200
From: Anders Darander <anders@chargestorm.se>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140625092807.GA21830@ad.chargestorm.se>
Mail-Followup-To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <cover.1403596416.git.anders@chargestorm.se>
	<1b5c27f39444bed435c8c050b2fb6def74a5adb8.1403596416.git.anders@chargestorm.se>
	<2430004.5QNcodJTid@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2430004.5QNcodJTid@peggleto-mobl5.ger.corp.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH 1/1] webmin: drop allarch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jun 2014 09:28:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Paul Eggleton <paul.eggleton@linux.intel.com> [140625 09:46]:

> On Tuesday 24 June 2014 09:54:12 Anders Darander wrote:
> > * runtime dependencies are TUNE_PKGARCH causing do_package_write_*
> >   task to have different signature for MACHINEs with different
> >   TUNE_PKGARCH

> > -inherit allarch perlnative update-rc.d
> > +inherit perlnative update-rc.d

> So apart from me being reticent to make this change at all (for reasons that 
> we've discussed before), 

Yes, I'm well aware of those discussions. I was actually thinking about
CC:ing you on my reply to Martin, after he suggested something like this
change.

> there is another issue - allarch.bbclass does more than just setting
> PACKAGE_ARCH, it also disables certain other functionality such as
> debug symbol splitting which is superfluous for these kinds of
> recipes; in my testing when I originally wrote the webmin recipe this
> significantly reduced the time required to build the recipe. We can't
> just drop this inherit without regard to that. (I'm sure the same
> applies elsewhere, it's just that the size of webmin makes the impact
> significant.)

I'm all for saving time! (And I'm not personally concerned by this
issue, as I'm currently only using webmin in a build tree for a signle
machine).

Though, to get back to Martin Jansa's issue; if there isn't already an
enhancment request file to the Yocto bugzilla, maybe it's time to file
one regarding the possibillity of having an allarch package
RDEPENDS/RRECOMMNEND a package with an ARCH or MACHINE tune...

Paul, what do you think about the feasibility of finding such a
solution?

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

