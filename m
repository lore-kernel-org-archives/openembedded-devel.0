Received: from mail-vb0-f45.google.com ([209.85.212.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TtGvh-0003ec-HG
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 13:08:19 +0100
Received: by mail-vb0-f45.google.com with SMTP id p1so385994vbi.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 03:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=2CtEmCeoJw2fMaiiS6QLEy4ukQzY1pic4ZFh4TwqRwo=;
	b=q3rAWkt/ElGnxwjSp8c1HA5OcwFIZBmBHuQgir6w7vYP9qQquPm89EDHQL6HijqVSa
	OBtPTXzcLb0xtfRwyHanEPbx/O0ONudb8/ZJXZw5VZ09DDdzXZIlrIhplLrhi32nTxoy
	VV+h5J5R3SpOT85KA3OBPbyO39JGQho2Y6/aTiBHJxmQsEitTyZIxh6fTroafMhCFIXn
	4NpSq/NXA5qsnj3FBXgEUrpCUO107yyci5Vou8DutXiHBg3YUBTWRhGsOf1josL7dXbd
	GgmhlvxVmNK0P11/wXzsARvlvn0NiKMGBZ3aj1pvWAEtM0oz1lbj8V3O+Z+HJL6JkTea
	aQ4g==
MIME-Version: 1.0
Received: by 10.58.34.229 with SMTP id c5mr15880756vej.24.1357818783954; Thu,
	10 Jan 2013 03:53:03 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Thu, 10 Jan 2013 03:53:03 -0800 (PST)
In-Reply-To: <1357814691-1724-1-git-send-email-noor_ahsan@mentor.com>
References: <1357814691-1724-1-git-send-email-noor_ahsan@mentor.com>
Date: Thu, 10 Jan 2013 12:53:03 +0100
Message-ID: <CALbNGRTY2_cAeE8GPKsLxiQE8iJaAVsOfe_9rpBRP0NcQ7LpXA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] autofs: Remove systemd related things.
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
X-List-Received-Date: Thu, 10 Jan 2013 12:08:19 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 10, 2013 at 11:44 AM, Noor, Ahsan <noor_ahsan@mentor.com> wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>
> * Autofs was being inherited from systemd. This class is only
> present in meta-systemd. So bitbake was giving parse error
> about systemd class. So removed systemd from inherit and
> removed SYSTEMD_PACKAGES and SYSTEMD_SERVICE.
Is this still true after auto BBMASKing?

Andreas


