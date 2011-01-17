Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vadmium@gmail.com>) id 1PepZC-0007aW-Hi
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 14:56:19 +0100
Received: by wwi18 with SMTP id 18so2142281wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 05:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=OUkVsRllFwFhffXZYKYtvx8SAwHXzdivvhC9U871xds=;
	b=XSkagWMyQi1Rcd7/ECp16yqa4hIuu+CZlsF+ddMOWVwtFgXt34y6VjpkQ/6D/+GRf7
	JgjbZfF5V8UHvtHRxJaeZrzpZm6HovBI8aS7om89LTnFn+AbMX4hULgH0fxZ6kUKHsio
	dn1/nRj3VS14CvNnHuwwfiuNr0uZILBmIN4Qc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=xFipAJf/1HUxS/IRMpWk77yByVlt0nzGxou97i6M9OgMeBkBndCzcPOA1dXqVNv4GS
	2Lz1d6L5ghtITMPzMjUU+8ywX7Z1+tDrGUS8WH0GTELlOfuQWMCnIiEE3ZYXFaPHfTKS
	j3xHL8ApT++RUO27QNuyS5NTPmjpFELhB2gA8=
MIME-Version: 1.0
Received: by 10.216.82.20 with SMTP id n20mr3176386wee.107.1295272540622; Mon,
	17 Jan 2011 05:55:40 -0800 (PST)
Sender: vadmium@gmail.com
Received: by 10.216.17.203 with HTTP; Mon, 17 Jan 2011 05:55:40 -0800 (PST)
In-Reply-To: <AANLkTi=q0Qa2w=Tn1kPGcA2Y5c6t3kfAfoRj8x1uvn2y@mail.gmail.com>
References: <AANLkTi=q0Qa2w=Tn1kPGcA2Y5c6t3kfAfoRj8x1uvn2y@mail.gmail.com>
Date: Mon, 17 Jan 2011 13:55:40 +0000
X-Google-Sender-Auth: 7joSkmoG3QP4abh7dpt40dJBSGw
Message-ID: <AANLkTi=pJidryLnDDNjJi0xqcq7UuRc2Xp5oWV=wRkzZ@mail.gmail.com>
From: Martin Panter <vadmium+floss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Avoid issues with APR package detecting Libtool
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
X-List-Received-Date: Mon, 17 Jan 2011 13:56:19 -0000
Content-Type: text/plain; charset=UTF-8

On 16 January 2011 12:32, Martin Panter <vadmium+floss@gmail.com> wrote:
> The configure script was failing for APR, I think because it was
> trying to hack Libtool internals and wasn't compatible with newer
> Libtool 2.4. Fixed for me with attached patch.
> -Martin

FYI I stumbled across another solution to apparently the same problem.
Gotta love independently reinventing the wheel!
"apr: Update to 1.4.2"
https://lists.yoctoproject.org/pipermail/poky/2011-January/002014.html


