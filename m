Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NPuoZ-0003c4-Gb
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 10:26:02 +0100
Received: by pzk30 with SMTP id 30so8235334pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 01:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=jQJX6IB6dKLFpsAlm4602Hwg8VQm/0NNFEv36Kg1Kxs=;
	b=RZbxKmAUfAr2AeFZL8mPLchbMY42cL5x00Y80Nq/kBwNeN+AQkkj+yK89SWq7TdoJx
	pVvVq6FrlRIvkRfIlv0DWB0yK7rrOzClP9mKoUeupAAuF0LJCskXM6kgsQnLgFKGd3nB
	FIRf6aWmgosLoZpha4iyVafnxLQW4cQVpJyVg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=liOzHhmjbttZ9K3RgbxCMPRZeH/hCh9leZsik6rq+gStWrdRcNTtOHtBvCEuEy/Qso
	jHVdZN0qNWCubDsCje3QHseSESdF6SPaA7C0Ad2rvKt75vxaztezjYIZmNeuvow5b4Zp
	NNPr/6Io74uAtovhqEwHvKgXixSBmPIHAm8DA=
Received: by 10.141.187.7 with SMTP id o7mr6018346rvp.35.1262165040002;
	Wed, 30 Dec 2009 01:24:00 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 20sm13352892pzk.9.2009.12.30.01.23.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Dec 2009 01:23:59 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1262160936-28480-1-git-send-email-camelguo@gmail.com>
	<200912300930.12895.holger+oe@freyther.de>
	<op.u5qsujbtmn1qzu@guohr-laptop-ubuntu>
	<1262164637.2553.6.camel@lenovo.internal.reciva.com>
Date: Wed, 30 Dec 2009 17:23:52 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5qu12iemn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1262164637.2553.6.camel@lenovo.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Remove the micro distro specific overridding of variables
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
X-List-Received-Date: Wed, 30 Dec 2009 09:26:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Wed, 30 Dec 2009 17:17:17 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> On Wed, 2009-12-30 at 16:36 +0800, Guo Hongruan wrote:
>> The micro/micro-uclibc specific check does cause the miss of the
>> /etc/default directory, which is required by the following installati=
on.
>> So the installation of base-file failed when DISTRO=3Dmicro or
>> DISTRO=3Dmicro-uclibc.
>
> Can you give any more details of the problem you are trying to solve?
> Which exact installation step requires /etc/default?
>

See the following for details:


http://tinderbox.openembedded.net/packages/392296/
http://tinderbox.openembedded.net/packages/391393/

> That directory is indeed not wanted for micro and, per my previous ema=
il
> on this topic, all the commands which install into it ought to be
> wrapped in a specific check against ${DISTRO}.
>
> Plus, I have recently built for micro-uclibc without seeing this probl=
em
> so I am a little baffled as to why it would be failing for you.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


