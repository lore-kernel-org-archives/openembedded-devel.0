Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pp2to-0003dA-IA
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 19:11:48 +0100
Received: by qwi2 with SMTP id 2so3159571qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 10:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Vd4EIR22ix4xQYSp2gq2Tob64S/DuX2cbTqyecq8Bq8=;
	b=tiQmb8zaBuo6WqeUeWbwbW09RWQ+lg1fSsMO+9EB6QxwhACNCtciq4dEsjAdGAz3Ry
	buFnj9hlAJQuXI0qNEc0vkHhal4bmho5/kCeUKZd2qK9fv7gVRZfAyYJuV8OJRnn2I09
	djs5o/ZNFBM+DoI54RY79mMY+PuKiSPpOviNM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Tgc1NLM8dQMXAV1Q0LqJMxLbSZ8ix73hTD0R0bYAz8qDAqXWeS61eNGM0nA/qMPdd+
	D9qHInlIumozxrMOKcAg4MzWS1V8Jz8b4Wii5nxtmF2k2dR3KMDCqfKVYnuGQLFYUI/f
	6PqiDVwXbuAQPtl0+wrDJkjcwrfUGPrbQinC4=
MIME-Version: 1.0
Received: by 10.224.19.196 with SMTP id c4mr3546317qab.184.1297707028664; Mon,
	14 Feb 2011 10:10:28 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Mon, 14 Feb 2011 10:10:28 -0800 (PST)
In-Reply-To: <1297705231.2178.104.camel@phil-desktop>
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
	<AANLkTi=XjCgstGxtHd2jTmp5Kmm8wyQzOjJrxnnAhJU9@mail.gmail.com>
	<AANLkTikjvqTZcOiYHRsXdE9otGaJTavGKZ8iWtuN7GVu@mail.gmail.com>
	<AANLkTi=7XnywEHPjEReDvY68TNd-3fzr7FtREJ-6hp3T@mail.gmail.com>
	<AANLkTinXm+YcGS_uadbA6ddezRRtZB0r6Tqcgt7GyOh4@mail.gmail.com>
	<4D59677E.2040004@mentor.com>
	<1297705231.2178.104.camel@phil-desktop>
Date: Mon, 14 Feb 2011 19:10:28 +0100
Message-ID: <AANLkTimu=72wQjT_m_ECes1C8rOfPD37trVY1KPkWNAT@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Mon, 14 Feb 2011 18:11:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/14/11, Phil Blundell <philb@gnu.org> wrote:
> Yeah, agreed.  Or even a split down to individual devices/drivers since
> each of the Ralink firmware binaries is quite large in itself.

Yeah, I agree it is a good idea, it just isn't needed for us.

So could this be done in two steps:
1) this patch (by me) - split into buses;
2) second patch (by whoever needs this) - furtherly split bus packages
by devices?

bye,
Filip Zyzniewski


