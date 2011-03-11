Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Py3SR-0004Dz-9c
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 15:36:47 +0100
Received: by iyb26 with SMTP id 26so2818770iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 06:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=sMXINmKdtxg6Gk4+Wlw7rysvCBMrXpyo6Eo0qmfFTS4=;
	b=Bki/HvgTIrvhExK1XGUhPCvgBIzIn+DBfgMySXFzGdjv0CPGQN6XJ5Hj7/kIGhe4w4
	MM3rGvGUNz0JhNjX97YPlN3lZ3yc2awWKpMXrsdKMvGp5iodKSpqqew75DClsAjRPv19
	g6NPW9ssLhM1utHROHTp8THiEaZeVbV3C+wCE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=B20hMp0pXBnTcF0pYr5VsKeVTL7OAw6uk7NFpiuQH4ikAFaTSbCZQXHwHJsvg0x7W0
	jlho+sDgj/7TfwmHjk0ke1AslNe2mVEPhiRUFC5k5E0Q5eoT6gfEdWYqSNDZUPFCosKN
	pNPWrCU/PBVWn7DRUtnoB4qe4U/kNSZ9bGJGQ=
Received: by 10.42.152.136 with SMTP id i8mr7404149icw.200.1299853651151; Fri,
	11 Mar 2011 06:27:31 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.42.176.137 with HTTP; Fri, 11 Mar 2011 06:27:11 -0800 (PST)
In-Reply-To: <ild7rh$50f$1@dough.gmane.org>
References: <ild7rh$50f$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 11 Mar 2011 07:27:11 -0700
X-Google-Sender-Auth: 9o2pFTQ7mWM_fO8LtR9vhotS0EU
Message-ID: <AANLkTikftdJ1_H3AyyQEU4EAz_8S--TywGFHmtAJa4S9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: Backporting bitbake python fixes to 1.12 branch?
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
X-List-Received-Date: Fri, 11 Mar 2011 14:36:47 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 11, 2011 at 6:25 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Various people trying out the maintenance branch get stuck on "parsing
> recipes: 0%" when using python 2.6.0 - 2.6.5-ish. I know master has
> bugfixes for that, could someone please backport/cherrypick/rediff them
> for the 1.12 branch?

Pushed to the 1.12 branch. Thanks for the reminder :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


