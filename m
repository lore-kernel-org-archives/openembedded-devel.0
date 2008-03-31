Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JgLze-0004ct-No
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 17:32:18 +0200
Received: by an-out-0708.google.com with SMTP id b33so456706ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 08:32:13 -0700 (PDT)
Received: by 10.100.232.13 with SMTP id e13mr14894473anh.89.1206977533067;
	Mon, 31 Mar 2008 08:32:13 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Mon, 31 Mar 2008 08:32:13 -0700 (PDT)
Message-ID: <c384c5ea0803310832w74e60013p3940a72947cfd417@mail.gmail.com>
Date: Mon, 31 Mar 2008 17:32:13 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fsqenu$gr7$1@ger.gmane.org>
MIME-Version: 1.0
References: <c384c5ea0803301459l3d808b51v64bad3155b7b3b86@mail.gmail.com>
	<fsqenu$gr7$1@ger.gmane.org>
Subject: Re: Behaviour when bitbaking a specific version with DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Mon, 31 Mar 2008 15:32:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Mar 31, 2008 at 12:34 PM, Rolf Leggewie
<no2spam@nospam.arcornews.de> wrote:
> Leon Woestenberg wrote:
>  > when I perform a bitbake package-version.bb, whilst that package has
>  > DEFAULT_PREFERENCE -1, weird things happen.
>
>  example?
>
Sure. (Revision numbers might be off, I do not have access to the
build machine right now.)

I had built console-image for MACHINE=efika, with madwifi-ng as an
extra package.
madwifi-ng-r2072 gets built, because newers have DEFAULT_PREFERENCE -1
(at least for MACHINE "efika").

Good so far.

I then cleaned madwifi-ng. If I then build a specific newer version
(which has DEFAULT_PREFERENCE = -1", bitbake madwifi-ng-r3367, bitbake
starts to build both revisions, and concurrently in my case.

I.e both the one I specified, and the one which has DEFAULT_PREFERENCE set to 1.

Not a common case, but it took me a while to see what caused it.

Regards,
-- 
Leon


