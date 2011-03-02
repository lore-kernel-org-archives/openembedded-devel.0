Received: from na3sys009aog114.obsmtp.com ([74.125.149.211])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PupxR-0003bi-Ry
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 18:35:30 +0100
Received: from source ([209.85.220.179]) (using TLSv1) by
	na3sys009aob114.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTW5/iQ5hYwlaZf+htak063ckPHTXenoG@postini.com;
	Wed, 02 Mar 2011 09:34:04 PST
Received: by mail-vx0-f179.google.com with SMTP id 38so154409vxc.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 09:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=qDjflBPm5YcRb1ul4f9LTlZ783QIAo1iZOsh8Kvv4qQ=;
	b=enjObq5ZfXqb1QNW8eH7CWbQvynh5VfFyhghNxziCq63XzaRknnY8kF6VsSXp9hJ95
	WVfaoM0zS+Dp72LElSy67gFiRibfyN8WLc6Hv9UeJFt9A42tA5YXiVeHy2NQiedPR+Yi
	o2mRhZ4wISwm9PLKHPIFEBwSKgaT8lEeZSXq0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=M1f4byas6h1Z23wy1PnUXidtj+5WNbhKG2oT5Qvamn2Ts68cu6s9baTtnLYqeAltDE
	oNs/mjluvk9+4JBiNbdx6a+tuOd3fNRJpqtb/WoRnTmoC15Dmiyt721eQ4rsW09zOVCe
	BRgqz7YK3Z22wq3tEwOXPAn4qrSaVLzn8p1b8=
MIME-Version: 1.0
Received: by 10.52.88.225 with SMTP id bj1mr50238vdb.224.1299086705198; Wed,
	02 Mar 2011 09:25:05 -0800 (PST)
Received: by 10.52.167.193 with HTTP; Wed, 2 Mar 2011 09:25:05 -0800 (PST)
In-Reply-To: <20110302171602.GO27067@edge>
References: <cover.1299076392.git.bengardiner@nanometrics.ca>
	<4D6E75BD.7050005@mentor.com>
	<AANLkTimwptJ9rS1mdDUcXxSwV5CXpgNH5O7hLtY2x5UF@mail.gmail.com>
	<4D6E7A16.9000608@mentor.com> <20110302171602.GO27067@edge>
Date: Wed, 2 Mar 2011 12:25:05 -0500
Message-ID: <AANLkTi=KRdAKpTp_M9w++Z2nmLFSZVbq-YBWMPqsVyx6@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Denys Dmytriyenko <denys@ti.com>, Tom Rini <tom_rini@mentor.com>
Cc: Andrea Galbusera <gizero@gmail.com>, Koen Kooi <koen@openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2 0/2] allow linux-lib-headers with external-toolchain-csl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2011 17:35:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Tom and Denys,

On Wed, Mar 2, 2011 at 12:10 PM, Tom Rini <tom_rini@mentor.com> wrote:
>
> It's all in now (and this spurred me to push something else I've been
> meaning to for a while, adding in gdbserver and dropping do_stage)[...]

Ok, no worries then. I'm really glad that you found it useful, Tom and
it's making its way to upstream, thanks.

On Wed, Mar 2, 2011 at 12:10 PM, Tom Rini <tom_rini@mentor.com> wrote:
> [...]but in
> short, we just cp -a like before but now will rm -rf as needed.
On Wed, Mar 2, 2011 at 12:12 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> Looks good to me, except:
>
> 1. Why use rsync instead of cp? I think it's less portable that way.

I had an inkling that my selection of rsync should have been defended
in the commit messages :)

In my own defense, I was concerned that the cp followed by an rm could
remove from staging other headers that were installed into the correct
locations -- rsync is my go-to for copying with exclusions.

I'll remember that it is not portable enough next time around.

On Wed, Mar 2, 2011 at 12:12 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> 2. I saw several linux-lib-headers instead of linux-libc-headers (missing 'c')
On Wed, Mar 2, 2011 at 12:16 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> Argh, you left one linux-lib-headers in the comment... :)

Oops. Sorry about that.

Thanks again for picking up this patch.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


