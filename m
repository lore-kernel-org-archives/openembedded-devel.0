Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1OzdFB-0007wV-ID
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 00:29:22 +0200
Received: by bwz2 with SMTP id 2so2730822bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 15:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=iLewZCRSLocgQyAunCo40yEp+mulrxV0NvA/pUAz8oM=;
	b=xN8//dt0GqdhtyUrKcMXVUAGODtZCuo4P/V4vg7L4bfKL8Tdb9/WbI9sDCo+0Kv86A
	k76a/jZ0dXJwkTqXv6+8AiVTQAr4g4k5Yt7wIUYFmOd7ZWzdhzKrNh/ftjhhHVzldmRj
	Rx+x/7cHqYTkZwmVK98xPfXHhmyz/jZmMJhBU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=fPcxX1OmZ6X62stE8O6UrIgeAapUPVlXqFyGEo8iL936wNq7EOwGoSHtJbo6ovEIny
	KQEubVfna1HLGgZCbJeXUJK26Qba8E9dUhuVdt9aA/Mv9WVFgI2vzEn84JQ2DQzuWdVE
	cG/9w7Wl160RsnkyAgEKL7Sie8bL5yOPtecqQ=
MIME-Version: 1.0
Received: by 10.204.76.205 with SMTP id d13mr3540470bkk.93.1285453755068; Sat,
	25 Sep 2010 15:29:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.118.1 with HTTP; Sat, 25 Sep 2010 15:29:15 -0700 (PDT)
In-Reply-To: <1285434426-17736-2-git-send-email-kwong@wurldtech.com>
References: <1285434426-17736-1-git-send-email-kwong@wurldtech.com>
	<1285434426-17736-2-git-send-email-kwong@wurldtech.com>
Date: Sat, 25 Sep 2010 19:29:15 -0300
X-Google-Sender-Auth: 4ddoeKKxlvzDbJ7zXUgFjiTdfY4
Message-ID: <AANLkTikE+Kqa4OqE50p+_2W1548a1ko40Gb9h8s-NASB@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Kelvie Wong <kwong@wurldtech.com>
Subject: Re: [PATCH 2/3] initramfs-module-udev: New module
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
X-List-Received-Date: Sat, 25 Sep 2010 22:29:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Sep 25, 2010 at 2:07 PM, Kelvie Wong <kwong@wurldtech.com> wrote:
> This launches (and kills) udev during the initramfs procedure to populate
> the /dev tree as udev would.

I didn't get /why/ do you kill it after starting.

Personally I think this could be supported by not enabled by default.
This might be an option that could be set by image.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 http://projetos.ossystems.com.br


