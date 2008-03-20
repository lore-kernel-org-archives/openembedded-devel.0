Received: from [64.233.178.247] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JcHM2-0006dt-MA
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Mar 2008 10:46:36 +0100
Received: by hs-out-0708.google.com with SMTP id 23so734969hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2008 02:46:33 -0700 (PDT)
Received: by 10.100.93.19 with SMTP id q19mr4508074anb.4.1206006393741;
	Thu, 20 Mar 2008 02:46:33 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Thu, 20 Mar 2008 02:46:33 -0700 (PDT)
Message-ID: <c384c5ea0803200246o192a449dh4ecc6cbfd7eb4e16@mail.gmail.com>
Date: Thu, 20 Mar 2008 10:46:33 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200803200120.47119.zecke@selfish.org>
MIME-Version: 1.0
References: <878x0emgub.fsf@frontier.dottedmag.net>
	<47E1A6CB.4010708@balister.org> <200803200120.47119.zecke@selfish.org>
X-SA-Exim-Connect-IP: 64.233.178.247
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Default SRCREV value
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
X-List-Received-Date: Thu, 20 Mar 2008 09:46:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Thu, Mar 20, 2008 at 1:20 AM, Holger Freyther <zecke@selfish.org> wrote:
>  Or as Mikhail suggested:
>  ${@bb.fatal("You want to specify a sane srvrev")}
>
>  The only down-side I can think of, now parsing will fail for a recipe you do
>  not even care for in your distribution, with having a default value 1 you
>  just parse fine.
>
I am +1 for this, it's another step to more robustness IMHO.

(And if you don't care with the version, then just live with a sane
revision *we* chose).

Regards,
-- 
Leon


