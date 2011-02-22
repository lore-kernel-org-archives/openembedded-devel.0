Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Przan-0003V9-3I
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 22:16:21 +0100
Received: by qyk27 with SMTP id 27so2170694qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2011 13:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=QNlAO1mVn17kT88FtwoGqsgtpOwHExCux0p30H3HUHM=;
	b=ezHMgX1Dtxri6l6y+a/+fKaehahl2fJeRPU2TftvWii1/VtjL1cuCuR2/xGraAx25Z
	XQfunppmLMIU1qAgcDGm3NX0oB5fchnyB/709hbJwcON6jg6Ba2IbIXauEFfKAMUHbkt
	gasq/qXnCZqHz5SyPK7Obu9pQCwqDvRURYPSE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UMu24OEklghJPxjDvwYAQjG+ak7ap9auWhZFbSzc0gT9oE1s0pOSlJY1Hrcdkpr7PR
	0OUhROzYZmDv2DqUx1ToVFhzjS4Ptf7teiurbREQeawZSvFgRAvreF+WhOhbMpZKeRtd
	xy+tnLMPfVOei+RXrLQWG9Hl62Flw9uqXIgkA=
MIME-Version: 1.0
Received: by 10.229.78.160 with SMTP id l32mr1779090qck.298.1298409300272;
	Tue, 22 Feb 2011 13:15:00 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Tue, 22 Feb 2011 13:15:00 -0800 (PST)
In-Reply-To: <1297709209-6602-1-git-send-email-filip.zyzniewski@gmail.com>
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
	<1297709209-6602-1-git-send-email-filip.zyzniewski@gmail.com>
Date: Tue, 22 Feb 2011 22:15:00 +0100
Message-ID: <AANLkTimzAAh8J8POPk0A=RROqNAAGowjTLwRNS5xNB-H@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv2] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Tue, 22 Feb 2011 21:16:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On 2/14/11, Filip Zyzniewski <filip.zyzniewski@gmail.com> wrote:
> The whole reposotiry is about 24MB in size and it's rarely needed
> whole. It is now splitted into bus specific subpackages (and some
> device-specific for devices on a bus like SPI or SBUS) all depended
> on by the linux-firmware package.
>
> Suggested improvement - split bus packages furtherly into device
> packages (so that we can either pull in a whole bus or just one
> device).

Is there anything going on with http://patches.openembedded.org/patch/589/?
It's been in 'Under Review' state for a couple of days now...

bye,
Filip Zyzniewski


