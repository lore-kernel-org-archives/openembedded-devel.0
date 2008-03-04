Received: from [216.239.58.189] (helo=gv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JWRZ3-0004ni-Su
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Mar 2008 08:27:56 +0100
Received: by gv-out-0910.google.com with SMTP id l14so693817gvf.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Mar 2008 23:26:39 -0800 (PST)
Received: by 10.114.112.1 with SMTP id k1mr1579305wac.24.1204615597632;
	Mon, 03 Mar 2008 23:26:37 -0800 (PST)
Received: by 10.114.234.12 with HTTP; Mon, 3 Mar 2008 23:26:37 -0800 (PST)
Message-ID: <19c1b8a90803032326s57ce6e5cic48a157e353dfb53@mail.gmail.com>
Date: Mon, 3 Mar 2008 23:26:37 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1204541308.5725.10.camel@hammer.suse.cz>
MIME-Version: 1.0
References: <1204494435.17068.23.camel@utx.utx.cz> <fqg9c0$g00$1@ger.gmane.org>
	<1204541308.5725.10.camel@hammer.suse.cz>
X-SA-Exim-Connect-IP: 216.239.58.189
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: iwwmmxt optimization and soft float in OE on PXA270
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
X-List-Received-Date: Tue, 04 Mar 2008 07:27:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Stanislav,

What ABI breakage are you seeing ?
Aren't you using EABI ?

Thanks

-Khem

On Mon, Mar 3, 2008 at 2:48 AM, Stanislav Brabec <utx@penguin.cz> wrote:
> Koen Kooi wrote:
>
>  > Angstrom already enables softfloat (for FPU-less systems) and -Os by
>  > default *and* enables iwmmxt (if you have MACHINE_FEATURES = "iwmmxt")
>  > for apps which have been proven to benefit from iwmmxt (e.g. mplayer).
>
>  Ah, I see. ABI-compatible softfp mode is enabled by patching gcc, not in
>  conf files.
>
>
>  > I still get mysterious segfaults when running an all iwmmxt glibc system
>  > (uclibc is even worse), so I don't think flipping the global switch is a
>  > good idea.
>
>  Which applications are failing for you?
>
>  --
>
> Stanislav Brabec
>  http://www.penguin.cz/~utx/zaurus
>
>
>  _______________________________________________
>
>
> Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


