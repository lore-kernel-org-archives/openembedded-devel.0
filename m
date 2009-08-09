Received: from [209.85.219.212] (helo=mail-ew0-f212.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <methril@gmail.com>) id 1Ma67X-0008Mp-Bv
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Aug 2009 12:59:23 +0200
Received: by ewy8 with SMTP id 8so1857115ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Aug 2009 03:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=YVlVev70CwvdUFOYG2EnE03qMz4LvU+7BD2YoNMf/ww=;
	b=tmVh77tggn04FSKwqFZ580fLTf2yaCwB86uJqBzajnENxqSjXGMIiEl2Aqx+SOtnmo
	FN6Ovd6LUme1XtwbR5Tl3JTJB/nNcbaJNPXeSFl11bYjruVSL4VXt+BByfEpa4SFQUrr
	VSQsJA3JVY9K6n2p24Ja8jUVFOYl5BYmGyDqw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=v4wAubunmqae2xE5nFMqjliKc/35s5DtztTEUtPYX3aqpIIpsK/u5C7WYtqVUaGw4i
	hZPbICyMCFIKET5U4octzZJ+1ftYM2KIuH25kNf1DhOMEqPWEd+XDMHuipV13aHu7fE0
	4dUBUizFtapIRUDXDqcdw9YMTNGZ1ZmZ/P8p0=
MIME-Version: 1.0
Received: by 10.210.129.6 with SMTP id b6mr1638831ebd.70.1249814597189; Sun, 
	09 Aug 2009 03:43:17 -0700 (PDT)
In-Reply-To: <1248208656-9496-1-git-send-email-methril@gmail.com>
References: <1248208656-9496-1-git-send-email-methril@gmail.com>
From: Rafael Campos <methril@gmail.com>
Date: Sun, 9 Aug 2009 12:42:57 +0200
Message-ID: <b84dee3a0908090342h2e6cecf7v812be48974d049ab@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] Update the em-x270 machine to work with linux_2.6.23.
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
X-List-Received-Date: Sun, 09 Aug 2009 10:59:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ping

have this message some issues  to not being included into the OE repo?

Regards

On Tue, Jul 21, 2009 at 10:37 PM, Rafael Campos Las
Heras<methril@gmail.com> wrote:
> * Use of generic linux_2.6.23 recipe
> * remove em-x270_2.6.23 recipe (ugly).
> * Add a patch that gives with gcc 4.1 compiler.
>
> Signed-off-by: Rafael Campos Las Heras
> ---
> conf/machine/em-x270.conf | 6 +-
> recipes/linux/em-x270-2.6.23/defconfig | 1354 ---
> recipes/linux/em-x270-2.6.23/em-x270.patch |12063 --------------------
> recipes/linux/em-x270_2.6.23.bb | 29 -
> .../em-x270/01-prevet_loop_timespec_add_ns.patch | 19 +
> recipes/linux/linux-2.6.23/em-x270/defconfig | 1354 +++
> recipes/linux/linux-2.6.23/em-x270/em-x270.patch |12063 ++++++++++++++++++++
> recipes/linux/linux_2.6.23.bb | 4 +
> 8 files changed, 13443 insertions(+), 13449 deletions(-)
> delete mode 100644 recipes/linux/em-x270-2.6.23/defconfig
> delete mode 100644 recipes/linux/em-x270-2.6.23/em-x270.patch
> delete mode 100644 recipes/linux/em-x270_2.6.23.bb
> create mode 100644 recipes/linux/linux-2.6.23/em-x270/01-prevet_loop_timespec_add_ns.patch
> create mode 100644 recipes/linux/linux-2.6.23/em-x270/defconfig
> create mode 100644 recipes/linux/linux-2.6.23/em-x270/em-x270.patch
>
> diff --git a/conf/machine/em-x270.conf b/conf/machine/em-x270.conf
> index f8a5c95..1255ba0 100644
> --- a/conf/machine/em-x270.conf
> +++ b/conf/machine/em-x270.conf
> @@ -9,7 +9,7 @@ TARGET_ARCH = "arm" --
<snip>
___________
Rafael Campos
o0 Methril 0o
http://openblog.methril.net/


