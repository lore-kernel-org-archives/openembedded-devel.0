Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PO6ZJ-0002nk-Lc
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 11:39:18 +0100
Received: by wwi17 with SMTP id 17so2576585wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Dec 2010 02:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GivVXWxxPkrX+FI3Z4w7DP1SgCFKUGjfhbQNXoomles=;
	b=jCDj3QzPotXXX/Y5iHdRLKcU/tfncUyxVrWLp+6HHZTNONRWdCCAm0fHqJM38LBxUz
	h7mZH1qdypIDmHd/adBBc3Vis4m8lSpx4KBIpW02sJRFwbBQ5UvAPm6V66gfIj8Sl5Op
	E0YXP93F7yHJPhz2ADHYD6LKsh6ACir4tA5lY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uAX9OP8rGVYh7OtgQrGuIlGuajX2xAIaXchqDSa9qsnHiITf3ReRtF92i6KAxQsT/9
	dMMP+30F2oQIpx14vprE2ffn/HSCzEruyUt9oPKeMrs/7Sl+fvV8UlWlyngTDl6tNbVS
	5r2RXXayBfXLLP/fK+va8EUNfs88jmQXTuMRw=
MIME-Version: 1.0
Received: by 10.227.134.10 with SMTP id h10mr10782882wbt.200.1291286274725;
	Thu, 02 Dec 2010 02:37:54 -0800 (PST)
Received: by 10.227.154.13 with HTTP; Thu, 2 Dec 2010 02:37:54 -0800 (PST)
In-Reply-To: <1291284734-27056-1-git-send-email-Martin.Jansa@gmail.com>
References: <1291284734-27056-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 2 Dec 2010 11:37:54 +0100
Message-ID: <AANLkTimin5RNmDFtaqdpwqaQ_tZfTKbXuNFmeQKkx-rr@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] nokia900.conf: MACHINE_EXTRA_RRECOMMENDS add needed kernel-modules
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
X-List-Received-Date: Thu, 02 Dec 2010 10:39:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 2, 2010 at 11:12 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * list all which are loaded after boot (ie with udev)
> * remove those which are handled by some task-base-* anyways (like g-ethe=
r, vfat etc)
> * remove those which are in RDEPENDS of some already listed module here
> ---
> =A0conf/machine/nokia900.conf | =A0 36 ++++++++++++++++++++++++++++++++++=
+-
> =A0recipes/tasks/task-base.bb | =A0 =A02 +-
> =A02 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/conf/machine/nokia900.conf b/conf/machine/nokia900.conf
> index caeb00a..5ed0dae 100644
> --- a/conf/machine/nokia900.conf
> +++ b/conf/machine/nokia900.conf
> @@ -14,7 +14,41 @@ XSERVER =3D "xserver-xorg \
> =A0 =A0 =A0 =A0 =A0 =A0xf86-input-keyboard \
> =A0 =A0 =A0 =A0 =A0 =A0xf86-video-omapfb "
>
> -MACHINE_EXTRA_RRECOMMENDS =3D "watchdog"
> +MACHINE_EXTRA_RRECOMMENDS =3D "watchdog \
> +# common \

sorry for that those comments shouldn't be included..

haven't tested it before sending because I got parse errors before
parsing task-base (due to unaccessible svn.enlightenment.org for a
while).. now routing to svn went OK, task-base parse failed and I see
that I need test run even for simple, safe-looking patches :/

sorry again and I'll send PATCHv2 if needed, but I think the idea
behind that patch is clear..

Regards,


