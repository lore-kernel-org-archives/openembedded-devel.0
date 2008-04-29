Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jqi0s-0001BP-2P
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 07:04:22 +0200
Received: by an-out-0708.google.com with SMTP id b33so1240804ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2008 22:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=urlXb9MI3fD3AgU+lTLwb9U95sPlOEEyIQ/8+uoy6qw=;
	b=tSphs+nwSKfWLNm8yu7jR/skjM+okPfYFhtu+UDOMCeBj7MEJTgrMDhMOLD30s6NLORXZacAykw0F6DnLtyE2l5azkRmd8uvUA9qe2ki8dqr3SLm2Ro/tOhcGEab7ojuRRSHlt9WlQvYQs3yrVrk+ad2V7CayEBf/x9MDB2Ysf8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=vppS89BVyDprhVsReN4xVfrITT5oYDyHejCLjL7EKFCxr9pcnVmobPKa4MpLnf0ceQw9N8Nqrme3Qry1+UvUZccjOMgGgSEcaPapBHaVfwYNyx/C6TjvJ80sUVk4xl3JBVJuZJhyVS6VYWMcJ3HD8mG/Zs1FPd9gMJDNKUb/N4A=
Received: by 10.100.57.6 with SMTP id f6mr790979ana.30.1209445435063;
	Mon, 28 Apr 2008 22:03:55 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Mon, 28 Apr 2008 22:03:55 -0700 (PDT)
Message-ID: <c384c5ea0804282203n7b743ed7w41e5e4c201b81a13@mail.gmail.com>
Date: Tue, 29 Apr 2008 07:03:55 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0804281519o596e224bw252bbac9cca4abc6@mail.gmail.com>
MIME-Version: 1.0
References: <200804281451.05548.geoffrey@pager.net>
	<200804282349.46539.zecke@selfish.org>
	<c384c5ea0804281519o596e224bw252bbac9cca4abc6@mail.gmail.com>
Subject: Re: Mixed up STAGING_INCDIR's in uclibc.inc?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 29 Apr 2008 05:04:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Tue, Apr 29, 2008 at 12:19 AM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
>  On Mon, Apr 28, 2008 at 11:49 PM, Holger Freyther <zecke@selfish.org> wrote:
>  > On Monday 28 April 2008 21:51:05 Geoffrey Wossum wrote:
>
>  The confusion started with commit "3afb4ffc02c1e4bde1031645cfa9f8e5465f2138".
>  Could you guys please see into that commit, and follow-up from there?
>
FWIW, by reading the intention of the patch commit, I checked with the
source (Poky), and indeed _NATIVE is used, and uclibc.inc DEPENDS on
ncurses-native.

One question remaining for me (and I think Poky might be broken in
that respect?) is that uclibc-initial_0.9.29.bb in Poky does not
DEPEND on ncurses-native (and does not re-use the .inc DEPENDS btw).

I have committed the _NATIVE, on both DEPENDS to the .dev branch.

Regards,
-- 
Leon


