Received: from [64.233.178.241] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KBDaj-0003R1-6s
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jun 2008 20:50:14 +0200
Received: by hs-out-0708.google.com with SMTP id 23so588672hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2008 11:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=pm6us+IFtRzq18GUiAmvlTG31hhPN7q/PgTdWT4tn5A=;
	b=L8az/jUhU2crZcaNdD6JOR5Dwh8mm4SKwwNZ2QFk60amzGBq5dTA53uVCxTYDb6HyN
	uaOwfluKtA1ZEoamejSGSaZsNWIch5bzzfof8pdOE3o7h0BWFSmns8ckDgtHO8ov5Y5g
	ZzpCf0Fd31zlcPMjzvo8TQi06QTXeYZWWVa5Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=n70tC4XW7R34JZ66LBq2P7hPja1pVd9+pKLoho/9BZ51OH2ackC5pknCOSAEUIOeWO
	H+IB2H6CI/pZVc7tArrkgXAOLwbocRXoNfGaLU5+f61UROMTCyXO0AgOUs0Wbg5A+o6Y
	RLxXBu13UuMBCbVTjVOtzzRUotZoVFtrwgRl0=
Received: by 10.100.197.7 with SMTP id u7mr16410915anf.27.1214333285814;
	Tue, 24 Jun 2008 11:48:05 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Tue, 24 Jun 2008 11:48:05 -0700 (PDT)
Message-ID: <c384c5ea0806241148r5f708f7bh38563da3c051229b@mail.gmail.com>
Date: Tue, 24 Jun 2008 20:48:05 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4860FE33.5010804@pobox.com>
MIME-Version: 1.0
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<20080624095735.GB3500@aquilonia.hyboria> <4860FE33.5010804@pobox.com>
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 24 Jun 2008 18:50:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

On Tue, Jun 24, 2008 at 4:01 PM, Alain M. <alainm@pobox.com> wrote:
> Hi, I am really new here but I have one suggestion:
> Graeme Gregory escreveu:
>> 1) OE-core - everything needed to get upto a successful glibc build
>> 2) OE-universe - all the other stuff, the recipes and distro configs.

Yes, but make this split only by means of convention, not in the scm
(name)space please.
Having a gentlemen's agreements that non-core developers should not
"commit changes to classes/conf and all the core packages (udev,
busybox, kernels)" is close to what we do nowadays and works fine.

I agree with Michael that intrusive changes should be done in branches.

My personal strong meaning is that we should first convert to GIT,
without changing our current policy TOO much.

Really, the change to GIT alone will already impact the productivity
negatively, due to the dip in the developer commits resulting from
that (people setting up their environment and workflow instead of
maintaining stuff).
If we crawled back up, let's improve on things.

For later, -next is a good idea to merge new branches first, and see
where the autobuilder/tests fail, and nack stuff if it got broken

Regards,
-- 
Leon


