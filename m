Received: from [66.249.82.237] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1IV9iy-00059I-GH
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2007 19:40:32 +0200
Received: by wx-out-0506.google.com with SMTP id h27so1483399wxd
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2007 10:37:28 -0700 (PDT)
Received: by 10.90.49.1 with SMTP id w1mr13288569agw.1189532247890;
	Tue, 11 Sep 2007 10:37:27 -0700 (PDT)
Received: by 10.90.50.8 with HTTP; Tue, 11 Sep 2007 10:37:27 -0700 (PDT)
Message-ID: <c384c5ea0709111037o723dda57x171c148a0f93a91a@mail.gmail.com>
Date: Tue, 11 Sep 2007 19:37:27 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200709111318.52432.openembedded@haerwu.biz>
MIME-Version: 1.0
References: <200709111318.52432.openembedded@haerwu.biz>
Subject: Re: Task-base is big :(
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
X-List-Received-Date: Tue, 11 Sep 2007 17:40:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

On 9/11/07, Marcin Juszkiewicz <openembedded@haerwu.biz> wrote:
>
> After long time of doing mostly Poky builds I did few Angstrom builds from
> OE.dev and found that amount of dependencies during build time has grown
> into very long list. It is 2388 tasks now just for "bitbake task-base"

Most of  your suggestion would end-up having a "USE" flags approach.

I also think the dependencies (whether run-time or build-time) grow
out of hand, and are very hard to get rid of building for true
embedded systems where the software is embedded as firmware and
nothing extra can be installed subsequently.

The TASK-* and *FEATURES approach looked good at first instance, but I
have reverted from using it, as it still results in a major cloud of
package (build) dependencies.

My current approach is maintaining an overlay with copied and adapted
options and dependencies but I would rather see this supported within
OpenEmbedded.

Maybe a minimal set of USE flags instead of creating -lite or -minimal
.bb is an option?
Or, using an include file that defines configuration variables
(HAVE_GTK, HAVE_X)?

Regards,
-- 
Leon


