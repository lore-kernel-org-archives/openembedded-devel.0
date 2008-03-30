Received: from [209.85.198.184] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jfzj6-0004nk-BU
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Mar 2008 17:45:44 +0200
Received: by rv-out-0910.google.com with SMTP id c24so922077rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2008 08:45:43 -0700 (PDT)
Received: by 10.141.19.16 with SMTP id w16mr2779027rvi.8.1206891943089;
	Sun, 30 Mar 2008 08:45:43 -0700 (PDT)
Received: by 10.140.250.18 with HTTP; Sun, 30 Mar 2008 08:45:43 -0700 (PDT)
Message-ID: <c384c5ea0803300845i767304c3g3a17a81ce2d8b724@mail.gmail.com>
Date: Sun, 30 Mar 2008 17:45:43 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fso78t$8is$2@ger.gmane.org>
MIME-Version: 1.0
References: <c384c5ea0803300616k3a3219ek6d48878f57ed4ef9@mail.gmail.com>
	<fso78t$8is$2@ger.gmane.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: base.bbclass: Enable overwrite flag for unzip command
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
X-List-Received-Date: Sun, 30 Mar 2008 15:45:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Sun, Mar 30, 2008 at 4:14 PM, Koen Kooi <koen@dominion.kabel.utwente.nl>
wrote:


> I think all unpack methods should have consistent behaviour, but I don't
> think silently overwriting files is a good idea, especially when SRC_URI
> contains patches as well.
>

In fact, unpacking over the previous work dir is one of numerous reasons why
rebuilds are very prone to non-deterministic builds; if the package build
behaves differently when left-overs are present, we have a problem. (A
simple example is a Makefile with non-correct dependency information - most
of these already fail during -jN with N>1).

However, we should note that re-builds are non-deterministic at least in
these two cases.
- when the meta data has changed inbetween. (Boosting PR helps as it will
start from a clean dir).
- if individual tasks are forced and the package has faulty internal build
dependencies.

I like the current behaviour of OpenEmbedded though, where we can force a
re-do of each stage during development.

I just never trust it for a release (candidate) build.

Change committed in  2e450cceb8dfc2c7a8dc9fce69d0d31223476a09, thanks for
the review.

Regards,
-- 
Leon

