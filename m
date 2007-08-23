Received: from [64.233.184.232] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1IOJDQ-0005x0-2t
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 22:23:40 +0200
Received: by wr-out-0506.google.com with SMTP id c46so468529wra
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 13:22:27 -0700 (PDT)
Received: by 10.90.81.14 with SMTP id e14mr7317997agb.1187900546916;
	Thu, 23 Aug 2007 13:22:26 -0700 (PDT)
Received: by 10.90.50.8 with HTTP; Thu, 23 Aug 2007 13:22:26 -0700 (PDT)
Message-ID: <c384c5ea0708231322l708a9a5cv36b4958a233f6eea@mail.gmail.com>
Date: Thu, 23 Aug 2007 22:22:26 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org, philipp.zabel@gmail.com
In-Reply-To: <74d0deb30708230151h6601b1c3r9011b2a8d8eea2e8@mail.gmail.com>
MIME-Version: 1.0
References: <74d0deb30708230151h6601b1c3r9011b2a8d8eea2e8@mail.gmail.com>
Subject: Re: glibc-package.bbclass: [ -f ] doesn't take multiple arguments
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
X-List-Received-Date: Thu, 23 Aug 2007 20:23:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Philipp,

On 8/23/07, pHilipp Zabel <philipp.zabel@gmail.com> wrote:
> The "[ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.* ]" fails if there
> are multiple libgcc_s.* in that directory (libgcc_s.so and
> libgcc_s.so.x.y)
>
> --- packages/glibc/glibc-package.bbclass        2529c6468fce1e1b9ff4d39758addca2534e19fb
> +++ packages/glibc/glibc-package.bbclass        7f658a24e4779696422ea29792ed63083a5985b8
> @@ -144,9 +144,12 @@ do_prep_locale_tree() {
>                 gunzip $i
>         done
>         ls ${D}/lib/* | xargs -iBLAH cp -a BLAH $treedir/lib
> -       if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.* ]; then
> -               cp -a ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.* $treedir/lib
> +       if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so ]; then
> +               cp -a ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so $treedir/lib

I understand the condition fix, but are you sure the cp action should
not have a wildcard??

Now, if multiple files exist, only one is copied.

Regards,

Leon.


