Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JainO-00068D-9P
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Mar 2008 03:40:24 +0100
Received: by wa-out-1112.google.com with SMTP id l24so7050201waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2008 19:37:56 -0700 (PDT)
Received: by 10.114.95.1 with SMTP id s1mr14964470wab.99.1205635076436;
	Sat, 15 Mar 2008 19:37:56 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Sat, 15 Mar 2008 19:37:56 -0700 (PDT)
Message-ID: <19c1b8a90803151937i6a7113abxdd4452db2d2eaa4a@mail.gmail.com>
Date: Sat, 15 Mar 2008 19:37:56 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1205629164.4551.20.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <1205629164.4551.20.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 209.85.146.182
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc recipes cleanup
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
X-List-Received-Date: Sun, 16 Mar 2008 02:40:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Richard

Here is what I am getting

ERROR: Could not include required file gcc-cross-kernel.inc while
parsing /local/sandbox/openembedded/org.openembedded.dev/packages/gcc/gcc-cross-kernel-3.3.4_3.3.4.bb


On Sat, Mar 15, 2008 at 5:59 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> Hi,
>
>  I've threatened for a long time to clean up the mess the gcc recipes
>  were in. Over the course of several commits I've tried to do this,
>  moving code to common .inc files where possible and making it clear
>  which files affect which types of gcc build (target, cross, sdk,
>  cross-initial, kernel, native).
>
>  Whilst I hope I've not broken anything, the changes are pretty drastic
>  so please test out your favourite machines/distros/combinations and
>  report any problems.
>
>  I did notice various things which simply couldn't have worked and now
>  everything is standardised, I'm optimistic that fixes to the toolchain
>  should be easier to make. Strange side effects from target into cross
>  and other nasty effects of the old recipes should be much harder to
>  create now too. meta-toolchain should benefit from the standardised sdk
>  recipes.
>
>  Cheers,
>
>  Richard
>
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


